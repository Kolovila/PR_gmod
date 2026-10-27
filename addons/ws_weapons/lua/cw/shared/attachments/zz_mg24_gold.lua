local att = {}
att.name = "zz_mg24_gold"
att.displayName = "DP-27 Gold"
att.displayNameShort = "Gold"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("zz_atts/weaps/zz_mg24_ico")
	att.description = {[1] = {t = "Gold version of the DP-27.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(1)
	end
	
	if self.WMEnt then
		self.WMEnt:SetSkin(1)
	end
	
end


function att:detachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(0)
	end
	
	if self.WMEnt then
		self.WMEnt:SetSkin(0)
	end
	
end

CustomizableWeaponry:registerAttachment(att)