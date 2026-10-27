local att = {}
att.name = "kd_deagle2"
att.displayName = "Gold Plating"
att.displayNameShort = "Gold"
att.isBG = true

att.statModifiers = {
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {		[1] = {t = "Increases coolness level by 1500%", c = CustomizableWeaponry.textColors.VPOSITIVE},
		[2] = {t = "Increases buyer's remorse by 750%", c = CustomizableWeaponry.textColors.NEGATIVE},
		[3] = {t = "Increases chance of gang violence.", c = CustomizableWeaponry.textColors.VNEGATIVE}}
	
	function att:attachFunc()
		self.CW_VM:SetSubMaterial(0, "models/weapons/m45/deagle2.mdl")
		self:SetSubMaterial(0, "models/weapons/m45/deagle2.mdl")
	end

	function att:detachFunc()
		self.CW_VM:SetSubMaterial(0)
		self:SetSubMaterial(0)
	end	
end

CustomizableWeaponry:registerAttachment(att)