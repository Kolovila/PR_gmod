ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Category = "TestPR"

ENT.PrintName = "Точка захвата"
ENT.Author = "Kolovila"
ENT.Contact = ""
ENT.Purpose = "Захвати точку, получай доход"
ENT.Instructions = "E — захват / меню точки"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.BaseHealth = 1000000000

ENT.Model = "models/props_wasteland/kitchen_counter001d.mdl"

-- Миникарта хранит тут свою иконку точки
ENT.img = ""

ENT.MaxGuardianCount = 5
ENT.CaptureRadius = 600

-- Цена следующего улучшения. Монитор: уровни 0..4, индекс = уровень + 1.
-- Комп: уровни 1..5, индекс = уровень. Нет цены = максимум.
ENT.UpgradePrices = {30000, 80000, 180000, 480000}

ENT.GuardianTypes = {
	["дикий"] = {
		ClassName = "npc_vj_mishawild_sniper1",
		Price = 2000,
		Weapons = "scav"
	},
	["ёбнутый"] = {
		ClassName = "npc_vj_mishawild_sanitar_security1",
		Price = 4000,
		Weapons = "sanitar"
	}
}

ENT.GuardianWeapons = {
	scav = {
		["Кедр"] = {ClassName = "weapon_vj_meft_kedr", Price = 1500},
		["Двухстволка"] = {ClassName = "weapon_vj_meft_mr43", Price = 1000},
		["МР153"] = {ClassName = "weapon_vj_meft_mp153", Price = 3000},
		["ПМ"] = {ClassName = "weapon_vj_meft_pm", Price = 2500},
		["ТОЗ-136"] = {ClassName = "weapon_vj_meft_toz", Price = 1500},
		["АКС-74У"] = {ClassName = "weapon_vj_meft_aks74u", Price = 1000},
		["АК-74М"] = {ClassName = "weapon_vj_meft_ak74m", Price = 1500},
		["Говностай"] = {ClassName = "weapon_vj_meft_vpo215", Price = 1500},
		["СКС"] = {ClassName = "weapon_vj_meft_sks", Price = 1000},
		["Мосинка"] = {ClassName = "weapon_vj_meft_mosin", Price = 3000}
	},
	sanitar = {
		["АК-101"] = {ClassName = "weapon_vj_meft_reshala_ak101", Price = 3000},
		["UMP45"] = {ClassName = "weapon_vj_meft_ump45", Price = 1500},
		["SCAR"] = {ClassName = "weapon_vj_meft_scar", Price = 1000},
		["M4A1"] = {ClassName = "weapon_vj_meft_m4a1", Price = 3000},
		["АС ВАЛ"] = {ClassName = "weapon_vj_meft_asval", Price = 3000}
	}
}

-- Множитель здоровья защитника, он же множитель цены типа
ENT.GuardianHealthMul = {1, 1.5, 2, 2.5}
ENT.GuardianSignalPrice = 500

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "CaptureTeam")
	self:NetworkVar("String", 1, "CurPoint")

	self:NetworkVar("Int", 0, "UpgradeMonitor")
	self:NetworkVar("Int", 1, "UpgradeComputer")
	self:NetworkVar("Int", 2, "GuardianCount")
	self:NetworkVar("Int", 3, "StoredMoney")

	self:NetworkVar("Float", 0, "NextIncome")
	self:NetworkVar("Float", 1, "CaptureStart")
	self:NetworkVar("Float", 2, "CaptureEnd")

	self:NetworkVar("Entity", 0, "Capturer")
end

function ENT:GetUpgradePrice(kind)
	if kind == "monitor" then
		return self.UpgradePrices[self:GetUpgradeMonitor() + 1]
	elseif kind == "computer" then
		return self.UpgradePrices[self:GetUpgradeComputer()]
	end
end

function ENT:GetIncomeInterval()
	return 450 - self:GetUpgradeMonitor() * 100
end

function ENT:GetIncomeAmount()
	return self:GetUpgradeComputer() * 1000
end

-- Точка принадлежит фракции (а не пустая или «Ничья»)
function ENT:HasOwner()
	local team = self:GetCaptureTeam()
	return team ~= "" and team ~= "Ничья"
end

-- Цена защитника или nil, если выбор неверный
function ENT:GetGuardianPrice(typeKey, weaponKey, hpIndex, signal)
	local gtype = self.GuardianTypes[typeKey]
	local hpMul = self.GuardianHealthMul[hpIndex]
	if not gtype or not hpMul then return end

	local weaponPrice = 0
	if weaponKey ~= "" then
		local weapon = (self.GuardianWeapons[gtype.Weapons] or {})[weaponKey]
		if not weapon then return end
		weaponPrice = weapon.Price
	end

	return math.floor(gtype.Price * hpMul) + weaponPrice + (signal and self.GuardianSignalPrice or 0)
end
