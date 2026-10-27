local att = {}
att.name = "bg_kk_xm8_paint3"
att.displayName = "Lulz Red Finish"
att.displayNameShort = "Red"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_kk_xm8_paint3")
	att.description = {[1] = {t = "Tacticool red finish for your weapon.", c = CustomizableWeaponry.textColors.POSITIVE}}

	function att:attachFunc()
		if self.CW_VM then
			self.CW_VM:SetModel("models/weapons/v_cwkk_xm8_2.mdl")
			self.CW_VM:SetSkin(1)
		end
		
		if self.WMEnt then
			self.WMEnt:SetModel("models/weapons/w_cwkk_xm8_2.mdl")
			self.WMEnt:SetSkin(1)
		end
	end

	function att:detachFunc()
		if self.CW_VM then
			self.CW_VM:SetModel("models/weapons/v_cwkk_xm8.mdl")
			self.CW_VM:SetSkin(0)
		end
		
		if self.WMEnt then
			self.WMEnt:SetModel("models/weapons/w_cwkk_xm8.mdl")
			self.WMEnt:SetSkin(0)
		end
	end
end

CustomizableWeaponry:registerAttachment(att)