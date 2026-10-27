local att = {}
	att.name = "mw3_att_gl_m203"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.isAltmode = true

	att.statModifiers = {}

	if CLIENT then
		att.description = {
		[1] = {t = "#mw3_att_gl_desc", c = CustomizableWeaponry.textColors.COSMETIC},
		} 
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_m203")
	end

	function att:attachFunc()
	self.CurName = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
	if self.WpnName then
		if self.AttachmentEquipped2 then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
		end
	end
	self.AttachmentEquipped = true
	self:setBodygroup( self.GripBGs.main, self.GripBGs.gl )
	self.Animations = self.Animations_GL
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.ToggleInTime = 0.8
	self.ToggleOutTime = 0.8

	self.Altmode.ClipSize 		= 1
	self.Altmode.DefaultClip	= 1
	self.Altmode.Ammo			= "40MM"

	self.Altmode.FireSound		= "MW3_M203_FIRE"
	self.Altmode.FireDelay		= 0.25

	self.Altmode.Damage			= 80
	self.Altmode.ClumpSpread	= 0
	self.Altmode.Shots			= 1

	self.Altmode.ShotgunReload		= false
	self.Altmode.ReloadTime			= 2
	self.Altmode.ReloadHalt			= (self.GLReloadTime or 2.5)
	self.Altmode.ReloadTime_Empty	= self.Altmode.ReloadTime
	self.Altmode.ReloadHalt_Empty	= self.Altmode.ReloadHalt
	self.Altmode.ReloadSpeed		= self.ReloadSpeed

	self.Altmode.NoADS				= true
	self.GLEquipped = true
			
	if not self.HasBeenGiven40MM then
		self:GiveSecondaryAmmoGL()
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
	self:setBodygroup( self.GripBGs.main, self.GripBGs.normal )
	self.Animations = self.Animations_Normal
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.Altmode.DefaultClip = nil
	self.GLEquipped = false
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_gl_m2032"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.isAltmode = true

	att.statModifiers = {}
	
	if CLIENT then
		att.description = {
		[1] = {t = "#mw3_att_gl_desc", c = CustomizableWeaponry.textColors.COSMETIC},
		} 
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_m203")
	end

	function att:attachFunc()
	self.CurName2 = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
	if self.WpnName then
		if self.AttachmentEquipped then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
		end
	end
	self.AttachmentEquipped2 = true
	self:setBodygroup( self.GripBGs.main, self.GripBGs.gl )
	self.Animations = self.Animations_GL
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.ToggleInTime = 0.8
	self.ToggleOutTime = 0.8

	self.Altmode.ClipSize 		= 1
	self.Altmode.DefaultClip	= 1
	self.Altmode.Ammo			= "40MM"

	self.Altmode.FireSound		= "MW3_M203_FIRE"
	self.Altmode.FireDelay		= 0.25

	self.Altmode.Damage			= 80
	self.Altmode.ClumpSpread	= 0
	self.Altmode.Shots			= 1

	self.Altmode.ShotgunReload		= false
	self.Altmode.ReloadTime			= 2
	self.Altmode.ReloadHalt			= (self.GLReloadTime or 2.55)
	self.Altmode.ReloadTime_Empty	= self.Altmode.ReloadTime
	self.Altmode.ReloadHalt_Empty	= self.Altmode.ReloadHalt
	self.Altmode.ReloadSpeed		= self.ReloadSpeed

	self.Altmode.NoADS				= true
	self.GLEquipped = true
			
	if not self.HasBeenGiven40MM then
		self:GiveSecondaryAmmoGL()
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
	self:setBodygroup( self.GripBGs.main, self.GripBGs.normal )
	self.Animations = self.Animations_Normal
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.Altmode.DefaultClip = nil
	self.GLEquipped = false
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_gl_m320"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.isAltmode = true

	att.statModifiers = {}
	
	if CLIENT then
		att.description = {
		[1] = {t = "#mw3_att_gl_desc", c = CustomizableWeaponry.textColors.COSMETIC},
		} 
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_m320")
	end

	function att:attachFunc()
	self.CurName = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
	if self.WpnName then
		if self.AttachmentEquipped2 then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
		end
	end
	self.AttachmentEquipped = true
	self:setBodygroup( self.GripBGs.main, self.GripBGs.gl )
	self.Animations = self.Animations_GL
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.ToggleInTime = 0.8
	self.ToggleOutTime = 0.8

	self.Altmode.ClipSize 		= 1
	self.Altmode.DefaultClip	= 1
	self.Altmode.Ammo			= "40MM"

	self.Altmode.FireSound		= "MW3_M320_FIRE"
	self.Altmode.FireDelay		= 0.25

	self.Altmode.Damage			= 80
	self.Altmode.ClumpSpread	= 0
	self.Altmode.Shots			= 1

	self.Altmode.ShotgunReload		= false
	self.Altmode.ReloadTime			= 2
	self.Altmode.ReloadHalt			= (self.GLReloadTime or 3)
	self.Altmode.ReloadTime_Empty	= self.Altmode.ReloadTime
	self.Altmode.ReloadHalt_Empty	= self.Altmode.ReloadHalt
	self.Altmode.ReloadSpeed		= self.ReloadSpeed

	self.Altmode.NoADS				= true
	self.GLEquipped = true
		
	if not self.HasBeenGiven40MM then
		self:GiveSecondaryAmmoGL()
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
	self:setBodygroup( self.GripBGs.main, self.GripBGs.normal )
	self.Animations = self.Animations_Normal
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.Altmode.DefaultClip = nil
	self.GLEquipped = false
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_gl_m3202"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.isAltmode = true

	att.statModifiers = {}
	
	if CLIENT then
		att.description = {
		[1] = {t = "#mw3_att_gl_desc", c = CustomizableWeaponry.textColors.COSMETIC},
		} 
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_m320")
	end

	function att:attachFunc()
	self.CurName2 = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
	if self.WpnName then
		if self.AttachmentEquipped then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
		end
	end
	self.AttachmentEquipped2 = true
	self:setBodygroup( self.GripBGs.main, self.GripBGs.gl )
	self.Animations = self.Animations_GL
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.ToggleInTime = 0.8
	self.ToggleOutTime = 0.8

	self.Altmode.ClipSize 		= 1
	self.Altmode.DefaultClip	= 1
	self.Altmode.Ammo			= "40MM"

	self.Altmode.FireSound		= "MW3_M320_FIRE"
	self.Altmode.FireDelay		= 0.25

	self.Altmode.Damage			= 80
	self.Altmode.ClumpSpread	= 0
	self.Altmode.Shots			= 1

	self.Altmode.ShotgunReload		= false
	self.Altmode.ReloadTime			= 2
	self.Altmode.ReloadHalt			= (self.GLReloadTime or 3)
	self.Altmode.ReloadTime_Empty	= self.Altmode.ReloadTime
	self.Altmode.ReloadHalt_Empty	= self.Altmode.ReloadHalt
	self.Altmode.ReloadSpeed		= self.ReloadSpeed

	self.Altmode.NoADS				= true
	self.GLEquipped = true
		
	if not self.HasBeenGiven40MM then
		self:GiveSecondaryAmmoGL()
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
	self.AttachmentEquipped2= nil
	self:setBodygroup( self.GripBGs.main, self.GripBGs.normal )
	self.Animations = self.Animations_Normal
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.Altmode.DefaultClip = nil
	self.GLEquipped = false
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_gl_gp25"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.isAltmode = true

	att.statModifiers = {}
	
	if CLIENT then
		att.description = {
		[1] = {t = "#mw3_att_gl_desc", c = CustomizableWeaponry.textColors.COSMETIC},
		} 
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_gp25")
	end

	function att:attachFunc()
	self.CurName = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
	if self.WpnName then
		if self.AttachmentEquipped2 then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
		end
	end
	self.AttachmentEquipped = true
	self:setBodygroup( self.GripBGs.main, self.GripBGs.gl )
	self.Animations = self.Animations_GL
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.ToggleInTime = 0.8
	self.ToggleOutTime = 0.8

	self.Altmode.ClipSize 		= 1
	self.Altmode.DefaultClip	= 1
	self.Altmode.Ammo			= "40MM"

	self.Altmode.FireSound		= "MW3_gp25_FIRE"
	self.Altmode.FireDelay		= 0.25

	self.Altmode.Damage			= 80
	self.Altmode.ClumpSpread	= 0
	self.Altmode.Shots			= 1

	self.Altmode.ShotgunReload		= false
	self.Altmode.ReloadTime			= 2.5
	self.Altmode.ReloadHalt			= (self.GLReloadTime or 3.13)
	self.Altmode.ReloadTime_Empty	= self.Altmode.ReloadTime
	self.Altmode.ReloadHalt_Empty	= self.Altmode.ReloadHalt
	self.Altmode.ReloadSpeed		= self.ReloadSpeed

	self.Altmode.NoADS				= true
	self.GLEquipped = true
		
	if not self.HasBeenGiven40MM then
		self:GiveSecondaryAmmoGL()
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
	self:setBodygroup( self.GripBGs.main, self.GripBGs.normal )
	self.Animations = self.Animations_Normal
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.Altmode.DefaultClip = nil
	self.GLEquipped = false
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_gl_gp252"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.isAltmode = true

	att.statModifiers = {}
	
	if CLIENT then
		att.description = {
		[1] = {t = "#mw3_att_gl_desc", c = CustomizableWeaponry.textColors.COSMETIC},
		} 
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_gp25")
	end

	function att:attachFunc()
	self.CurName2 = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
	if self.WpnName then
		if self.AttachmentEquipped then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_gl_equipped')
		end
	end
	self.AttachmentEquipped2 = true
	self:setBodygroup( self.GripBGs.main, self.GripBGs.gl )
	self.Animations = self.Animations_GL
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.ToggleInTime = 0.8
	self.ToggleOutTime = 0.8

	self.Altmode.ClipSize 		= 1
	self.Altmode.DefaultClip	= 1
	self.Altmode.Ammo			= "40MM"

	self.Altmode.FireSound		= "MW3_gp25_FIRE"
	self.Altmode.FireDelay		= 0.25

	self.Altmode.Damage			= 80
	self.Altmode.ClumpSpread	= 0
	self.Altmode.Shots			= 1

	self.Altmode.ShotgunReload		= false
	self.Altmode.ReloadTime			= 2.5
	self.Altmode.ReloadHalt			= (self.GLReloadTime or 3.13)
	self.Altmode.ReloadTime_Empty	= self.Altmode.ReloadTime
	self.Altmode.ReloadHalt_Empty	= self.Altmode.ReloadHalt
	self.Altmode.ReloadSpeed		= self.ReloadSpeed

	self.Altmode.NoADS				= true
	self.GLEquipped = true
		
	if not self.HasBeenGiven40MM then
		self:GiveSecondaryAmmoGL()
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
	self:setBodygroup( self.GripBGs.main, self.GripBGs.normal )
	self.Animations = self.Animations_Normal
	self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
	self.Altmode.DefaultClip = nil
	self.GLEquipped = false
	end

CustomizableWeaponry:registerAttachment(att)
