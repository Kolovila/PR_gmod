local att = {}
att.name = "kd_g172"
att.displayName = "Stainless"
att.displayNameShort = "Stainless"
att.isBG = true

att.statModifiers = {
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {}
	
	function att:attachFunc()
		self.CW_VM:SetSubMaterial(1, "models/weapons/glock/glock2.mdl")
		self:SetSubMaterial(1, "models/weapons/glock/glock2.mdl")
	end

	function att:detachFunc()
		self.CW_VM:SetSubMaterial(1)
		self:SetSubMaterial(1)
	end	
end

CustomizableWeaponry:registerAttachment(att)