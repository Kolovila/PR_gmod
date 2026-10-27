local att = {}
att.name = "am_45acp_lm"
att.displayName = "Pociski Lasermatch FMJ"
att.displayNameShort = ".45 LM"

att.statModifiers = {
	DamageMult = 0.09,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_45lm")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)