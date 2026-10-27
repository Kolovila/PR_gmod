local att = {}
att.name = "bg_lyxn_short_barrel"
att.displayName = "Shortened barrel"
att.displayNameShort = "Short"
att.isBG = true
att.categoryFactors = {cqc = 3}
att.SpeedDec = -3

att.statModifiers = {
OverallMouseSensMult = 0.3,
DrawSpeedMult = 0.5,
FireDelayMult = -0.3,
RecoilMult = -0.5,
AimSpreadMult = 0.2,
HipSpreadMult = 0.35,
ClumpSpreadMult = 0.3,
DamageMult = -0.1
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/short")
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.short)
	self:setupCurrentIronsights(self.ShortenedPos, self.ShortenedAng)
	
	if not self:isAttachmentActive("sights") then
		self:updateIronsights("Shortened")
	end
	
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
	self:revertToOriginalIronsights()
end

CustomizableWeaponry:registerAttachment(att)