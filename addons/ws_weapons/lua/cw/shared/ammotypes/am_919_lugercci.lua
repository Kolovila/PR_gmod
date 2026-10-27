local att = {}
att.name = "am_919_lugercci"
att.displayName = "Pociski Luger CCI"
att.displayNameShort = "Luger CCI"

att.statModifiers = {
	DamageMult = 0.08,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_919lugercci")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)