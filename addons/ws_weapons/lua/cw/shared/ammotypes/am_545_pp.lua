local att = {}
att.name = "am_545_pp"
att.displayName = "Pociski PP"
att.displayNameShort = "PP"

att.statModifiers = {DamageMult = 0.02}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_54539pp")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)