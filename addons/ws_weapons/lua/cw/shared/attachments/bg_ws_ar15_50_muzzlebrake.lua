local att = {}
att.name = "bg_ws_ar15_50_muzzlebrake"
att.displayName = "Muzzle Brake"
att.displayNameShort = "MB"
att.isBG = true

att.statModifiers = {HipSpreadMult = -0.1,
AimSpreadMult = -0.1,
RecoilMult = -0.30,
DrawSpeedMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_ar15_50_muzzlebrake")
end

function att:attachFunc()
	self:setBodygroup(self.MuzzleBrakeBGs.main, self.MuzzleBrakeBGs.MB)
end

function att:detachFunc()
	self:setBodygroup(self.MuzzleBrakeBGs.main, self.MuzzleBrakeBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)