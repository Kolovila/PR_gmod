local att = {}
att.name = "md_improved_bolt"
att.displayName = "Improved Bolt"
att.displayNameShort = "Fast Bolt"
att.isBG = true

att.statModifiers = {FireDelayMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/improved_bolt")
end

function att:attachFunc()
end

function att:detachFunc()
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)