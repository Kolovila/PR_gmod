local att = {}
att.name = "am_338lm_upz"
att.displayName = "Pociski .338 UPZ"
att.displayNameShort = "UPZ"

att.statModifiers = {
	DamageMult = 0.02,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_338lm_upz")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)