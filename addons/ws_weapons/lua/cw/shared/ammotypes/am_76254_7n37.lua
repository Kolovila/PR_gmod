local att = {}
att.name = "am_76254_7n37"
att.displayName = "Pociski 7N37"
att.displayNameShort = "7N37"

att.statModifiers = {
	DamageMult = 0.1,
	RecoilMult = 0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76254_7n37")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)