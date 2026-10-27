local att = {}
att.name = "md_eft_si_uh1"
att.displayName = "Vortex Razor AMG UH-1 holographic sight"
att.displayNameShort = "UH-1"
att.aimPos = {"EFTUH1Pos", "EFTUH1Ang"}
att.FOVModifier = 15
att.isSight = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT
if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_si_uh1")
	att.description = {[1] = {t = "Provides a circle and dot reticle to ease aiming.", c = CustomizableWeaponry.textColors.POSITIVE}}
	
	att.reticle = "models/weapons/cw_eft/upgrades/scopes/UH1/uh1_reticule"
	att._reticleSize = 6.5
	
	function att:drawReticle()
		if not self:isAiming() or not self:isReticleActive() then
			return
		end
		
		diff = self:getDifferenceToAimPos(self.EFTUH1Pos, self.EFTUH1Ang, 1)
		
		-- draw the reticle only when it's close to center of the aiming position
		if diff > 0.9 and diff < 1.1 then
			cam.IgnoreZ(true)
				render.SetMaterial(att._reticle)
				dist = math.Clamp(math.Distance(1, 1, diff, diff), 0, 0.13)
				
				local EA = self:getReticleAngles()
				
				local renderColor = self:getSightColor(att.name)
				renderColor.a = (0.13 - dist) / 0.13 * 255
				
				local pos = EyePos() + EA:Forward() * 100
				
				for i = 1, 2 do
					render.DrawSprite(pos, att._reticleSize, att._reticleSize, renderColor)
				end
			cam.IgnoreZ(false)
		end
	end
end

CustomizableWeaponry:registerAttachment(att)