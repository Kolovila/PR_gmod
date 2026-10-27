local att = {}
att.name = "am_5728_ss197sr"
att.displayName = "Pociski SS197SR"
att.displayNameShort = "SS197SR"

att.statModifiers = {
	DamageMult = 0.11,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_5728ss197sr")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)