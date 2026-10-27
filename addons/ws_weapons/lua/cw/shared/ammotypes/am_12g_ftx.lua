local att = {}
att.name = "am_12g_ftx"
att.displayName = "Łuski FTX Custom LIte"
att.displayNameShort = "FTX"

att.statModifiers = {
	DamageMult = 2,
	AimSpreadMult = -1.35,
	HipSpreadMult = -1.35,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_12g_ftx")
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