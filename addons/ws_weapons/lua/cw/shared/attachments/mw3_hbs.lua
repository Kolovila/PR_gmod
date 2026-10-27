local att = {}
att.name = "mw3_att_hbs"
att.displayName = "#" .. att.name
att.displayNameShort = ""
att.isHBS = true

if CLIENT then
	att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_heartbeat")
	att.description = {
	[1] = {t = "#" .. att.name .. "_desc", c = CustomizableWeaponry.textColors.COSMETIC}
	}

	att.reticle = "models/ma85_mw3/atts/hbs/reticle"
	att._reticleSize = .25

	function att:elementRender()
		if not self.ActiveAttachments[att.name] then return end
		if not self.AttachmentModelsVM then return end
		if not self.AttachmentModelsVM[att.name] then return end
		
		local natural = 
		{
			["npc_crow"] = true,
			["npc_pigeon"] = true,
			["npc_seagull"] = true,
			["npc_gman"] = true,
		}
		
		local friendly = 
		{
			["npc_monk"] = true,
			["npc_citizen"] = true,
			["npc_alyx"] = true,
			["npc_barney"] = true,
			["npc_kleiner"] = true,
			["npc_mossman"] = true,
			["npc_eli"] = true,
			["npc_dog"] = true,
			["npc_magnusson"] = true,
			["npc_vortigaunt"] = true,
		}
		
		local undefined = 
		{
			["npc_dog"] = true,
			["npc_turret"] = true,
		}
		
		local rcBlue = Color(150, 150, 255, 255)
		local rcRed = Color(255, 75, 75, 255)
		local rcWhite = Color(255, 255, 255, 255)
		local rc
		
		local isAiming = self:isAiming()
		local attachmEnt = self.AttachmentModelsVM[att.name].ent
		local mdlAtt = self.AttachmentModelsVM[att.name].model
		local EA = self:getReticleAngles()
		-- if not (isScopePos and (isAiming or self.dt.BipodDeployed)) then return end

		local retAtt = attachmEnt:GetAttachment(attachmEnt:LookupAttachment("tag_motion_tracker"))
		if not retAtt then return end
		
		local retSize = att._reticleSize * (self.AttachmentModelsVM[att.name].retSizeMult or 1)
		local retDist = -0.15
		local retPos = retAtt.Pos + retAtt.Ang:Up() * -1 + retAtt.Ang:Forward() * retDist
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
		
		attachmEnt:SetModel(mdlAtt)
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
		
		for k, v in pairs(ents.GetAll()) do
			if (v:IsNPC() or (v:IsPlayer() and v != self.Owner)) and not undefined[v:GetClass()] then
				local dist = math.Round(self.Owner:GetPos():Distance(v:GetPos()) / 100, 2)
				if dist <= 8.5 then
					local aimPos = self.Owner:GetAimVector()
					local entPos = v:GetPos() - self.Owner:GetPos()
					aimPos.z = 0
					entPos.z = 0
					local dot = aimPos:GetNormalized():Dot(entPos:GetNormalized())
					local dotcos = math.cos(math.acos(dot))
					local dotsin = math.sin(math.acos(dot))
					local dotcross = aimPos:GetNormalized():Cross(entPos:GetNormalized())
					-- wtf
					if dotcross.z <= 0 then
						dotsin = math.sin(math.acos(dot))
					else
						dotsin = math.sin(math.acos(dot)) * -1
					end
					
					local teammate
					if v:IsPlayer() then
						local entteam = team.GetName(v:Team())
						local ownerteam = team.GetName(self.Owner:Team())
						if (entteam == ownerteam) then
							teammate = true
						else
							teammate = false
						end
					end
					
					if friendly[v:GetClass()] or teammate then
						rc = rcBlue
					elseif natural[v:GetClass()] then
						rc = rcWhite
					else
						rc = rcRed
					end
					
					local curX = math.Clamp( dist * dotsin / 4, -1.1, 1.2 )
					local curY = math.Clamp( dist * dotcos / 4, 0.15, 1.9 )
					local curZ = retPos.z
					local deltaPos = retPos + retAtt.Ang:Right() * curX + retAtt.Ang:Up() * curY
					cam.IgnoreZ(true)
						render.CullMode(MATERIAL_CULLMODE_CW)
							render.DrawQuadEasy(deltaPos, retNorm, retSize, retSize, rc, retAng)
						render.CullMode(MATERIAL_CULLMODE_CCW)
					cam.IgnoreZ(false)
				end
			end
		end
		
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
	self.isHBSAttached = true
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
	self.isHBSAttached = false
end

CustomizableWeaponry:registerAttachment(att)

local att = {}
att.name = "mw3_att_hbs2"
att.displayName = "#" .. att.name
att.displayNameShort = ""
att.isHBS = true

if CLIENT then
	att.displayIcon = surface.GetTextureID("mw3_icons/atts/mod_heartbeat")
	att.description = {
	[1] = {t = "#mw3_att_hbs_desc", c = CustomizableWeaponry.textColors.COSMETIC}
	}

	att.reticle = "models/ma85_mw3/atts/hbs/reticle"
	att._reticleSize = .25

	function att:elementRender()
		if not self.ActiveAttachments[att.name] then return end
		if not self.AttachmentModelsVM then return end
		if not self.AttachmentModelsVM[att.name] then return end
		
		local natural = 
		{
			["npc_crow"] = true,
			["npc_pigeon"] = true,
			["npc_seagull"] = true,
			["npc_gman"] = true,
		}
		
		local friendly = 
		{
			["npc_monk"] = true,
			["npc_citizen"] = true,
			["npc_alyx"] = true,
			["npc_barney"] = true,
			["npc_kleiner"] = true,
			["npc_mossman"] = true,
			["npc_eli"] = true,
			["npc_dog"] = true,
			["npc_magnusson"] = true,
			["npc_vortigaunt"] = true,
		}
		
		local undefined = 
		{
			["npc_dog"] = true,
			["npc_turret"] = true,
		}
		
		local rcBlue = Color(150, 150, 255, 255)
		local rcRed = Color(255, 75, 75, 255)
		local rcWhite = Color(255, 255, 255, 255)
		local rc
		
		local isAiming = self:isAiming()
		local attachmEnt = self.AttachmentModelsVM[att.name].ent
		local mdlAtt = self.AttachmentModelsVM[att.name].model
		local EA = self:getReticleAngles()
		-- if not (isScopePos and (isAiming or self.dt.BipodDeployed)) then return end

		local retAtt = attachmEnt:GetAttachment(attachmEnt:LookupAttachment("tag_motion_tracker"))
		if not retAtt then return end
		
		local retSize = att._reticleSize * (self.AttachmentModelsVM[att.name].retSizeMult or 1)
		local retDist = -0.15
		local retPos = retAtt.Pos + retAtt.Ang:Up() * -1 + retAtt.Ang:Forward() * retDist
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
		
		attachmEnt:SetModel(mdlAtt)
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
		
		for k, v in pairs(ents.GetAll()) do
			if (v:IsNPC() or (v:IsPlayer() and v != self.Owner)) and not undefined[v:GetClass()] then
				local dist = math.Round(self.Owner:GetPos():Distance(v:GetPos()) / 100, 2)
				if dist <= 8.5 then
					local aimPos = self.Owner:GetAimVector()
					local entPos = v:GetPos() - self.Owner:GetPos()
					aimPos.z = 0
					entPos.z = 0
					local dot = aimPos:GetNormalized():Dot(entPos:GetNormalized())
					local dotcos = math.cos(math.acos(dot))
					local dotsin = math.sin(math.acos(dot))
					local dotcross = aimPos:GetNormalized():Cross(entPos:GetNormalized())
					-- wtf
					if dotcross.z <= 0 then
						dotsin = math.sin(math.acos(dot))
					else
						dotsin = math.sin(math.acos(dot)) * -1
					end
					
					local teammate
					if v:IsPlayer() then
						local entteam = team.GetName(v:Team())
						local ownerteam = team.GetName(self.Owner:Team())
						if (entteam == ownerteam) then
							teammate = true
						else
							teammate = false
						end
					end
					
					if friendly[v:GetClass()] or teammate then
						rc = rcBlue
					elseif natural[v:GetClass()] then
						rc = rcWhite
					else
						rc = rcRed
					end
					
					local curX = math.Clamp( dist * dotsin / 4, -1.1, 1.2 )
					local curY = math.Clamp( dist * dotcos / 4, 0.15, 1.9 )
					local curZ = retPos.z
					local deltaPos = retPos + retAtt.Ang:Right() * curX + retAtt.Ang:Up() * curY
					cam.IgnoreZ(true)
						render.CullMode(MATERIAL_CULLMODE_CW)
							render.DrawQuadEasy(deltaPos, retNorm, retSize, retSize, rc, retAng)
						render.CullMode(MATERIAL_CULLMODE_CCW)
					cam.IgnoreZ(false)
				end
			end
		end
		
		render.SetStencilEnable(false)
	end
end

function att:attachFunc()
	self.CurName2 = self.WpnName .. " " .. loc('mw3_att_hbs_equipped')
	if self.WpnName then
		if self.AttachmentEquipped then
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_custom')
		else
			self.PrintName = self.WpnName .. " " .. loc('mw3_att_hbs_equipped')
		end
	end
	self.AttachmentEquipped2 = true
	self.isHBSAttached = true
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
	self.isHBSAttached = false
end

CustomizableWeaponry:registerAttachment(att)