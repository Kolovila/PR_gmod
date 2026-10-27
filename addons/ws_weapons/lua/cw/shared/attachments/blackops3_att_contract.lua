local att = {}
att.name = "blackops3_att_contract"
att.displayName = "Black Ops III"
att.displayNameShort = "BO3"
att.isContract = true

if CLIENT then
	att.displayIcon = surface.GetTextureID("blackops3/util/bo3logo")
	att.description = {
	[1] = {t = "Allows to use the attachments from Black Ops III.", c = CustomizableWeaponry.textColors.POSITIVE},
	}
end

function att:attachFunc()
	self.isBlackOps3ContractAttached = true
end

function att:detachFunc()
	self.isBlackOps3ContractAttached = false
end

CustomizableWeaponry:registerAttachment(att)