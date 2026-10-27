local att = {}
att.name = "am_m61"
att.displayName = "M61 AP"
att.displayNameShort = "M61"

att.statModifiers = {
	DamageMult = 0.45,
	RecoilMult = 0.25,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/matchgradeammo")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)