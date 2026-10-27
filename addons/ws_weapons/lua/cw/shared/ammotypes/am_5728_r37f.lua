local att = {}
att.name = "am_5728_r37f"
att.displayName = "Pociski R37.F"
att.displayNameShort = "R37.F"

att.statModifiers = {
	DamageMult = -0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_5728r37f")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)