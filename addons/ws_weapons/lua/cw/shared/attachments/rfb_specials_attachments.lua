--[[ 
local att = {}
att.name = "md_special_suppressor"
att.displayName = "Silencerco Osprey"
att.displayNameShort = "Osprey"
att.isSuppressor = true

att.statModifiers = {
RecoilMult = -0.2,
AimSpreadMult = -0.1,
OverallMouseSensMult = -0.05,
DamageMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/osprey")
	att.description = {[1] = {t = "looks cool and obstructs less the sight", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.dt.Suppressed = true
end

function att:detachFunc()
	self:resetSuppressorStatus()
end

CustomizableWeaponry:registerAttachment(att)
--]]

local att = {}
att.name = "bg_rfb_special_rail"
att.displayName = "Kel Tec Quad Rail"
att.displayNameShort = "Rail"
att.isBG = true

att.statModifiers = {
HipSpreadMult = -0.05,
RecoilMult = 0.05,
OverallMouseSensMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/rfb_rail")
	att.description = {[1] = {t = "A special rail for extra attachments", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.RailsBGs.main, self.RailsBGs.kt_rfb_rail)
	self.ShellPosOffset = {x = 0.1, y = 5, z = -0.2}
end

function att:detachFunc()
	self:setBodygroup(self.RailsBGs.main, self.BarrelBGs.regular)
	self.ShellPosOffset = {x = 0.25, y = 0, z = -0.2}
end

CustomizableWeaponry:registerAttachment(att)

local att = {}
att.name = "bg_rfb_long_barrel"
att.displayName = "Long Barrel"
att.displayNameShort = "Long"
att.isBG = true
att.SpeedDec = 5

att.statModifiers = {
DamageMult = 0.05,
AimSpreadMult = -0.1,
HipSpreadMult = -0.1,
RecoilMult = 0.1,
FireDelayMult = 0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/rfb_long")
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.long)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)

local att = {}
att.name = "bg_rfb_short_barrel"
att.displayName = "Short Barrel"
att.displayNameShort = "Short"
att.isBG = true
att.SpeedDec = -5

att.statModifiers = {
DamageMult = -0.05,
AimSpreadMult = 0.1,
HipSpreadMult = 0.1,
RecoilMult = -0.1,
FireDelayMult = -0.1,
OverallMouseSensMult = 0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/rfb_short")
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.short)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)