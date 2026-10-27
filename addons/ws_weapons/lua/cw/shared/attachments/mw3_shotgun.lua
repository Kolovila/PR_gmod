local att = {}
	att.name = "mw3_att_shotgun"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.isAltmode = true

	att.statModifiers = {}
	
	if CLIENT then
		att.description = {[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC},
		} 
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_shotgun")
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
	self:setBodygroup(self.GripBGs.main, self.GripBGs.shg)
	self.Animations = self.Animations_SHG
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.ToggleInTime = 0.8
	self.ToggleOutTime = 0.7

	self.Altmode.ClipSize 		= 4
	self.Altmode.DefaultClip	= self.Altmode.ClipSize
	self.Altmode.Ammo			= "buckshot"

	self.Altmode.FireSound		= "MW3_SHOTGUN_FIRE"
	self.Altmode.FireDelay		= 60/200

	self.Altmode.Damage			= 10
	self.Altmode.ClumpSpread	= 0.06
	self.Altmode.Shots			= 10

	self.Altmode.ShotgunReload		= true
	self.Altmode.ReloadStartTime	= (self.SHGReloadStartTime or 1.17)
	self.Altmode.InsertShellTime	= (self.SHGReloadLoopTime or 1.1)
	self.Altmode.ReloadFinishWait	= (self.SHGReloadEndTime or 1.2)

	self.Altmode.ReloadSpeed		= 1.25
	self.Altmode.RechamberTime = 0.45

	self.Altmode.NoADS = true
	self.Altmode.BoltActionLogic = true
	self.ShotgunEquipped = true
		
	if not self.HasBeenGivenBuckshot then
		self:GiveSecondaryAmmoSHG()
	end

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
	self:setBodygroup(self.GripBGs.main, self.GripBGs.normal)
	self.Animations = self.Animations_Normal
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.Altmode.BoltActionLogic = false
	self.Altmode.DefaultClip = nil
	self.ShotgunEquipped = false
end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_shotgun2"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.isAltmode = true

	att.statModifiers = {}
	
	if CLIENT then
		att.description = {[1] = {t = "#mw3_att_shotgun_desc", c = CustomizableWeaponry.textColors.COSMETIC},
		} 
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_shotgun")
	end

function att:attachFunc()
	self.CurName2 = self.WpnName .. " " .. loc('mw3_att_shotgun_equipped')
	if self.WpnName then
		if self.AttachmentEquipped then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_shotgun_equipped')
		end
	end
	self.AttachmentEquipped2 = true
	self:setBodygroup(self.GripBGs.main, self.GripBGs.shg)
	self.Animations = self.Animations_SHG
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.ToggleInTime = 0.8
	self.ToggleOutTime = 0.7

	self.Altmode.ClipSize 		= 4
	self.Altmode.DefaultClip	= self.Altmode.ClipSize
	self.Altmode.Ammo			= "buckshot"

	self.Altmode.FireSound		= "MW3_SHOTGUN_FIRE"
	self.Altmode.FireDelay		= 60/200

	self.Altmode.Damage			= 10
	self.Altmode.ClumpSpread	= 0.06
	self.Altmode.Shots			= 10

	self.Altmode.ShotgunReload		= true
	self.Altmode.ReloadStartTime	= (self.SHGReloadStartTime or 1.17)
	self.Altmode.InsertShellTime	= (self.SHGReloadLoopTime or 1.1)
	self.Altmode.ReloadFinishWait	= (self.SHGReloadEndTime or 1.2)

	self.Altmode.ReloadSpeed		= 1.25
	self.Altmode.RechamberTime = 0.45

	self.Altmode.NoADS = true
	self.Altmode.BoltActionLogic = true
	self.ShotgunEquipped = true
		
	if not self.HasBeenGivenBuckshot then
		self:GiveSecondaryAmmoSHG()
	end

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
	self:setBodygroup(self.GripBGs.main, self.GripBGs.normal)
	self.Animations = self.Animations_Normal
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.Altmode.BoltActionLogic = false
	self.Altmode.DefaultClip = nil
	self.ShotgunEquipped = false
end

CustomizableWeaponry:registerAttachment(att)
