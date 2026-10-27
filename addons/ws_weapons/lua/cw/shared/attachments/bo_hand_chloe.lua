local att = {}
att.name = "bo_hand_chloe"
att.displayName = "Chloe Hands"
att.displayNameShort = "Chloe Lynch"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/camo/chloe_menu")
	att.description = {[1] = {t = "Weapon Hands", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetBodygroup(1, 6)
	end
end

function att:detachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetBodygroup(1, 0)
	end
end

CustomizableWeaponry:registerAttachment(att)