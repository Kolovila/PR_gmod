local att = {}
att.name = "h1_att_gl"
att.displayName = "Grenade Launcher"
att.displayNameShort = "GL"
att.isGrenadeLauncher = true

att.statModifiers = {DrawSpeedMult = -0.2,
OverallMouseSensMult = -0.2,
RecoilMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("blackops3/icon_atts/h1_att_gl")
	att.description = {[1] = {t = "Allows the user to fire 40MM rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.isGLAttached = true
	if CLIENT then
		self:resetM203Anim()
	end
end

function att:detachFunc()
	self.isGLAttached = false
	if CLIENT then
		self:resetM203Anim()
		self.dt.M203Active = false
		self.M203AngDiff = Angle(0, 0, 0)
	end
end

CustomizableWeaponry:registerAttachment(att)