local att = {}
att.name = "am_12g_p312c"
att.displayName = "Łuski Poleva-3"
att.displayNameShort = "P-3 12c"

att.statModifiers = {
	RecoilMult = -0.15,
	AimSpreadMult = -1.1,
	HipSpreadMult = -1.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_12g_p312c")
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