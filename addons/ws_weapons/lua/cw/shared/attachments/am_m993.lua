local att = {}
att.name = "am_m993"
att.displayName = "M993 AP"
att.displayNameShort = "M993"

att.statModifiers = {
	DamageMult = 0.35,
	RecoilMult = 0.35,
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