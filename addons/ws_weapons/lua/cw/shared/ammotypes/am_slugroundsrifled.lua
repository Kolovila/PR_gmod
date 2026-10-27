local att = {}
att.name = "am_rifledslugs"
att.displayName = "Rifled Slugs"
att.displayNameShort = "Slug"

att.statModifiers = {DamageMult = 5.7,
	AimSpreadMult = -.7,
	RecoilMult = 0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/slugrounds")
	att.description = {{t = "Deals colossal amounts of damage.", c = CustomizableWeaponry.textColors.POSITIVE},
	{t = "Requires a more accurate shot.", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()
	self.Shots = 1
	self.ClumpSpread = nil
	 
end

function att:detachFunc()
	self.Shots = self.Shots_Orig
	self.ClumpSpread = self.ClumpSpread_Orig
	 
end

CustomizableWeaponry:registerAttachment(att)