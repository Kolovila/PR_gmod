local att = {}
att.name = "am_12g_ledslug"
att.displayName = "Łuski Led"
att.displayNameShort = "Led"

att.statModifiers = {
	DamageMult = 1.9,
	AimSpreadMult = -1.20,
	HipSpreadMult = -1.20,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_12g_ledslug")
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