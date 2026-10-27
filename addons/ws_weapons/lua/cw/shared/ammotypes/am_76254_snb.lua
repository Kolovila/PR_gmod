local att = {}
att.name = "am_76254_snb"
att.displayName = "Pociski SNB"
att.displayNameShort = "SNB"

att.statModifiers = {
	DamageMult = 0.16,
	RecoilMult = 0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76254_snb")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)