local att = {}
att.name = "am_flechettem37"
att.displayName = "Buck, #2"
att.displayNameShort = "2BUCK"

att.statModifiers = {ClumpSpreadMult = -0.2,
	DamageMult = -0.6,
	RecoilMult = -.25}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/num2buck")
	att.description = {{t = "Adds hit probability with 20 smaller pellets", c = CustomizableWeaponry.textColors.POSITIVE},
	{t = "Decreases penetration by 25%", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()
	self.Shots = 20
	self.PenMod = .75
end

function att:detachFunc()
	self.Shots = self.Shots_Orig
	self.PenMod = 1
end

CustomizableWeaponry:registerAttachment(att)