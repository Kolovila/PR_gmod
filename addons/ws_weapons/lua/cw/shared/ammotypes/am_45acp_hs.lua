local att = {}
att.name = "am_45acp_hs"
att.displayName = "Pociski Hydra-Shok"
att.displayNameShort = ".45 HS"

att.statModifiers = {
	DamageMult = 0.07,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_45hs")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)