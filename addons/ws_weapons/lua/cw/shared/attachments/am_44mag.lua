local att = {}
att.name = "am_44mag"
att.displayName = "44 Magnum Cylinder"
att.displayNameShort = "44 Mag"
att.isBG = true

att.statModifiers = {
	DamageMult = 0.175,
	RecoilMult = 0.275,
		}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/matchgradeammo")
	att.description = {
	[1] = {t = "Allows the use of .44 magnum rounds.", c = CustomizableWeaponry.textColors.POSITIVE},
	}
end

function att:attachFunc()
	self:unloadWeapon()
	self:updateSoundTo("CW_KK_INS2_MATEBA_44_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self.Primary.Ammo			= ".44 magnum"
end

function att:detachFunc()
	self:unloadWeapon()
	self:restoreSound()
	self.Primary.Ammo			= ".357 Magnum"
end

CustomizableWeaponry:registerAttachment(att)