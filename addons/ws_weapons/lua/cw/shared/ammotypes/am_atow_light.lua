local att = {}
att.name = "am_atow_light"
att.displayName = "Match"
att.displayNameShort = "MAT"

att.statModifiers = {AimSpreadMult = -0.45}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/matchgradeammo")
	att.description = {{t = "Provides superior long range ballistic performance", c = CustomizableWeaponry.textColors.POSITIVE},
	{t = "Increases range and decreases damage falloff.", c = CustomizableWeaponry.textColors.VPOSITIVE},}
end

function att:attachFunc()
	self.PenMod = 0.80
end

function att:detachFunc()
	self.PenMod = 1
end

CustomizableWeaponry:registerAttachment(att)