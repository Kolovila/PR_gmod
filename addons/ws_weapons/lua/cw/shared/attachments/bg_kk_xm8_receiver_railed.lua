local att = {}
att.name = "bg_kk_xm8_receiver_railed"
att.displayName = "Railed receiver"
att.displayNameShort = "Rail"
att.isBG = true

-- att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_kk_xm8_receiver_railed")
	att.description = {
		[1] = {t = "Scope-less receiver with iron sights.", c = CustomizableWeaponry.textColors.REGULAR},	
		[2] = {t = "Comes with rail for other optics.", c = CustomizableWeaponry.textColors.POSITIVE}
	}
end

function att:attachFunc()
	self:setupCurrentIronsights(self.RailedAimPos, self.RailedAimAng)
	
	if not self:isAttachmentActive("sights") then
		self:updateIronsights("RailedAim")
	end
end

function att:detachFunc()
	self:revertToOriginalIronsights()
end

CustomizableWeaponry:registerAttachment(att)