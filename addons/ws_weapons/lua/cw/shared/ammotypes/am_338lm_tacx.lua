local att = {}
att.name = "am_338lm_tacx"
att.displayName = "Pociski .338 TAC-X"
att.displayNameShort = "TAC-X"

att.statModifiers = {
	DamageMult = 0.09,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_338lm_tacx")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)