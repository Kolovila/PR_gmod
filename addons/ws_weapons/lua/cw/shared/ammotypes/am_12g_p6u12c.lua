local att = {}
att.name = "am_12g_p6u12c"
att.displayName = "Łuski Poleva-6u"
att.displayNameShort = "P-6u 12c"

att.statModifiers = {
	RecoilMult = -0.1,
	AimSpreadMult = -1.15,
	HipSpreadMult = -1.15,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_12g_p6u12c")
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