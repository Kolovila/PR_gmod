local att = {}
att.name = "am_5728_r37x"
att.displayName = "Pociski R37.X"
att.displayNameShort = "R37.X"

att.statModifiers = {
	DamageMult = 0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_5728r37x")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)