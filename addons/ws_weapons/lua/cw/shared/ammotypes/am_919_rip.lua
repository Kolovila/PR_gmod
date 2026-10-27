local att = {}
att.name = "am_919_rip"
att.displayName = "Pociski RIP"
att.displayNameShort = "RIP"

att.statModifiers = {
	RecoilMult = 0.2,
	DamageMult = 0.45,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_919rip")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)