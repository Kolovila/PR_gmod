local att = {}
att.name = "bo_hand_lynn"
att.displayName = "Lynn Hands"
att.displayNameShort = "Lynn"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/camo/lynn_menu")
	att.description = {[1] = {t = "Weapon Hands", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetBodygroup(1, 1)
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