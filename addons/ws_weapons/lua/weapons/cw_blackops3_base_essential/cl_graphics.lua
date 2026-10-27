local Ang0 = Angle(0, 0, 0)

local FT, CT, cos1, cos2, ws, vel, att, ang
local Ang0, curang, curviewbob = Angle(0, 0, 0), Angle(0, 0, 0), Angle(0, 0, 0)
local reg = debug.getregistry()
local GetVelocity = reg.Entity.GetVelocity
local Length = reg.Vector.Length
local Right = reg.Angle.Right
local Up = reg.Angle.Up
local Forward = reg.Angle.Forward
local RotateAroundAxis = reg.Angle.RotateAroundAxis
local GetBonePosition = reg.Entity.GetBonePosition

local ManipulateBonePosition, ManipulateBoneAngles = reg.Entity.ManipulateBonePosition, reg.Entity.ManipulateBoneAngles

//WM
function SWEP:drawAttachmentsWM()
	if not self.AttachmentModelsWM then
		return false
	end
	
	for k, v in pairs(self.AttachmentModelsWM) do
		if v.active and v.ent then
			model = v.ent
			wm = self.WMEnt
			if wm:GetBoneMatrix(wm:LookupBone(v.bone)) then
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
	end
	
	for k, v in pairs(self.elementRenderWM) do
		v(self)
	end
	
	return true
end

function SWEP:setupAttachmentModelsWM()
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
			
			-- if data.attachWMBodyGroups then
				-- for main, sec in pairs(data.attachWMBodyGroups) do
					-- self.WMEnt:SetBodygroup(main, sec)
				-- end
			-- end
			
			data.ent:SetupBones()
		end
	end
end

function SWEP:getWMMuzzlePosition()
	return self.WMEnt:GetAttachment(self.WorldMuzzleAttachmentID)
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
					
					if self.Owner == LocalPlayer() then
						cam.IgnoreZ(true)
							self:drawWMInteractionMenu()
						cam.IgnoreZ(false)
					end
					
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

local bullet = surface.GetTextureID("cw2/gui/bullet")

function SWEP:drawWM3D2DHUD()
	local att = self:getWMMuzzlePosition()
	
	if not att then
		return
	end
	
	local ang = EyeAngles()
	ang:RotateAroundAxis(ang:Right(), 90)
	ang:RotateAroundAxis(ang:Up(), -90)
	
	cam.Start3D2D(att.Pos + ang:Forward() * 4, ang, self.HUD_3D2DScale)
		cam.IgnoreZ(true)
			local FT = FrameTime()
			
			if self.dt.State == CW_AIMING or (self.InactiveWeaponStates[self.dt.State] and not (self.IsReloading and self.Cycle <= 0.98)) then
				self.HUD_3D2DAlpha = math.Approach(self.HUD_3D2DAlpha, 0, FT * 1000)
			else
				self.HUD_3D2DAlpha = math.Approach(self.HUD_3D2DAlpha, 255, FT * 1000)
			end
			
			self.HUDColors.white.a = self.HUD_3D2DAlpha
			self.HUDColors.black.a = self.HUD_3D2DAlpha
			
			local mag = self:Clip1()
			
			self.HUDColors.black.a = self.HUD_3D2DAlpha
			
			local reloadProgress = self:getReloadProgress()
			
			-- if our mag has not much ammo or we're reloading, make the text red
			if mag <= self.Primary.ClipSize * 0.25 or reloadProgress then
				self.HUD_3D2D_MagColor = LerpColor(FT * 10, self.HUD_3D2D_MagColor, self.HUDColors.red)
			else
				self.HUD_3D2D_MagColor = LerpColor(FT * 10, self.HUD_3D2D_MagColor, self.HUDColors.white)
			end
			
			self.HUD_3D2D_MagColor.a = self.HUD_3D2DAlpha
			
			-- only show the reload progress if we're reloading
			if reloadProgress then
				draw.ShadowText("RELOADING " .. reloadProgress .. "%", "CW_HUD60", 90, 50, self.HUD_3D2D_MagColor, self.HUDColors.black, 2, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			else
				draw.ShadowText(self:getMagCapacity() .. " / " .. self:getReserveAmmoText(), "CW_HUD60", 90, 50, self.HUD_3D2D_MagColor, self.HUDColors.black, 2, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			end
			
			if self.BulletDisplay and self.BulletDisplay > 0 then
				local bulletDisplayAlpha = self.HUD_3D2DAlpha
				local bulletDisplayOffset = 0
				
				if #self.FireModes > 1 then -- if we have more than 1 firemode for the current weapon, we don't let the firemode display fade and instead reposition it a bit to let the player see what firemode he's using while aiming
					local aiming = self.dt.State == CW_AIMING
				
					bulletDisplayAlpha = aiming and 255 or self.HUD_3D2DAlpha
					bulletDisplayOffset = aiming and -255 or 0
				end
				
				surface.SetTexture(bullet)
				surface.SetDrawColor(0, 0, 0, bulletDisplayAlpha)
				
				for i = 1, self.BulletDisplay do
					surface.DrawTexturedRectRotated(115 + bulletDisplayOffset, 38 + (i - 1) * 18, 30, 30, 180)
				end
				
				surface.SetTexture(bullet)
				surface.SetDrawColor(255, 255, 255, bulletDisplayAlpha)
				
				for i = 1, self.BulletDisplay do
					surface.DrawTexturedRectRotated(113 + bulletDisplayOffset, 38 + (i - 1) * 18 - 2, 30, 30, 180)
				end
			end
			
			draw.ShadowText(self.Primary.Ammo, "CW_HUD48", 90, 100, self.HUDColors.white, self.HUDColors.black, 2, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			
			local grenades = self.Owner:GetAmmoCount("Frag Grenades")
			
			if grenades > 0 then
				draw.ShadowText(grenades .. "x FRAG", "CW_HUD40", 90, 140, self.HUDColors.white, self.HUDColors.black, 2, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			end
			
			self.HUDColors.white.a = 255
			self.HUDColors.black.a = 255
			
			if self.dt.M203Active then
				-- display the text when we either have a round in, or have no rounds but aren't aiming
				if (not self.M203Chamber and self.dt.State ~= CW_AIMING) or self.M203Chamber then
					if not self.M203Chamber then
						draw.ShadowText("M203 EMPTY", "CW_HUD40", 90, -70, self.HUDColors.red, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
					else
						draw.ShadowText("M203 READY", "CW_HUD40", 90, -70, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
					end
					
					local curGrenade = CustomizableWeaponry.grenadeTypes.getGrenadeText(self)
					
					draw.ShadowText(self.Owner:GetAmmoCount("40MM") .. "x RESERVE", "CW_HUD32", 90, -40, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
					draw.ShadowText("TYPE" .. curGrenade, "CW_HUD32", 90, -10, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				end
			end
			
			CustomizableWeaponry.callbacks.processCategory(self, "drawTo3D2DHUD")
		cam.IgnoreZ(false)
	cam.End3D2D()
end

-- interaction menu, AKA weapon interaction menu
function SWEP:drawInteractionMenu()
	local prefix = self:GetPrefix()
	local vm = self.CW_VM
	local cycle = vm:GetCycle()
	local curSeq = vm:GetSequenceName(vm:GetSequence())
	FT = FrameTime()
	
	if self.dt.State == CW_CUSTOMIZE then
		self.CustomizeMenuAlpha = math.Approach(self.CustomizeMenuAlpha, 1, FT * 5)
	else
		self.CustomizeMenuAlpha = math.Approach(self.CustomizeMenuAlpha, 0, FT * 15)
	end
	
	if self.CustomizeMenuAlpha > 0 then
		local att = self:getMuzzlePosition()
		local ang = EyeAngles()
		ang:RotateAroundAxis(ang:Right(), 90)
		ang:RotateAroundAxis(ang:Up(), -90)
		ang:RotateAroundAxis(ang:Right(), -10)
		
		cam.Start3D2D(att.Pos, ang, self.CustomizationMenuScale)
			-- disable depth checks
			cam.IgnoreZ(true)
				CustomizableWeaponry.interactionMenu.draw(self)
			cam.IgnoreZ(false)
		cam.End3D2D()
	end
	
	if self.dt.State == CW_CUSTOMIZE and self:isInterruptableAnim() and curSeq != (prefix .. "idle") then
		self:idleAnimFunc()
	end
end

function SWEP:drawWMInteractionMenu()
	FT = FrameTime()
	
	if self.dt.State == CW_CUSTOMIZE then
		self.CustomizeMenuAlpha = math.Approach(self.CustomizeMenuAlpha, 1, FT * 5)
	else
		self.CustomizeMenuAlpha = math.Approach(self.CustomizeMenuAlpha, 0, FT * 15)
	end
	
	local att = self:getWMMuzzlePosition()
	
	if att and self.CustomizeMenuAlpha > 0 then
		local ang = EyeAngles()
		ang:RotateAroundAxis(ang:Right(), 90)
		ang:RotateAroundAxis(ang:Up(), -90)
		ang:RotateAroundAxis(ang:Right(), -10)
		
		cam.Start3D2D(att.Pos, ang, self.CustomizationMenuScale)
			-- disable depth checks
			cam.IgnoreZ(true)
				CustomizableWeaponry.interactionMenu.draw(self)
			cam.IgnoreZ(false)
		cam.End3D2D()
	end
	
	-- and lastly, draw the custom hud if the player has it enabled
	if GetConVarNumber("cw_customhud_ammo") >= 1 then
		self:drawWM3D2DHUD()
	end
end

//VM
function SWEP:buildBoneTable()
	local vm = self.CW_VM
	
	for i = 0, vm:GetBoneCount() - 1 do
		local boneName = vm:GetBoneName(i)
		local bone
		
		if boneName then
			bone = vm:LookupBone(boneName)
		end
		
		-- from the kk ins2 sweps
		-- save the bone indexes and bone names so that we don't have to get it again when we're offsetting them
		self.vmBones[i + 1] = {boneName = boneName, bone = i, curPos = Vector(0, 0, 0), curAng = Angle(0, 0, 0), targetPos = Vector(0, 0, 0), targetAng = Angle(0, 0, 0)}
	end
end

function SWEP:createCustomVM(mdl)
	self.CW_VM = self:createManagedCModel(mdl, RENDERGROUP_BOTH)
	self.CW_VM:SetNoDraw(true)
	self.CW_VM:SetupBones()
	
	if self.CustomVMArms then
		if self.CustomVMArmsPM and self.CustomVMArmsConvertRig then
			self.CW_CSTM_ARMS = self:createManagedCModel(self.CustomVMArmsConvertRig, RENDERGROUP_BOTH)
		else
			self.CW_CSTM_ARMS = self:createManagedCModel(self.CustomVMArmsCSSRig, RENDERGROUP_BOTH)
		end
		
		if self.CW_CSTM_ARMS:GetParent() != self.CW_VM then
			self.CW_CSTM_ARMS:SetNoDraw(true)
			self.CW_CSTM_ARMS:SetupBones()
			self.CW_CSTM_ARMS:SetParent(self.CW_VM)
			self.CW_CSTM_ARMS:AddEffects(EF_BONEMERGE)
			self.CW_CSTM_ARMS:AddEffects(EF_BONEMERGE_FASTCULL)
		end
	end
	
	if self.ViewModelFlip then
		local mtr = Matrix()
		mtr:Scale(Vector(1, -1, 1))
		
		self.CW_VM:EnableMatrix("RenderMultiply", mtr)
	end
end

function SWEP:_drawViewModel()
	-- draw the viewmodel
	
	if self.ViewModelFlip then
		render.CullMode(MATERIAL_CULLMODE_CW)
	end
	
	local POS = EyePos() - self.CW_VM:GetPos()
	
	self.CW_VM:FrameAdvance(FrameTime())
	self.CW_VM:SetupBones()
	self.CW_VM:DrawModel()
	
	if self.ViewModelFlip then
		render.CullMode(MATERIAL_CULLMODE_CCW)
	end
	
	local PM = self.Owner:GetHands()
	
	if self.CustomVMArmsPM then
		if PM:GetParent() != self.CW_CSTM_ARMS then
			PM:SetParent(self.CW_CSTM_ARMS)
			PM:AddEffects(EF_BONEMERGE)
			PM:AddEffects(EF_BONEMERGE_FASTCULL)
		end
		PM:DrawModel()
	elseif self.CustomVMArms then
		-- PM:SetParent(nil)
		-- PM:SetNoDraw(true)
		self.CW_CSTM_ARMS:DrawModel()
	else
	end
	
	-- draw the attachments
	self:drawAttachments()
	
	-- draw the customization menu
	self:drawInteractionMenu()
	
	-- draw the unique scope behavior if it is defined
	if self.reticleFunc then
		self.reticleFunc(self)
	end
	
	-- and lastly, draw the custom hud if the player has it enabled
	if GetConVarNumber("cw_customhud_ammo") >= 1 then
		self:draw3D2DHUD()
	end
end

function SWEP:drawAttachments()
	if not self.AttachmentModelsVM then
		return false
	end
	
	local FT = FrameTime()
	
	for k, data in pairs(self.AttachmentModelsVM) do
		if data.active and data.ent then
			local model = data.ent
			local vm = self.CW_VM
			local pos, ang
			
			if data.bone_merge then
				pos = vm:GetPos()
				ang = vm:GetAngles()
			elseif data._bone then
				pos, ang = self:getBoneOrientation(data._bone)
			end
			
			model:SetPos(pos + ang:Forward() * data.pos.x + ang:Right() * data.pos.y + ang:Up() * data.pos.z)
			ang:RotateAroundAxis(ang:Up(), data.angle.y)
			ang:RotateAroundAxis(ang:Right(), data.angle.p)
			ang:RotateAroundAxis(ang:Forward(), data.angle.r)

			model:SetAngles(ang)
			
			if data.animated then
				model:FrameAdvance(FrameTime())
				model:SetupBones()
			end
			
			model:DrawModel()
		end
	end
	
	for k, v in pairs(self.elementRender) do
		v(self)
	end
	
	return true
end

function SWEP:setupAttachmentModels()
	if self.AttachmentModelsVM then
		for k, data in pairs(self.AttachmentModelsVM) do
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
			
			if data.bone_merge then
				data.ent:SetParent(self.CW_VM)
				data.ent:AddEffects(EF_BONEMERGE)
			end
			
			if data.bone then
				data._bone = self.CW_VM:LookupBone(data.bone)
			end
			
			if data.bodygroups then
				for main, sec in pairs(data.bodygroups) do
					data.ent:SetBodygroup(main, sec)
				end
			end
			
			-- if data.attachVMBodyGroups then
				-- for main, sec in pairs(data.attachVMBodyGroups) do
					-- self:setBodygroup(main, sec)
				-- end
			-- end
			
			data.ent:SetupBones()
		end
	end
end

function SWEP:resetM203Anim()
	self:idleAnimFunc()
end

function SWEP:setM203Anim(animName, cycle, speed, prefix)
	cycle = cycle or 0
	speed = speed or 1
	prefix = prefix or self:GetPrefix()
	
	self:sendWeaponAnim(prefix .. animName, speed, cycle)
	
	self.curM203Anim = prefix .. animName
end

function SWEP:offsetM203ArmBone(restore)
	-- if not self.M203ArmBone then
		-- self.M203ArmBone = self.AttachmentModelsVM.md_m203.ent:LookupBone("Bip01 L Clavicle")
	-- end
	
	-- if restore then
		-- ManipulateBonePosition(self.AttachmentModelsVM.md_m203.ent, self.M203ArmBone, Vec0)
	-- else
		-- ManipulateBonePosition(self.AttachmentModelsVM.md_m203.ent, self.M203ArmBone, Vec50)
	-- end
end

//CalcView
function SWEP:CalcView(ply, pos, ang, fov)
	self.freeAimOn = self:isFreeAimOn()
	self.autoCenterFreeAim = GetConVarNumber("cw_freeaim_autocenter") > 0
	
	if self.dt.BipodDeployed then
		if not self.forceFreeAimOffTime then
			self.forceFreeAimOffTime = CurTime() + 0.5
		end
	else
		self.forceFreeAimOffTime = false
	end
		
	if self.freeAimOn then
		fov = 90 -- force FOV to 90 when in free aim mode, unfortunately, due to angles getting fucked up when FOV is not 90
		RunConsoleCommand("fov_desired", 90)
	end
	
	-- if we have free aim on, and we are not using a bipod, or we're using a bipod and we have not run out of "free aim time", then we should simulate free aim
	if self.freeAimOn and (not self.forceFreeAimOffTime or CurTime() < self.forceFreeAimOffTime) then
		local aiming = self.dt.State == CW_AIMING
		
		if self.shouldUpdateAngles then
			self.lastEyeAngle = self.Owner:EyeAngles()
			self.shouldUpdateAngles = false
		else
			local dot = math.Clamp(math.abs(self:getFreeAimDotToCenter()) + 0.3, 0.3, 1)
			
			local lazyAim = GetConVarNumber("cw_freeaim_lazyaim")
			self.lastEyeAngle.y = math.NormalizeAngle(self.lastEyeAngle.y - self.mouseX * lazyAim * dot)
			
			if not aiming and CurTime() > self.lastShotTime then -- we only want to modify pitch if we haven't shot lately
				self.lastEyeAngle.p = math.Clamp(self.lastEyeAngle.p + self.mouseY * lazyAim * dot, -89, 89)
			end
		end
		
		if self.autoCenterFreeAim then
			if self.mouseActive then
				self.lastMouseActivity = CurTime() + GetConVarNumber("cw_freeaim_autocenter_time")
			end
			
			local canAutoCenter = CurTime() > self.lastMouseActivity 
			local shouldAutoCenter = false
			local aimAutoCenter = GetConVarNumber("cw_freeaim_autocenter_aim") > 0
			
			if aiming then
				canAutoCenter = true
				shouldAutoCenter = true
			end
		
			if self.autoCenterExclusions[self.dt.State] then
				canAutoCenter = true
				shouldAutoCenter = true
			end
			
			if self.forceFreeAimOffTime then -- if we're being forced to turn free-aim off, do so
				canAutoCenter = true
				shouldAutoCenter = true
			end
		
			if canAutoCenter then
				local frameTime = FrameTime()
				
				self.freeAimAutoCenterSpeed = frameTime * 16
				
				if aiming then
					self.freeAimAutoCenterSpeed = frameTime * 25 --math.Approach(self.freeAimAutoCenterSpeed, frameTime * 40, frameTime * 6)
				end
				
				if self.autoCenterExclusions[self.dt.State] then
					shouldAutoCenter = true
				else
					if CurTime() > self.lastMouseActivity then
						shouldAutoCenter = true
						self.freeAimAutoCenterSpeed = frameTime * 6 --math.Approach(self.freeAimAutoCenterSpeed, frameTime * 6, frameTime * 6)
					end
				end
				
				self.freeAimAutoCenterSpeed = math.Clamp(self.freeAimAutoCenterSpeed, 0, 1)
					
				if shouldAutoCenter then
					self.lastEyeAngle = LerpAngle(self.freeAimAutoCenterSpeed, self.lastEyeAngle, self.Owner:EyeAngles())
				end
			end
		end
		
		local yawDiff = math.AngleDifference(self.lastEyeAngle.y, ang.y)
		local pitchDiff = math.AngleDifference(self.lastEyeAngle.p, ang.p)
		
		local yawLimit = GetConVarNumber("cw_freeaim_yawlimit")
		local pitchLimit = GetConVarNumber("cw_freeaim_pitchlimit")
		
		if yawDiff >= yawLimit then
			self.lastEyeAngle.y = math.NormalizeAngle(ang.y + yawLimit)
		elseif yawDiff <= -yawLimit then
			self.lastEyeAngle.y = math.NormalizeAngle(ang.y - yawLimit)
		end
		
		if pitchDiff >= pitchLimit then
			self.lastEyeAngle.p = math.NormalizeAngle(ang.p + pitchLimit)
		elseif pitchDiff <= -pitchLimit then
			self.lastEyeAngle.p = math.NormalizeAngle(ang.p - pitchLimit)
		end
		
		ang.y = self.lastEyeAngle.y
		ang.p = self.lastEyeAngle.p
		
		ang = ang
	else
		self.shouldUpdateAngles = true
	end
	
	FT, CT = FrameTime(), CurTime()
	
	local resetM203Angles = false
	
	self.M203CameraActive = false
	
	if self.AttachmentModelsVM then
		local m203 = self.AttachmentModelsVM.md_m203
		
		if m203 then
			if self.dt.State ~= CW_CUSTOMIZE then
				local CAMERA = m203.ent:GetAttachment(m203.ent:LookupAttachment("Camera")).Ang
				local modelAng = m203.ent:GetAngles()
				
				RotateAroundAxis(CAMERA, Right(CAMERA), self.M203CameraRotation.p)
				RotateAroundAxis(CAMERA, Up(CAMERA), self.M203CameraRotation.y)
				RotateAroundAxis(CAMERA, Forward(CAMERA), self.M203CameraRotation.r)

				local factor = math.abs(ang.p)
				local intensity = 1
				
				if factor >= 60 then
					factor = factor - 60
					intensity = math.Clamp(1 - math.abs(factor / 15), 0, 1)
				end
				
				self.M203AngDiff = math.NormalizeAngles((modelAng - CAMERA)) * 0.5 * intensity
			end
		end
	end
	
	ang = ang - self.M203AngDiff
	ang = ang - self.CurM203Angles * 0.5
	ang.r = ang.r + self.lastViewRoll
	
	if UnPredictedCurTime() > self.lastViewRollTime then
		self.lastViewRoll = LerpCW20(FrameTime() * 10, self.lastViewRoll, 0)
	end
	
	if UnPredictedCurTime() > self.FOVHoldTime or freeAimOn then
		self.FOVTarget = LerpCW20(FT * 10, self.FOVTarget, 0)
	end	
	
	if self.CalcViewCamera and self.CW_VM:GetAttachment(self.CW_VM:LookupAttachment(self.CalcViewCamera)) then
		local vm = self.CW_VM
		local CAMERA = vm:GetAttachment(vm:LookupAttachment(self.CalcViewCamera)).Ang
		local modelAng = vm:GetAngles()
		
		-- RotateAroundAxis(CAMERA, Right(CAMERA), self.M203CameraRotation.p)
		-- RotateAroundAxis(CAMERA, Up(CAMERA), self.M203CameraRotation.y)
		-- RotateAroundAxis(CAMERA, Forward(CAMERA), self.M203CameraRotation.r)

		local factor = math.abs(ang.p)
		local intensity = self.CalcViewCameraIntensity or 1
		
		if factor >= 60 then
			factor = factor - 60
			intensity = math.Clamp(1 - math.abs(factor / 15), 0, 1)
		end
		
		self.CalcViewCameraAngDiff = math.NormalizeAngles((modelAng - CAMERA)) * 0.5 * intensity
		
		ang = ang - self.CalcViewCameraAngDiff
	end
	
	if self.ReloadViewBobEnabled and self.CalcViewCamera then
		if self.IsReloading and self.Cycle <= 0.9 then
			att = self.Owner:GetAttachment(1)
			
			if att then
				ang = ang * 1
				
				self.LerpBackSpeed = 1
				curang = LerpAngle(FT * 10, curang, (ang - att.Ang) * 0.1)
			else
				self.LerpBackSpeed = math.Approach(self.LerpBackSpeed, 10, FT * 50)
				curang = LerpAngle(FT * self.LerpBackSpeed, curang, Ang0)
			end
		else
			self.LerpBackSpeed = math.Approach(self.LerpBackSpeed, 10, FT * 50)
			curang = LerpAngle(FT * self.LerpBackSpeed, curang, Ang0)
		end

		RotateAroundAxis(ang, Right(ang), curang.p * self.RVBPitchMod)
		RotateAroundAxis(ang, Up(ang), curang.r * self.RVBYawMod)
		RotateAroundAxis(ang, Forward(ang), (curang.p + curang.r) * 0.15 * self.RVBRollMod)
	end
	
	if self.dt.State == CW_AIMING then
		if self.dt.M203Active and self.M203Chamber and not CustomizableWeaponry.grenadeTypes:canUseProperSights(self.Grenade40MM) then
			self.CurFOVMod = LerpCW20(FT * 10, self.CurFOVMod, 5)
		else
			local zoomAmount = self.ZoomAmount
			local simpleTelescopics = not self:canUseComplexTelescopics()
			local shouldDelay = false
			
			if simpleTelescopics then
				if self.SimpleTelescopicsFOV then
					zoomAmount = self.SimpleTelescopicsFOV
					shouldDelay = true
				end
			end
			
			if self.DelayedZoom or shouldDelay then
				if CT > self.AimTime then
					if self.SnapZoom or (self.SimpleTelescopicsFOV and simpleTelescopics) then
						self.CurFOVMod = zoomAmount
					else
						self.CurFOVMod = LerpCW20(FT * 10, self.CurFOVMod, zoomAmount)
					end
				else
					self.CurFOVMod = LerpCW20(FT * 10, self.CurFOVMod, 0)
				end
			else
				if self.SnapZoom or (self.SimpleTelescopicsFOV and simpleTelescopics) then
					self.CurFOVMod = zoomAmount
				else
					self.CurFOVMod = LerpCW20(FT * 10, self.CurFOVMod, zoomAmount)
				end
			end
		end
	else
		self.CurFOVMod = LerpCW20(FT * 10, self.CurFOVMod, 0)
	end
	
	if self.holdingBreath then
		self.BreathFOVModifier = math.Approach(self.BreathFOVModifier, 7, FT * 12)
	else
		self.BreathFOVModifier = math.Approach(self.BreathFOVModifier, 0, FT * 10)
	end
	
	fov = math.Clamp(fov - self.CurFOVMod - self.BreathFOVModifier, 5, 90)
	
	if self.Owner then
		if self.ViewbobEnabled then
			ws = self.Owner:GetWalkSpeed()
			vel = Length(GetVelocity(self.Owner))
			
			local intensity = 1
						
			if self:isPlayerProne() and vel >= self.BusyProneVelocity then
				intensity = 7
				cos1 = math.cos(CT * 6)
				cos2 = math.cos(CT * 7)
				curviewbob.p = cos1 * 0.1 * intensity
				curviewbob.y = cos2 * 0.2 * intensity
			else			
				if self.Owner:OnGround() and vel > ws * 0.3 then
					if vel < ws * 1.2 then
						cos1 = math.cos(CT * 15)
						cos2 = math.cos(CT * 12)
						curviewbob.p = cos1 * 0.15 * intensity
						curviewbob.y = cos2 * 0.1 * intensity
					else
						cos1 = math.cos(CT * 20)
						cos2 = math.cos(CT * 15)
						curviewbob.p = cos1 * 0.25 * intensity
						curviewbob.y = cos2 * 0.15 * intensity
					end
				else
					curviewbob = LerpAngle(FT * 10, curviewbob, Ang0)
				end
			end
		end
	end
	
	fov = fov - self.FOVTarget
	self.curFOV = fov
	
	return pos, ang + curviewbob * self.ViewbobIntensity, fov
end