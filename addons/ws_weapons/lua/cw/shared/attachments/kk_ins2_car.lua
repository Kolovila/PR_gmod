local att = {}
att.name = "kk_ins2_car"
att.displayName = "Center Axis Relock"
att.displayNameShort = "John Wick"
att.aimPos = {"KKINS2CarPos", "KKINS2CarAng"}
att.FOVModifier = 0
att.AimViewModelFOV = 40
att.isSight = true

att.statModifiers = {
	// OverallMouseSensMult = -0.05,
	HipSpreadMult = -0.15,
	AimSpreadMult = -0.15,
	DrawSpeedMult = 0.05,
	VelocitySensitivityMult = -0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_car")
	att.description = {
		[1] = {t = "Ironsights become aligned with your left eye.", c = CustomizableWeaponry.textColors.POSITIVE},
		[2] = {t = "+Makes you look cool", c = CustomizableWeaponry.textColors.VPOSITIVE},
		[3] = {t = "Decreases aim FOV, making long range engagement difficult.", c = CustomizableWeaponry.textColors.VNEGATIVE},
	}

	-- att.reticle = "models/weapons/optics/kobra_dot"
	-- att._reticleSize = 16


end

function att:attachFunc()
	self.SimpleTelescopicsFOV = 70
	--self.AimViewModelFOV = 50
	self.BlurOnAim = true
	self.ZoomTextures = att.zoomTextures
end

function att:detachFunc()
	self.OverrideAimMouseSens = nil
	self.SimpleTelescopicsFOV = nil
	--self.AimViewModelFOV = self.AimViewModelFOV_Orig
	self.BlurOnAim = false
end

CustomizableWeaponry:registerAttachment(att)
