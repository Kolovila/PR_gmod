local att = {}
att.name = "md_deltasight"
att.displayName = "Delta [RDS]"
att.displayNameShort = "Delta"
att.aimPos = {"DeltaPos", "DeltaAng"}
att.FOVModifier = 15
att.isSight = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT


if CLIENT then
	att.displayIcon = surface.GetTextureID("rage_extras/icons/delta")
	att.description = {[1] = {t = "A smaller red dot sight. You may prefer it to the ironsights on your pistol.", c = CustomizableWeaponry.textColors.POSITIVE}}
	
	att.reticle = "cw2/reticles/aim_reticule"
	
	att._reticleSize = 0.4
	
	function att:drawReticle()
		if not self:isAiming() then
			return
		end
		
		diff = self:getDifferenceToAimPos(self.DeltaPos, self.DeltaAng, att._reticleSize)
		
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