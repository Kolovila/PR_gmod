local att = {}
att.name = "bo_hand_militia"
att.displayName = "Militia Hands"
att.displayNameShort = "Militia"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/militia_menu")
	att.description = {[1] = {t = "Weapon Hands", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetBodygroup(1, 5)
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