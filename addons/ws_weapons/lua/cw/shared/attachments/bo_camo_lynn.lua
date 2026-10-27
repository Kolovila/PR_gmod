local att = {}
att.name = "bo_camo_lynn"
att.displayName = "Lynn Camo"
att.displayNameShort = "Lynn"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/camo/lynn_menu")
	att.description = {[1] = {t = "Weapon camo.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(11)
	end
	
	if self.WMEnt then
		self.WMEnt:SetSkin(11)
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