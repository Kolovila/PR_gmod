local att = {}
att.name = "am_matchgrade_khr"
att.displayName = "Match grade rounds"
att.displayNameShort = "Match"

att.statModifiers = {AimSpreadMult = -0.3}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/matchgradeammo")
	att.description = {}
end

function att:attachFunc()
	 
end

function att:detachFunc()
	 
end

CustomizableWeaponry:registerAttachment(att)