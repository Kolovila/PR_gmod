local att = {}
att.name = "am_atow_lowvel"
att.displayName = "Reduced recoil"
att.displayNameShort = "RR"

att.statModifiers = {AimSpreadMult = 0.5,
FireDelayMult = .12,
RecoilMult = -.1,
DamageMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/matchgradeammo")
	att.description = {}
end

function att:attachFunc()
end

function att:detachFunc()
end

CustomizableWeaponry:registerAttachment(att)