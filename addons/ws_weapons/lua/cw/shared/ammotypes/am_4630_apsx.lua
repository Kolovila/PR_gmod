local att = {}
att.name = "am_4630_apsx"
att.displayName = "Pociski AP SX"
att.displayNameShort = "AP SX"

att.statModifiers = {
	DamageMult = 0.3,
	RecoilMult = 0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_46030apsx")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)