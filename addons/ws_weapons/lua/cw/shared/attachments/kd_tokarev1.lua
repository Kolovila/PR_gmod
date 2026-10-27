local att = {}
att.name = "kd_tokarev1"
att.displayName = "Refinished"
att.displayNameShort = "Refinished"
att.isBG = true

att.statModifiers = {
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {}
	
	function att:attachFunc()
		self.CW_VM:SetSubMaterial(0, "models/weapons/makarov/diffusev.mdl")
		self:SetSubMaterial(0, "models/weapons/makarov/diffusev.mdl")
	end

	function att:detachFunc()
		self.CW_VM:SetSubMaterial(0)
		self:SetSubMaterial(0)
	end	
end

CustomizableWeaponry:registerAttachment(att)