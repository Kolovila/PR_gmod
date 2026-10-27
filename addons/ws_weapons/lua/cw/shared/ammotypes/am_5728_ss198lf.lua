local att = {}
att.name = "am_5728_ss198lf"
att.displayName = "Pociski SS198LF"
att.displayNameShort = "SS198LF"

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_5728ss198lf")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)