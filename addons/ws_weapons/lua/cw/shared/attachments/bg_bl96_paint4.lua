local att = {}
att.name = "bg_bl96_paint4"
att.displayName = "Orange"
att.displayNameShort = "Orange"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_bl96_paint4")
	att.description = {[1] = {t = "Standard orange.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(4)
	end
	if self.WMEnt then
		self.WMEnt:SetSkin(4)
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