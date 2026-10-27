local att = {}
att.name = "kd_deagle0"
att.displayName = "Polished Chrome"
att.displayNameShort = "Chrome"
att.isBG = true

att.statModifiers = {
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {}
	
	function att:attachFunc()
		self.CW_VM:SetSubMaterial(0, "models/weapons/m45/deagle0.mdl")
		self:SetSubMaterial(0, "models/weapons/m45/deagle0.mdl")
	end

	function att:detachFunc()
		self.CW_VM:SetSubMaterial(0)
		self:SetSubMaterial(0)
	end	
end

CustomizableWeaponry:registerAttachment(att)