local att = {}
att.name = "am_545_prs"
att.displayName = "Pociski PRS"
att.displayNameShort = "PRS"

att.statModifiers = {RecoilMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_54539prs")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)