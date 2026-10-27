local att = {}
att.name = "am_12g_ap20"
att.displayName = "Łuski AP-20"
att.displayNameShort = "AP-20"

att.statModifiers = {
	DamageMult = 6,
	RecoilMult = 0.5,
	AimSpreadMult = -1.25,
	HipSpreadMult = -1.25,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_12g_ap20")
	att.description = {}
end

function att:attachFunc()
	self.Shots = 1
	self.ClumpSpread = nil
	self:unloadWeapon()
end

function att:detachFunc()
	self.Shots = self.Shots_Orig
	self.ClumpSpread = self.ClumpSpread_Orig
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)