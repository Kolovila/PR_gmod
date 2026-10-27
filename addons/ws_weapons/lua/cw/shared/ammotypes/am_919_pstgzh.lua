local att = {}
att.name = "am_919_pstgzh"
att.displayName = "Pociski Pst gzh"
att.displayNameShort = "Pst gzh"

att.statModifiers = {
	DamageMult = 0.075,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_919pstgzh")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)