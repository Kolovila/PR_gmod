local att = {}
att.name = "am_5728_ss190"
att.displayName = "Pociski SS190"
att.displayNameShort = "SS190"

att.statModifiers = {
	DamageMult = 0.24,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_5728ss190")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)