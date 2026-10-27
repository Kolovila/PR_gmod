local att = {}
att.name = "stoner_lmg_grip"
att.displayName = "LMG Grip"
att.displayNameShort = "LMG Mode"
att.SpeedDec = 5

att.statModifiers = { DrawSpeedMult = 0.1,
RecoilMult = -0.1,
FireDelayMult = -.286
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bipod")
	-- PR: у автора строка описания стояла без «att.description = {…}» — ошибка Lua при загрузке
	att.description = {[1] = {t = "Makes your grip on surfaces hard and sturdy as a bipod, without the disadvantages of one.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.BipodInstalled = true
	self.CanRestOnObjects = false
end

function att:detachFunc()
	self.BipodInstalled = false
	self.CanRestOnObjects = true
end

CustomizableWeaponry:registerAttachment(att)
