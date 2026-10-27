local att = {}
att.name = "am_4630_fmjsx"
att.displayName = "Pociski FMJ SX"
att.displayNameShort = "FMJ SX"

att.statModifiers = {
	DamageMult = 0.09,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_46030fmjsx")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)