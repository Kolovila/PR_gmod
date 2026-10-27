local att = {}
att.name = "md_cybersupp"
att.displayName = "Suppressor"
att.displayNameShort = "Silencer"
att.isSuppressor = true

att.statModifiers = {RecoilMult = -0.1,
DamageMult = -0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("aron_icons/silencer")
	att.description = {[1] = {t = "Decreases firing noise.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.dt.Suppressed = true
end

function att:detachFunc()
	self.dt.Suppressed = false
end

CustomizableWeaponry:registerAttachment(att)