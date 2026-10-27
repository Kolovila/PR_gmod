local att = {}
att.name = "am_12g_superformance"
att.displayName = "Łuski SuperFormance"
att.displayNameShort = "SF"

att.statModifiers = {
	RecoilMult = -0.15,
	AimSpreadMult = -1.7,
	HipSpreadMult = -1.7,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_12g_superformance")
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