-- Запись боя для разбора ИИ: пока на карте есть техника патрулей или пехота (npc_pr_soldier) в бою,
-- два раза в секунду пишем, где игроки и что делают (машина, скорость, здоровье, огонь), где
-- авиация патрулей, в каком режиме и по кому работает (у ИИ fire1 — стрелял в этом режиме, fire2 —
-- наведён), и что делает каждый боец пехоты: who = inf:<роль>, class = <группа>@<патруль>,
-- state = <состояние>/<приказ отряда>/<походка>[/c — присел][/move]/sq:<фаза отряда>,
-- target = враг или «contact <дистанция>», fire1 — стрелял за полсекунды, fire2 — видит врага;
-- shots / hits / dmg — выстрелов, попаданий по игрокам и их урона с прошлой строки (у игрока — его
-- выстрелы и попадания по бойцам), aim — сведение прицела (b.aimT, с); why — почему боец видит врага
-- 1,5 с и больше и молчит (friend — свой на линии, hold — перенос огня/пауза, aimhold — сводит прицел,
-- role — роль не велит, reload, range — далеко, noenemy — VJ целится в другого, vj — сам VJ); los —
-- прямая видимость с глаз бойца до груди и головы ближайшего игрока (0–2, без учёта угла зрения);
-- hg — части тела игрока, куда попал (h голова, c грудь, s живот, a рука, l нога).
-- Файл — data/pr_gamemode/gameplay/<дата_время>.csv, новый на каждую карту.
-- pr_gameplay_rec 0 — выключить

local CVAR = CreateConVar("pr_gameplay_rec", "1", FCVAR_ARCHIVE, "Писать бой патрулей (техника и пехота) в data/pr_gamemode/gameplay")
local DIR = "pr_gamemode/gameplay"
local MAX_FILES = 30
local COLUMNS = "time,who,class,x,y,z,speed,heading,pitch,hp,state,target,fire1,fire2,weapon,shots,hits,dmg,aim,why,los,hg,body"

local fileName

local function Open()
	if fileName then return fileName end
	file.CreateDir(DIR)
	-- Старые записи — долой, держим последние MAX_FILES
	local files = file.Find(DIR .. "/*.csv", "DATA", "datedesc") or {}
	for i = MAX_FILES, #files do file.Delete(DIR .. "/" .. files[i]) end
	fileName = string.format("%s/%s_%s.csv", DIR, os.date("%Y%m%d_%H%M%S"), game.GetMap())
	file.Write(fileName, COLUMNS .. "\n")
	return fileName
end

local function Row(who, class, ent, hp, state, target, fire1, fire2, weapon, extra)
	local pos, vel, ang = ent:GetPos(), ent:GetVelocity(), ent:GetAngles()
	return string.format("%.1f,%s,%s,%d,%d,%d,%d,%d,%d,%s,%s,%s,%d,%d,%s,%s",
		CurTime(), who, class, pos.x, pos.y, pos.z, ent.PR_RecSpeed or vel:Length(), ang.y, ang.p, tostring(hp or ""),
		state or "", target or "", fire1 and 1 or 0, fire2 and 1 or 0, weapon or "", extra or ",,,,,,,")
end

-- Выстрелы бойцов и игроков (дробь — один выстрел) и попадания — для разбора меткости
hook.Add("EntityFireBullets", "PR_RecShots", function(ent)
	if IsValid(ent) and (ent.PR_Brain or ent:IsPlayer()) and ent.PR_RecShotFrame ~= FrameNumber() then
		ent.PR_RecShotFrame = FrameNumber()
		ent.PR_RecShots = (ent.PR_RecShots or 0) + 1
	end
end)
local HG = {[HITGROUP_HEAD] = "h", [HITGROUP_CHEST] = "c", [HITGROUP_STOMACH] = "s", [HITGROUP_LEFTARM] = "a",
	[HITGROUP_RIGHTARM] = "a", [HITGROUP_LEFTLEG] = "l", [HITGROUP_RIGHTLEG] = "l"}
hook.Add("PostEntityTakeDamage", "PR_RecHits", function(ent, dmg, took)
	if not (took and IsValid(ent)) then return end
	-- Добивание от кровотечения и смерть по телу (sv_body.lua, sv_vivo_compat.lua) — не попадание
	if ent.PR_BodyKill then return end
	local a = dmg:GetAttacker()
	if not IsValid(a) or a == ent then return end
	if ent:IsPlayer() and a.PR_Brain then
		a.PR_RecHits = (a.PR_RecHits or 0) + 1
		a.PR_RecDmg = (a.PR_RecDmg or 0) + dmg:GetDamage()
		a.PR_RecHG = (a.PR_RecHG or "") .. (HG[ent:LastHitGroup()] or "o")
	elseif ent.PR_Brain and a:IsPlayer() then
		a.PR_RecHits = (a.PR_RecHits or 0) + 1
		a.PR_RecDmg = (a.PR_RecDmg or 0) + dmg:GetDamage()
	end
end)

-- Почему боец, который видит врага, молчит (первая подходящая причина)
local function SilentWhy(npc, b, seen)
	local now = CurTime()
	if not seen then b.recSeenSince = nil return "" end
	b.recSeenSince = b.recSeenSince or now
	if now - b.recSeenSince < 1.5 or now - (b.lastFireAt or -10) < 1.5 then return "" end
	local wep = npc:GetActiveWeapon()
	if PR_Inf.FriendOnLine and PR_Inf.FriendOnLine(npc, seen:GetPos(), 60) then return "friend" end
	if PR_Inf.HoldFire(npc) then return "hold" end
	if PR_Inf.AimHold and PR_Inf.AimHold(npc) then return "aimhold" end
	if npc.PR_Fire == false then return "role" end
	if npc.GetWeaponState and VJ.WEP_STATE_RELOADING and npc:GetWeaponState() == VJ.WEP_STATE_RELOADING then return "reload" end
	if npc:GetPos():Distance(seen:GetPos()) > (npc.Weapon_MaxDistance or 1e9) then return "range" end
	if npc:GetEnemy() ~= seen then return "noenemy" end
	return "vj"
end

-- Прямая видимость с глаз бойца до груди и головы ближайшего игрока (без угла зрения)
local function TrueLOS(npc)
	local best, bd
	for _, p in ipairs(player.GetHumans()) do
		if p:Alive() then
			local d = p:GetPos():DistToSqr(npc:GetPos())
			if not bd or d < bd then best, bd = p, d end
		end
	end
	if not best then return "" end
	local eye = npc:EyePos()
	local n = 0
	for _, t in ipairs({best:WorldSpaceCenter(), best:EyePos()}) do
		if not util.TraceLine({start = eye, endpos = t, mask = MASK_BLOCKLOS_AND_NPCS, filter = {npc, best}}).Hit then n = n + 1 end
	end
	return tostring(n)
end

local function Name(e)
	if not IsValid(e) then return "" end
	if e:IsPlayer() then return e:Nick():gsub(",", " ") end
	return e:GetClass()
end

timer.Create("PR_GameplayRec", 0.5, 0, function()
	if not CVAR:GetBool() or not PR_Patrol or not PR_Patrol.Active then return end
	local vehicles, infantry, fighting = {}, {}, false
	local now = CurTime()
	for _, patrol in ipairs(PR_Patrol.Active) do
		for _, v in ipairs(patrol.vehicles or {}) do
			if not v.dead and IsValid(v.ent) then vehicles[#vehicles + 1] = v end
		end
		for _, npc in ipairs(patrol.members or {}) do
			local b = IsValid(npc) and npc.PR_Brain
			if b and npc:Health() > 0 then
				infantry[#infantry + 1] = npc
				if b.state ~= "patrol" or #(b.contacts or {}) > 0 then fighting = true end
			end
		end
	end
	if #vehicles == 0 and not fighting then return end

	local out = {}
	for _, ply in ipairs(player.GetHumans()) do
		local seat = ply:GetVehicle()
		local body = ply
		if IsValid(seat) then
			body = seat
			while IsValid(body:GetParent()) do body = body:GetParent() end
		end
		local wep = ply:GetActiveWeapon()
		-- body — части тела VIVO по ядру sv_body.lua («H35 T85 … LL0!», «!» кровотечение, «x» перелом)
		local extra = string.format("%d,%d,%d,,,,,%s", ply.PR_RecShots or 0, ply.PR_RecHits or 0, ply.PR_RecDmg or 0,
			PR_Body and PR_Body.DescribePlayer(ply) or "")
		ply.PR_RecShots, ply.PR_RecHits, ply.PR_RecDmg = 0, 0, 0
		out[#out + 1] = Row("player:" .. Name(ply), IsValid(seat) and body:GetClass() or "foot", body,
			ply:Alive() and ply:Health() or 0, ply:Alive() and "alive" or "dead", "",
			ply:KeyDown(IN_ATTACK), ply:KeyDown(IN_ATTACK2), IsValid(wep) and wep:GetClass() or "", extra)
	end
	for _, v in ipairs(vehicles) do
		local e = v.ent
		local hp = isfunction(e.GetHP) and e:GetHP() or (isfunction(e.GetCurHealth) and e:GetCurHealth()) or nil
		out[#out + 1] = Row("ai:" .. tostring(v.kind), v.class or e:GetClass(), e, hp and math.Round(hp),
			tostring(v.airMode or v.driveState or ""):gsub(",", " "), Name(v.target), v.planeFired, v.fire, "")
	end
	if fighting then
		local U = PR_Inf and PR_Inf.U
		for _, npc in ipairs(infantry) do
			local b, patrol = npc.PR_Brain, npc.PR_Patrol
			local def = npc.PR_PatrolDef or {}
			local seen = U and U.BestVisible(npc, b)
			local c = U and U.BestContact(b)
			local target = IsValid(npc.PR_Enemy) and Name(npc.PR_Enemy) or (c and ("contact " .. math.Round(npc:GetPos():Distance(c.pos))) or "")
			local state = table.concat({b.state or "", b.order and b.order.kind or "-", npc.PR_Gait or "stand"}, "/")
				.. (npc.PR_Crouch and "/c" or "") .. (b.route and "/move" or "")
				.. "/sq:" .. (patrol and patrol.squad and patrol.squad.phase or "-")
			local who = string.gsub(tostring(def.name or "") .. "@" .. tostring(patrol and patrol.cfg and patrol.cfg.name or ""), ",", " ")
			local wep = npc:GetActiveWeapon()
			-- У NPC GetVelocity даёт 0 — скорость считаем по смещению за полсекунды
			local p = npc:GetPos()
			npc.PR_RecSpeed = npc.PR_RecPos and math.Round(p:Distance(npc.PR_RecPos) / 0.5) or 0
			npc.PR_RecPos = p
			local extra = string.format("%d,%d,%d,%.1f,%s,%s,%s,%s", npc.PR_RecShots or 0, npc.PR_RecHits or 0, npc.PR_RecDmg or 0, b.aimT or 0,
				SilentWhy(npc, b, seen), TrueLOS(npc), npc.PR_RecHG or "", PR_Body and PR_Body.Describe(npc) or "")
			npc.PR_RecShots, npc.PR_RecHits, npc.PR_RecDmg, npc.PR_RecHG = 0, 0, 0, nil
			out[#out + 1] = Row("inf:" .. ((npc.PR_Role or "") ~= "" and npc.PR_Role or "regular"), who, npc, npc:Health(), state,
				(string.gsub(target, ",", " ")), now - (b.lastFireAt or -10) < 0.5, seen ~= nil, IsValid(wep) and wep:GetClass() or "", extra)
		end
	end
	file.Append(Open(), table.concat(out, "\n") .. "\n")
end)
