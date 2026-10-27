local att = {}
	att.name = "mw3_att_reflex"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.aimPos = {"ReflexPos", "ReflexAng"}
	--att.FOVModifier = 14
	att.isSight = true
	att.isReflex = true

	att.statModifiers = {}

	if CLIENT then
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/scope_reflex")
		att.description = {[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}}

		att.reticle = "models/ma85_mw3/atts/reflex/reticle"
		att._reticleSize = .75

		att.reticle1 = "mw3_reticles/reticle1"
		att._reticle1 = Material( att.reticle1 )

		att.reticle2 = "mw3_reticles/reticle2"
		att._reticle2 = Material( att.reticle2 )

		att.reticle3 = "mw3_reticles/reticle3"
		att._reticle3 = Material( att.reticle3 )

		att.reticle4 = "mw3_reticles/reticle4"
		att._reticle4 = Material( att.reticle4 )

		att.reticle5 = "mw3_reticles/reticle5"
		att._reticle5 = Material( att.reticle5 )

		att.reticle6 = "mw3_reticles/reticle6"
		att._reticle6 = Material( att.reticle6 )

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
		
		local retSize = att._reticleSize * (self.AttachmentModelsVM[att.name].retSizeMult or 1) * (self.ReticleBoost or 1)
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
		
		if self.ActiveAttachments.mw3_reticle_target then
			render.SetMaterial(att._reticle1)
			self.ReticleBoost = 3
		elseif self.ActiveAttachments.mw3_reticle_delta then
			render.SetMaterial(att._reticle2)
			self.ReticleBoost = 3
		elseif self.ActiveAttachments.mw3_reticle_udot then
			render.SetMaterial(att._reticle3)
			self.ReticleBoost = 3
		elseif self.ActiveAttachments.mw3_reticle_mildot then
			render.SetMaterial(att._reticle4)
			self.ReticleBoost = 3
		elseif self.ActiveAttachments.mw3_reticle_omega then
			render.SetMaterial(att._reticle5)
			self.ReticleBoost = 3
		elseif self.ActiveAttachments.mw3_reticle_lambda then
			render.SetMaterial(att._reticle6)
			self.ReticleBoost = 3
		else
			render.SetMaterial(att._reticle)
			self.ReticleBoost = 1
		end
		
		cam.Start3D()
		-- cam.IgnoreZ(true)
			render.CullMode(MATERIAL_CULLMODE_CW)
				render.DrawQuadEasy(retPos, retNorm, retSize, retSize, rc, retAng)
			render.CullMode(MATERIAL_CULLMODE_CCW)
		-- cam.IgnoreZ(false)
		cam.End3D()
		
		render.SetStencilEnable(false)
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
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
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
	end
end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_holo"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.aimPos = {"HoloPos", "HoloAng"}
	--att.FOVModifier = 14
	att.isSight = true
	att.isReflex = true

	att.statModifiers = {}
	
	if CLIENT then
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/scope_eotech")
		att.description = {[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}}

		att.reticle = "models/ma85_mw3/atts/holo/reticle"
		att._reticleSize = .5

		att.reticle1 = "mw3_reticles/reticle1"
		att._reticle1 = Material( att.reticle1 )

		att.reticle2 = "mw3_reticles/reticle2"
		att._reticle2 = Material( att.reticle2 )

		att.reticle3 = "mw3_reticles/reticle3"
		att._reticle3 = Material( att.reticle3 )

		att.reticle4 = "mw3_reticles/reticle4"
		att._reticle4 = Material( att.reticle4 )

		att.reticle5 = "mw3_reticles/reticle5"
		att._reticle5 = Material( att.reticle5 )

		att.reticle6 = "mw3_reticles/reticle6"
		att._reticle6 = Material( att.reticle6 )

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
		
		local retSize = att._reticleSize * (self.AttachmentModelsVM[att.name].retSizeMult or 1) * (self.ReticleBoost or 1)
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
		
		if self.ActiveAttachments.mw3_reticle_target then
			render.SetMaterial(att._reticle1)
			self.ReticleBoost = 4
		elseif self.ActiveAttachments.mw3_reticle_delta then
			render.SetMaterial(att._reticle2)
			self.ReticleBoost = 4
		elseif self.ActiveAttachments.mw3_reticle_udot then
			render.SetMaterial(att._reticle3)
			self.ReticleBoost = 4
		elseif self.ActiveAttachments.mw3_reticle_mildot then
			render.SetMaterial(att._reticle4)
			self.ReticleBoost = 4
		elseif self.ActiveAttachments.mw3_reticle_omega then
			render.SetMaterial(att._reticle5)
			self.ReticleBoost = 4
		elseif self.ActiveAttachments.mw3_reticle_lambda then
			render.SetMaterial(att._reticle6)
			self.ReticleBoost = 4
		else
			render.SetMaterial(att._reticle)
			self.ReticleBoost = 1
		end
		
		cam.Start3D()
		-- cam.IgnoreZ(true)
			render.CullMode(MATERIAL_CULLMODE_CW)
				render.DrawQuadEasy(retPos, retNorm, retSize, retSize, rc, retAng)
			render.CullMode(MATERIAL_CULLMODE_CCW)
		-- cam.IgnoreZ(false)
		cam.End3D()
		
		render.SetStencilEnable(false)
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
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
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
	end
end

CustomizableWeaponry:registerAttachment(att)

local att = {}
	att.name = "mw3_att_acog"
	att.displayName = "#" .. att.name
	att.displayNameShort = ""
	att.aimPos = {"ACOGPos", "ACOGAng"}
	att.FOVModifier = 40
	att.isSight = true
	att.isScope= true

	att.statModifiers = {}
	
	if CLIENT then
		att.displayIcon = surface.GetTextureID("mw3_icons/atts/scope_acog")
		att.description = {[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}}

		att.reticle = "models/ma85_mw3/atts/acog/reticle"
		att._reticleSize = 2.25

		att.reticle1 = "mw3_reticles/reticle1"
		att._reticle1 = Material( att.reticle1 )

		att.reticle2 = "mw3_reticles/reticle2"
		att._reticle2 = Material( att.reticle2 )

		att.reticle3 = "mw3_reticles/reticle3"
		att._reticle3 = Material( att.reticle3 )

		att.reticle4 = "mw3_reticles/reticle4"
		att._reticle4 = Material( att.reticle4 )

		att.reticle5 = "mw3_reticles/reticle5"
		att._reticle5 = Material( att.reticle5 )

		att.reticle6 = "mw3_reticles/reticle6"
		att._reticle6 = Material( att.reticle6 )

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
		
		local retSize = att._reticleSize * (self.AttachmentModelsVM[att.name].retSizeMult or 1) * (self.ReticleBoost or 1)
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
		
		if self.ActiveAttachments.mw3_reticle_target then
			render.SetMaterial(att._reticle1)
			self.ReticleBoost = 1.25
		elseif self.ActiveAttachments.mw3_reticle_delta then
			render.SetMaterial(att._reticle2)
			self.ReticleBoost = 1.25
		elseif self.ActiveAttachments.mw3_reticle_udot then
			render.SetMaterial(att._reticle3)
			self.ReticleBoost = 1.25
		elseif self.ActiveAttachments.mw3_reticle_mildot then
			render.SetMaterial(att._reticle4)
			self.ReticleBoost = 1.25
		elseif self.ActiveAttachments.mw3_reticle_omega then
			render.SetMaterial(att._reticle5)
			self.ReticleBoost = 1.25
		elseif self.ActiveAttachments.mw3_reticle_lambda then
			render.SetMaterial(att._reticle6)
			self.ReticleBoost = 1.25
		else
			render.SetMaterial(att._reticle)
			self.ReticleBoost = 1
		end
		
		cam.Start3D()
		-- cam.IgnoreZ(true)
			render.CullMode(MATERIAL_CULLMODE_CW)
				render.DrawQuadEasy(retPos, retNorm, retSize, retSize, rc, retAng)
			render.CullMode(MATERIAL_CULLMODE_CCW)
		-- cam.IgnoreZ(false)
		cam.End3D()
		
		render.SetStencilEnable(false)
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
		--self.OverrideAimMouseSens = 0.8
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
		self.ADSSpeed = self.ADSSpeed_Orig * .75
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
		--self.OverrideAimMouseSens = nil
		self.AimViewModelFOV = self.AimViewModelFOV_Orig
		self.ADSSpeed = self.ADSSpeed_Orig
	end
end

CustomizableWeaponry:registerAttachment(att)
