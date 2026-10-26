AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_util.lua")
AddCSLuaFile("testhud.lua")
AddCSLuaFile("custom_scoreboard.lua")
AddCSLuaFile("player/sh_player_save.lua")
AddCSLuaFile("cl_ui.lua")
AddCSLuaFile("cl_shop.lua")
AddCSLuaFile("cl_menu.lua")
AddCSLuaFile("cl_patrols.lua")
AddCSLuaFile("cl_minimap.lua")
AddCSLuaFile("config/minimap.lua")

-- Снимок карты для мини-карты: клиенты скачивают его с сервера (или с sv_downloadurl)
resource.AddFile("materials/test_gm_mat/minimap/rp_desert_conflict.jpg")

include("shared.lua")
include("sv_util.lua")
include("sv_db.lua")
include("player/sh_player_save.lua")
include("sv_shop.lua")
include("sv_admin.lua")
include("sv_sandbox.lua")
include("sv_patrols.lua")
include("sv_minimap.lua")
include("sv_vivo_compat.lua")
include("sv_simfphys_compat.lua")
include("sv_rocket_compat.lua")

-- Игрок, которому засчитывается убийство. Водитель техники тоже считается.
function PR_KillerPlayer(attacker)
	if IsValid(attacker) and isfunction(attacker.GetDriver) and IsValid(attacker:GetDriver()) then
		attacker = attacker:GetDriver()
	end

	if IsValid(attacker) and attacker:IsPlayer() then
		return attacker
	end
end

-- Опыт игроку: общий, фракционный и оружейный. Уровень растёт, когда опыта >= уровень * 100.
local function PR_AddExp(ply, exp, weaponExp)
	local function LevelUp(expKey, levelKey)
		local level = ply:GetNWInt(levelKey)
		if ply:GetNWInt(expKey) >= level * 100 then
			ply:SetNWInt(expKey, 0)
			ply:SetNWInt(levelKey, level + 1)
		end
	end

	ply:SetNWInt("PR_exp", ply:GetNWInt("PR_exp") + exp)
	LevelUp("PR_exp", "PR_level")

	local frac = ply:GetNWString("PR_fraction")
	if PR_IsFraction(frac) then
		ply:SetNWInt("PR_exp_" .. frac, ply:GetNWInt("PR_exp_" .. frac) + exp)
		ply:SetNWInt("PR_weapon_exp_" .. frac, ply:GetNWInt("PR_weapon_exp_" .. frac) + weaponExp)
		LevelUp("PR_exp_" .. frac, "PR_level_" .. frac)
	end
end

local function PR_AddMoney(ply, amount)
	ply:SetNWInt("PR_money", math.max(ply:GetNWInt("PR_money") + amount, 0))
end

-- Награда {money, exp} игроку — для того, что гибнет не как NPC (техника патрулей)
function PR_GiveReward(ply, reward)
	if not IsValid(ply) or not ply:IsPlayer() or not istable(reward) then return end
	PR_AddMoney(ply, reward.money or 0)
	PR_AddExp(ply, reward.exp or 0, reward.exp or 0)
end

-- Купленное оружие из пресета при каждом спавне
hook.Add("PlayerSpawn", "PR_GivePreset", function(ply)
	local preset = ply.Preset or {}
	local purchased = ply.PurchasedWeapons or {}

	for _, slot in ipairs({"Primary", "Secondary"}) do
		local item = istable(preset[slot]) and preset[slot]["Item"]
		if isstring(item) and table.HasValue(purchased, item) then
			ply:Give(item)
		end
	end
end)

-- Награда за убийство игрока: 100$ + 20$ за уровень фракции жертвы, опыт 10 + уровень жертвы.
-- За своего — штраф 100$ (мародёры друг другу не свои, см. PR_AreAllies).
hook.Add("PlayerDeath", "PR_KillReward", function(victim, inflictor, attacker)
	-- Бот-экипаж техники патруля: за него платит сама техника (sv_patrols.lua)
	if victim:GetNWBool("PR_PatrolCrew") then return end

	victim:SetNWInt("PR_deaths", victim:GetNWInt("PR_deaths") + 1)

	-- Убил NPC, мир или упал сам: награды нет
	attacker = PR_KillerPlayer(attacker)
	if not attacker or victim == attacker then return end

	local victimFrac = victim:GetNWString("PR_fraction")
	local victimLevel = victim:GetNWInt("PR_level_" .. victimFrac)

	if PR_AreAllies(victimFrac, attacker:GetNWString("PR_fraction")) then
		PR_AddMoney(attacker, -100)
		return
	end

	if victimFrac == "" then
		PR_AddMoney(attacker, 100)
	else
		PR_AddMoney(attacker, 100 + 20 * victimLevel)
	end

	PR_AddExp(attacker, 10 + victimLevel, 10 + victimLevel)
	attacker:SetNWInt("PR_kills", attacker:GetNWInt("PR_kills") + 1)
end)

-- Внимание: у OnNPCKilled порядок (npc, attacker, inflictor), не как у PlayerDeath
hook.Add("OnNPCKilled", "PR_KillReward", function(victim, attacker, inflictor)
	attacker = PR_KillerPlayer(attacker)
	if not attacker then return end

	-- За своих защитников точки не платим
	if victim.WhiteFractionList != nil and victim.WhiteFractionList == attacker:GetNWString("PR_fraction") then return end

	-- У патрульных своя награда (config/patrols.lua), у остальных NPC — 100$ и 1 опыта
	local reward = victim.PR_Reward or {}
	PR_AddMoney(attacker, reward.money or 100)
	PR_AddExp(attacker, reward.exp or 1, reward.exp or 1)
	attacker:SetNWInt("PR_kills_npc", attacker:GetNWInt("PR_kills_npc") + 1)
end)

-- Взрывы (DMG_BLAST) по технике и пропам в 20 раз сильнее
hook.Add("EntityTakeDamage", "PR_BlastVsVehicles", function(target, dmginfo)
	if dmginfo:GetDamageType() == DMG_BLAST then
		if target:IsPlayer() or target:IsNPC() then return end
		dmginfo:ScaleDamage(20)
	end
end)

-- F4
function GM:ShowSpare2(ply)
	ply:ConCommand("open_main_menu")
end

function GM:ShutDown()
	PR_Save_All()
end

function GM:PlayerSay(ply, text)
	local playerMsg = string.Explode(" ", text)

	-- !деньги 500 — выкинуть пачку денег перед собой
	if playerMsg[1] == "!деньги" then
		local amount = math.floor(tonumber(playerMsg[2] or "") or 0)

		if amount <= 0 then
			ply:ChatPrint("Пиши так: !деньги 500")
		elseif ply:GetNWInt("PR_money") < amount then
			ply:ChatPrint("Не хватает денег")
		else
			local money = scripted_ents.Get("pr_money"):SpawnFunction(ply, ply:GetEyeTrace(), "pr_money")

			if IsValid(money) then
				money:SetValue(amount)
				ply:SetNWInt("PR_money", ply:GetNWInt("PR_money") - amount)
			end
		end

		return "" -- чтобы команда не светилась в чате
	end

	-- Без этого обычные сообщения не доходят до чата
	return text
end

-- Потолок скорости: бег 250, шаг 150
timer.Create("PR_ChangeSpeed", 1, 0, function()
	for _, v in ipairs(player.GetAll()) do
		if v:GetRunSpeed() > 250 then
			v:SetRunSpeed(250)
		end
		if v:GetWalkSpeed() > 150 then
			v:SetWalkSpeed(150)
		end
	end
end)
