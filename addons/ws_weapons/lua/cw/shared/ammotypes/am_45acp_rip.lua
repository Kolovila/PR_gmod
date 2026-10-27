local att = {}
att.name = "am_45acp_rip"
att.displayName = "Pociski RIP"
att.displayNameShort = ".45 RIP"

att.statModifiers = {
	DamageMult = 0.61,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_45rip")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)