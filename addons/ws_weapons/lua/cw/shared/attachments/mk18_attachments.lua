AddCSLuaFile()

---------- Tritium Sights ----------

local att = {}
att.name = "mk18_tritium"
att.displayName = "Tritium sights"
att.displayNameShort = "Tritium"
att.isBG = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT
 
if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_tritium")
	att.description = {[1] = {t = "Adds tritium sights to your gun.", c = CustomizableWeaponry.textColors.COSMETIC}}
	
	att.reticle = "atts/icontrit"
	att._reticleSize = 1
	
	function att:elementRender()
		local rc = self:getSightColor(att.name)
		local vec = Vector((rc.r / 255)*(rc.r / 255), (rc.g / 255)*(rc.g / 255), (rc.b / 255)*(rc.b / 255)) // saturated
		local mat = Material("models/weapons/v_models/mk18/tritium")
		
		mat:SetVector("$selfillumtint", vec)
	end
end
 
function att:attachFunc()
	self:setBodygroup(self.TritiumBGs.main, self.TritiumBGs.on)
end

function att:detachFunc()
	self:setBodygroup(self.TritiumBGs.main, self.TritiumBGs.off)
end
 
CustomizableWeaponry:registerAttachment(att)

---------- Troy Battle Sights ----------

local att = {}
att.name = "troy_sights"
att.displayName = "Troy Battle Sights"
att.displayNameShort = "Troy"
att.isBG = true
att.isSight = true
att.aimPos = {"TroySightPos", "TroySightAng"}
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT
 
if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/troy_sights")
	att.description = {[1] = {t = "A folding ironsight variant.", c = CustomizableWeaponry.textColors.COSMETIC}}
	
	att.reticle = "atts/icontrit"
	att._reticleSize = 1
	
	function att:elementRender()
		local rc = self:getSightColor(att.name)
		local vec = Vector((rc.r / 255)*(rc.r / 255), (rc.g / 255)*(rc.g / 255), (rc.b / 255)*(rc.b / 255)) // saturated
		local mat = Material("models/weapons/v_models/mk18/diffuse")
		
		mat:SetVector("$selfillumtint", vec)
	end
end

function att:attachFunc()
	self:setBodygroup(self.SightBGs.main, self.SightBGs.troy)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(1,1)
	end
end

function att:detachFunc()
	if self.WMEnt then
		self.WMEnt:SetBodygroup(1,0)
	end
end
 
CustomizableWeaponry:registerAttachment(att)

---------- Default CW 2.0 ACOG Scope (FIXED) ----------

local att = {}
att.name = "mk18_acog_fixed"
att.displayName = "Trijicon ACOG"
att.displayNameShort = "ACOG"
att.aimPos = {"ACOG_FixedPos", "ACOG_FixedAng"}
att.FOVModifier = 15
att.isSight = true

att.statModifiers = {OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/acog")
	att.description = {[1] = {t = "Provides 4x magnification.", c = CustomizableWeaponry.textColors.POSITIVE},
	[2] = {t = "Narrow scope reduces awareness.", c = CustomizableWeaponry.textColors.NEGATIVE},
	[3] = {t = "Can be disorienting at close range.", c = CustomizableWeaponry.textColors.NEGATIVE},
	[4] = {t = "Double tap your 'use' key, to use the backup sights.", c = CustomizableWeaponry.textColors.REGULAR}}

	local old, x, y, ang
	local reticle = surface.GetTextureID("cw2/reticles/reticle_chevron")
	
	att.zoomTextures = {[1] = {tex = reticle, offset = {0, 1}}}
	
	local lens = surface.GetTextureID("cw2/gui/lense")
	local lensMat = Material("cw2/gui/lense")
	local cd, alpha = {}, 0.5
	local Ini = true
	
	-- render target var setup
	cd.x = 0
	cd.y = 0
	cd.w = 512
	cd.h = 512
	cd.fov = 4.5
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
		
		if self:canSeeThroughTelescopics(att.aimPos[1]) then
			alpha = math.Approach(alpha, 0, FrameTime() * 5)
		else
			alpha = math.Approach(alpha, 1, FrameTime() * 5)
		end
		
		x, y = ScrW(), ScrH()
		old = render.GetRenderTarget()
	
		ang = LocalPlayer():EyeAngles() + LocalPlayer():GetPunchAngle() -- fucking fix for some models
		//ang = self:getTelescopeAngles() //[[the broken code]]
		
		if self.ViewModelFlip then
			ang.r = -self.BlendAng.z
		else
			ang.r = self.BlendAng.z
		end
		
		if not self.freeAimOn then
			ang:RotateAroundAxis(ang:Right(), self.ACOG_FixedAxisAlign.right)
			ang:RotateAroundAxis(ang:Up(), self.ACOG_FixedAxisAlign.up)
			ang:RotateAroundAxis(ang:Forward(), self.ACOG_FixedAxisAlign.forward)
		end
		
		local size = self:getRenderTargetSize()
		
		cd.w = size
		cd.h = size
		cd.angles = ang
		cd.origin = self.Owner:GetShootPos()
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
	self.OverrideAimMouseSens = 0.25
	self.SimpleTelescopicsFOV = 70
	self.AimViewModelFOV = 50
	self.BlurOnAim = true
	self.ZoomTextures = att.zoomTextures
end

function att:detachFunc()
	self.OverrideAimMouseSens = nil
	self.SimpleTelescopicsFOV = nil
	self.AimViewModelFOV = self.AimViewModelFOV_Orig
	self.BlurOnAim = false
end

CustomizableWeaponry:registerAttachment(att)

---------- PMAG Gen M3 36-Rounds ----------

local att = {}
att.name = "mk18_pmag"
att.displayName = "PMAG Gen M3"
att.displayNameShort = "PMAG"

att.statModifiers = {ReloadSpeedMult = -0.10,
OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/pmag")
	att.description = {[1] = {t = "Increases the magazine's size to 36 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.pmag)
	self:unloadWeapon()
	self.Primary.ClipSize = 36
	self.Primary.ClipSize_Orig = 36
	if self.WMEnt then
		self.WMEnt:SetBodygroup(2,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
	if self.WMEnt then
		self.WMEnt:SetBodygroup(2,0)
	end
end

CustomizableWeaponry:registerAttachment(att)

---------- Quad-Stack 60 Round Magazine (with "WMEnt" function) ----------

local att = {}
att.name = "quad_stack60"
att.displayName = "Quad-Stack Magazine"
att.displayNameShort = "Quad"
att.isBG = true

att.statModifiers = {ReloadSpeedMult = -0.15,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar1560rndmag")
	att.description = {[1] = {t = "Increases the magazine's size to 60 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.round60)
	self:unloadWeapon()
	self.Primary.ClipSize = 60
	self.Primary.ClipSize_Orig = 60
	if self.WMEnt then
		self.WMEnt:SetBodygroup(2,2)
	end
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
	if self.WMEnt then
		self.WMEnt:SetBodygroup(2,0)
	end
end

CustomizableWeaponry:registerAttachment(att)

---------- Sturdy Stock (with "WMEnt" function) ----------

local att = {}
att.name = "sturdy_stock"
att.displayName = "Sturdy Stock"
att.displayNameShort = "Sturdy"
att.isBG = true

att.statModifiers = {RecoilMult = -0.05,
OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15sturdystock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.sturdy)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(3,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(3,0)
	end
end

CustomizableWeaponry:registerAttachment(att)

---------- Heavy Stock (with "WMEnt" function) ----------

local att = {}
att.name = "heavy_stock"
att.displayName = "Heavy Stock"
att.displayNameShort = "Heavy"
att.isBG = true

att.statModifiers = {RecoilMult = -0.1,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15heavystock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.heavy)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(3,2)
	end
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(3,0)
	end
end

CustomizableWeaponry:registerAttachment(att)