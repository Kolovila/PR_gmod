local att = {}
att.name = "doi_atow_29short"
att.displayName = "Short Barrel"
att.displayNameShort = "Snub"
att.isBG = true
att.SpeedDec = -5

att.statModifiers = {RecoilMult = 0.1,
HipSpreadMult = 0.25,
DrawSpeedMult = .12}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/m3barrel")
	att.description = {[3] = {t = "Decreases effective range by 15M.", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.snub)
	--self.MuzzleAttachmentName = 3
	self:setupCurrentIronsights(self.Alt2IronPos, self.Alt2IronAng)
	
	if not self:isAttachmentActive("sights") then
		self:updateIronsights("Alt2Iron")
	end
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.default)
	--self.MuzzleAttachmentName = 1
	self:revertToOriginalIronsights()
end

CustomizableWeaponry:registerAttachment(att)