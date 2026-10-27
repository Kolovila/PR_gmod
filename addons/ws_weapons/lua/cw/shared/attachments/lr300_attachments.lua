AddCSLuaFile()

---------- Tan Skin ----------

local att = {}
att.name = "lr300_tan"
att.displayName = "Tan Handle"
att.displayNameShort = "Tan"
att.isBG = true

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/lr300_tan")
	att.description = {[1] = {t = "Changes the polymer's colour to Tan.", c = CustomizableWeaponry.textColors.COSMETIC}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(1)
	end
	if self.WMEnt then
		self.WMEnt:SetSkin(1)
	end
end

function att:detachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(0)
	end
	if self.WMEnt then
		self.WMEnt:SetSkin(0)
	end
end

CustomizableWeaponry:registerAttachment(att)

---------- Green Skin ----------

local att = {}
att.name = "lr300_green"
att.displayName = "Green Handle"
att.displayNameShort = "Green"
att.isBG = true

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/lr300_green")
	att.description = {[1] = {t = "Changes the polymer's colour to Green.", c = CustomizableWeaponry.textColors.COSMETIC}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(2)
	end
	if self.WMEnt then
		self.WMEnt:SetSkin(2)
	end
end

function att:detachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(0)
	end
	if self.WMEnt then
		self.WMEnt:SetSkin(0)
	end
end

CustomizableWeaponry:registerAttachment(att)

---------- Sci-Fi Skin ----------

local att = {}
att.name = "lr300_scifi"
att.displayName = "Marpshyr"
att.displayNameShort = "Sci-Fi"
att.isBG = true

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/lr300_scifi")
	att.description = {[1] = {t = "Changes the gun to a futuristic Red & Black look.", c = CustomizableWeaponry.textColors.COSMETIC}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(3)
	end
	if self.WMEnt then
		self.WMEnt:SetSkin(3)
	end
end

function att:detachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(0)
	end
	if self.WMEnt then
		self.WMEnt:SetSkin(0)
	end
end

CustomizableWeaponry:registerAttachment(att)

---------- Long Barrel ----------

local att = {}
att.name = "lr300_longbarrel"
att.displayName = "Long Barrel"
att.displayNameShort = "Long"
att.isBG = true

att.statModifiers = {DamageMult = 0.1,
AimSpreadMult = -0.1,
RecoilMult = 0.1,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/lr300_longbarrel")
	att.description = {[1] = {t = "A barrel for long range engagements.", c = CustomizableWeaponry.textColors.REGULAR}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.long)
	self:updateSoundTo("CW_LR300_LONGBARREL_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_LR300_LONGBARREL_FIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)

---------- EXT RIS Receiver ----------

local att = {}
att.name = "lr300_longreceiver"
att.displayName = "Long Barrel RIS"
att.displayNameShort = "EXT RIS"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15longris")
	att.description = {[1] = {t = "A rail interface for your weapon.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.ReceiverBGs.main, self.ReceiverBGs.m16)
end

function att:detachFunc()
	self:setBodygroup(self.ReceiverBGs.main, self.ReceiverBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)

---------- Green Tip Rounds ----------

local att = {}
att.name = "am_greentip"
att.displayName = "Green Tip Rounds"
att.displayNameShort = "Green Tip"

att.statModifiers = {DamageMult = 0.25,
RecoilMult = 0.30}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/green_tip")
	att.description = {[1] = {t = "An excellent choice for armor penetration.", c = CustomizableWeaponry.textColors.REGULAR}}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)