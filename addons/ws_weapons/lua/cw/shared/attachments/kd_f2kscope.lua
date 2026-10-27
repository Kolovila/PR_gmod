local att = {}
att.name = "kd_f2kscope"
att.displayName = "Standard F2000 Scope"
att.displayNameShort = "F2000"
att.aimPos = {"KDINS2FN2000Pos", "KDINS2FN2000Ang"}
att.FOVModifier = 0
att.AimViewModelFOV = 35
att.isSight = true

att.statModifiers = {
	OverallMouseSensMult = -0.06
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {
		[1] = {t = "Provides 1.6x magnification.", c = CustomizableWeaponry.textColors.POSITIVE},
		[2] = {t = "Narrow scope may decrease awareness.", c = CustomizableWeaponry.textColors.NEGATIVE}
	}
end

CustomizableWeaponry:registerAttachment(att)