local att = {}
att.name = "md_cantedsights"
att.displayName = "Canted Iron Sights"
att.displayNameShort = "Canted Sights"
--att.isSight = true
att.aimPos = {"CantedPos", "CantedAng"}


if CLIENT then
	att.displayIcon = surface.GetTextureID("rage_extras/icons/cantedsights")
	att.description = {[1] = {t = "Gives You Ironsights", c = CustomizableWeaponry.textColors.COSMETIC}}
end

function att:attachFunc()
	if CLIENT then
		if self.AttachmentModelsVM.md_couldbewhat then
			self.AttachmentModelsVM.md_couldbewhat.active = true
		end
	end
 function att:elementRender()
		if not self.ActiveAttachments[att.name] then return end
		
		local currentPrimarySight = self:getActiveAttachmentInCategory(self.primarySightCategory or 1)
		if self.lastPrimarySight != currentPrimarySight then
			self.SightBackUpPos = self[att.aimPos[1]]
			self.SightBackUpAng = self[att.aimPos[2]]
			
			if not CustomizableWeaponry.sights[currentPrimarySight] then
				self.ActualSightPos = self.AimPos_Orig
				self.ActualSightAng = self.AimAng_Orig
			end
	end

function att:detachFunc()
	if CLIENT then
		if self.AttachmentModelsVM.md_couldbewhat then
			self.AttachmentModelsVM.md_couldbewhat.active = false
		end
	end
	self.SightBackUpPos = self.SightBackUpPos_Orig
	self.SightBackUpAng = self.SightBackUpAng_Orig
	
end
end
end

CustomizableWeaponry:registerAttachment(att)