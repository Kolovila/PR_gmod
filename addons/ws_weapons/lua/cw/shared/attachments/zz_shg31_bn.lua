local att = {}
att.name = "zz_shg31_bn"
att.displayName = "M97 Trench Gun Bayonet"
att.displayNameShort = "Bayonet"
att.isSuppressor = false

if CLIENT then
	att.displayIcon = surface.GetTextureID("zz_atts/weaps/zz_shg31_bn")
	att.description = {[1] = {t = "Adds nothing.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
end

function att:detachFunc()
end

CustomizableWeaponry:registerAttachment(att)