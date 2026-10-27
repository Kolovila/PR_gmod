local att = {}
att.name = "mw3_att_mags"
att.displayName = "#" .. att.name
att.displayNameShort = ""

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_mags")
	att.description = {[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}}
end

	function att:attachFunc()
	self.CurName = self.WpnName .. " " .. loc(att.name .. '_equipped')
	if self.WpnName then
		if self.AttachmentEquipped2 then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc(att.name .. '_equipped')
		end
	end
	self.AttachmentEquipped = true
	self.Primary.ClipSize = self.Primary.ClipSize_Ext
	end

	function att:detachFunc()
	if self.WpnName then
		if self.AttachmentEquipped2 then
			self.PrintName = self.CurName2
		else
			self.PrintName = self.WpnName
		end
	end
	self.AttachmentEquipped = nil
	self.Primary.ClipSize = self.Primary.ClipSize_Orig
	self:unloadWeaponPartially()
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
att.name = "mw3_att_mags2"
att.displayName = "#" .. att.name
att.displayNameShort = ""

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_mags")
	att.description = {[1] = {t = "#mw3_att_mags_desc", c = CustomizableWeaponry.textColors.COSMETIC}}
end

	function att:attachFunc()
	self.CurName2 = self.WpnName .. " " .. loc('mw3_att_mags_equipped')
	if self.WpnName then
		if self.AttachmentEquipped then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_mags_equipped')
		end
	end
	self.AttachmentEquipped2 = true
	self.Primary.ClipSize = self.Primary.ClipSize_Ext
	end

	function att:detachFunc()
	if self.WpnName then
		if self.AttachmentEquipped then
			self.PrintName = self.CurName
		else
			self.PrintName = self.WpnName
		end
	end
	self.AttachmentEquipped2 = nil
	self.Primary.ClipSize = self.Primary.ClipSize_Orig
	self:unloadWeaponPartially()
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
att.name = "mw3_att_rapid_fire"
att.displayName = "#" .. att.name
att.displayNameShort = ""

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_rapid_fire")
	att.description = {[1] = {t = "#mw3_att_rapid_fire_desc", c = CustomizableWeaponry.textColors.COSMETIC}}
end

	function att:attachFunc()
	self.CurName = self.WpnName .. " " .. loc(att.name .. '_equipped')
	if self.WpnName then
		if self.AttachmentEquipped2 then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc(att.name .. '_equipped')
		end
	end
	self.AttachmentEquipped = true
	end

	function att:detachFunc()
	if self.WpnName then
		if self.AttachmentEquipped2 then
			self.PrintName = self.CurName2
		else
			self.PrintName = self.WpnName
		end
	end
	self.AttachmentEquipped = nil
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
att.name = "mw3_att_rapid_fire2"
att.displayName = "#" .. att.name
att.displayNameShort = ""

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_rapid_fire")
	att.description = {[1] = {t = "#mw3_att_rapid_fire_desc", c = CustomizableWeaponry.textColors.COSMETIC}}
end

	function att:attachFunc()
	self.CurName2 = self.WpnName .. " " .. loc('mw3_att_rapid_fire_equipped')
	if self.WpnName then
		if self.AttachmentEquipped then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_rapid_fire_equipped')
		end
	end
	self.AttachmentEquipped2 = true
	end

	function att:detachFunc()
	if self.WpnName then
		if self.AttachmentEquipped then
			self.PrintName = self.CurName
		else
			self.PrintName = self.WpnName
		end
	end
	self.AttachmentEquipped2 = nil
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
att.name = "mw3_att_knife"
att.displayName = "#" .. att.name
att.displayNameShort = ""
att.aimPos = {"KnifePos", "KnifeAng"}
att.isSight = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_knife")
	att.description = {[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}}
end

	function att:attachFunc()
	self.CurName = self.WpnName .. " " .. loc(att.name .. '_equipped')
	if self.WpnName then
		self.PrintName = self.WpnName .. " " .. loc(att.name .. '_equipped')
	end
	self.AttachmentEquipped = true
	self.CanMelee = true
	self.Animations = self.Animations_Knife
	self:sendWeaponAnim("idle")
	self.CustomizePos = self.CustomizePos_Knife
	self.TacKnifeOn = true
	end

	function att:detachFunc()
	if self.WpnName then
		self.PrintName = self.WpnName
	end
	self.AttachmentEquipped = nil
	self.CanMelee = false
	self.Animations = self.Animations_Normal
	self:sendWeaponAnim("idle")
	self.CustomizePos = self.CustomizePos_Orig
	self.TacKnifeOn = false
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_silencer2"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.isSuppressor = true

	att.statModifiers = {}

	if CLIENT then
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_silencer")
		att.description = {
		[1] = {t = "#mw3_att_silencer_desc", c = CustomizableWeaponry.textColors.COSMETIC}
		}
	end

	function att:attachFunc()
		self.CurName2 = self.WpnName .. " " .. loc('mw3_att_silencer_equipped')
		if self.WpnName then
			if self.AttachmentEquipped then
				self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
			else
				self.PrintName = self.WpnName .. " " .. loc('mw3_att_silencer_equipped')
			end
		end
		self.AttachmentEquipped2 = true
		self.dt.Suppressed = true
		self:setBodygroup(self.MuzzleBGs.main, self.MuzzleBGs.off)
	end

	function att:detachFunc()
		if self.WpnName then
			if self.AttachmentEquipped then
				self.PrintName = self.CurName
			else
				self.PrintName = self.WpnName
			end
		end
		self.AttachmentEquipped2 = nil
		self.dt.Suppressed = false
		self:setBodygroup(self.MuzzleBGs.main, self.MuzzleBGs.normal)
	end
	
CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_silencer"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.isSuppressor = true

	att.statModifiers = {}

	if CLIENT then
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_silencer")
		att.description = {
		[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}
		}
	end

	function att:attachFunc()
		self.CurName = self.WpnName .. " " .. loc(att.name .. '_equipped')
		if self.WpnName then
			if self.AttachmentEquipped2 then
				self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
			else
				self.PrintName = self.WpnName .. " " .. loc(att.name .. '_equipped')
			end
		end
		self.AttachmentEquipped = true
		self.dt.Suppressed = true
		self:setBodygroup(self.MuzzleBGs.main, self.MuzzleBGs.off)
	end

	function att:detachFunc()
		if self.WpnName then
			if self.AttachmentEquipped2 then
				self.PrintName = self.CurName2
			else
				self.PrintName = self.WpnName
			end
		end
		self.AttachmentEquipped = nil
		self.dt.Suppressed = false
		self:setBodygroup(self.MuzzleBGs.main, self.MuzzleBGs.normal)
	end
	
CustomizableWeaponry:registerAttachment(att)
