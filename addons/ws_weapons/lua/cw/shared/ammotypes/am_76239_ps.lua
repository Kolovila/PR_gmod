local att = {}
att.name = "am_76239_ps"
att.displayName = "Pociski PS"
att.displayNameShort = "PS"

att.statModifiers = {
	DamageMult = 0.08,
	RecoilMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76239ps")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)