local att = {}
	att.name = "mw3_att_thermal"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.aimPos = ({"ThermalPos", "ThermalAng"} or {"ReflexPos", "ReflexAng"})
	att.FOVModifier = 40
	att.isSight = true
	att.isScope = true

	att.statModifiers = {}

	if CLIENT then
	att.displayIcon = surface.GetTextureID("mw3_icons/atts/scope_thermal")
	att.description = {[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}}
	
	local CW20_MA85_MW3_IRFX_SETTING = 
	{
		[ "$pp_colour_addr" ] 		= 0,
		[ "$pp_colour_addg" ] 		= 0,
		[ "$pp_colour_addb" ] 		= 0,
		[ "$pp_colour_brightness" ] = 0.01,
		[ "$pp_colour_contrast" ]	= 1,
		[ "$pp_colour_colour" ] 	= 0,
		[ "$pp_colour_mulr" ] 		= 0,
		[ "$pp_colour_mulg" ] 		= 0,
		[ "$pp_colour_mulb" ] 		= 0
	}

	local highlights_material = Material("hf_icons/Other/white")

	local function CW20_MA85_MW3_IRFX()
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()
		
		if not IsValid(wep) or not wep.CW20Weapon then
			return
		end
		
		UCT = UnPredictedCurTime()
		if not (wep.ThermalAcquiredMW3 and UCT > wep.AimTime and wep.dt.State == CW_AIMING) then
			return
		end
				
	--	render.SuppressEngineLighting(true)

		-- get all entities that are to be drawn 'white hot'
		-- note that getting only player, npc and vehicle may or may not be faster than getting all
		local highlight_ents -- = ents.GetAll()
		highlight_ents = ents.FindByClass("player")
		highlight_ents = table.Add(highlight_ents, ents.FindByClass("npc_*"))
		highlight_ents = table.Add(highlight_ents, ents.FindByClass("*vehicle_*"))

		-- go through all entities
		for _, ent in pairs(highlight_ents) do
			if ent:IsNPC() or ent:IsPlayer() or ent:IsVehicle() then
				if not ent:IsEffectActive(EF_NODRAW) then
					render.MaterialOverride( highlights_material )
					render.SetBlend( 1 )
					ent:DrawModel()
					render.SetBlend( 0 )
					render.MaterialOverride( nil )
				end
			end
		end
		
	--	render.SuppressEngineLighting(false)
	end

	local function CW20_MA85_MW3_IRFX_SSE()
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()
		
		if not IsValid(wep) or not wep.CW20Weapon then
			return
		end
		
		UCT = UnPredictedCurTime()
		if not (wep.ThermalAcquiredMW3 and UCT > wep.AimTime and wep.dt.State == CW_AIMING) then
			return
		end
		
		DrawColorModify( CW20_MA85_MW3_IRFX_SETTING )
		DrawBloom( 0.65, 2.5, 10, 10, 1, 1, 1, 1, 1 )
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
		--self.OverrideAimMouseSens = 0.75
		self.AimBreathingEnabled = true
		self.AimViewModelFOV = 50
		self.BlurOnAim = false
		self.AimBreathingEnabled = true
		self.MoveWepAwayWhenAiming = true
		self.DrawBlackBarsOnAim = true
		self.SimpleTSAcquired = true
		self.OverrideAimMouseSens = 0.9
		self.ThermalAcquiredMW3 = true
		self.ADSSpeed = self.ADSSpeed_Orig * 0.75
		self.ScopeSpeed = (self.ScopeSpeed_Thermal or self.ScopeSpeed_Orig * 1.5)

		hook.Add("PostDrawOpaqueRenderables", "CW20_MA85_MW3_IRFX", CW20_MA85_MW3_IRFX)
		hook.Add("RenderScreenspaceEffects", "CW20_MA85_MW3_IRFX_SSE",CW20_MA85_MW3_IRFX_SSE)
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
		--self.OverrideAimMouseSens = 1
		-- self.SimpleTelescopicsFOV = nil
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
		self.BlurOnAim = false
		self:resetAimBreathingState()
		self.MoveWepAwayWhenAiming = false
		self.DrawBlackBarsOnAim = false
		self.SimpleTSAcquired = false
		self.ThermalAcquiredMW3 = false
		self.ADSSpeed = self.ADSSpeed_Orig
		self.ScopeSpeed = self.ScopeSpeed_Orig

		hook.Remove("PostDrawOpaqueRenderables", "CW20_MA85_MW3_IRFX")
		hook.Remove("RenderScreenspaceEffects", "CW20_MA85_MW3_IRFX_SSE")
	end
end

CustomizableWeaponry:registerAttachment(att)
