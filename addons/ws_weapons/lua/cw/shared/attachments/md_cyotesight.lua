local att = {}
att.name = "md_cyotesight"
att.displayName = "Coyote [RDS]"
att.displayNameShort = "Coyote"
att.aimPos = {"CoyotePos", "CoyoteAng"}
att.FOVModifier = 15
att.isSight = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT
att.statModifiers = {OverallMouseSensMult = -0.04}

if CLIENT then
	att.displayIcon = surface.GetTextureID("rage_extras/icons/cyote")
	att.description = {[1] = {t = "A Chinese red dot sight for easier tracking of targets,", c = CustomizableWeaponry.textColors.POSITIVE},
	                   [2] = {t = "many prefer it to a weapons default ironsights.", c = CustomizableWeaponry.textColors.POSITIVE}}
	
	att.reticle = "cw2/reticles/aim_reticule"
	att._reticleSize = 0.4
	
		function att:drawReticle()
		if not self:isAiming() or not self:isReticleActive() then
			return
		end
		
		diff = self:getDifferenceToAimPos(self.CoyotePos, self.CoyoteAng, att._reticleSize)
		
		-- draw the reticle only when it's close to center of the aiming position
		if diff > 0.9 and diff < 1.1 then
			cam.IgnoreZ(true)
				render.SetMaterial(att._reticle)
				dist = math.Clamp(math.Distance(1, 1, diff, diff), 0, 0.13)
				
				local EA = self.Owner:EyeAngles() + self.Owner:GetPunchAngle()
				
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