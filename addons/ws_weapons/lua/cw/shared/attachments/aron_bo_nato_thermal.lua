local att = {}
att.name = "bo_nato_ir"
att.displayName = "NATO IR Scope"
att.displayNameShort = "IR Scope"
att.aimPos = {"AronNATOIRPos", "AronNATOIRAng"}
att.FOVModifier = 27
att.isSight = true
att.withoutRail = true

att.statModifiers = {OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/ir")
	att.description = {[1] = {t = "N.A.T.O. IR Scope", c = CustomizableWeaponry.textColors.POSITIVE}}

	local old, x, y, ang
	
	att.zoomTextures = {{tex = surface.GetTextureID("aron_icons/nato_ir_retlic"), offset = {0, 1}}}

	local lens = surface.GetTextureID("aron_icons/nato_ir_retlic")
	local lensMat = Material("cw2/gui/lense")
end

	function att:attachFunc()
	self.OverrideAimMouseSens = 0.75
	self.SimpleTelescopicsFOV = 50
	self.AimViewModelFOV = 40
	self.BlurOnAim = false
	self.ZoomTextures = att.zoomTextures
	self.AimBreathingEnabled = true
	self.MoveWepAwayWhenAiming = true
	self.SimpleTSAcquired = true
	self.ThermalAcquired = true
end

function att:detachFunc()
	self.OverrideAimMouseSens = nil
	self.SimpleTelescopicsFOV = nil
	self.AimViewModelFOV = self.AimViewModelFOV_Orig
	self.BlurOnAim = false
	self:resetAimBreathingState()
	self.MoveWepAwayWhenAiming = false
	self.SimpleTSAcquired = false
	self.ThermalAcquired = false
end

CustomizableWeaponry:registerAttachment(att)

if CLIENT then
	local PP_IRFX = 
	{
		[ "$pp_colour_addr" ] 		= 0,
		[ "$pp_colour_addg" ] 		= 0.15,
		[ "$pp_colour_addb" ] 		= 0.8,
		[ "$pp_colour_brightness" ] = 0.03,
		[ "$pp_colour_contrast" ]	= 1,
		[ "$pp_colour_colour" ] 	= 0.5,
		[ "$pp_colour_mulr" ] 		= 0,
		[ "$pp_colour_mulg" ] 		= 0,
		[ "$pp_colour_mulb" ] 		= 0
	}

	local function CW20_BLACKOPS1_IRFX()
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()
		
		if not IsValid(wep) or not wep.CW20Weapon then
			return
		end
		
		UCT = UnPredictedCurTime()
		local simpleTelescopics = wep.SimpleTSAcquired or not wep:canUseComplexTelescopics()
		
		local hasZoom = (wep.SimpleTelescopicsFOV)
		local canUseIR = (simpleTelescopics and hasZoom and wep.ThermalAcquired)
		
		if not (canUseIR and UCT > wep.AimTime and wep.dt.State == CW_AIMING) then
			return
		end
				
		render.SuppressEngineLighting(true)
		
		FT = FrameTime()
		
		for _, ent in pairs(ents.GetAll()) do
			if ent:IsNPC() or ent:IsPlayer() or ent:IsVehicle() or ent:IsWeapon() then
				if not ent:IsEffectActive(EF_NODRAW) then
					render.SuppressEngineLighting(true)
					render.MaterialOverride( Material("aron_icons/white") )
					render.SetBlend( 1 )
					ent:DrawModel()
					render.SuppressEngineLighting(false)
				end
			elseif ent:IsRagdoll() or ent:GetClass() == "class C_ClientRagdoll" then
				render.SuppressEngineLighting(true)
				ent:DrawModel()
				render.SuppressEngineLighting(false)
			end
		end
		
		DrawColorModify(PP_IRFX)
		DrawBloom( 0.65, 2.5, 10, 10, 1, 1, 1, 1, 1 )
		
		render.SuppressEngineLighting(false)
	end
	
	hook.Add("PostDrawOpaqueRenderables", "CW20_BLACKOPS1_IRFX", function()
		CW20_BLACKOPS1_IRFX()
	end)
end