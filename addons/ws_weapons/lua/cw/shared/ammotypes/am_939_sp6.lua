local att = {}
att.name = "am_939_sp6"
att.displayName = "Pociski SP-6"
att.displayNameShort = "SP-6"

att.statModifiers = {
	RecoilMult = 0.1,
	DamageMult = 0.18,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_939_sp6")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)