local att = {}
att.name = "am_atow_heavy"
att.displayName = "Overpressure"
att.displayNameShort = "+P"

att.statModifiers = {DamageMult = 0.15,
	RecoilMult = 0.2,
	AimSpreadMult = 0.25}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/hvyammo")
	att.description = {{t = "Light JHP & more powder increases velocity", c = CustomizableWeaponry.textColors.VPOSITIVE}}
end

function att:attachFunc()
end

function att:detachFunc()
end

CustomizableWeaponry:registerAttachment(att)