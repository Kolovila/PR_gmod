local att = {}
att.name = "bo_reflex"
att.displayName = "Reflex Sight"
att.displayNameShort = "Reflex"
att.aimPos = {"AronREFLEXPos", "AronREFLEXAng"}
att.FOVModifier = 4
att.isSight = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/reflex")
	att.description = {[1] = {t = "Reflex red dot precision sights.", c = CustomizableWeaponry.textColors.POSITIVE}}
	att.reticle = "aron_icons/reflex_cross"
	att._reticleSize = 2.5

	function att:drawReticle()
		if not self:isAiming() or not self:isReticleActive() then
			return
		end
		
		diff = self:getDifferenceToAimPos(self.AronREFLEXPos, self.AronREFLEXAng, att._reticleSize)
		
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