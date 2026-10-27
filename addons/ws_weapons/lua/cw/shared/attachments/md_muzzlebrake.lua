local att = {}
att.name = "md_muzzlebrake"
att.displayName = "Muzzle Brake"
att.displayNameShort = "Brake"
att.isSuppressor = false

att.statModifiers = {RecoilMult = -0.45,
DamageMult = 0.15,
HipSpreadMult = 0.6}

if CLIENT then
	att.displayIcon = surface.GetTextureID("rage_extras/icons/muzzlebrake")
	att.description = {[1] = {t = "The muzzle brake makes it easier to control the kick of the weapon", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.dt.Suppressed = false
end

function att:detachFunc()
	self.dt.Suppressed = false
end

CustomizableWeaponry:registerAttachment(att)