local att = {}
att.name = "am_magnum_khr"
att.displayName = "Magnum rounds"
att.displayNameShort = "Magnum"

att.statModifiers = {DamageMult = 0.15,
	RecoilMult = 0.25}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/magnumrounds")
	att.description = {}
end

function att:attachFunc()
	 
end

function att:detachFunc()
	 
end

CustomizableWeaponry:registerAttachment(att)