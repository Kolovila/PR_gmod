local att = {}
att.name = "bg_wsmk11_paint1"
att.displayName = "Tan Paint"
att.displayNameShort = "Tan"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_wsmk11_paint1")
	att.description = {
						[1] = {t = "\"No sweet perfume ever tortured me more than this\"", c = CustomizableWeaponry.textColors.REGULAR},
						[2] = {t = "Tan finish for your weapon.", c = CustomizableWeaponry.textColors.POSITIVE}}
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