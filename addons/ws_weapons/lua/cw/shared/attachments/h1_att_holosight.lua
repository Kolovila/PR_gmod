local att = {}
att.name = "h1_att_holosight"
att.displayName = "Holographic Sight"
att.displayNameShort = "Holo"
att.aimPos = {"H1HoloPos", "H1HoloAng"}
att.FOVModifier = 25
att.isSight = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

if CLIENT then
	att.displayIcon = surface.GetTextureID("blackops3/icon_atts/h1_att_holosight")
	att.description = {
	[1] = {t = "Holographic sight.", c = CustomizableWeaponry.textColors.POSITIVE},
	[2] = {t = "Provides a clearer view of the target than a reflex, but with less peripheral vision.", c = CustomizableWeaponry.textColors.POSITIVE},
	}
	
	att.reticle = "blackops3/reticles/weapon_reticle_holo_col"
	att._reticleSize = 2

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

CustomizableWeaponry:registerAttachment(att)