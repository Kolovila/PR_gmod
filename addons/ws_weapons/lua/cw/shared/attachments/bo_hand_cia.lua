local att = {}
att.name = "bo_hand_cia"
att.displayName = "CIA Hands"
att.displayNameShort = "CIA"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/cia_menu")
	att.description = {[1] = {t = "Weapon Hands", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetBodygroup(1, 3)
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