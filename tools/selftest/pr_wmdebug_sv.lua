-- Ствол ArcCW в руке бойца крупным планом: где модель относительно кисти, какая модель, группы
-- тела, снимки wm_*. run_selftest.ps1 -Suite wmdebug
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step, check = T.S, T.log, T.step, T.check

local GUNS = {"weapon_vj_arccw_ur_ak", "weapon_vj_arccw_firearms2_m4a1", "weapon_vj_arccw_firearms2_gsh18", "weapon_vj_arccw_uc_rpg7",
	"weapon_vj_arccw_firearms2_ak74", "weapon_vj_arccw_ud_m16"}

local function Ground(x, y)
	local tr = util.TraceLine({start = Vector(x, y, 2000), endpos = Vector(x, y, -3000), mask = MASK_PLAYERSOLID_BRUSHONLY})
	return tr.HitPos + Vector(0, 0, 4)
end

step(0, function()
	log("start (wmdebug)")
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	S.base = Ground(-12450, -2500)
	S.host = player.GetHumans()[1]
	S.list = {}
	for i, w in ipairs(GUNS) do
		local n = ents.Create("npc_pr_soldier")
		n:SetModel("models/player/eft/followers/glukhar/glukhar_scout.mdl")
		n:SetKeyValue("additionalequipment", w)
		n:SetPos(S.base + Vector(-250 + i * 80, 0, 0))
		n:SetAngles(Angle(0, 270, 0))
		PR_Quietly(function() n:Spawn() n:Activate() end)
		S.list[i] = n
	end
end)

step(3, function()
	for i, n in ipairs(S.list) do
		local wep = n:GetActiveWeapon()
		local bone = n:LookupBone("ValveBiped.Bip01_R_Hand")
		local hand = bone and n:GetBonePosition(bone)
		if IsValid(wep) then
			local bgs = {}
			for _, bg in ipairs(wep:GetBodyGroups() or {}) do bgs[#bgs + 1] = bg.name .. "=" .. wep:GetBodygroup(bg.id) .. "/" .. (bg.num - 1) end
			log(string.format("WM %s model %s pos-hand %.0f custom %s mdlvalid %s bodygroups %s", wep:GetClass(), wep:GetModel(),
				hand and wep:GetPos():Distance(hand) or -1, tostring(wep.WorldModel_UseCustomPosition), tostring(util.IsValidModel(wep:GetModel())),
				table.concat(bgs, " ")))
			-- Своя позиция (ArcCW WorldModelOffset) — модель ставим к кисти сами, проверяем расстояние; обычную
			-- мировую модель (FA:S2) движок приклеивает к кисти при отрисовке — сущность на сервере у ног
			check("gun " .. wep:GetClass() .. " sits at the hand", not wep.WorldModel_UseCustomPosition or (hand and wep:GetPos():Distance(hand) < 40),
				hand and math.Round(wep:GetPos():Distance(hand)))
		else
			log("WM no weapon for " .. GUNS[i])
		end
	end
	if IsValid(S.host) then
		S.host:SetMoveType(MOVETYPE_NOCLIP)
		S.host:SetPos(S.base + Vector(0, -170, 30))
		T.lookAt(S.base + Vector(0, 0, 45))
	end
end)

step(3, function() T.shot("wm_row") end)

step(1, function()
	if IsValid(S.host) then
		S.host:SetPos(S.list[1]:GetPos() + Vector(40, -70, 50))
		T.lookAt(S.list[1]:GetPos() + Vector(0, 0, 45))
	end
end)

step(3, function() T.shot("wm_akm_close") end)

step(1, function()
	for _, n in ipairs(S.list) do if IsValid(n) then n:Remove() end end
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
