local att = {}
att.name = "doi_atow_m3stock"
att.displayName = "Skeleton Stock"
att.displayNameShort = "Stock"
att.isBG = true
att.SpeedDec = 10

att.statModifiers = {RecoilMult = -0.4,
OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bhpstock")
	att.description = {[1] = {t = "Significantly reduces muzzle rise.", c = CustomizableWeaponry.textColors.VPOSITIVE}}
end

function att:attachFunc()
end

function att:detachFunc()
end

CustomizableWeaponry:registerAttachment(att)