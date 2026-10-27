local att = {}
att.name = "am_casull"
att.displayName = "454 Casull Cylinder"
att.displayNameShort = "454 Casull"
att.isBG = true

att.statModifiers = {
	DamageMult = 0.65,
	RecoilMult = 0.45,
		}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/matchgradeammo")
	att.description = {
	[1] = {t = "Texas Red had not cleared leather when a bullet fairly ripped...", c = CustomizableWeaponry.textColors.POSITIVE},
	[2] = {t = "Allows the use of .454 Casull rounds.", c = CustomizableWeaponry.textColors.VPOSITIVE},
	}
end

function att:attachFunc()
	self:unloadWeapon()
	self:updateSoundTo("CW_KK_INS2_MATEBA_454_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self.Primary.Ammo			= ".454 casull"
end

function att:detachFunc()
	self:unloadWeapon()
	self:restoreSound()
	self.Primary.Ammo			= ".357 Magnum"
end

CustomizableWeaponry:registerAttachment(att)