local att = {}
att.name = "doi_atow_unertl"
att.displayNameShort = "Unertl 7.8x"
att.displayName = "Unertl"
att.aimPos = {"UnertlPos", "UnertlAng"}
att.FOVModifier = 20
att.AimViewModelFOV = 25
att.isSight = true
att.withoutRail = true

att.statModifiers = {
	OverallMouseSensMult = -0.4
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/unertl8x")
	att.description = {
		[1] = {t = "American 7.8x magnification scope.", c = CustomizableWeaponry.textColors.POSITIVE},
		[2] = {t = "For long range.", c = CustomizableWeaponry.textColors.POSITIVE}
	}

	local old, x, y, ang
	local reticle = surface.GetTextureID("models/khrcw2/doipack/springfield/weaver_crosshair")
	
	att.zoomTextures = {[1] = {tex = reticle, offset = {0, 1}}}
	
	local lens = surface.GetTextureID("cw2/gui/lense")
	local lensMat = Material("cw2/gui/lense")
	local cd, alpha = {}, 0.5
	local Ini = true
	
	-- render target var setup
	cd.x = 0
	cd.y = 0
	cd.w = 1024
	cd.h = 1024
	cd.fov = 3
	cd.drawviewmodel = false
	cd.drawhud = false
	cd.dopostprocess = false
	
function att:drawRenderTarget()
		local complexTelescopics = self:canUseComplexTelescopics()
		
		-- if we don't have complex telescopics enabled, don't do anything complex, and just set the texture of the lens to a fallback 'lens' texture
		if not complexTelescopics then
			self.TSGlass:SetTexture("$basetexture", lensMat:GetTexture("$basetexture"))
			return
		end
		
		if self.dt.State == CW_AIMING then
			alpha = math.Approach(alpha, 0, FrameTime() * 5)
		else
			alpha = math.Approach(alpha, 1, FrameTime() * 5)
		end
		
		x, y = ScrW(), ScrH()
		old = render.GetRenderTarget()

		ang = self:getTelescopeAnglesNew()
		
		if not self.TelescopeSkipRotate then
			if self.ViewModelFlip then
				ang.r = -self.BlendAng.z
			else
				ang.r = self.BlendAng.z
			end
		end
		
		if self.UnertlAxisAlign then
			local right, up, forward = ang:Right(), ang:Up(), ang:Forward()
			
			ang:RotateAroundAxis(right, self.UnertlAxisAlign.right)
			ang:RotateAroundAxis(up, self.UnertlAxisAlign.up)
			ang:RotateAroundAxis(forward, self.UnertlAxisAlign.forward)
		end
	
		local size = self:getRenderTargetSize()

		cd.w = size
		cd.h = size
		cd.angles = ang
		cd.origin = self.Owner:GetShootPos()
		
		self:adjustTelescopicsFOV(cd)
		
		render.SetRenderTarget(self.ScopeRT)
		render.SetViewPort(0, 0, size, size)
			if alpha < 1 or Ini then
				render.RenderView(cd)
				Ini = false
			end
					
			ang = self.Owner:EyeAngles()
			ang.p = ang.p + self.BlendAng.x
			ang.y = ang.y + self.BlendAng.y
			ang.r = ang.r + self.BlendAng.z
			ang = -ang:Forward()
			
			local light = render.ComputeLighting(self.Owner:GetShootPos(), ang)
			
			cam.Start2D()				
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(reticle)
				surface.DrawTexturedRect(0, 0, size, size)
				
				if alpha < 1 then
					self:drawLensShadow(size, size)
				end
				
				surface.SetDrawColor(150 * light[1], 150 * light[2], 150 * light[3], 255 * alpha)
				surface.SetTexture(lens)
				surface.DrawTexturedRectRotated(size * 0.5, size * 0.5, size, size, 90)
			cam.End2D()
		render.SetViewPort(0, 0, x, y)
		render.SetRenderTarget(old)
		
		if self.TSGlass then
			self.TSGlass:SetTexture("$basetexture", self.ScopeRT)
		end
	end
end

function att:attachFunc()
	self:setBodygroup(self.SightBGs.main, self.SightBGs.off)
	self.OverrideAimMouseSens = 0.01
	self.SimpleTelescopicsFOV = 83
	self.AimViewModelFOV = 50
	self.BlurOnAim = true
	self.ZoomTextures = att.zoomTextures
end

function att:detachFunc()
	self:setBodygroup(self.SightBGs.main, self.SightBGs.on)
	self.OverrideAimMouseSens = nil
	self.SimpleTelescopicsFOV = nil
	self.AimViewModelFOV = self.AimViewModelFOV_Orig
	self.BlurOnAim = false
end

CustomizableWeaponry:registerAttachment(att)