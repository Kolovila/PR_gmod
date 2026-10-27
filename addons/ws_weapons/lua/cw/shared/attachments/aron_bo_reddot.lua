local att = {}
att.name = "bo_reddot"
att.displayName = "Red dot Sight"
att.displayNameShort = "Red dot"
att.aimPos = {"AronREDDOTPos", "AronREDDOTAng"}
att.FOVModifier = 5
att.isSight = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_WM then
		self.CW_WM:SetBodygroup(0, 2)
	end
end

function att:detachFunc()
	if SERVER then
		return
	end

	if self.CW_WM then
		self.CW_WM:SetBodygroup(0, 0)
	end
end

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/reddot")
	att.description = {[1] = {t = "Red dot precision sight.", c = CustomizableWeaponry.textColors.POSITIVE}}
	att.reticle = "cw2/reticles/aim_reticule"
	att._reticleSize = 0.8

	function att:drawReticle()
		if not self:isAiming() or not self:isReticleActive() then
			return
		end
		
		diff = self:getDifferenceToAimPos(self.AronREDDOTPos, self.AronREDDOTAng, att._reticleSize)
		
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