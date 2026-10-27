local att = {}
att.name = "doi_atow_modernfinish"
att.displayName = "Synthetic Finish"
att.displayNameShort = "Synth"
att.isBG = true
att.SpeedDec = -2

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/garandsyn")
	att.description = {[1] = {t = "hey bubba", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(2)
	end
end

function att:detachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(0)
	end
end

CustomizableWeaponry:registerAttachment(att)