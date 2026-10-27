local att = {}
att.name = "am_flechetterounds2"
att.displayName = "Flechette rounds"
att.displayNameShort = "Flechette"

att.statModifiers = {ClumpSpreadMult = -0.4,
	DamageMult = -0.65}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/flechetterounds")
	att.description = {{t = "Fires lots of razer  sharp nails.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.Shots = 20
	 
end

function att:detachFunc()
	self.Shots = self.Shots_Orig
	 
end

CustomizableWeaponry:registerAttachment(att)