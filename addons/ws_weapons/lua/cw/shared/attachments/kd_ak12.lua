local att = {}
att.name = "kd_ak12"
att.displayName = "Green Furniture"
att.displayNameShort = "Green"
att.isBG = true

att.statModifiers = {
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {}
	
	function att:attachFunc()
		self.CW_VM:SetSubMaterial(0, "models/weapons/ak12/green_3_metal_diffuse.mdl")
		self:SetSubMaterial(0, "models/weapons/ak12/green_3_metal_diffuse.mdl")
	end

	function att:detachFunc()
		self.CW_VM:SetSubMaterial(0)
		self:SetSubMaterial(0)
	end	
end

CustomizableWeaponry:registerAttachment(att)