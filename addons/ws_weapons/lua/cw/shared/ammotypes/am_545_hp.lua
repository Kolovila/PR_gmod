local att = {}
att.name = "am_545_hp"
att.displayName = "Pociski HP"
att.displayNameShort = "HP"

att.statModifiers = {
	RecoilMult = 0.05,
	DamageMult = 0.01,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_54539hp")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)