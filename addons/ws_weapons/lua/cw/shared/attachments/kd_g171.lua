local att = {}
att.name = "kd_g171"
att.displayName = "Tan Two-Tone"
att.displayNameShort = "Tan"
att.isBG = true

att.statModifiers = {
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {}
	
	function att:attachFunc()
		self.CW_VM:SetSubMaterial(1, "models/weapons/glock/glock1.mdl")
		self:SetSubMaterial(1, "models/weapons/glock/glock1.mdl")
	end

	function att:detachFunc()
		self.CW_VM:SetSubMaterial(1)
		self:SetSubMaterial(1)
	end	
end

CustomizableWeaponry:registerAttachment(att)