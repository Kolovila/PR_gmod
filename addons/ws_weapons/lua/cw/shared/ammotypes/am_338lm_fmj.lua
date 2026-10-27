local att = {}
att.name = "am_338lm_fmj"
att.displayName = "Pociski .338 FMJ"
att.displayNameShort = "FMJ"

att.statModifiers = {
	DamageMult = 0.12,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_338lm_fmj")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)