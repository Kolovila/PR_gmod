local att = {}
att.name = "am_12g_grizzly40"
att.displayName = "Łuski Grizzly 40"
att.displayNameShort = "Grizzly"

att.statModifiers = {
	RecoilMult = 0.2,
	DamageMult = 2.1,
	AimSpreadMult = -0.8,
	HipSpreadMult = -0.8,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_12g_grizzly40")
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