local att = {}
att.name = "md_warrior_t1"
att.displayName = "W-T1"
att.displayNameShort = "W-T1"
att.aimPos = {"wtPos", "wtAng"}
att.FOVModifier = 10
att.isSight = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/warrior_t1")
	att.description = {[1] = {t = "Provides a dot reticle to ease aiming.", c = CustomizableWeaponry.textColors.POSITIVE}}
	
	att.reticle = "models/optics/warrior_t1/reticle"
	--att.reticle = "models/weapons/tfa_ins2/upgrades/hcog_reticle_rear_col"
	att._reticleSize = 6

function att:drawReticle()
		if not self:isAiming() or not self:isReticleActive() then
			return
		end
		
		diff = self:getDifferenceToAimPos(self.wtPos, self.wtAng, 1)

		-- draw the reticle only when it's close to center of the aiming position
		if diff > 0.9 and diff < 1.1 then
			cam.IgnoreZ(true)
				render.SetMaterial(att._reticle)
				dist = math.Clamp(math.Distance(1, 1, diff, diff), 0, 1.13)
				
				local EA = self:getReticleAngles()
				
				local renderColor = self:getSightColor(att.name)
				renderColor.a = (0.3 - dist) / 0.3 * 255
				
				local pos = EyePos() + EA:Forward() * 100
				
				for i = 1, 2 do
					render.DrawSprite(pos, att._reticleSize, att._reticleSize, renderColor)
				end
			cam.IgnoreZ(false)
		end
	end
end

CustomizableWeaponry:registerAttachment(att)