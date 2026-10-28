-- NPC-копии стволов ArcCW (sh_npc_weapons.lua), гранатомёты и ручные гранаты.
-- Сколько копий, урон и выпадение, боец стреляет из копии АКМ, РПГ-7 пускает ракету ArcCW, M79 —
-- 40-мм гранату навесом, граната долетает до точки и рвётся. Снимки бойцов со стволами в руках
-- (npcw_*) — для глаза.
-- run_selftest.ps1 -Suite npcw
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step, waitFor, check = T.S, T.log, T.step, T.waitFor, T.check

local function Ground(x, y)
	local tr = util.TraceLine({start = Vector(x, y, 2000), endpos = Vector(x, y, -3000), mask = MASK_PLAYERSOLID_BRUSHONLY})
	return tr.HitPos + Vector(0, 0, 4)
end

local function Soldier(pos, yaw, weapon, model)
	local n = ents.Create("npc_pr_soldier")
	n:SetModel(model or "models/player/eft/followers/glukhar/glukhar_assault_ar.mdl")
	n:SetKeyValue("additionalequipment", weapon)
	n:SetPos(pos)
	n:SetAngles(Angle(0, yaw or 90, 0))
	PR_Quietly(function() n:Spawn() n:Activate() end)
	return n
end

hook.Add("EntityFireBullets", "PR_SelfTestNPCW", function(ent)
	if ent == S.shooter then S.shots = (S.shots or 0) + 1 end
end)
hook.Add("OnEntityCreated", "PR_SelfTestNPCW", function(ent)
	timer.Simple(0, function()
		if not IsValid(ent) then return end
		local c = ent:GetClass()
		if c == "arccw_ucex_rocket" then
			S.rocket = ent
			S.track = {}
			timer.Create("PR_SelfTestRocket", 0.05, 40, function()
				if IsValid(ent) then table.insert(S.track, ent:GetPos()) end
			end)
		end
		if c == "arccw_thr_frag" or c == "npc_grenade_frag" then S.nade = ent end
		if c == "arccw_uc_40mm_he" then S.glNade = ent end
	end)
end)
hook.Add("EntityRemoved", "PR_SelfTestNPCW", function(ent)
	if ent == S.nade then S.nadeEnd = ent:GetPos() end
	if ent == S.rocket then S.rocketEnd = ent:GetPos() end
	if ent == S.glNade then S.glEnd = ent:GetPos() end
end)

step(0, function()
	log("start (npcw)")
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	S.base = Ground(-12450, -2500)
	S.host = player.GetHumans()[1]

	local n = PR_NPCW and PR_NPCW.Count or 0
	log("NPC copies of ArcCW weapons: " .. n)
	check("NPC copies of ArcCW weapons are built", n >= 150, n)
	local ak = weapons.GetStored("weapon_vj_arccw_ur_ak")
	check("AKM copy exists", ak ~= nil)
	if ak then
		local full = weapons.Get("weapon_vj_arccw_ur_ak")
		check("AKM copy: ArcCW model, sound and magazine", file.Exists(full.WorldModel, "GAME") and full.Primary.ClipSize == 30 and full.Primary.Sound ~= nil,
			tostring(full.WorldModel) .. " " .. tostring(full.Primary.ClipSize))
		check("AKM copy: scaled damage", full.Primary.Damage >= 4 and full.Primary.Damage <= 12, full.Primary.Damage)
		check("AKM copy: player picks up the real ArcCW gun", full.ReplacementWeapon == "arccw_ur_ak" and full.MadeForNPCsOnly == true)
		check("AKM copy: NPC-only weapon inherits VJ fields", full.Primary.SoundPitch ~= nil and full.Primary.Tracer ~= nil)
		check("AKM copy: model sits in the hand by the ArcCW offset", full.WorldModel_UseCustomPosition == true and full.PR_WMPos ~= nil)
	end
	local kinds = {}
	for _, info in pairs(PR_NPCW.List or {}) do kinds[info.kind] = (kinds[info.kind] or 0) + 1 end
	local parts = {}
	for k, v in SortedPairs(kinds) do parts[#parts + 1] = k .. "=" .. v end
	log("kinds: " .. table.concat(parts, " "))
	check("there are sniper, DMR, rifle, SMG, shotgun and launcher copies", (kinds.sniper or 0) > 0 and (kinds.dmr or 0) > 0 and (kinds.rifle or 0) > 0
		and (kinds.smg or 0) > 0 and (kinds.shotgun or 0) > 0 and (kinds.launcher or 0) > 0, table.concat(parts, " "))

	-- Стрелок с копией АК-74 и цель (бот, бессмертный)
	S.bot = player.CreateNextBot("npcw_target")
	S.shooter = Soldier(S.base, 90, "weapon_vj_arccw_ur_ak")
end)

step(1, function()
	local bot = S.bot
	bot:Spawn()
	bot:SetNWString("PR_fraction", "")
	bot.VJ_NPC_Class = nil
	bot:GodEnable()
	bot:SetPos(S.base + Vector(0, 900, 0))
	local wep = S.shooter:GetActiveWeapon()
	check("soldier holds the AKM copy", IsValid(wep) and wep:GetClass() == "weapon_vj_arccw_ur_ak", IsValid(wep) and wep:GetClass())
	-- Снимок: игрок сбоку от бойца
	if IsValid(S.host) then
		S.host:SetMoveType(MOVETYPE_NOCLIP)
		S.host:SetPos(S.shooter:GetPos() + Vector(110, 60, 10))
		T.lookAt(S.shooter:WorldSpaceCenter() + Vector(0, 10, 10))
	end
	S.shots = 0
end)

step(3, function() T.shot("npcw_akm") end)

waitFor(8, function() return (S.shots or 0) >= 3 end, "soldier fires the AKM copy")
step(0, function()
	check("soldier fires bullets from the AKM copy", (S.shots or 0) >= 3, S.shots)
	if IsValid(S.shooter) then S.shooter:Remove() end
	-- РПГ-7
	S.shooter = Soldier(S.base, 90, "weapon_vj_arccw_uc_rpg7")
	S.bot:SetPos(S.base + Vector(0, 2000, 0))
end)

step(1, function()
	local wep = S.shooter:GetActiveWeapon()
	check("grenadier holds the RPG-7 copy", IsValid(wep) and wep:GetClass() == "weapon_vj_arccw_uc_rpg7", IsValid(wep) and wep:GetClass())
	if IsValid(S.host) then
		S.host:SetPos(S.shooter:GetPos() + Vector(110, 60, 10))
		T.lookAt(S.shooter:WorldSpaceCenter() + Vector(0, 10, 10))
	end
end)

step(3, function() T.shot("npcw_rpg") end)

waitFor(15, function() return S.rocket ~= nil end, "grenadier launches a rocket")
waitFor(5, function() return S.rocketEnd ~= nil end, "rocket explodes")
step(0, function()
	check("RPG-7 copy launches the ArcCW rocket", S.rocket ~= nil)
	local L = PR_NPCW.Last
	if L then log(string.format("rocket: from %s to %s dir %s", tostring(L.from), tostring(L.to), tostring(L.dir))) end
	local pts = {}
	for i, p in ipairs(S.track or {}) do if i % 2 == 1 then pts[#pts + 1] = string.format("%d,%d,%d", p.x, p.y, p.z) end end
	log("rocket track: " .. table.concat(pts, " ") .. " end " .. tostring(S.rocketEnd) .. " bot " .. tostring(S.bot:GetPos()))
	check("rocket flies to the target and explodes", S.rocketEnd ~= nil and S.rocketEnd:Distance(S.bot:GetPos()) < 700,
		S.rocketEnd and math.Round(S.rocketEnd:Distance(S.bot:GetPos())))
	if IsValid(S.shooter) then S.shooter:Remove() end
	-- Ручная граната в точку 900 ю
	S.thrower = Soldier(S.base + Vector(800, 0, 0), 90, "weapon_vj_arccw_ur_ak")
	S.bot:SetPos(S.base + Vector(0, -6000, 0))
end)

step(1, function()
	S.nadeTarget = S.thrower:GetPos() + Vector(0, 900, 0)
	S.nade = nil
	PR_Inf.ThrowGrenade(S.thrower, S.nadeTarget)
end)

waitFor(6, function() return S.nadeEnd ~= nil end, "grenade explodes")
step(0, function()
	check("hand grenade is thrown", S.nade ~= nil or S.nadeEnd ~= nil)
	-- Рвётся через 0,3–0,8 с после падения — успевает откатиться
	check("grenade lands near the aimed point (< 300)", S.nadeEnd ~= nil and Vector(S.nadeEnd.x, S.nadeEnd.y, 0):Distance(Vector(S.nadeTarget.x, S.nadeTarget.y, 0)) < 300,
		S.nadeEnd and math.Round(Vector(S.nadeEnd.x, S.nadeEnd.y, 0):Distance(Vector(S.nadeTarget.x, S.nadeTarget.y, 0))))

	-- Выпадение: убить бойца — на земле копия, игрок подбирает настоящий ствол
	local n = S.thrower
	S.deathPos = n:GetPos()
	S.dropped = nil
	hook.Add("OnEntityCreated", "PR_SelfTestNPCWDrop", function(ent)
		timer.Simple(0, function()
			if IsValid(ent) and ent:IsWeapon() and string.StartWith(ent:GetClass(), "weapon_vj_arccw_") and not IsValid(ent:GetOwner()) then S.dropped = ent end
		end)
	end)
	local d = DamageInfo()
	d:SetDamage(10000)
	d:SetDamageType(DMG_BULLET)
	d:SetAttacker(game.GetWorld())
	n:TakeDamageInfo(d)
end)

step(5, function()
	if not IsValid(S.dropped) then
		for _, e in ipairs(ents.FindInSphere(S.deathPos or S.base, 500)) do
			if e:IsWeapon() and string.StartWith(e:GetClass(), "weapon_vj_arccw_") and not IsValid(e:GetOwner()) then S.dropped = e end
		end
	end
	check("killed soldier drops its weapon", IsValid(S.dropped), tostring(S.dropped))
	hook.Remove("OnEntityCreated", "PR_SelfTestNPCWDrop")
	-- Снимок бойцов с разными стволами (для глаза): пистолет, дробовик, снайперка
	S.gallery = {}
	local picks = {"weapon_vj_arccw_cod4e_m9", "weapon_vj_arccw_ud_870", "weapon_vj_arccw_cod4e_m40a3", "weapon_vj_arccw_mw3e_m4a1", "weapon_vj_arccw_uc_pkm"}
	for i, w in ipairs(picks) do
		if weapons.GetStored(w) then
			S.gallery[#S.gallery + 1] = Soldier(S.base + Vector(-200 + i * 100, 300, 0), 270, w, "models/player/eft/bosses/killa.mdl")
		end
	end
	if IsValid(S.host) then
		S.host:SetPos(S.base + Vector(50, 140, 20))
		T.lookAt(S.base + Vector(50, 300, 40))
	end
end)

step(4, function() T.shot("npcw_gallery") end)

-- 40 мм: M79 — граната ArcCW навесом в цель на 1500
step(1, function()
	for _, n in ipairs(S.gallery or {}) do if IsValid(n) then n:Remove() end end
	S.gallery = {}
	local info = PR_NPCW.List["weapon_vj_arccw_ud_m79"]
	check("M79 copy is a grenade launcher", info ~= nil and info.kind == "launcher", info and info.kind)
	local w = weapons.Get("weapon_vj_arccw_ud_m79")
	check("M79 copy lobs the ArcCW 40 mm grenade", w ~= nil and w.PR_Projectile == "arccw_uc_40mm_he" and w.PR_Lob == true, w and tostring(w.PR_Projectile))
	S.gl = Soldier(S.base, 90, "weapon_vj_arccw_ud_m79")
	S.bot:SetPos(S.base + Vector(0, 1500, 0))
	S.glNade, S.glEnd = nil, nil
end)

waitFor(15, function() return S.glEnd ~= nil end, "40 mm grenade explodes")
step(0, function()
	local d = S.glEnd and S.glEnd:Distance(S.bot:GetPos())
	log("40 mm: end " .. tostring(S.glEnd) .. " bot " .. tostring(S.bot:GetPos()))
	check("40 mm grenade lands near the target (< 300)", d ~= nil and d < 300, d and math.Round(d))
	if IsValid(S.gl) then S.gl:Remove() end
end)

step(1, function()
	for _, n in ipairs(S.gallery or {}) do if IsValid(n) then n:Remove() end end
	if IsValid(S.bot) then S.bot:Kick("selftest") end
	hook.Remove("EntityFireBullets", "PR_SelfTestNPCW")
	hook.Remove("OnEntityCreated", "PR_SelfTestNPCW")
	hook.Remove("EntityRemoved", "PR_SelfTestNPCW")
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
