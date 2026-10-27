local att = {}
att.name = "bg_kk_xm8_foregrip_compact"
att.displayName = "Compact Handguard"
att.displayNameShort = "Compact"
att.isBG = true

att.statModifiers = {
	RecoilMult = -0.2,
	AimSpreadMult = 0.7,
	OverallMouseSensMult = 0.15,
	DrawSpeedMult = 0.2
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_kk_xm8_foregrip_compact")
	att.description = {[1] = {t = "Setup for close range engagements.", c = CustomizableWeaponry.textColors.REGULAR}}
end

function att:attachFunc()
	self.MuzzlePosMod = self.MuzzlePosModShort
	self:updateSoundTo("CW_KK_XM8_FIRE_COMPACT", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_KK_XM8_FIRE_SUPPRESSED_COMPACT", CustomizableWeaponry.sounds.SUPPRESSED)
end

function att:detachFunc()
	self.MuzzlePosMod = self.MuzzlePosModDef
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)