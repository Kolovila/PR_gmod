local att = {}
att.name = "md_ak101"
att.displayName = "AK101 Conversion"
att.displayNameShort = "AK101"

att.statModifiers = {DamageMult = -.2,
AimSpreadMult = -.19,
RecoilMult = -.19,
FireDelayMult = -.143,
MaxSpreadIncMult = -0.12}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/matchgradeammo")
		att.description = {[1] = {t = "Conversion to the standard NATO round.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
self:updateSoundTo("CW_AR15_LONGBARREL_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
end

function att:detachFunc()
self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)