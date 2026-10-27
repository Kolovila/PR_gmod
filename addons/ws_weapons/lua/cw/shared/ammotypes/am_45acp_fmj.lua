local att = {}
att.name = "am_45acp_fmj"
att.displayName = "Pociski FMJ"
att.displayNameShort = ".45 FMJ"

att.statModifiers = {
	DamageMult = 0.08,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_45fmj")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)