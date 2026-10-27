local att = {}
att.name = "bo_camo_erdl"
att.displayName = "ERDL Camo"
att.displayNameShort = "ERDL"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/camo/erdl_menu")
	att.description = {[1] = {t = "Weapon camo.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(12)
	end
	
	if self.WMEnt then
		self.WMEnt:SetSkin(12)
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