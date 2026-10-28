-- Запись боя для разбора ИИ: пока на карте есть техника патрулей или пехота (npc_pr_soldier) в бою,
-- два раза в секунду пишем, где игроки и что делают (машина, скорость, здоровье, огонь), где
-- авиация патрулей, в каком режиме и по кому работает (у ИИ fire1 — стрелял в этом режиме, fire2 —
-- наведён), и что делает каждый боец пехоты: who = inf:<роль>, class = <группа>@<патруль>,
-- state = <состояние>/<приказ отряда>/<походка>[/c — присел][/move]/sq:<фаза отряда>,
-- target = враг или «contact <дистанция>», fire1 — стрелял за полсекунды, fire2 — видит врага.
-- Файл — data/pr_gamemode/gameplay/<дата_время>.csv, новый на каждую карту.
-- pr_gameplay_rec 0 — выключить

local CVAR = CreateConVar("pr_gameplay_rec", "1", FCVAR_ARCHIVE, "Писать бой патрулей (техника и пехота) в data/pr_gamemode/gameplay")
local DIR = "pr_gamemode/gameplay"
local MAX_FILES = 30
local COLUMNS = "time,who,class,x,y,z,speed,heading,pitch,hp,state,target,fire1,fire2,weapon"

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

local function Row(who, class, ent, hp, state, target, fire1, fire2, weapon)
	local pos, vel, ang = ent:GetPos(), ent:GetVelocity(), ent:GetAngles()
	return string.format("%.1f,%s,%s,%d,%d,%d,%d,%d,%d,%s,%s,%s,%d,%d,%s",
		CurTime(), who, class, pos.x, pos.y, pos.z, vel:Length(), ang.y, ang.p, tostring(hp or ""),
		state or "", target or "", fire1 and 1 or 0, fire2 and 1 or 0, weapon or "")
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
		out[#out + 1] = Row("player:" .. Name(ply), IsValid(seat) and body:GetClass() or "foot", body,
			ply:Alive() and ply:Health() or 0, ply:Alive() and "alive" or "dead", "",
			ply:KeyDown(IN_ATTACK), ply:KeyDown(IN_ATTACK2), IsValid(wep) and wep:GetClass() or "")
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
			out[#out + 1] = Row("inf:" .. ((npc.PR_Role or "") ~= "" and npc.PR_Role or "regular"), who, npc, npc:Health(), state,
				(string.gsub(target, ",", " ")), now - (b.lastFireAt or -10) < 0.5, seen ~= nil, IsValid(wep) and wep:GetClass() or "")
		end
	end
	file.Append(Open(), table.concat(out, "\n") .. "\n")
end)
