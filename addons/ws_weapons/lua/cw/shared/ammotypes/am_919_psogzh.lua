local att = {}
att.name = "am_919_psogzh"
att.displayName = "Pociski PSO gzh"
att.displayNameShort = "PSO gzh"

att.statModifiers = {
	DamageMult = 0.07,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_919psogzh")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)