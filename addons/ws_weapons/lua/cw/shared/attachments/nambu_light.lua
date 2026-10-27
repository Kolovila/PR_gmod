local att = {}
att.name = "nambu_light"
att.displayName = "Lightweight Variant"
att.displayNameShort = "Lightweight"
att.isBG = true
att.SpeedDec = -3

att.statModifiers = {OverallMouseSensMult = 0.15,
RecoilMult = -0.20,
DamageMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/onehand")
	att.description = {[1] = {t = "Makes your Nambu more lightweight.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)