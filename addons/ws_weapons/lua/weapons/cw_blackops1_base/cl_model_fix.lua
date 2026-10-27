local reg = debug.getregistry()
local GetVelocity = reg.Entity.GetVelocity
local Length = reg.Vector.Length
local Right = reg.Angle.Right
local Up = reg.Angle.Up
local Forward = reg.Angle.Forward
local RotateAroundAxis = reg.Angle.RotateAroundAxis
local GetBonePosition = reg.Entity.GetBonePosition

//CODES
function SWEP:drawAttachmentsWM()
	if not self.AttachmentModelsWM then
		return false
	end
	
	for k, v in pairs(self.AttachmentModelsWM) do
		if v.active and v.ent then
			model = v.ent
			wm = self.WMEnt
			m = wm:GetBoneMatrix(wm:LookupBone(v.bone))
			pos = m:GetTranslation()
			ang = m:GetAngles()
			
			model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z)
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)

			model:SetAngles(ang)
			
			model:DrawModel()
		end
	end
	
	return true
end

function SWEP:setupAttachmentModelsWM()
	-- who would like to leave the model argument empty...
	
	if self.AttachmentModelsWM then
		for k, data in pairs(self.AttachmentModelsWM) do
			data.origPos = data.pos
			data.origAng = data.angle
			
			data.ent = self:createManagedCModel(data.model, RENDERGROUP_BOTH)
			data.ent:SetNoDraw(true)
			
			data.active = data.active or false
			
			if data.size then
				data.matrix = Matrix()
				
				data.matrix:Scale(data.size)
				data.ent:EnableMatrix("RenderMultiply", data.matrix)
			end
			
			if data.bodygroups then
				for main, sec in pairs(data.bodygroups) do
					data.ent:SetBodygroup(main, sec)
				end
			end
			
			data.ent:SetupBones()
		end
	end
end

function SWEP:DrawWorldModel()
	if self.dt.Safe then
		if self.CHoldType != self.RunHoldType then
			self:SetHoldType(self.RunHoldType)
			self.CHoldType = self.RunHoldType
		end
	else
		if self.dt.State == CW_RUNNING or self.dt.State == CW_ACTION then
			if self.CHoldType != self.RunHoldType then
				self:SetHoldType(self.RunHoldType)
				self.CHoldType = self.RunHoldType
			end
		else
			if self.CHoldType != self.NormalHoldType then
				self:SetHoldType(self.NormalHoldType)
				self.CHoldType = self.NormalHoldType
			end
		end
	end
				
	if self.DrawTraditionalWorldModel then
		self:DrawModel()
	else
		wm = self.WMEnt
		
		if IsValid(wm) then
			if IsValid(self.Owner) then
				pos, ang = GetBonePosition(self.Owner, self.Owner:LookupBone("ValveBiped.Bip01_R_Hand"))
				
				if pos and ang then
					RotateAroundAxis(ang, Right(ang), self.WMAng[1])
					RotateAroundAxis(ang, Up(ang), self.WMAng[2])
					RotateAroundAxis(ang, Forward(ang), self.WMAng[3])

					pos = pos + self.WMPos[1] * Right(ang) 
					pos = pos + self.WMPos[2] * Forward(ang)
					pos = pos + self.WMPos[3] * Up(ang)
					
					wm:SetRenderOrigin(pos)
					wm:SetRenderAngles(ang)
					wm:DrawModel()
				end
			else
				wm:SetRenderOrigin(self:GetPos())
				wm:SetRenderAngles(self:GetAngles())
				wm:DrawModel()
				wm:DrawShadow()
			end
			self:drawAttachmentsWM()
		else
			self:DrawModel()
		end
	end
end