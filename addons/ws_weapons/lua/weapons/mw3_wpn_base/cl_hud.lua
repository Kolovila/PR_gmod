surface.CreateFont("PS4_FONT24", {font = "Controller: Sony PlayStation 4", size = 30, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT72", {font = "Controller: Sony PlayStation 4", size = 72, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT60", {font = "Controller: Sony PlayStation 4", size = 60, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT52", {font = "Controller: Sony PlayStation 4", size = 52, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT48", {font = "Controller: Sony PlayStation 4", size = 48, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT40", {font = "Controller: Sony PlayStation 4", size = 40, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT38", {font = "Controller: Sony PlayStation 4", size = 38, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT36", {font = "Controller: Sony PlayStation 4", size = 36, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT32", {font = "Controller: Sony PlayStation 4", size = 32, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT28", {font = "Controller: Sony PlayStation 4", size = 28, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT24", {font = "Controller: Sony PlayStation 4", size = 24, weight = 500, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT22", {font = "Controller: Sony PlayStation 4", size = 22, weight = 500, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT20", {font = "Controller: Sony PlayStation 4", size = 20, weight = 500, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT16", {font = "Controller: Sony PlayStation 4", size = 16, weight = 500, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT14", {font = "Controller: Sony PlayStation 4", size = 14, weight = 500, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("PS4_FONT12", {font = "Controller: Sony PlayStation 4", size = 12, weight = 500, blursize = 0, antialias = true, shadow = true})

surface.CreateFont("XBOX_FONT24", {font = "Controller: Microsoft Xbox One", size = 30, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT72", {font = "Controller: Microsoft Xbox One", size = 72, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT60", {font = "Controller: Microsoft Xbox One", size = 60, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT52", {font = "Controller: Microsoft Xbox One", size = 52, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT48", {font = "Controller: Microsoft Xbox One", size = 48, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT40", {font = "Controller: Microsoft Xbox One", size = 40, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT38", {font = "Controller: Microsoft Xbox One", size = 38, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT36", {font = "Controller: Microsoft Xbox One", size = 36, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT32", {font = "Controller: Microsoft Xbox One", size = 32, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT28", {font = "Controller: Microsoft Xbox One", size = 28, weight = 700, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT24", {font = "Controller: Microsoft Xbox One", size = 24, weight = 500, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT22", {font = "Controller: Microsoft Xbox One", size = 22, weight = 500, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT20", {font = "Controller: Microsoft Xbox One", size = 20, weight = 500, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT16", {font = "Controller: Microsoft Xbox One", size = 16, weight = 500, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT14", {font = "Controller: Microsoft Xbox One", size = 14, weight = 500, blursize = 0, antialias = true, shadow = true})
surface.CreateFont("XBOX_FONT12", {font = "Controller: Microsoft Xbox One", size = 12, weight = 500, blursize = 0, antialias = true, shadow = true})

local Deploy, UnDeploy = surface.GetTextureID("cw2/gui/bipod_deploy"), surface.GetTextureID("cw2/gui/bipod_undeploy")
local deployedOnObject = surface.GetTextureID("cw2/gui/deployonobject")
local scopeTemplate = surface.GetTextureID("cw2/gui/scope_template")

SWEP.CrossAmount = 0
SWEP.CrossAlpha = 255
SWEP.FadeAlpha = 0
SWEP.AimTime = 0

local MeleeReticle = surface.GetTextureID("cw2/gui/wf_melee")
local ClumpSpread = surface.GetTextureID("cw2/gui/clumpspread_ring")
local ClumpSpreadWF = surface.GetTextureID("cw2/gui/wf_clump")
local Bullet = surface.GetTextureID("cw2/gui/bullet")
local GLCrosshair = surface.GetTextureID("mw2_reticles/m203")
local RPGCrosshair = surface.GetTextureID("mw2_reticles/rpg")
local Vignette = surface.GetTextureID("cw2/effects/vignette")

local ReloadBG = surface.GetTextureID("mw3_icons/other/ReloadBG")

local White, Black = Color(255, 255, 255, 255), Color(0, 0, 0, 255)
local Red, Yellow = Color(255, 100, 100, 255), Color(255, 216, 100, 255)
local x, y, x2, y2, lp, size, FT, CT, tr, x3, x4, y3, y4, UCT, sc1, sc2
local td = {}

local surface = surface
local math = math
local draw = draw
local dst = draw.SimpleText

SWEP.HUD_HealthTextColor = Color(255, 255, 255, 255)
SWEP.HUD_MagTextColor = Color(255, 255, 255, 255)
SWEP.HUD_Mag2TextColor = Color(255, 255, 255, 255)
SWEP.HUD_ReserveTextColor = Color(255, 255, 255, 255)
SWEP.HUD_MagText = "MAG: "
SWEP.HUD_BreathAlpha = 1

function draw.ShadowText(text, font, x, y, colortext, colorshadow, dist, xalign, yalign)
	dst(text, font, x + dist, y + dist, colorshadow, xalign, yalign)
	dst(text, font, x, y, colortext, xalign, yalign)
end

-- pre-define strings to not generate them every frame and make life unbearable for gc
local cwhud24 = "CW_HUD24"
local cwhud22 = "CW_HUD22"
local cwhud20 = "CW_HUD20"
local cwhud16 =	"CW_HUD16"
local cwhud14 = "CW_HUD14"


function SWEP:crosshairVisible()
	-- not visible if we're aiming
	if self.dt.State == CW_AIMING and self.FadeCrosshairOnAim then
		return false
	end

	-- or are in an inactive state (action in progress/running)
	if self.InactiveWeaponStatesCrosshair[self.dt.State] then
		return false
	end

	-- or have safety turned on
	if self.dt.Safe then
		return false
	end

	-- or are in a vehicle
	if self.Owner:InVehicle() then
		return false
	end

	-- or are near a wall
	if self.NearWall then
		return false
	end

	-- or are reloading the weapon
	if self.IsReloadShotgun and self.Cycle <= 1 then
		return false
	end

	if self.IsReloading and self.Cycle <= .9 and not self.isDualwield then
		return false
	end

	-- or when inspecting the weapon
	if self.IsInspecting and self.Cycle <= .9 then
		return false
	end

	-- or when toggling the alt mode
	if self.isToggling and self.Cycle <= .9 then
		return false
	end

	return true
end

-- function SWEP:drawClumpSpread(x, y, spread, alpha)
	-- if not spread then
		-- return
	-- end

	-- local size = math.ceil(spread * 2500)
	-- surface.SetDrawColor(0, 0, 0, alpha)
	-- surface.SetTexture(ClumpSpreadWF)
	-- surface.DrawTexturedRect(x - size * 0.5 - 1, y - size * 0.5 - 1, size + 2, size + 2)

	-- surface.SetDrawColor(255, 255, 255, alpha)
	-- surface.DrawTexturedRect(x - size * 0.5, y - size * 0.5, size, size)
-- end

function SWEP:drawWiiCrosshairStyle()

	outer = "mw3_reticles/wii/outer_"
	style = outer .. GetConVarNumber("mw3_prompt_wii_crosshair_style")
	
return surface.GetTextureID(style)

end

function SWEP:drawWiiCrosshairColIn()
	convar = GetConVarNumber("mw3_prompt_wii_crosshair_col_in")
	r = 255
	g = 255
	b = 255

	if convar == 1 then
		r = 0
		g = 255
		b = 255
	elseif convar == 2 then
		r = 255
		g = 200
		b = 100
	elseif convar == 3 then
		r = 255
		g = 255
		b = 255
	elseif convar == 4 then
		r = 255
		g = 255
		b = 0
	elseif convar == 5 then
		r = 255
		g = 0
		b = 255
	elseif convar == 6 then
		r = 100
		g = 100
		b = 255
	elseif convar == 7 then
		r = 255
		g = 125
		b = 255
	elseif convar == 8 then
		r = 255
		g = 255
		b = 125
	elseif convar == 9 then
		r = 100
		g = 100
		b = 100
	elseif convar == 10 then
		r = 255
		g = 100
		b = 100
	end

return r, g, b, self.CrossAlpha * 0.75
end

function SWEP:drawWiiCrosshairColOut()
	convar = GetConVarNumber("mw3_prompt_wii_crosshair_col_out")
	r = 255
	g = 255
	b = 255

	if convar == 1 then
		r = 255
		g = 255
		b = 255
	elseif convar == 2 then
		r = 255
		g = 255
		b = 0
	elseif convar == 3 then
		r = 255
		g = 200
		b = 100
	elseif convar == 4 then
		r = 0
		g = 255
		b = 255
	elseif convar == 5 then
		r = 255
		g = 0
		b = 255
	elseif convar == 6 then
		r = 100
		g = 100
		b = 255
	elseif convar == 7 then
		r = 255
		g = 100
		b = 100
	elseif convar == 8 then
		r = 100
		g = 255
		b = 100
	elseif convar == 9 then
		r = 100
		g = 100
		b = 100
	elseif convar == 10 then
		r = 0
		g = 0
		b = 0
	end

return r, g, b, self.CrossAlpha * 0.75
end

function SWEP:drawWiiCrosshair(x, y, spread, alpha)
			local dot = surface.GetTextureID("mw3_reticles/wii/dot")
			local dot2 = surface.GetTextureID("mw3_reticles/wii/outer_7")
			local gl = surface.GetTextureID("mw3_reticles/wii/gl")
			local con = GetConVarNumber("mw3_prompt_wii_crosshair_style")
			local am1 = self.Primary.Ammo
			local am2 = self.Secondary.Ammo
			
			
			surface.SetDrawColor(self:drawWiiCrosshairColIn()) -- Inner Crosshair Colour
			
			if (self.dt.AltActive and am2 == "40MM") or am1 == "RPG_Round" then
				surface.SetTexture(gl)
				retpos = 64
				retsize = 128
			elseif con == 7 then
				surface.SetTexture(dot2)
				retpos = 8
				retsize = 16
			else
				surface.SetTexture(dot)
				retpos = 8
				retsize = 16
			end
			
			surface.DrawTexturedRect(x2 - retpos, y2 - retpos, retsize, retsize) -- Inner Circle

			surface.SetTexture(self:drawWiiCrosshairStyle())
			surface.SetDrawColor(self:drawWiiCrosshairColOut()) -- Outer Crosshair Colour
			
			if not (con == 6 or con == 7) then
				if self.CrosshairParts.left then
					surface.DrawTexturedRect(x2 - 46 - self.CrossAmount, y2 - 15, 32, 32) -- Outer Left
				end

				if self.CrosshairParts.right then
					surface.DrawTexturedRectRotated(x2 + 31 + self.CrossAmount, y2 + 1, 32, 32, 180) -- Outer Right
				end

				if self.CrosshairParts.upper then
					surface.DrawTexturedRectRotated(x2 + 0, y2 - 30 - self.CrossAmount, 34, 32, -90) -- Outer Upper
				end

				if self.CrosshairParts.lower then
					surface.DrawTexturedRectRotated(x2 + 0, y2 + 31 + self.CrossAmount, 32, 32, 90) -- Outer Lower
				end
			end
end

function SWEP:drawCrosshair(x, y, spread, alpha)
			surface.SetDrawColor(0, 0, 0, self.CrossAlpha * 0.75) -- BLACK crosshair parts

			if self.CrosshairParts.left then
				surface.DrawRect(x2 - 13 - self.CrossAmount, y2 - 1, 12, 3) -- left cross
			end

			if self.CrosshairParts.right then
				surface.DrawRect(x2 + 3 + self.CrossAmount, y2 - 1, 12, 3) -- right cross
			end

			if self.CrosshairParts.upper then
				surface.DrawRect(x2 - 1, y2 - 13 - self.CrossAmount, 3, 12) -- upper cross
			end

			if self.CrosshairParts.lower then
				surface.DrawRect(x2 - 1, y2 + 3 + self.CrossAmount, 3, 12) -- lower cross
			end

			surface.SetDrawColor(255, 255, 255, self.CrossAlpha) -- WHITE crosshair parts

			if self.CrosshairParts.left then
				surface.DrawRect(x2 - 12 - self.CrossAmount, y2, 10, 1) -- left cross
			end

			if self.CrosshairParts.right then
				surface.DrawRect(x2 + 4 + self.CrossAmount, y2, 10, 1) -- right cross
			end

			if self.CrosshairParts.upper then
				surface.DrawRect(x2, y2 - 12 - self.CrossAmount, 1, 10) -- upper cross
			end

			if self.CrosshairParts.lower then
				surface.DrawRect(x2, y2 + 4 + self.CrossAmount, 1, 10) -- lower cross
			end
end

function SWEP:drawClumpSpread(x, y, spread, alpha)
	local con = GetConVarNumber("mw3_prompt_wii_crosshair_style")
	if self.ClumpSpread == 0 then
		return
	end

	if self.useWiiCrosshair then
		surface.SetTexture(self:drawWiiCrosshairStyle())
		surface.SetDrawColor(self:drawWiiCrosshairColOut()) -- Outer Crosshair Colour
																					 

		if not (con == 6 or con == 7) then
			surface.DrawTexturedRect(x2 - 46 - spread, y2 - 15, 32, 32) -- Outer Left
			surface.DrawTexturedRectRotated(x2 + 31 + spread, y2 + 1, 32, 32, 180) -- Outer Right
			surface.DrawTexturedRectRotated(x2 + 0, y2 - 30 - spread, 34, 32, -90) -- Outer Upper
			surface.DrawTexturedRectRotated(x2 + 0, y2 + 31 + spread, 32, 32, 90) -- Outer Lower
		end
	else
		surface.SetDrawColor(0, 0, 0, alpha * 0.75) -- BLACK crosshair parts

		surface.DrawRect(x2 - 13 - spread, y2 - 1, 12, 3) -- left cross
		surface.DrawRect(x2 + 3 + spread, y2 - 1, 12, 3) -- right cross
		surface.DrawRect(x2 - 1, y2 - 13 - spread, 3, 12) -- upper cross
		surface.DrawRect(x2 - 1, y2 + 3 + spread, 3, 12) -- lower cross

		surface.SetDrawColor(255, 255, 255, alpha) -- WHITE crosshair parts
		surface.DrawRect(x2 - 12 - spread, y2, 10, 1) -- left cross
		surface.DrawRect(x2 + 4 + spread, y2, 10, 1) -- right cross
		surface.DrawRect(x2, y2 - 12 - spread, 1, 10) -- upper cross
		surface.DrawRect(x2, y2 + 4 + spread, 1, 10) -- lower cross
	end
end

function SWEP:drawClumpSpreadAlt(x, y, spread, alpha)
	local con = GetConVarNumber("mw3_prompt_wii_crosshair_style")
	local secammo = self.Secondary.Ammo
	if not self.dt.AltActive then
		return
	end

	if self.useWiiCrosshair then
		surface.SetDrawColor(self:drawWiiCrosshairColOut()) -- Outer Crosshair Colour
		surface.SetTexture(self:drawWiiCrosshairStyle())
																					 

		if not (con == 6 or con == 7 or (self.dt.AltActive and secammo == "40MM")) then
			surface.DrawTexturedRect(x2 - 45 - spread, y2 - 16, 32, 32) -- Outer Left
			surface.DrawTexturedRectRotated(x2 + 32 + spread, y2 + 0, 32, 32, 180) -- Outer Right
			surface.DrawTexturedRectRotated(x2 + 0, y2 - 30 - spread, 32, 32, -90) -- Outer Upper
			surface.DrawTexturedRectRotated(x2 + 0, y2 + 32 + spread, 32, 32, 90) -- Outer Lower
		end
	else
		surface.SetDrawColor(0, 0, 0, alpha * 0.75) -- BLACK crosshair parts

		surface.DrawRect(x2 - 13 - spread, y2 - 1, 12, 3) -- left cross
		surface.DrawRect(x2 + 3 + spread, y2 - 1, 12, 3) -- right cross
		surface.DrawRect(x2 - 1, y2 - 13 - spread, 3, 12) -- upper cross
		surface.DrawRect(x2 - 1, y2 + 3 + spread, 3, 12) -- lower cross

		surface.SetDrawColor(255, 255, 255, alpha) -- WHITE crosshair parts
		surface.DrawRect(x2 - 12 - spread, y2, 10, 1) -- left cross
		surface.DrawRect(x2 + 4 + spread, y2, 10, 1) -- right cross
		surface.DrawRect(x2, y2 - 12 - spread, 1, 10) -- upper cross
		surface.DrawRect(x2, y2 + 4 + spread, 1, 10) -- lower cross
	end
end

function SWEP:DrawHUD()
	FT, CT, x, y = FrameTime(), CurTime(), ScrW(), ScrH()
	UCT = UnPredictedCurTime()

	-- DEBUG
--	local seq = self.CW_VM:GetSequence()
--	local seq_name = self.CW_VM:GetSequenceName( seq )
--	draw.ShadowText( "Weap Seq: ".. seq_name .."(".. tostring(seq) ..")", cwhud24, 0.05, y / 2, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	-- DEBUG END --

	if self.dt.State == CW_AIMING then
		-- if we have M203 mode enabled, but have no rounds in it, OR if we don't have M203 enabled, let us draw the overlays
		if (self.dt.M203Active and (not self.M203Chamber or CustomizableWeaponry.grenadeTypes:canUseProperSights(self.Grenade40MM))) or not self.dt.M203Active then
			local simpleTelescopics = not self:canUseComplexTelescopics()

			local hasZoom = (self.SimpleTelescopicsFOV)
			local canUseSimpleTelescopics = (simpleTelescopics and hasZoom)

			if UCT > self.AimTime or self.InstantDissapearOnAim then
				if self.DrawBlackBarsOnAim or canUseSimpleTelescopics then
					surface.SetDrawColor(0, 0, 0, 255)

					if self.ScaleOverlayToScreenHeight then
						x3 = (x - y) / 2
						y3 = y / 2
						x4 = x - x3
						y4 = y - y3

						surface.DrawRect(0, 0, x3, y)
						surface.DrawRect(x4, 0, x3, y)
					else
						x3 = (x - 1024) / 2
						y3 = (y - 1024) / 2
						x4 = x - x3
						y4 = y - y3

						surface.DrawRect(0, 0, x3, y)
						surface.DrawRect(x4, 0, x3, y)
						surface.DrawRect(0, 0, x, y3)
						surface.DrawRect(0, y4, x, y3)
					end
				end
			end

			if self.AimOverlay or canUseSimpleTelescopics then
				if UCT > self.AimTime or self.InstantDissapearOnAim then
					surface.SetDrawColor(255, 255, 255, 255)

					if canUseSimpleTelescopics then
						surface.SetTexture(scopeTemplate)
						surface.DrawTexturedRect(x * 0.5 - 512, y * 0.5 - 512, 1024, 1024)
					else
						surface.SetTexture(self.AimOverlay)
					end

					if self.StretchOverlayToScreen then
						if canUseSimpleTelescopics then
							for k, v in ipairs(self.ZoomTextures) do
								if v.color then
									surface.SetDrawColor(v.color)
								else
									surface.SetDrawColor(255, 255, 255, 255)
								end

								surface.SetTexture(v.tex)
								surface.DrawTexturedRect(v.offset[1], v.offset[2], x, y)
							end
						else
							surface.DrawTexturedRect(0, 0, x, y)
						end

					elseif self.ScaleOverlayToScreenHeight then
						if canUseSimpleTelescopics then
							for k, v in ipairs(self.ZoomTextures) do
								surface.SetTexture(v.tex)
								surface.DrawTexturedRect(x * 0.5 - y * 0.5 + v.offset[1], y * 0.5 - y * 0.5 + v.offset[2], y, y)
							end
						else
							surface.DrawTexturedRect(x * 0.5 - y * 0.5, y * 0.5 - y * 0.5, y, y)
						end
					else
						if canUseSimpleTelescopics then
							for k, v in ipairs(self.ZoomTextures) do
								local xSize, ySize = 1024, 1024

								if v.size then
									xSize, ySize = v.size[1], v.size[2]
								end


								if v.color then
									surface.SetDrawColor(v.color)
								else
									surface.SetDrawColor(255, 255, 255, 255)
								end

								surface.SetTexture(v.tex)
								surface.DrawTexturedRect(x * 0.5 - xSize * 0.5 + v.offset[1], y * 0.5 - ySize * 0.5 + v.offset[2], xSize, ySize)
							end
						else
							surface.DrawTexturedRect(x * 0.5 - 512, y * 0.5 - 512, 1024, 1024)
						end
					end
				end
			end


			if self.AimOverlay2 or canUseSimpleTelescopics then
				if UCT > self.AimTime or self.InstantDissapearOnAim then
					surface.SetDrawColor(255, 255, 255, 255)

					if canUseSimpleTelescopics then
						surface.SetTexture(scopeTemplate)
						surface.DrawTexturedRect(x * 0.5 - 512, y * 0.5 - 512, 1024, 1024)
					else
						surface.SetTexture(self.AimOverlay2)
					end

					if self.StretchOverlayToScreen then
						if canUseSimpleTelescopics then
							for k, v in ipairs(self.ZoomTextures) do
								if v.color then
									surface.SetDrawColor(v.color)
								else
									surface.SetDrawColor(255, 255, 255, 255)
								end

								surface.SetTexture(v.tex)
								surface.DrawTexturedRect(v.offset[1], v.offset[2], x, y)
							end
						else
							surface.DrawTexturedRect(0, 0, x, y)
						end

					elseif self.ScaleOverlayToScreenHeight then
						if canUseSimpleTelescopics then
							for k, v in ipairs(self.ZoomTextures) do
								surface.SetTexture(v.tex)
								surface.DrawTexturedRect(x * 0.5 - y * 0.5 + v.offset[1], y * 0.5 - y * 0.5 + v.offset[2], y, y)
							end
						else
							surface.DrawTexturedRect(x * 0.5 - y * 0.5, y * 0.5 - y * 0.5, y, y)
						end
					else
						if canUseSimpleTelescopics then
							for k, v in ipairs(self.ZoomTextures) do
								local xSize, ySize = 1024, 1024

								if v.size then
									xSize, ySize = v.size[1], v.size[2]
								end


								if v.color then
									surface.SetDrawColor(v.color)
								else
									surface.SetDrawColor(255, 255, 255, 255)
								end

								surface.SetTexture(v.tex)
								surface.DrawTexturedRect(x * 0.5 - xSize * 0.5 + v.offset[1], y * 0.5 - ySize * 0.5 + v.offset[2], xSize, ySize)
							end
						else
							surface.DrawTexturedRect(x * 0.5 - 512, y * 0.5 - 512, 1024, 1024)
						end
					end
				end
			end

			if self.FadeDuringAiming or canUseSimpleTelescopics then
				if UCT < self.AimTime then
					self.FadeAlpha = math.Approach(self.FadeAlpha, 255, FT * 1500)
				else
					self.FadeAlpha = LerpCW20(FT * 10, self.FadeAlpha, 0)
				end

				surface.SetDrawColor(0, 0, 0, self.FadeAlpha)
				surface.DrawRect(0, 0, x, y)
			end
		end
	else
		self.FadeAlpha = 0
	end

-- Reload Tooltips
if ((self:Clip1() <= self.Primary.ClipSize * .25) or (self.isDualwield and self:Clip2() <= self.Primary.ClipSize * .25)) and not (self.IsReloading or self.IsReloadShotgun) then
	if not self.Customizing and not self.IsInspecting and not self.isToggling then
	surface.SetTexture(ReloadBG)
		if not self.dt.AltActive then
			if self.Owner:GetAmmoCount(self.Primary.Ammo) == 0 then
				if self:Clip1() > 0 or (self.isDualwield and self:Clip2() > 0) and self.ShowLowAmmoPrompt then
					draw.ShadowText("#mw3_ammo_low", cwhud24, x / 2, y / 2 + 80 + (self.ClumpSpread_Orig * 500), Yellow, Black, 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				elseif (self.isDualwield and (self:Clip1() == 0 and self:Clip2() == 0)) or self:Clip1() == 0 and self.ShowEmptyPrompt then
					draw.ShadowText("#mw3_ammo_empty", cwhud24, x / 2, y / 2 + 80 + (self.ClumpSpread_Orig * 500), Red, Black, 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end
			elseif self.ShowReloadPrompt then
				draw.ShadowText("#mw3_ammo_reload", cwhud24, x / 2, y / 2 + 80 + (self.ClumpSpread_Orig * 500), White, Black, 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
	end
end

if (self:Clip2() <= self.Secondary.ClipSize * .25) and not (self.IsReloading or self.IsReloadShotgun) then
	if not self.Customizing and not self.IsInspecting and not self.isToggling then
		if self.dt.AltActive then
			if self.Owner:GetAmmoCount(self.Secondary.Ammo) == 0 then
				if self:Clip2() == 0 then
					draw.ShadowText("#mw3_ammo_empty", cwhud24, x / 2, y / 2 + 80 + (self.Altmode.ClumpSpread * 500), Red, Black, 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				elseif self.ShowLowAmmoPrompt then
					draw.ShadowText("#mw3_ammo_low", cwhud24, x / 2, y / 2 + 80 + (self.Altmode.ClumpSpread * 500), Yellow, Black, 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end
			elseif self.ShowReloadPrompt then
				draw.ShadowText("#mw3_ammo_reload", cwhud24, x / 2, y / 2 + 80 + (self.Altmode.ClumpSpread * 500), White, Black, 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
	end
end

if self.MustAimToFire and not self:isAiming() and not self.Customizing and not self.IsInspecting and not self:isReloading() and self:Clip1() == self.Primary.ClipSize and not self.dt.Safe then
	if self.Owner:KeyDown(IN_ATTACK) then
			local text = markup.Parse("<font=CW_HUD24>" .. loc('mw3_prompt_aim_to_fire'))
			local text2 = markup.Parse("<color=0,0,0><font=CW_HUD24>" .. loc('mw3_prompt_aim_to_fire'))

				if self.ShowConsoleButtons then
					aimbutton = self:GamepadPromptAimToFireCol()											
					aimbuttonbg = self:GamepadPromptAimToFire()
				else
					aimbutton = self:getKeyBind("+attack2")
					aimbuttonbg = aimbutton
				end

			text_aim = "<font=CW_HUD24><color=255,255,0>" .. aimbutton .. "<color=255,255,255><font=CW_HUD24>"
			text_aimbg = "<font=CW_HUD24>" .. aimbuttonbg .. "<font=CW_HUD24>"
			
			local aimbuttontext = markup.Parse(text_aim)
			local aimbuttontext2 = markup.Parse("<color=0,0,0>" .. text_aimbg)
			
		text2:Draw(x / 2 + 2, y / 2 + 162, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		text:Draw(x / 2, y / 2 + 160, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
		aimbuttontext2:Draw(x / 2 + 2, y / 2 +192, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		aimbuttontext:Draw(x / 2, y / 2 +190, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

if (self.GLEquipped or self.ShotgunEquipped) then
	if not self:isAiming() and not self.Customizing and not self.isSprinting and not (self.IsReloading or self.AltReloads or self.IsReloadShotgun or (self.isToggling and self.Cycle <= 0.8)) then
		if not self.dt.Safe then

			if (self:Clip2() == 0 and self.Owner:GetAmmoCount(self.Secondary.Ammo) == 0) then
				textcol_alt = "<color=255,100,100>"
			else
				textcol_alt = "<color=255,255,255>"
			end
		
			if self.ShowConsoleButtons then
				gl1prompt = self:GamepadPromptGL1Col()
				gl1promptbg = self:GamepadPromptGL1()
				
				gl2prompt = self:GamepadPromptGL2Col()
				gl2promptbg = self:GamepadPromptGL2()
	   
			else
				gl1prompt = "<color=255,255,0>" .. self:getKeyBind("+use")
				gl1promptbg = self:getKeyBind("+use")
				
				gl2prompt = "<color=255,255,0>" .. self:getKeyBind("+attack2")
				gl2promptbg = self:getKeyBind("+attack2")
			end

			if (self:Clip2() == 0 and self.Owner:GetAmmoCount(self.Secondary.Ammo) == 0) then
										 
				if self.dt.AltActive then
					prompts =  gl1prompt .. "<color=255,255,255><font=CW_HUD24> + " .. gl2prompt
					promptsbg = gl1promptbg .. "<font=CW_HUD24> + " .. gl2promptbg
				else
					prompts = loc('mw3_ammo_empty')
					promptsbg = loc('mw3_ammo_empty')
				end
			else
				prompts = gl1prompt .. "<color=255,255,255><font=CW_HUD24> + " .. gl2prompt
				promptsbg = gl1promptbg .. "<font=CW_HUD24> + " .. gl2promptbg									 
			end

			text_gl = "<font=CW_HUD24>" .. string.format(textcol_alt .. loc('mw3_info_alt'), textcol_alt .. prompts)
			text_gl2 = "<color=0,0,0><font=CW_HUD24>" .. string.format(loc('mw3_info_alt'), promptsbg)
			local activegltext = markup.Parse(text_gl)
			local activegltext2 = markup.Parse(text_gl2)
			
			if self.ShowAltWpnPrompt then
				activegltext2:Draw(x / 2 +1.5, y / 1 -148.5, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				activegltext:Draw(x / 2, y / 1 -150, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
	end
end

if self.hasHybrid then
	if not self:isAiming() and not self.Customizing and not self.isSprinting and not (self.IsReloading or self.AltReloads or self.IsReloadShotgun or (self.isToggling and self.Cycle <= 0.8)) then
		if not self.dt.Safe then
			if self.ShowConsoleButtons then
				gl1prompt = self:GamepadPromptGL1Col()
				gl1promptbg = self:GamepadPromptGL1()
				
				gl2prompt = self:GamepadPromptGL2Col()
				gl2promptbg = self:GamepadPromptGL2()
			else
				gl1prompt = "<color=255,255,0>" .. self:getKeyBind("+use")
				gl1promptbg = self:getKeyBind("+use")
				
				gl2prompt = "<color=255,255,0>" .. self:getKeyBind("+attack2")
				gl2promptbg = self:getKeyBind("+attack2")
			end
					 
		prompts = gl1prompt .. "<color=255,255,255><font=CW_HUD24> + " .. gl2prompt
		promptsbg = gl1promptbg .. "<font=CW_HUD24> + " .. gl2promptbg									 

		text_gl = "<font=CW_HUD24>" .. string.format(loc('mw3_info_alt'), prompts)
		text_gl2 = "<color=0,0,0><font=CW_HUD24>" .. string.format(loc('mw3_info_alt'), promptsbg)
		local activegltext = markup.Parse(text_gl)
		local activegltext2 = markup.Parse(text_gl2)
		
		if self.ShowAltWpnPrompt then
			activegltext2:Draw(x / 2 +1.5, y / 1 -148.5, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			activegltext:Draw(x / 2, y / 1 -150, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
	end
end

if self.CanMelee then
	if not self:isAiming() and not self.Customizing and not self.isSprinting and not (self.IsReloading or self.AltReloads or self.IsReloadShotgun or (self.isToggling and self.Cycle <= 0.8)) then
		if not self.dt.Safe then
			if self.ShowConsoleButtons then
				gl1prompt = self:GamepadPromptMelee1Col()
				gl1promptbg = self:GamepadPromptMelee1()
				
				gl2prompt = self:GamepadPromptMelee2Col()
				gl2promptbg = self:GamepadPromptMelee2()
			else
				gl1prompt = "<color=255,255,0>" .. self:getKeyBind("+use")
				gl1promptbg = self:getKeyBind("+use")
				
				gl2prompt = "<color=255,255,0>" .. self:getKeyBind("+attack")
				gl2promptbg = self:getKeyBind("+attack")
			end
					 
		prompts = gl1prompt .. "<color=255,255,255><font=CW_HUD24> + " .. gl2prompt
		promptsbg = gl1promptbg .. "<font=CW_HUD24> + " .. gl2promptbg									 

		text_gl = "<font=CW_HUD24>" .. string.format(loc('mw3_info_melee'), prompts)
		text_gl2 = "<color=0,0,0><font=CW_HUD24>" .. string.format(loc('mw3_info_melee'), promptsbg)
		local activegltext = markup.Parse(text_gl)
		local activegltext2 = markup.Parse(text_gl2)
		
		if self.ShowMeleePrompt then
			activegltext2:Draw(x / 2 +1.5, y / 1 -148.5, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			activegltext:Draw(x / 2, y / 1 -150, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
	end
end

-- Moka's Debugging
	if GetConVarNumber("ma85_debug") == 1 then
		local seq = self.CW_VM:GetSequence()
		local seq_name = self.CW_VM:GetSequenceName( seq )
		local seq_time = self.CW_VM:SequenceDuration ( seq )
		local seq_cyc = self.CW_VM:GetCycle() * 100

		if self.CurName then
			curname = self.CurName
		else
			curname = "NIL"
		end
		
		if self.CurName2 then
			curname2 = self.CurName2
		else
			curname2 = "NIL"
		end

		draw.ShadowText("Animation: " .. seq_name, cwhud24, x / 2 - 400, y / 2 + 160, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.ShadowText("Anim. Time: " .. math.Round(seq_time, 2) .. " Sec. / Cur. " .. math.Round(seq_time * self.CW_VM:GetCycle(), 1) .. "", cwhud24, x / 2 - 400, y / 2 + 180, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.ShadowText("Anim. Percentage: " .. (math.Round(seq_cyc, 0) .. "%"), cwhud24, x / 2 - 400, y / 2 + 200, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.ShadowText("Reload Speed: " .. math.Round(100 * self.ReloadSpeed, 2) .. "%", cwhud24, x / 2 - 400, y / 2 + 220, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.ShadowText("RPM: " .. math.Round(60/self.FireDelay, 0), cwhud24, x / 2 - 400, y / 2 + 240, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.ShadowText("Zoom Level: " .. self.ZoomAmount, cwhud24, x / 2 - 400, y / 2 + 260, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.ShadowText("Penetration Value: " .. math.Round(self.PenMod, 2), cwhud24, x / 2 - 400, y / 2 + 280, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.ShadowText("Sensitivity: " .. math.Round(self:AdjustMouseSensitivity(), 2), cwhud24, x / 2 - 400, y / 2 + 300, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.ShadowText("Cur. Spread: " .. math.Round(self.CurCone, 2), cwhud24, x / 2 - 400, y / 2 + 320, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.ShadowText("Current Skin: " .. self.dt.CurrentSkin, cwhud24, x / 2 - 400, y / 2 + 340, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		-- draw.ShadowText("Cur. Name: " .. self.PrintName, cwhud24, x / 2 - 400, y / 2 + 360, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		-- draw.ShadowText("Cur. Att1. Name: " .. curname, cwhud24, x / 2 - 400, y / 2 + 380, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		-- draw.ShadowText("Cur. Att2. Name: " .. curname2, cwhud24, x / 2 - 400, y / 2 + 400, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		
		-- ent = ent or self.CW_VM
		-- local e_name = self.CW_VM:GetModel()
		-- if ( timer.Exists( "CW2_IDLERETURN" .. e_name ) ) then
			-- draw.ShadowText("Idle Timer: " .. math.Round(timer.TimeLeft( "CW2_IDLERETURN" .. e_name ), 2), cwhud24, x / 2 - 400, y / 2 + 360, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)									
		-- end

		if self.CW_VM2 and self.isDualwield then
			local seq2 = self.CW_VM2:GetSequence()
			local seq2_name = self.CW_VM2:GetSequenceName( seq2 )
			local seq2_time = self.CW_VM2:SequenceDuration ( seq2 )
			local seq2_cyc = self.CW_VM2:GetCycle() * 100
		
			draw.ShadowText("Animation: " .. seq2_name, cwhud24, x / 2 + 200, y / 2 + 160, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.ShadowText("Anim. Time: " .. math.Round(seq2_time, 2) .. " Sec. (Cur. " .. math.Round(seq2_time * self.CW_VM2:GetCycle(), 1) .. ")", cwhud24, x / 2 + 200, y / 2 + 180, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.ShadowText("Anim. Percentage: " .. (math.Round(seq2_cyc, 0) .. "%"), cwhud24, x / 2 + 200, y / 2 + 200, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			
			
			-- local e_name = self.CW_VM2:GetModel()
			-- if ( timer.Exists( "CW2_IDLERETURN" .. e_name ) ) then
				-- draw.ShadowText("Idle Timer: " .. math.Round(timer.TimeLeft( "CW2_IDLERETURN" .. e_name ), 2), cwhud24, x / 2 + 200, y / 2 + 360, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)									
			-- end
		end
	end

-- Safety Icon
local Safety = surface.GetTextureID("mw3_icons/other/safety")
if self.dt.Safe and not self:isAiming() and not self.Customizing and not self.IsInspecting and not self:isReloading() then
	-- surface.SetTexture(Safety)
	-- surface.SetDrawColor(255, 100, 100, 255)
	-- surface.DrawTexturedRect(x / 2 - 50, y / 1 - 150, 100, 100)

	-- draw.ShadowText("SAFETY ON", cwhud24, x / 2, y / 1 -150, Red, Black, 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

end

	if not self.dt.BipodDeployed then
		if self.BipodInstalled then
			if self:CanRestWeapon(self.BipodDeployHeightRequirement) then
				draw.ShadowText(string.format(self:getKeyBind("+use")), cwhud24, x / 2, y / 2 + 140, White, Black, 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

				surface.SetTexture(Deploy)

		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawTexturedRect(x / 2 - 47, y / 2 + 155, 96, 96)

		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawTexturedRect(x / 2 - 44, y / 2 + 157, 90, 90)
		end
		else
			if self.dt.State == CW_AIMING then
				if self.CanRestOnObjects then
					if self:CanRestWeapon(self.WeaponRestHeightRequirement) then
						surface.SetTexture(deployedOnObject)

						surface.SetDrawColor(0, 0, 0, 255)
						surface.DrawTexturedRect(x / 2 - 47, y / 2 + 155, 96, 96)

						surface.SetDrawColor(255, 255, 255, 255)
						surface.DrawTexturedRect(x / 2 - 44, y / 2 + 157, 90, 90)
					end
				end
			end
		end
	else
			draw.ShadowText(string.format(self:getKeyBind("+use")), cwhud24, x / 2, y / 2 + 140, White, Black, 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		surface.SetTexture(UnDeploy)

		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawTexturedRect(x / 2 - 47, y / 2 + 155, 96, 96)

		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawTexturedRect(x / 2 - 44, y / 2 + 157, 90, 90)
	end
	
		if self.AdjustableZoom then
			local maxzoom = self.MaxZoom
			local minzoom = self.MinZoom
			local curzoom = self.ZoomAmount

			if curzoom > minzoom then
				zoomincolor = "<color=255,255,0>"
				zoomincolorgp = self:GamepadPromptZoomInCol()
			else
				zoomincolor = "<color=100,100,100>"
				zoomincolorgp = "<color=100,100,100>" .. self:GamepadPromptZoomIn()
			end
				
			if curzoom < maxzoom then
				zoomoutcolor = "<color=255,255,0>"
				zoomoutcolorgp = self:GamepadPromptZoomOutCol()
			else
				zoomoutcolor = "<color=100,100,100>"
				zoomoutcolorgp = "<color=100,100,100>" .. self:GamepadPromptZoomOut()
			end
		
		
			if self:isAiming() then
				if self.ShowConsoleButtons then			
					zoominbutton = zoomincolorgp .. "<color=255,255,255>"
					zoominbuttonbg = self:GamepadPromptZoomIn()
					zoomoutbutton = zoomoutcolorgp .. "<color=255,255,255>"
					zoomoutbuttonbg = self:GamepadPromptZoomOut()
				else
					zoominbutton = zoomincolor .. self:getKeyBind("+invnext") .. "<color=255,255,255>"
					zoominbuttonbg = self:getKeyBind("+invnext")
					zoomoutbutton = zoomoutcolor .. self:getKeyBind("+invprev") .. "<color=255,255,255>"
					zoomoutbuttonbg = self:getKeyBind("+invprev")
				end

				text_zoom = "<font=CW_HUD24>" .. string.format(loc('mw3_info_zoom'), zoominbutton .. "<font=CW_HUD24> / " .. zoomoutbutton .. "<font=CW_HUD24>")
				text_zoombg = "<font=CW_HUD24>" .. string.format(loc('mw3_info_zoom'), zoominbuttonbg .. "<font=CW_HUD24> / " .. zoomoutbuttonbg .. "<font=CW_HUD24>")
			
				local zoomtext = markup.Parse(text_zoom)
				local zoomtextbg = markup.Parse("<color=0,0,0>" .. text_zoombg)

				zoomtextbg:Draw(x / 2, y / 2 - 273, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				zoomtext:Draw(x / 2, y / 2 - 275, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		
	if self.AimBreathingEnabled and not self.NoHoldingBreath then
		self.HUD_BreathAlpha = LerpCW20(FT * 10, self.HUD_BreathAlpha, (1 - self.BreathLeft))

		if self.BreathLeft < 1 then
			surface.SetDrawColor(0, 0, 0, 255 * self.HUD_BreathAlpha)
			surface.SetTexture(Vignette)
			surface.DrawTexturedRect(0, 0, x, y)
		end

		if self.dt.State == CW_AIMING then
			if self.Owner:GetVelocity():Length() < self.BreathHoldVelocityMinimum then
				local finalColorMain = White
				local finalColorSecondary = White

				if self.noBreathHoldingUntilKeyRelease then
					finalColorMain = self.HUDColors.deepRed
				end

				if not self.holdingBreath and self.BreathLeft < 0.5 then
					finalColorSecondary = self.HUDColors.red
				end

				if self.ShowConsoleButtons then
					holdbreathbutton = self:GamepadPromptBreathCol() .. "<color=255,255,255>"
					holdbreathbuttonbg = self:GamepadPromptBreath()
				else
																							
																	   
		 
		 
					holdbreathbutton = "<color=255,255,0>" .. self:getKeyBind("+speed") .. "<color=255,255,255>"
					holdbreathbuttonbg = self:getKeyBind("+speed")
				end
	   

				text_breath = "<font=CW_HUD24>" .. string.format(loc('mw3_info_breath'), holdbreathbutton .. "<font=CW_HUD24>")
				text_breathbg = "<font=CW_HUD24>" .. string.format(loc('mw3_info_breath'), holdbreathbuttonbg .. "<font=CW_HUD24>")
			
				local breathtext = markup.Parse(text_breath)
				local breathtextbg = markup.Parse("<color=0,0,0>" .. text_breathbg)

				breathtextbg:Draw(x / 2, y / 2 - 248, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				breathtext:Draw(x / 2, y / 2 - 250, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.ShadowText(math.Round(self.BreathLeft * 100) .. "%", cwhud24, x / 2, y / 2 - 230, finalColorSecondary, Black, 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		else
			if self.holdingBreath then
				self:stopHoldingBreath(nil, nil, 0)
			end
		end
	end

	local disableCrosshair, disableCustomHUD, disableTabDisplay = CustomizableWeaponry.callbacks.processCategory(self, "suppressHUDElements", customHUD)

	if not disableCrosshair then
		if self.CrosshairEnabled and GetConVarNumber("cw_crosshair") > 0 then
			lp = self.Owner:ShouldDrawLocalPlayer()

			if lp or self.freeAimOn then
				td.start = self.Owner:GetShootPos()
				td.endpos = td.start + (self.Owner:EyeAngles() + self.Owner:GetPunchAngle()):Forward() * 16384
				td.filter = self.Owner

				tr = util.TraceLine(td)

				x2 = tr.HitPos:ToScreen()
				x2, y2 = x2.x, x2.y
			else
				x2, y2 = math.Round(x * 0.5), math.Round(y * 0.5)
			end

			if not self:crosshairVisible() then
				self.CrossAlpha = LerpCW20(FT * 30, self.CrossAlpha, 0)
			else
				self.CrossAlpha = LerpCW20(FT * 30, self.CrossAlpha, 255)
			end

			if self.Primary.Ammo == "40MM" and not self.useWiiCrosshair then
				if self.dt.State ~= CW_AIMING and self.dt.State ~= CW_CUSTOMIZE and not self.ReloadDelay then
					local x2, y2 = math.Round(x/2), math.Round(y/2)

					surface.SetTexture(GLCrosshair)
					surface.SetDrawColor(255, 255, 255, 255 * self.CrossAlpha)
					surface.DrawTexturedRect(x2-200, y2-200, 400, 400)
				end
				-- hide the actual crosshair
				self.CrossAlpha = 0
			end

			if self.Primary.Ammo == "RPG_Round" and not self.useWiiCrosshair then
				if self.dt.State ~= CW_AIMING and self.dt.State ~= CW_CUSTOMIZE and not self.ReloadDelay then
					local x2, y2 = math.Round(x/2), math.Round(y/2)

					surface.SetTexture(RPGCrosshair)
					surface.SetDrawColor(255, 255, 255, 255 * self.CrossAlpha)
					surface.DrawTexturedRect(x2-200, y2-200, 400, 400)
				end
				-- hide the actual crosshair
				self.CrossAlpha = 0
			end

			if self.dt.AltActive and self.Secondary.Ammo == "40MM" and not self.useWiiCrosshair then
				if self.dt.State ~= CW_AIMING and self.dt.State ~= CW_CUSTOMIZE and not self.AltReloadDelay then
					local x2, y2 = math.Round(x/2), math.Round(y/2)

					surface.SetTexture(GLCrosshair)
					surface.SetDrawColor(255, 255, 255, 255 * self.CrossAlpha)
					surface.DrawTexturedRect(x2-200, y2-200, 400, 400)
				end
				-- hide the actual crosshair
				self.CrossAlpha = 0
			end

			if self.dt.AltActive and self.ActiveAttachments.mw3_att_ft and not self.useWiiCrosshair then
				if self.dt.State ~= CW_AIMING and self.dt.State ~= CW_CUSTOMIZE and not self.AltReloadDelay then
					local x2, y2 = math.Round(x/2), math.Round(y/2)

					surface.SetTexture(FTCrosshair)
					surface.SetDrawColor(255, 255, 255, 255 * self.CrossAlpha)	   
					surface.DrawTexturedRect(x2-200, y2-200, 400, 400)
				end
				-- hide the actual crosshair
				self.CrossAlpha = 0						 
			end

			if self.dt.AltActive then
				self:drawClumpSpreadAlt(x2, y2, self.Altmode.ClumpSpread * 1000, self.CrossAlpha)
			else
				self:drawClumpSpread(x2, y2, self.ClumpSpread * 1000, self.CrossAlpha)
			end

			self.CrossAmount = LerpCW20(FT * 10, self.CrossAmount, (self.CurCone * 350) * (90 / (math.Clamp(GetConVarNumber("fov_desired"), 75, 90) - self.CurFOVMod)))

			if self.useWiiCrosshair then
				self:drawWiiCrosshair()
			else
				self:drawCrosshair()
			end												 
		end														  
	end

	if not disableCustomHUD then
		local customHUD = GetConVarNumber("cw_customhud") >= 1

		if not customHUD and GetConVarNumber("cw_customhud_ammo") <= 0 then
			if self.FireModeDisplayPos == "right" then
				sc1, sc2 = ScreenScale(35), ScreenScale(44)
				draw.ShadowText(self.FireModeDisplay, cwhud16, x - sc1 - self.BulletDisplay * 20, y - sc2 - 20, White, Black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

				if self.BulletDisplay and self.BulletDisplay > 0 then
					surface.SetDrawColor(0, 0, 0, 255)
					surface.SetTexture(Bullet)

					for i = 1, self.BulletDisplay do
						surface.DrawTexturedRect(x - sc1 - (i - 1) * 20 - 5, y - sc2 - 25, 16, 16)
					end

					surface.SetDrawColor(255, 255, 255, 255)

					for i = 1, self.BulletDisplay do
						surface.DrawTexturedRect(x - sc1 - (i - 1) * 20 - 6, y - sc2 - 26, 16, 16)
					end
				end
			elseif self.FireModeDisplayPos == "middle" then
				draw.ShadowText(self.FireModeDisplay, cwhud16, x * 0.5, y - 100, White, Black, 1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

				local grenades = self.Owner:GetAmmoCount("Frag Grenades")

				-- only display the frag ammo count if we have any grenades in reserve
				if grenades > 0 then
					draw.ShadowText(grenades .. "x FRAG", cwhud16, x * 0.5, y - 120, self.HUD_ReserveTextColor, self.HUDColors.black, 1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end

				if self.BulletDisplay and self.BulletDisplay > 0 then
					surface.SetDrawColor(0, 0, 0, 255)
					surface.SetTexture(Bullet)

					for i = 1, self.BulletDisplay do
						surface.DrawTexturedRect(x * 0.5 - 20 * i + self.BulletDisplay * 10 + 1, y - 89, 16, 16)
					end

					surface.SetDrawColor(255, 255, 255, 255)

					for i = 1, self.BulletDisplay do
						surface.DrawTexturedRect(x * 0.5 - 20 * i + self.BulletDisplay * 10, y - 90, 16, 16)
					end
				end
			elseif self.FireModeDisplayPos == "left" then
				sc1, sc2 = ScreenScale(35), ScreenScale(44)
				draw.ShadowText(self.FireModeDisplay, cwhud16, sc1, y - sc2 - 20, White, Black, 1, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

				if self.BulletDisplay and self.BulletDisplay > 0 then
					surface.SetDrawColor(0, 0, 0, 255)
					surface.SetTexture(Bullet)

					surface.SetFont(cwhud16)
					local size = surface.GetTextSize(self.FireModeDisplay)

					for i = 1, self.BulletDisplay do
						surface.DrawTexturedRect(sc1 + (i - 1) * 20 + size + 15, y - sc2 - 25, 16, 16)
					end

					surface.SetDrawColor(255, 255, 255, 255)

					for i = 1, self.BulletDisplay do
						surface.DrawTexturedRect(sc1 + (i - 1) * 20 - 1 + size + 15, y - sc2 - 26, 16, 16)
					end
				end
			end

			--[[
			if self.dt.UGLActive then
				self.HUDColors.red.a = 255
				self.HUDColors.black.a = 255
				self.HUDColors.white.a = 255

				if not self.UGL.Ready then
					draw.ShadowText("#wf_gl_empty", cwhud24, x * 0.5, y - 170, self.HUDColors.red, self.HUDColors.black, 1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				else
					draw.ShadowText("#wf_gl_loaded", cwhud24, x * 0.5, y - 170, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end

				local curGrenade = CustomizableWeaponry.grenadeTypes.getGrenadeText(self)

				draw.ShadowText(string.format( "#wf_gl_reserve", self.Owner:GetAmmoCount("40MM") ), cwhud22, x * 0.5, y - 150, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.ShadowText("#wf_gl_type" .. curGrenade, cwhud22, x * 0.5, y - 130, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
			]]
		end

		if customHUD then
			self:drawCustomHUD()
		end
	end

	if not disableTabDisplay then
		if self.dt.State == CW_CUSTOMIZE then
			self:drawTabDisplay()
		end

		CustomizableWeaponry.callbacks.processCategory(self, "drawToHUD", customHUD)
	end
end


SWEP.HUDColors = {white = Color(255, 255, 255, 255),
red = Color(255, 150, 150, 255),
deepRed = Color(255, 110, 110, 255),
black = Color(0, 0, 0, 255),
green = Color(200, 255, 200, 255),
grey = Color(255, 255, 255, 10),
blue = Color(0, 200, 255, 255)}

local gradient = surface.GetTextureID("cw2/gui/gradient")

function SWEP:drawTabDisplay()
	local x, y = ScrW(), ScrH()

	local entryCount = #CustomizableWeaponry.interactionMenu.tabs
	local baseHeight = entryCount * 22 + 10
	surface.SetDrawColor(0, 0, 0, 255)
	surface.SetTexture(gradient)
	surface.DrawTexturedRectRotated(x - 180, y - 195 - baseHeight * 0.5, 300, baseHeight, 180)

	for k, v in ipairs(CustomizableWeaponry.interactionMenu.tabs) do
		local clr

		if self.CustomizationTab == v.id then
			clr = self.HUDColors.blue
		else
			clr = self.HUDColors.grey
		end

		draw.ShadowText(self:getKeyBind(v.switchToKey) .. " " .. v.text, cwhud24, x - 35, y - 290 - (k - 1) * -23, clr, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_RIGHT)
	end
end

function SWEP:drawCustomHUD()
	local FT = FrameTime()

	local x, y = ScrW(), ScrH()

	self.HUDColors.white.a = 255
	self.HUDColors.black.a = 255
	local baseX, baseY = 100, y - 150

	surface.SetDrawColor(0, 0, 0, 200)
	surface.SetTexture(gradient)
	surface.DrawTexturedRect(baseX - 5, baseY - 15, 300, 90)

	-- draw the bottom-left part of the HUD; aka health and armor
	draw.ShadowText("HEALTH: ", cwhud24, baseX, baseY, self.HUD_HealthTextColor, self.HUDColors.black, 1, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.ShadowText("ARMOR: ", cwhud24, baseX, baseY + 60, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

	local hp = self.Owner:Health()
	local arm = self.Owner:Armor()

	-- approach the health and armor values rather than snapping, so that the pips fill up gradually
	self.HUD_LastHealth = math.Approach(self.HUD_LastHealth, hp, FT * 100)
	self.HUD_LastArmor = math.Approach(self.HUD_LastArmor, arm, FT * 100)

	-- draw the health and armor text
	draw.ShadowText(hp .. "%", cwhud24, baseX + 100, baseY, self.HUD_HealthTextColor, self.HUDColors.black, 1, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.ShadowText(arm .. "%", cwhud24, baseX + 100, baseY + 60, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

	local healthPips = math.Clamp(math.floor(self.HUD_LastHealth / 5), 1, 20)
	local armorPips = math.Clamp(math.floor(self.HUD_LastArmor / 5), 0, 20)

	-- black health and armor pips (to avoid unnecessary SetDrawColor calls)
	surface.SetDrawColor(0, 0, 0, 255)

	for i = 1, healthPips do
		surface.DrawRect(baseX + (i - 1) * 12 + 2, baseY + 16, 5, 10)
	end

	for i = 1, armorPips do
		surface.DrawRect(baseX + (i - 1) * 12 + 2, baseY + 36, 5, 10)
	end

	-- colored health pips
	for i = 1, healthPips do
		surface.SetDrawColor(240 - i * 10, i * 12.75, i * 4, 255)
		surface.DrawRect(baseX + (i - 1) * 12 + 1, baseY + 15, 5, 10)
	end

	-- colored armor pips
	for i = 1, armorPips do
		surface.SetDrawColor(0, 125 + i * 6.5, 200 + i * 2.75, 255)
		surface.DrawRect(baseX + (i - 1) * 12 + 1, baseY + 35, 5, 10)
	end

	-- draw the 2D variant of the custom HUD in case the 3D variant was disabled by the user
	if GetConVarNumber("cw_customhud_ammo") <= 0 then
		local baseXAMMO, baseYAMMO = x - 117, y - 150

		surface.SetDrawColor(0, 0, 0, 200)
		surface.SetTexture(gradient)
		surface.DrawTexturedRectRotated(baseXAMMO - 128, baseYAMMO + 30, 300, 90, 180)

		-- display the M203 section if we're in M203 mode
		if self.dt.M203Active then
			surface.DrawTexturedRectRotated(baseXAMMO - 128, baseYAMMO - 60, 300, 70, 180)

			if not self.M203Chamber then
				draw.ShadowText("M203 EMPTY", cwhud24, baseXAMMO + 15, baseY - 80, self.HUDColors.red, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			else
				draw.ShadowText("M203 READY", cwhud24, baseXAMMO + 15, baseY - 80, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			end

			local curGrenade = CustomizableWeaponry.grenadeTypes.getGrenadeText(self)

			draw.ShadowText(self.Owner:GetAmmoCount("40MM") .. "x RESERVE", cwhud22, baseXAMMO + 15, baseY - 60, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

			draw.ShadowText("TYPE" .. curGrenade, cwhud22, baseXAMMO + 15, baseY - 40, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end

		local mag = self:Clip1()
		local magsize = self.Primary.ClipSize
		local mag2 = self:Clip2()
		local mag2size = self.Secondary.ClipSize
		local ammoCount, magCount, targetColor = self:getReserveAmmoText()

		if not targetColor then
			if ammoCount <= self.Primary.ClipSize then -- make the reserve text red if we only have 1 mag (or less) in reserve left
				self.HUD_ReserveTextColor = LerpColor(FT * 10, self.HUD_ReserveTextColor, self.HUDColors.deepRed)
			else
				self.HUD_ReserveTextColor = LerpColor(FT * 10, self.HUD_ReserveTextColor, White)
			end
		else
			self.HUD_ReserveTextColor = LerpColor(FT * 10, self.HUD_ReserveTextColor, targetColor)
		end

		local reloadProgress = self:getReloadProgress()

		-- if we're reloading or are low on ammo, make the text red
		if reloadProgress or (mag <= magsize * 0.25) then
			self.HUD_MagTextColor = LerpColor(FT * 10, self.HUD_MagTextColor, self.HUDColors.red)
		else
			self.HUD_MagTextColor = LerpColor(FT * 10, self.HUD_MagTextColor, White)
		end

		if reloadProgress or mag2 <= mag2size * 0.25 then
			self.HUD_Mag2TextColor = LerpColor(FT * 10, self.HUD_Mag2TextColor, self.HUDColors.red)
		else
			self.HUD_Mag2TextColor = LerpColor(FT * 10, self.HUD_Mag2TextColor, White)
		end

		-- display either the reload progress or the ammo in mag
		-- if reloadProgress then
			-- draw.ShadowText("RELOADING  " .. reloadProgress .. "%", "CW_HUD32", baseXAMMO + 15, baseYAMMO, self.HUD_MagTextColor, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		-- else
			if self.isDualwield then
				draw.ShadowText(self.HUD_MagText, "CW_HUD32", baseXAMMO - 15, baseYAMMO, self.HUDColors.white, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				draw.ShadowText(self:Clip1(), "CW_HUD24", baseXAMMO + 15, baseYAMMO - 7.5, self.HUD_MagTextColor, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				draw.ShadowText(self:Clip2(), "CW_HUD24", baseXAMMO + 15, baseYAMMO + 7.5, self.HUD_Mag2TextColor, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			else
				if self.dt.AltActive then
					draw.ShadowText(self.HUD_MagText .. self:Clip2(), "CW_HUD32", baseXAMMO + 15, baseYAMMO, self.HUD_Mag2TextColor, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				else
					draw.ShadowText(self.HUD_MagText .. self:getMagCapacity(), "CW_HUD32", baseXAMMO + 15, baseYAMMO, self.HUD_MagTextColor, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				end
			end
		-- end

		local grenades = self.Owner:GetAmmoCount("Frag Grenades")
		local ammoText = "RESERVE: " .. ammoCount
		local ammo2Text = "RESERVE: " .. (self.Owner:GetAmmoCount(self.Secondary.Ammo) - self:Clip2())

		-- display the amount of frag grenades only if we have some
		if grenades > 0 then
			surface.SetFont(cwhud24)

			local textSize = surface.GetTextSize(ammoText)

			draw.ShadowText(grenades .. "x FRAG, ", cwhud20, baseXAMMO - textSize + 15, baseYAMMO + 25, self.HUD_ReserveTextColor, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end


		if self.dt.AltActive then
			draw.ShadowText(ammo2Text, cwhud24, baseXAMMO + 15, baseYAMMO + 25, self.HUD_ReserveTextColor, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		else
			draw.ShadowText(ammoText, cwhud24, baseXAMMO + 15, baseYAMMO + 25, self.HUD_ReserveTextColor, self.HUDColors.black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
		draw.ShadowText(self.FireModeDisplay, cwhud22, baseXAMMO + 15, baseYAMMO + 45, White, Black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

		-- display the firemode section
		if self.BulletDisplay and self.BulletDisplay > 0 then
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(Bullet)

			surface.SetFont(cwhud24)
			local xSize = surface.GetTextSize(self.FireModeDisplay)

			-- draw the shadow of the bullets and the regular bullets in 2 separate loops, to do only (2 SetDrawColor) calls instead of (BulletDisplay * 2 SetDrawColor) calls
			for i = 1, self.BulletDisplay do
				surface.DrawTexturedRect(baseXAMMO - (i - 1) * 20 - xSize, baseYAMMO + 39, 16, 16)
			end

			surface.SetDrawColor(255, 255, 255, 255)

			for i = 1, self.BulletDisplay do
				surface.DrawTexturedRect(baseXAMMO - (i - 1) * 20 - 1 - xSize, baseYAMMO + 38, 16, 16)
			end
		end

		draw.ShadowText(self.Primary.Ammo, cwhud14, baseXAMMO + 15, baseYAMMO + 62, White, Black, 1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end
end

function SWEP:DrawWeaponSelection(x, y, wide, tall, alpha)
	if self.SelectIcon then
		surface.SetDrawColor(255, 210, 0, 255)
		surface.SetTexture(self.SelectIcon)
		surface.DrawTexturedRect(x + tall * 0.2, y, tall, tall)
	else
		draw.SimpleText(self.IconLetter, self.SelectFont, x + wide / 2, y + tall * 0.2, Color(255, 210, 0, alpha), TEXT_ALIGN_CENTER)
	end
end
