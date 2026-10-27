local att = {}
att.name = "md_ac10632"
att.displayName = "ac10632"
att.displayNameShort = "ac10632"
att.aimPos = {"AC10632Pos", "AC10632Ang"}
att.FOVModifier = 15
att.isSight = true
att.withoutRail = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT
att.statModifiers = {OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/md_ac10632")
	att.description = {
		[1] = {
			t = "Provides a bright reticle to ease aiming.", 
			c = CustomizableWeaponry.textColors.POSITIVE
		}
	}
	
	att.reticle = "cw2/reticles/kobra_sight"
	att._reticleSize = 2.5

	function att:drawReticle()
		if !self:isAiming() then
			return
		end
		
		diff = self:getDifferenceToAimPos(self.AC10632Pos, self.AC10632Ang, att._reticleSize)
		if diff > 0.8 and diff < 1.3 then
			cam.IgnoreZ(true)
				local material = self:getSightColor(att.name)
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