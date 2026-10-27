function SWEP:AttachmentRecoilCalculation()
local attachment = self.ActiveAttachments

	recoilmod = 1

	if attachment.mw3_att_grip or attachment.mw3_att_grip2 then
		recoilmod = recoilmod - .25
	end

	if attachment.mw3_prof_kick then
		recoilmod = recoilmod - .15
	end

	return recoilmod
end

	-- self.ScopeSpeed = self.ScopeSpeed_Orig * 1.25
	
function SWEP:AttachmentEffectiveRangeCalculation()
local attachment = self.ActiveAttachments

	rangemod = 1
	
	if attachment.mw3_att_silencer or attachment.mw3_att_silencer2 then
		rangemod = rangemod - .25
	end
	
	if attachment.mw3_prof_range then
		rangemod = rangemod + .25
	end

	return rangemod
end

function SWEP:AttachmentSpreadCalculation()
local attachment = self.ActiveAttachments

	spreadmod = 1
	
	if self.isDualwield then
		spreadmod = spreadmod + 25
	end
	
	return spreadmod
end

function SWEP:MW3Attachments()

self.ZoomInButton = "+use"
self.ZoomOutButton = "+reload"

	if GetConVarNumber("mw3_prompt_wii_crosshair") == 1 then
		self.useWiiCrosshair = true
	else
		self.useWiiCrosshair = false
	end

	if GetConVarNumber("mw3_ammo_show_reload") == 1 then
		self.ShowReloadPrompt = true
	else
		self.ShowReloadPrompt = false
	end

	if GetConVarNumber("mw3_ammo_show_lowammo") == 1 then
		self.ShowLowAmmoPrompt = true
	else
		self.ShowLowAmmoPrompt = false
	end

	if GetConVarNumber("mw3_ammo_show_noammo") == 1 then
		self.ShowEmptyPrompt = true
	else
		self.ShowEmptyPrompt = false
	end

	if GetConVarNumber("mw3_show_alt") == 1 then
		self.ShowAltWpnPrompt = true
	else
		self.ShowAltWpnPrompt = false
	end

	if GetConVarNumber("mw3_prompt_controller") == 1 then
		self.ShowConsoleButtons = true
	else
		self.ShowConsoleButtons = false
	end

	if GetConVarNumber("mw3_prompt_controller_ps4") == 1 then
		self.ShowConsoleButtons_PS4 = true
	else
		self.ShowConsoleButtons_PS4 = false
	end

	if GetConVarNumber("mw3_sens_reduce") == 1 then
		self.SlowSensOnAim = true
	else
		self.SlowSensOnAim = false
	end

	if GetConVarNumber("mw3_show_melee") == 1 then
		self.ShowMeleePrompt = true
	else
		self.ShowMeleePrompt = false
	end

if self.SlowSensOnAim then
	self.SlowSensClose = GetConVarNumber("mw3_sens_close")
	self.SlowSensMid = GetConVarNumber("mw3_sens_mid")
	self.SlowSensLong = GetConVarNumber("mw3_sens_long")
end

-- attsbutton = GetConVarString("mw3_cusmenu_camo")

-- if CLIENT then
-- if attsbutton == "use"
	-- or attsbutton == "reload" 
	-- or attsbutton == "zoom" 
	-- or attsbutton == "jump" 
	-- or attsbutton == "duck" 
	-- or attsbutton == "attack1" 
	-- or attsbutton == "attack2" then
	-- self.ScopeButton = "+" .. attsbutton
-- end
-- end

insbuttongetstring = GetConVarString("mw3_prompt_controller_button_inspect")
reloadbuttongetstring = GetConVarString("mw3_prompt_controller_button_reload")
gl1buttongetstring = GetConVarString("mw3_prompt_controller_button_gl_1")
gl2buttongetstring = GetConVarString("mw3_prompt_controller_button_gl_2")
breathbuttongetstring = GetConVarString("mw3_prompt_controller_button_breath")
aimbuttongetstring = GetConVarString("mw3_prompt_controller_button_aiming")
meleebutton1getstring = GetConVarString("mw3_prompt_controller_button_melee_1")
meleebutton2getstring = GetConVarString("mw3_prompt_controller_button_melee_2")
zoomingetstring = GetConVarString("mw3_prompt_controller_button_zoom_in")
zoomoutgetstring = GetConVarString("mw3_prompt_controller_button_zoom_out")

if self.ShowConsoleButtons then

self.Prompts_Shared = {
PadU = "W",
PadR = "D",
PadL = "A",
PadD = "X",
Pad = "S",

BL = "[",
BR = "]",
TL = "{",
TR = "}",
}

self.Prompts_PS4 = {
A = "x",
X = "s",
Y = "t",
B = "c",

A_Col = "<color=150,255,255>x",
X_Col = "<color=255,150,255>s",
Y_Col = "<color=150,255,150>t",
B_Col = "<color=255,150,150>c",

Guide = "h",
Start = "o",
Back = "r",

}

self.Prompts_Xbox = {
A = "a",
X = "x",
Y = "y",
B = "b",

A_Col = "<color=100,255,100>a",
X_Col = "<color=100,255,255>x",
Y_Col = "<color=255,255,0>y",
B_Col = "<color=255,100,100>b",

Guide = "g",
Start = "m",
Back = "v",

}

	if self.ShowConsoleButtons_PS4 then
		buttonset = self.Prompts_PS4
	else
		buttonset = self.Prompts_Xbox
	end

sharedset = self.Prompts_Shared

end

if CLIENT then
	self.AimOverlay_Reticle_Sniper = surface.GetTextureID("mw3_reticles/scope")
	self.AimOverlay_Reticle_Sniper_SVD = surface.GetTextureID("mw3_reticles/scope_svd")
	self.AimOverlay_Reticle_Thermal = surface.GetTextureID("mw3_reticles/scope_thermal")
	self.AimOverlay_Reticle_XM25 = surface.GetTextureID("mw3_reticles/scope_xm25")
end

	if self.BoltActionLogic then
		if self:Clip1() <= 0 then
			self.isRechambered = true
		end

		if not self.isRechambered then
			self:Rechamber()
		end
	end
	
	if self.BoltActionLogic and not self.isRechambered then
		self:Rechamber()
		return
	elseif self.Altmode.BoltActionLogic and not self.isRechambered then
		self:Rechamber()
		return
	end

local attachment = self.ActiveAttachments

if self.isSniper then
	if attachment.mw3_att_acog or (self.hasHybrid and not self.HybridOn) then
		self.AimBreathingEnabled = false
		self.MoveWepAwayWhenAiming = false
		self.DrawBlackBarsOnAim = false
		self.SimpleTSAcquired = false
		self.DelayedZoom = false
		self.SnapZoom = false
	else
		self.AimBreathingEnabled = true
		self.MoveWepAwayWhenAiming = true
		self.DrawBlackBarsOnAim = true
		self.SimpleTSAcquired = true
		self.DelayedZoom = true
		self.SnapZoom = true
	end
end

if self.isSniper then
	if attachment.mw3_att_thermal then
		self.AimOverlay = self.AimOverlay_Reticle_Thermal
		self.AimOverlay2 = nil
	elseif attachment.mw3_att_acog or (attachment.mw3_att_rsass_hybrid and not self.HybridOn) then
		self.AimOverlay = nil
		self.AimOverlay2 = nil
	else
		self.AimOverlay = self.ScopeReticle
		self.AimOverlay2 = nil
	end
elseif self.isXM25 then
	self.AimOverlay = self.AimOverlay_Reticle_XM25
	self.AimOverlay2 = nil
else
	if attachment.mw3_att_thermal then
		self.AimOverlay = self.AimOverlay_Reticle_Thermal
		self.AimOverlay2 = nil
	else
		self.AimOverlay = nil
		self.AimOverlay2 = nil
	end
end

if ((attachment.mw3_att_silencer or attachment.mw3_att_silencer2) and self.isSniper) and attachment.mw3_prof_damage then
	self.Damage = self.Damage_Orig * 1.4 * .7143
elseif ((attachment.mw3_att_silencer or attachment.mw3_att_silencer2) and self.isSniper) then
	self.Damage = self.Damage_Orig * .7143
elseif attachment.mw3_prof_damage then
	self.Damage = self.Damage_Orig * 1.4
else
	self.Damage = self.Damage_Orig
end

self.HipSpread = self.HipSpread_Orig * self:AttachmentSpreadCalculation()
self.Range = self.Range_Orig * self:AttachmentEffectiveRangeCalculation()
self:CalculateEffectiveRange()

if attachment.mw3_att_rapid_fire or attachment.mw3_att_rapid_fire2 then
	self.FireDelay = self.FireDelay_Orig * 0.75
else
	self.FireDelay = self.FireDelay_Orig
end

self.Recoil = self.Recoil_Orig * self:AttachmentRecoilCalculation()

if attachment.mw3_prof_impact then
	self.PenMod = self.PenMod_Orig * 2
else
	self.PenMod = self.PenMod_Orig
end

if attachment.mw3_prof_speed then
	self.ADSWalkSpeed = self.ADSWalkSpeed_Orig * 1.5
	self.SprintSpeed = self.SprintSpeed_Orig * 1.1
else
	self.ADSWalkSpeed = self.ADSWalkSpeed_Orig
	self.SprintSpeed = self.SprintSpeed_Orig
end

end