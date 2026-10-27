local att = {}
	att.name = "mw3_att_variable"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""

	att.statModifiers = {}

	if CLIENT then
	att.displayIcon = surface.GetTextureID("mw3_icons/atts/scope_variable")
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
		self.AdjustableZoom = true
		self.MinZoom = 65
		self.MaxZoom = 85
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
		self.AdjustableZoom = false
		self.ZoomAmount = self.ZoomAmount_Orig
	end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_sniper"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.aimPos = {"ScopePos", "ScopeAng"}
	att.FOVModifier = 75
	att.isBG = true
	att.isSight = true
	att.isScope= true

	att.statModifiers = {}

	if CLIENT then
	att.displayIcon = surface.GetTextureID("mw3_icons/atts/scope_variable")
	att.description = {[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}}
	end

	function att:attachFunc()
		self.isSniper = true
		self:setBodygroup( self.ScopeBGs.main, self.ScopeBGs.scope )
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
		self.ADSSpeed = self.ADSSpeed_Orig * .75
	end

	function att:detachFunc()
		self.isSniper = false
		self:setBodygroup( self.ScopeBGs.main, self.ScopeBGs.none )
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
		self.ADSSpeed = self.ADSSpeed_Orig
		
		self.AimBreathingEnabled = false
		self.MoveWepAwayWhenAiming = false
		self.DrawBlackBarsOnAim = false
		self.SimpleTSAcquired = false
		self.DelayedZoom = false
		self.SnapZoom = false
	end

CustomizableWeaponry:registerAttachment(att)
