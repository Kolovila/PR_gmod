local att = {}
att.name = "am_5728_sb193"
att.displayName = "Pociski SB193"
att.displayNameShort = "SB193"

att.statModifiers = {
	DamageMult = 0.2,
	RecoilMult = -0.2,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_5728sb193")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)