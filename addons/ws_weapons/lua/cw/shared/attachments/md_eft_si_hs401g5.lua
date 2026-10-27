local att = {}
att.name = "md_eft_si_hs401g5"
att.displayName = "Holosun HS401G5 reflex sight"
att.displayNameShort = "HS401G5"
att.aimPos = {"EFTHS401G5Pos", "EFTHS401G5Ang"}
att.FOVModifier = 15
att.isSight = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_si_hs401g5")
	att.description = {[1] = {t = "Provides a dot reticle to ease aiming.", c = CustomizableWeaponry.textColors.POSITIVE}}
	
	att.reticle = "cw2/reticles/aim_reticule"
	att._reticleSize = 0.4
end	
function att:drawReticle()
	if not self:isAiming() or not self:isReticleActive() then
		return
	end
		
	diff = self:getDifferenceToAimPos(self.EFTHS401G5Pos, self.EFTHS401G5Ang, 1)
		
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


CustomizableWeaponry:registerAttachment(att)