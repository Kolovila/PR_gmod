local att = {}
att.name = "am_300blk_ap"
att.displayName = "Pociski .300 AAC Blackout AP"
att.displayNameShort = "AP"

att.statModifiers = {
	DamageMult = 0.15,
	RecoilMult = 0.05,
	AimSpreadMult = -0.05,
	HipSpreadMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_300blk_ap")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)