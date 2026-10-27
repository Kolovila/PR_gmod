local reg = debug.getregistry()
local GetVelocity = reg.Entity.GetVelocity
local Length = reg.Vector.Length

// FUNC
if SERVER then
	function SWEP:toggleCustomization()
		if self.dt.State ~= CW_CUSTOMIZE then
			self.dt.State = CW_CUSTOMIZE
			-- self.dt.M203Active = false
		else
			self.dt.State = CW_IDLE
		end
		
		self:delayEverything(self.CUSTOMIZATION_MENU_TOGGLE_WAIT)
	end
end

function SWEP:resetPostDetach(att, attCategory)
	-- reset things like aim FOV and reticle functions in case the detached attachment is a sight
	local attName = attCategory.atts[attCategory.last]
	CustomizableWeaponry.callbacks.processCategory(self, "preDetachAttachment", att, attCategory)
	
	if att.isSight then
		self.ZoomAmount = self.ZoomAmount_Orig
		self.reticleFunc = nil
		
		if self.SightWithRail then
			if self.AttachmentModelsVM.md_rail then
				-- make the rail inactive in case the weapon uses it for the sights
				self.AttachmentModelsVM.md_rail.active = false
			end
			
			if self.RailBGs then
				self.CW_VM:SetBodygroup(self.RailBGs.main, self.RailBGs.off)
			end
		end
		
		if self.SightBGs and self.SightBGs.carryhandle then
			self:setBodygroup(self.SightBGs.main, self.SightBGs.carryhandle)
		end
		
		if self.WMEnt then
			if self.WMSightBGs and self.WMSightBGs.carryhandle then
				self.WMEnt:SetBodygroup(self.WMSightBGs.main, self.WMSightBGs.carryhandle)
			end
		end
		
		self.currentSight = nil
		
		if CLIENT then
			self:resetAimToIronsights()
		end
	end
	
	if CLIENT then
		-- make attachment models inactive
		if self.AttachmentModelsVM then
			if self.AttachmentModelsVM[attName] then
				self.AttachmentModelsVM[attName].active = false
			end
		end
		
		-- WHY IT COULD NOT BE UNACTIVE WHEN I ATTEMPTED TO MAKE A CALLBACK?
		-- I HAD TO COPY THE WHOLE FUNCTION FROM CW_BASE
		if self.AttachmentModelsWM then
			if self.AttachmentModelsWM[attName] then
				self.AttachmentModelsWM[attName].active = false
			end
		end
		
		local model = self.AttachmentModelsVM[attName]
		local modelWM = self.AttachmentModelsWM[attName]
		
		if self.AttachmentModelsVM then
			if model and model.detachVMBodyGroups then
				for main, sec in pairs(model.detachVMBodyGroups) do
					self:setBodygroup(main, sec)
				end
			end
		end
		
		if self.AttachmentModelsWM then
			if modelWM and modelWM.detachWMBodyGroups then
				for main, sec in pairs(modelWM.detachWMBodyGroups) do
					self.WMEnt:SetBodygroup(main, sec)
				end
			end
		end
		
		-- remove any rendering functions it might have had
		self.elementRender[att.name] = nil
		
		if self.elementRenderWM and self.elementRenderWM[att.name] then
			self.elementRenderWM[att.name] = nil
		end
	end
	
	self.ActiveAttachments[att.name] = false
	attCategory.last = nil
	
	CustomizableWeaponry.callbacks.processCategory(self, "postDetachAttachment", att, attCategory)
end

// CALLBACKS
CustomizableWeaponry.callbacks:addNew("postAttachAttachment", "CW20_BLACKOPS3_CALLBACK_POSTATTACH", function(wep,cur,curPos)
	if not wep.BlackOps3Weapon then
		return
	end
	
	local attTable = wep.Attachments[cur]
	local att = inherit or CustomizableWeaponry:findAttachment(attTable.atts[curPos])
	-- be advised - attTable.last = curPos
	
	if att.isSight then
		wep.currentSight = att.name
	end
	
	if CLIENT then
		if wep.AttachmentModelsVM and wep.AttachmentModelsVM[attTable.atts[curPos]] then
			local model = wep.AttachmentModelsVM[attTable.atts[curPos]]
		
			if model.attachVMBodyGroups then
				for main, sec in pairs(model.attachVMBodyGroups) do
					wep:setBodygroup(main, sec)
				end
			end
		end
	
		if wep.AttachmentModelsWM and wep.AttachmentModelsWM[attTable.atts[curPos]] then
			local model = wep.AttachmentModelsWM[attTable.atts[curPos]]
			
			if model then
				model.active = true
			end
			
			if att.isSight then
				if model.active and not att.isBG then
					if wep.WMEnt and wep.WMSightBGs and wep.WMSightBGs.none then
						wep.WMEnt:SetBodygroup(wep.WMSightBGs.main, wep.WMSightBGs.none)
					end
				end
			end
			
			if model.attachWMBodyGroups then
				for main, sec in pairs(model.attachWMBodyGroups) do
					wep.WMEnt:SetBodygroup(main, sec)
				end
			end
			
			if att.elementRenderWM then
				wep.elementRenderWM[att.name] = att.elementRenderWM
			end
		end
	end
end)

CustomizableWeaponry.callbacks:addNew("adjustViewmodelPosition", "CW20_BLACKOPS3_CALLBACK_ADJUSTVMPOS", function(wep, TargetPos, TargetAng)
	if not wep.BlackOps3Weapon then
		return
	end

	if CLIENT then
		local vel = GetVelocity(wep.Owner)
		local len = Length(vel)
		local ws = wep.Owner:GetWalkSpeed()
		local prefix = wep:GetPrefix()
		
		local EA = EyeAngles()
		local FT = FrameTime()
		
		if wep.Sequence then
			wep.IsReloading = wep.ReloadAnims[wep.Sequence]
		end
		
		if (wep.Animations[prefix .. "sprint_loop"] or wep.Animations[prefix .. "sprint_in"]) and (wep.dt.State == CW_RUNNING or (((len > ws * wep.RunStateVelocity and wep.Owner:KeyDown(IN_SPEED)) or len > ws * 3 or (wep.ForceRunStateVelocity and len > wep.ForceRunStateVelocity)) and wep.Owner:OnGround())) then
			return wep.AlternativePos, wep.AlternativeAng
		end
		
		if wep.Animations[prefix .. "crawl_loop"] and wep.dt.State == CW_PRONE_MOVING then
			return wep.AlternativePos, wep.AlternativeAng
		end
		
		if wep.dt.State == CW_HOLSTER_START or wep.dt.State == CW_HOLSTER_END then
			return wep.AlternativePos, wep.AlternativeAng
		end
	end
end)

// SOUND
CustomizableWeaponry:addRegularSound("Weapon_BLACKOPS3_UTIL.Empty", "weapons/blackops3/arak/wpn_ar_standard_start_ads.wav")
CustomizableWeaponry:addRegularSound("Weapon_BLACKOPS3_Melee.Riflebutt", 
	{
	"weapons/blackops3/rifle_butt/imp_rifle_butt_00.wav",
	"weapons/blackops3/rifle_butt/imp_rifle_butt_01.wav",
	"weapons/blackops3/rifle_butt/imp_rifle_butt_02.wav",
	"weapons/blackops3/rifle_butt/rifle_hit_00.wav",
	"weapons/blackops3/rifle_butt/rifle_hit_01.wav",
	"weapons/blackops3/rifle_butt/rifle_miss.wav"
	}
)

CustomizableWeaponry:addRegularSound("Weapon_BLACKOPS3_Cloth.Regular", 
	{
	"weapons/blackops3/cloth/fly_cloth_00.wav",
	"weapons/blackops3/cloth/fly_cloth_01.wav",
	"weapons/blackops3/cloth/fly_cloth_02.wav",
	"weapons/blackops3/cloth/fly_cloth_03.wav"
	}
)

CustomizableWeaponry:addRegularSound("Weapon_BLACKOPS3_Cloth.Med", 
	{
	"weapons/blackops3/cloth/fly_cloth_med_00.wav",
	"weapons/blackops3/cloth/fly_cloth_med_01.wav",
	"weapons/blackops3/cloth/fly_cloth_med_02.wav",
	"weapons/blackops3/cloth/fly_cloth_med_03.wav",
	"weapons/blackops3/cloth/fly_cloth_med_04.wav",
	"weapons/blackops3/cloth/fly_cloth_med_05.wav",
	"weapons/blackops3/cloth/fly_cloth_med_06.wav",
	"weapons/blackops3/cloth/fly_cloth_med_07.wav",
	"weapons/blackops3/cloth/fly_cloth_med_08.wav",
	"weapons/cw_foley/foley_medium1.wav",
	"weapons/cw_foley/foley_medium2.wav",
	"weapons/cw_foley/foley_medium3.wav",
	}
)

CustomizableWeaponry:addRegularSound("Weapon_BLACKOPS3_Cloth.Short", 
	{
	"weapons/blackops3/cloth/fly_cloth_shrt_00.wav",
	"weapons/blackops3/cloth/fly_cloth_shrt_01.wav",
	"weapons/blackops3/cloth/fly_cloth_shrt_02.wav",
	"weapons/blackops3/cloth/fly_cloth_shrt_03.wav",
	"weapons/blackops3/cloth/fly_cloth_shrt_04.wav",
	"weapons/blackops3/cloth/fly_cloth_short_05.wav",
	"weapons/blackops3/cloth/fly_cloth_shrt_06.wav"
	}
)
	
CustomizableWeaponry:addRegularSound("Weapon_BLACKOPS3_Cloth.Melee", 
	{
	"weapons/blackops3/cloth/riot_shield_swing_cloth_00.wav",
	"weapons/blackops3/cloth/riot_shield_swing_cloth_01.wav",
	}
)

CustomizableWeaponry:addRegularSound("H1_M320.Reload_Open", "weapons/h1/gl/wpfoly_m320_reload_open_v1.wav")
CustomizableWeaponry:addRegularSound("H1_M320.Reload_Close", "weapons/h1/gl/wpfoly_m320_reload_close_v1.wav")
CustomizableWeaponry:addRegularSound("H1_M320.Reload_Eject", "weapons/h1/gl/wpfoly_m320_reload_eject_v1.wav")
CustomizableWeaponry:addRegularSound("H1_M320.Reload_Lift", "weapons/h1/gl/wpfoly_m320_reload_lift_v1.wav")
CustomizableWeaponry:addRegularSound("H1_M320.Reload_Load", "weapons/h1/gl/wpfoly_m320_reload_load_v1.wav")

CustomizableWeaponry:addRegularSound("H1_M203.Chamber_Close", "weapons/h1/gl/wpfoly_m203_chamber_close_v12.wav")
CustomizableWeaponry:addRegularSound("H1_M203.Chamber_Open", "weapons/h1/gl/wpfoly_m203_chamber_open_v12.wav")
CustomizableWeaponry:addRegularSound("H1_M203.Load", "weapons/h1/gl/wpfoly_m203_load_v12.wav")

CustomizableWeaponry:addRegularSound("H1_GP25.Chamber", "weapons/h1/gl/wpfoly_ak47gp25_grnd_chamber_v1.wav")
CustomizableWeaponry:addRegularSound("H1_GP25.Lift", "weapons/h1/gl/wpfoly_ak47gp25_grnd_lift_v1.wav")

// AMMO TYPES
CustomizableWeaponry:registerAmmo("7.8x50MM RAR", "7.8x50MM RAR Rounds", 7.8, 50)
CustomizableWeaponry:registerAmmo(".50 BMG", ".50 BMG Rounds", 12.7, 99)

// FIREMODES
CustomizableWeaponry.firemodes:registerFiremode("blackops3_4burst", "4-ROUND BURST", true, 4, 4)