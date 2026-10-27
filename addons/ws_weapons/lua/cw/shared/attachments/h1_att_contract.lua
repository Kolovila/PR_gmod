local att = {}
att.name = "h1_att_contract"
att.displayName = "MW Remastered"
att.displayNameShort = "MWR"
att.isContract = true

if CLIENT then
	att.displayIcon = surface.GetTextureID("blackops3/util/bo3logo")
	att.description = {
	[1] = {t = "Allows to use the attachments from MW Remastered.", c = CustomizableWeaponry.textColors.POSITIVE},
	}
end

function att:attachFunc()
	self.isMWRContractAttached = true
end

function att:detachFunc()
	self.isMWRContractAttached = false
end

CustomizableWeaponry:registerAttachment(att)