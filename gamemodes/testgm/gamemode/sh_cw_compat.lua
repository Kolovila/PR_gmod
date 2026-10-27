-- CW 2.0 считает дальность и пробитие ствола из баллистики его патрона (CustomizableWeaponry.ammoTypes,
-- ищется по точному имени Primary.Ammo). Несколько стволов из addons/ws_weapons берут стандартные
-- патроны HL2, которых в этой таблице нет, — и падали при выдаче (cw_base: CaseLength = nil):
-- S&W 29 («357»), Ithaca 37 и M1912 («Buckshot»), M202 и M72 LAW («rpg_round»).
-- Дописываем им баллистику похожих патронов CW (диаметр пули и длина гильзы, мм).

local MISSING = {
	["357"] = {bulletDiameter = 9, caseLength = 33},      -- как .357 Magnum
	["Buckshot"] = {bulletDiameter = 5, caseLength = 10}, -- как 12 Gauge
	["rpg_round"] = {bulletDiameter = 40, caseLength = 100}
}

local function Fill()
	if not (CustomizableWeaponry and CustomizableWeaponry.ammoTypes) then return end
	local types = CustomizableWeaponry.ammoTypes
	for name, info in pairs(MISSING) do
		types[name] = types[name] or info
	end
	-- Имя ищется с учётом регистра, а паки пишут по-разному («.44 Magnum» и «.44 magnum»):
	-- копия под строчным именем
	local lower = {}
	for name, info in pairs(types) do
		local l = string.lower(name)
		if l ~= name and not types[l] then lower[l] = info end
	end
	for l, info in pairs(lower) do types[l] = info end
end

-- Стволы, которые рисуют модель в руке сами (DrawTraditionalWorldModel = false), берут сдвиг и поворот
-- из WMPos / WMAng. У некоторых из паков поворота нет — cw_base/cl_model.lua падал каждый кадр.
-- Ставим нулевые: модель может сидеть чуть криво, но рисуется и без ошибок
local function FixWorldModelOffsets()
	for _, w in ipairs(weapons.GetList()) do
		local c = w.ClassName
		if c and weapons.IsBasedOn(c, "cw_base") then
			local stored = weapons.GetStored(c)
			local full = weapons.Get(c)
			if full and full.DrawTraditionalWorldModel == false then
				if not full.WMAng then stored.WMAng = Angle(0, 0, 0) end
				if not full.WMPos then stored.WMPos = Vector(0, 0, 0) end
			end
		end
	end
end

Fill()
-- На случай, если CW подгрузился позже режима; стволы к Initialize уже зарегистрированы
hook.Add("Initialize", "PR_CWAmmoCompat", function()
	Fill()
	FixWorldModelOffsets()
end)
hook.Add("InitPostEntity", "PR_CWWorldModelCompat", FixWorldModelOffsets)
