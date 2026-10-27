local att = {}
att.name = "bg_ws_ar15_50_DMRrec"
att.displayName = "DMR Receiver"
att.displayNameShort = "D. Receiver"
att.isBG = true
att.SpeedDec = 2

att.statModifiers = {
RecoilMult = -0.15,
DrawSpeedMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_ar15_50_DMRrec")
end

function att:attachFunc()
	self:setBodygroup(self.ReceiverBGs.main, self.ReceiverBGs.DMR)
end

function att:detachFunc()
	self:setBodygroup(self.ReceiverBGs.main, self.ReceiverBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)