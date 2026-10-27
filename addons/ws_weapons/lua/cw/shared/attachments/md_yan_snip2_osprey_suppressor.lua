local att = {}
att.name = "md_snip2_osprey_suppressor"
att.displayName = "Silencerco Osprey"
att.displayNameShort = "Osprey"
att.isSuppressor = true

att.statModifiers = {
RecoilMult = -0.2,
AimSpreadMult = -0.2,
HipSpreadMult = -0.05,
OverallMouseSensMult = -0.15,
DamageMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/osprey_suppressor")
	att.description = {[1] = {t = "looks REALLY cool", c = CustomizableWeaponry.textColors.POSITIVE},
    [2] = {t = "Decreases firing noise.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.dt.Suppressed = true
end

function att:detachFunc()
	self:resetSuppressorStatus()
end

CustomizableWeaponry:registerAttachment(att)