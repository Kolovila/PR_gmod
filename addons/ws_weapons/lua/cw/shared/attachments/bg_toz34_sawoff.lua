local att = {}
att.name = "bg_toz34_sawoff"
att.displayName = "Sawn-off"
att.displayNameShort = "Sawn-off"
att.isBG = true
att.SpeedDec = -5

att.statModifiers = {
	DamageMult = 0.1,
	RecoilMult = 0.1,
	AimSpreadMult = 0.2,
	DrawSpeedMult = 0.5,
	OverallMouseSensMult = 0.15
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_toz34_sawoff")
end

function att:attachFunc()
	self:setBodygroup(0, 1)
	self.MuzzleAttachmentName = self.MuzzleAttachmentAlt
	self.NearWallDistance = 16
end

function att:detachFunc()
	self:setBodygroup(0, 0)
	self.MuzzleAttachmentName = self.MuzzleAttachmentNameOrig
	self.NearWallDistance = 40
end

CustomizableWeaponry:registerAttachment(att)