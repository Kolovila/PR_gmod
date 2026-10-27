local att = {}
att.name = "am_545_ps"
att.displayName = "Pociski PS"
att.displayNameShort = "PS"

att.statModifiers = {RecoilMult = -0.02}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_54539ps")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)