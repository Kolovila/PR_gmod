local att = {}
att.name = "kd_deagle1"
att.displayName = "Matte Green"
att.displayNameShort = "Green"
att.isBG = true

att.statModifiers = {
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {}
	
	function att:attachFunc()
		self.CW_VM:SetSubMaterial(0, "models/weapons/m45/deagle1.mdl")
		self:SetSubMaterial(0, "models/weapons/m45/deagle1.mdl")
	end

	function att:detachFunc()
		self.CW_VM:SetSubMaterial(0)
		self:SetSubMaterial(0)
	end	
end

CustomizableWeaponry:registerAttachment(att)