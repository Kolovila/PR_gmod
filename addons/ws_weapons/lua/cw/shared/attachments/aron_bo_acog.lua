local att = {}
att.name = "bo_acog"
att.displayName = "ACOG Scope"
att.displayNameShort = "ACOG"
att.aimPos = {"AronACOGPos", "AronACOGAng"}
att.FOVModifier = 35
att.isSight = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/acog")
	att.description = {[1] = {t = "Enhanced zoom ACOG scope.", c = CustomizableWeaponry.textColors.POSITIVE}}
	att.reticle = "cw2/reticles/scope_leo"
	att._reticleSize = 0

	function att:drawReticle()
		if not self:isAiming() or not self:isReticleActive() then
			return
		end
		
		diff = self:getDifferenceToAimPos(self.AronACOGPos, self.AronACOGAng, att._reticleSize)
		
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

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetBodygroup(2, 3)
	end
end

function att:detachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetBodygroup(2, 2)
	end
end

CustomizableWeaponry:registerAttachment(att)