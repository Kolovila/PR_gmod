local att = {}
att.name = "am_919_ap63"
att.displayName = "Pociski AP 6.3"
att.displayNameShort = "AP 6.3"

att.statModifiers = {
	DamageMult = 0.12,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_919ap63")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)