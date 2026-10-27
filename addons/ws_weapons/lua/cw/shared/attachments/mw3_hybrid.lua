local att = {}
	att.name = "mw3_att_hybrid"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.aimPos = {"HybridPos", "HybridAng"}
	att.FOVModifier = 40
	att.isSight = true
	att.isScope= true
	att.isHybrid = true

	att.statModifiers = {}

	if CLIENT then
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/scope_hybrid")
		att.description = {[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}}

		att.reticle = "models/ma85_mw3/atts/holo/reticle"
		att._reticleSize = .6

	function att:elementRender()
		if not self.ActiveAttachments[att.name] then return end
		if not self.AttachmentModelsVM then return end
		if not self.AttachmentModelsVM[att.name] then return end

		local rc = self:getSightColor(att.name)

		local isAiming = self:isAiming()
		local isScopePos = (self.AimPos == self[att.aimPos[1]] and self.AimAng == self[att.aimPos[2]])
		local attachmEnt = self.AttachmentModelsVM[att.name].ent
		-- local mdlAtt = self.AttachmentModelsVM[att.name].model
		local EA = self:getReticleAngles()
		-- if not (isScopePos and (isAiming or self.dt.BipodDeployed)) then return end

		local retAtt = attachmEnt:GetAttachment(attachmEnt:LookupAttachment("reticle"))
		if not retAtt then return end

		local retSize = att._reticleSize * (self.AttachmentModelsVM[att.name].retSizeMult or 1)
		local retDist = (retAtt.Pos:Distance(EyePos())) * (self.AttachmentModelsVM[att.name].retDistMult or 1)
		local retPos = retAtt.Pos + retAtt.Ang:Forward() * retDist
		local retNorm = retAtt.Ang:Forward()
		local retAng = retAtt.Ang.z + 180

		render.ClearStencil()
		render.SetStencilEnable(true)
		render.SetStencilWriteMask(1)
		render.SetStencilTestMask(1)
		render.SetStencilReferenceValue(1)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_ALWAYS)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilFailOperation(STENCILOPERATION_KEEP)
		render.SetStencilZFailOperation(STENCILOPERATION_KEEP)

		-- attachmEnt:SetModel(mdlAtt)
		attachmEnt:DrawModel()

		render.SetStencilWriteMask(2)
		render.SetStencilTestMask(2)
		render.SetStencilReferenceValue(2)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilWriteMask(1)
		render.SetStencilTestMask(1)
		render.SetStencilReferenceValue(1)

		render.SetMaterial(att._reticle)

		cam.Start3D()
		-- cam.IgnoreZ(true)
			render.CullMode(MATERIAL_CULLMODE_CW)
				render.DrawQuadEasy(retPos, retNorm, retSize, retSize, rc, retAng)
			render.CullMode(MATERIAL_CULLMODE_CCW)
		-- cam.IgnoreZ(false)
		cam.End3D()

		render.SetStencilEnable(false)
	end
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
		self.ADSSpeed = self.ADSSpeed_Orig * .75
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
		self:setBodygroup( self.ScopeBGs.main, self.ScopeBGs.hybrid )
		self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
		self.ToggleInTime = 1.43
		self.ToggleOutTime = 1

		self.aimPosHybridUp = att.aimPos
		self.FOVModifierHybridUp = att.FOVModifier

		self.aimPosHybridDown = att.aimPos
		self.FOVModifierHybridDown = 20
		
		self.hasHybrid = true
		self.HybridOn = true
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
		self.ADSSpeed = self.ADSSpeed_Orig
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
		self:setBodygroup( self.ScopeBGs.main, self.ScopeBGs.none )
		self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )

		self.hasHybrid = nil
		self.HybridOn = nil
	end
-- end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_hamr"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.aimPos = {"HAMRPos", "HAMRAng"}
	att.FOVModifier = 40
	att.isSight = true
	att.isScope= true
	att.isHybrid = true

	att.statModifiers = {}
	
	if CLIENT then
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/scope_hamr")
		att.description = {[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}}

		att.reticle = "models/ma85_mw3/atts/hamr/reticle"
		att._reticleSize = 3

		att.reticle2 = "models/ma85_mw3/atts/reflex/reticle"
		att._reticle2 = Material( att.reticle2 )
		att._reticle2Size = .75

	function att:elementRender()
		if not self.ActiveAttachments[att.name] then return end
		if not self.AttachmentModelsVM then return end
		if not self.AttachmentModelsVM[att.name] then return end
		
		local rc = self:getSightColor(att.name)
		
		local isAiming = self:isAiming()
		local isScopePos = (self.AimPos == self[att.aimPos[1]] and self.AimAng == self[att.aimPos[2]])
		local attachmEnt = self.AttachmentModelsVM[att.name].ent
		-- local mdlAtt = self.AttachmentModelsVM[att.name].model
		local EA = self:getReticleAngles()
		-- if not (isScopePos and (isAiming or self.dt.BipodDeployed)) then return end

		if not self.HybridOn then
			hybridAtt = "reticle_alt"
			retSize = att._reticle2Size
			curReticle = att._reticle2
		else
			hybridAtt = "reticle"
			retSize = att._reticleSize
			curReticle = att._reticle
		end

		local retAtt = attachmEnt:GetAttachment(attachmEnt:LookupAttachment(hybridAtt))
		if not retAtt then return end

		local retSize = retSize * (self.AttachmentModelsVM[att.name].retSizeMult or 1)
		local retDist = (retAtt.Pos:Distance(EyePos())) * (self.AttachmentModelsVM[att.name].retDistMult or 1)
		local retPos = retAtt.Pos + retAtt.Ang:Forward() * retDist
		local retNorm = retAtt.Ang:Forward()
		local retAng = retAtt.Ang.z + 180	


		render.ClearStencil()
		render.SetStencilEnable(true)
		render.SetStencilWriteMask(1)
		render.SetStencilTestMask(1)
		render.SetStencilReferenceValue(1)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_ALWAYS)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilFailOperation(STENCILOPERATION_KEEP)
		render.SetStencilZFailOperation(STENCILOPERATION_KEEP)
		
		-- attachmEnt:SetModel(mdlAtt)
		attachmEnt:DrawModel()
		
		render.SetStencilWriteMask(2)
		render.SetStencilTestMask(2)
		render.SetStencilReferenceValue(2)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilWriteMask(1)
		render.SetStencilTestMask(1)
		render.SetStencilReferenceValue(1)

		render.SetMaterial(curReticle)
		
		cam.Start3D()
		-- cam.IgnoreZ(true)
			render.CullMode(MATERIAL_CULLMODE_CW)
				render.DrawQuadEasy(retPos, retNorm, retSize, retSize, rc, retAng)
			render.CullMode(MATERIAL_CULLMODE_CCW)
		-- cam.IgnoreZ(false)
		cam.End3D()
		
		render.SetStencilEnable(false)
	end
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
		self.ADSSpeed = self.ADSSpeed_Orig * .8
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
		self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )
		self.ToggleInTime = 1.27
		self.ToggleOutTime = self.ToggleInTime

		self.aimPosHybridUp = att.aimPos
		self.FOVModifierHybridUp = att.FOVModifier

		self.aimPosHybridDown = {"AltHAMRPos", "AltHAMRAng"}
		self.FOVModifierHybridDown = 20
		
		self.hasHybrid = true
		self.HybridOn = true
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
		self.ADSSpeed = self.ADSSpeed_Orig
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
		self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )

		self.hasHybrid = nil
		self.HybridOn = nil
	end

CustomizableWeaponry:registerAttachment(att)
local att = {}
	att.name = "mw3_att_rsass_hybrid"
	att.displayName = "#mw3_att_hybrid"
	att.displayNameShort = ""
	att.aimPos = {"IronsightPos", "IronsightAng"}
	att.FOVModifier = 75
	att.isSight = true
	att.isScope= true
	att.isHybrid = true

	att.statModifiers = {}

	if CLIENT then
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/scope_reflex")
		att.description = {[1] = {t = "#mw3_att_hybrid_rsass_desc", c = CustomizableWeaponry.textColors.COSMETIC}}

		att.reticle = "models/ma85_mw3/atts/reflex/reticle"
		att._reticleSize = .75

	function att:elementRender()
		if not self.ActiveAttachments[att.name] then return end
		if not self.AttachmentModelsVM then return end
		if not self.AttachmentModelsVM[att.name] then return end

		local rc = self:getSightColor(att.name)

		local isAiming = self:isAiming()
		local isScopePos = (self.AimPos == self[att.aimPos[1]] and self.AimAng == self[att.aimPos[2]])
		local attachmEnt = self.AttachmentModelsVM[att.name].ent
		-- local mdlAtt = self.AttachmentModelsVM[att.name].model
		local EA = self:getReticleAngles()
		-- if not (isScopePos and (isAiming or self.dt.BipodDeployed)) then return end

		local retAtt = attachmEnt:GetAttachment(attachmEnt:LookupAttachment("reticle"))
		if not retAtt then return end

		local retSize = att._reticleSize * (self.AttachmentModelsVM[att.name].retSizeMult or 1)
		local retDist = (retAtt.Pos:Distance(EyePos())) * (self.AttachmentModelsVM[att.name].retDistMult or 1)
		local retPos = retAtt.Pos + retAtt.Ang:Forward() * retDist
		local retNorm = retAtt.Ang:Forward()
		local retAng = retAtt.Ang.z + 180

		render.ClearStencil()
		render.SetStencilEnable(true)
		render.SetStencilWriteMask(1)
		render.SetStencilTestMask(1)
		render.SetStencilReferenceValue(1)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_ALWAYS)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilFailOperation(STENCILOPERATION_KEEP)
		render.SetStencilZFailOperation(STENCILOPERATION_KEEP)

		-- attachmEnt:SetModel(mdlAtt)
		attachmEnt:DrawModel()

		render.SetStencilWriteMask(2)
		render.SetStencilTestMask(2)
		render.SetStencilReferenceValue(2)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilWriteMask(1)
		render.SetStencilTestMask(1)
		render.SetStencilReferenceValue(1)

		render.SetMaterial(att._reticle)

		cam.Start3D()
		-- cam.IgnoreZ(true)
			render.CullMode(MATERIAL_CULLMODE_CW)
				render.DrawQuadEasy(retPos, retNorm, retSize, retSize, rc, retAng)
			render.CullMode(MATERIAL_CULLMODE_CCW)
		-- cam.IgnoreZ(false)
		cam.End3D()

		render.SetStencilEnable(false)
	end
end

	function att:attachFunc()
		self.CurName = self.WpnName .. " " .. loc('mw3_att_hybrid_equipped')
		if self.WpnName then
			if self.AttachmentEquipped2 then
				self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
			else
				self.PrintName = self.WpnName .. " " .. loc('mw3_att_hybrid_equipped')
			end
		end
		self.AttachmentEquipped = true
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
		self:setBodygroup( self.ScopeBGs.main, self.ScopeBGs.hybrid )
		self.ToggleInTime = 0.77
		self.ToggleOutTime = 0.67

		self.aimPosHybridUp = att.aimPos
		self.FOVModifierHybridUp = att.FOVModifier

		self.aimPosHybridDown = {"ReflexPos", "ReflexAng"}
		self.FOVModifierHybridDown = 20
		
		self.hasHybrid = true
		self.HybridOn = true
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
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
		self:setBodygroup( self.ScopeBGs.main, self.ScopeBGs.none )
		self:sendWeaponAnim( "idle", (self.IdleAnimSpeed or 1), 0 )

		self.hasHybrid = nil
		self.HybridOn = nil
	end

CustomizableWeaponry:registerAttachment(att)
