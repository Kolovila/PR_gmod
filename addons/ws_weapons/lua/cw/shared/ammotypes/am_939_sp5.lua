local att = {}
att.name = "am_939_sp5"
att.displayName = "Pociski SP-5"
att.displayNameShort = "SP-5"

att.statModifiers = {
	DamageMult = 0.14,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_939_sp5")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)