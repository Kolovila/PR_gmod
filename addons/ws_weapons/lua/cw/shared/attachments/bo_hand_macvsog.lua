local att = {}
att.name = "bo_hand_macvsog"
att.displayName = "macVsog Hands"
att.displayNameShort = "macVsog"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/macvsog")
	att.description = {[1] = {t = "Weapon Hands", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetBodygroup(1, 2)
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