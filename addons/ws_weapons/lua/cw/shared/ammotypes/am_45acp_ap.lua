local att = {}
att.name = "am_45acp_ap"
att.displayName = "Pociski AP"
att.displayNameShort = ".45 AP"

att.statModifiers = {
	DamageMult = 0.06,
	HipSpreadMult = 0.05,
	AimSpreadMult = 0.05,
	RecoilMult = 0.2,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_45ap")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)