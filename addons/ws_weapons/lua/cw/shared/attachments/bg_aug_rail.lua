local att = {}
att.name = "bg_aug_rail"
att.displayName = "AUG Rail"
att.displayNameShort = "Rail"
att.isBG = true

-- att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/icons/aug_rail")
	att.description = {
		[1] = {t = "Scope-less rail variant thing.", c = CustomizableWeaponry.textColors.REGULAR},	
		[2] = {t = "Now you don't have to use just the scope only.", c = CustomizableWeaponry.textColors.POSITIVE}
	}
end

function att:attachFunc()
	self:setupCurrentIronsights(self.AUGRailAimPos, self.AUGRailAimAng)
	
	if not self:isAttachmentActive("sight") then
		self:updateIronsights("AUGRailAim")
	end
end

function att:detachFunc()
	self:revertToOriginalIronsights()
end

CustomizableWeaponry:registerAttachment(att)