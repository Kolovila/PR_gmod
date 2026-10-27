local att = {}
att.name = "md_kemper"
att.displayName = "kemper_xl"
att.displayNameShort = "kemper_xl"
att.aimPos = {"kemperPos", "kemperAng"}
att.FOVModifier = 10
att.isSight = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kemper_xl")
	att.description = {[1] = {t = "Provides a dot reticle to ease aiming.", c = CustomizableWeaponry.textColors.POSITIVE}}
	
	att.reticle = "models/optics/kemper_xl/reticle"
	--att.reticle = "models/weapons/tfa_ins2/upgrades/hcog_reticle_rear_col"
	att._reticleSize = 10

function att:drawReticle()
		if not self:isAiming() or not self:isReticleActive() then
			return
		end
		
		diff = self:getDifferenceToAimPos(self.wtPos, self.wtAng, 1)

		-- draw the reticle only when it's close to center of the aiming position
		if diff > 0.3 and diff < 1.1 then
			cam.IgnoreZ(true)
				render.SetMaterial(att._reticle)
				dist = math.Clamp(math.Distance(1, 1, diff, diff), 0, 0.08)
				
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