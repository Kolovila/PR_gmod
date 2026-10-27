local att = {}
att.name = "am_76254_lpsgzh"
att.displayName = "Pociski LPS Gzh"
att.displayNameShort = "LPS Gzh"

att.statModifiers = {
	DamageMult = 0.08,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76254_lpsgzh")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)