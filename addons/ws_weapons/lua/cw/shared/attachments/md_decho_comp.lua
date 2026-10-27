local att = {}
att.name = "md_decho_comp"
att.displayName = "Decho-comp"
att.displayNameShort = "DC"
att.isSuppressor = false

att.statModifiers = {OverallMouseSensMult = -0.1,
RecoilMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/YZQ")
	att.description = {[1] = {t = "go~go~go~", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.dt.Suppressed = false
end

function att:detachFunc()
	self:resetSuppressorStatus()
end

CustomizableWeaponry:registerAttachment(att)