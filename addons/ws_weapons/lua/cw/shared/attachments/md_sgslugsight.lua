local att = {}
att.name = "md_sgslugsight"
att.displayName = "Rifle Sights"
att.displayNameShort = "Sights"
att.isBG = true

att.statModifiers = {
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/altsight")
	att.description = {[1] = {t = "Adds a rear sight, intended for firing slugs.", c = CustomizableWeaponry.textColors.COSMETIC}}
end

function att:attachFunc()
	self:setupCurrentIronsights(self.AltIronPos, self.AltIronAng)
	
	if not self:isAttachmentActive("sights") then
		self:updateIronsights("AltIron")
	end
end

function att:detachFunc()
	self:revertToOriginalIronsights()
end

CustomizableWeaponry:registerAttachment(att)
