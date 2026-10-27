local att = {}
	att.name = "mw3_att_grip"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""

	att.statModifiers = {}

	if CLIENT then
		att.description = {[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC},
		} 
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_grip")
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
		self.Animations = self.Animations_Grip
		self:sendWeaponAnim("idle")
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
		self.Animations = self.Animations_Normal
		self:sendWeaponAnim("idle")
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_grip2"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""

	att.statModifiers = {}

	if CLIENT then
		att.description = {[1] = {t = "#mw3_att_grip_desc", c = CustomizableWeaponry.textColors.COSMETIC},
		} 
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_grip")
	end

	function att:attachFunc()
		self.CurName2 = self.WpnName .. " " .. loc('mw3_att_grip_equipped')
		if self.WpnName then
			if self.AttachmentEquipped then
				self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
			else
				self.PrintName = self.WpnName .. " " .. loc('mw3_att_grip_equipped')
			end
		end
		self.AttachmentEquipped2 = true
		self.Animations = self.Animations_Grip
		self:sendWeaponAnim("idle")
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
		self.Animations = self.Animations_Normal
		self:sendWeaponAnim("idle")
		self.AttachmentEquipped2 = nil
	end

CustomizableWeaponry:registerAttachment(att)
