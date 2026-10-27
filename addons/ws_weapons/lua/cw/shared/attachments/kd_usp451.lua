local att = {}
att.name = "kd_usp451"
att.displayName = "Silver and Black"
att.displayNameShort = "Silver"
att.isBG = true

att.statModifiers = {
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {}
	
	function att:attachFunc()
		self.CW_VM:SetSubMaterial(1, "models/weapons/usp_crash/usp_diffuse_metal2.mdl")
		self:SetSubMaterial(1, "models/weapons/usp_crash/usp_diffuse_metal2.mdl")
	end

	function att:detachFunc()
		self.CW_VM:SetSubMaterial(1)
		self:SetSubMaterial(1)
	end	
end

CustomizableWeaponry:registerAttachment(att)