local att = {}
att.name = "am_4630_actionsx"
att.displayName = "Pociski Action SX"
att.displayNameShort = "Action SX"

att.statModifiers = {
	DamageMult = 0.06,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_46030actionsx")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)