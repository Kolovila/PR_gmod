-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_barrel_cloth.lua
do
    local att = {}

att.PrintName = "29\" Clothwrap Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Standard barrel wrapped in cloth. Makes handling slightly more comfortable, but not by much. Fits the sniper receiver as well."
att.AutoStats = true

att.Slot = "uc_mosin_barrel"

att.SortOrder = 15

att.Mult_SightTime = 0.95

att.Mult_HipDispersion = 0.95

att.ActivateElements = {"barrel_cloth", "barrel_cloth_sniper"}

    ArcCW.LoadAttachmentType(att, "uc_mosin_barrel_cloth")
end
-- END BUNDLED ATTACHMENT: uc_mosin_barrel_cloth.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_barrel_obrez.lua
do
    local att = {}

att.PrintName = "15\" Obrez Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Stubby barrel. Handling is much light but recoil is harder to manage."
att.AutoStats = true

att.Slot = "uc_mosin_barrel"

att.ExcludeFlags = {"mosin_sniper"}

att.SortOrder = 15

att.Add_BarrelLength = -14
att.Mult_Sway = .85
att.Mult_SightTime = .85
att.Mult_RPM = 1.20

att.Mult_Recoil = 1.355
att.Mult_AccuracyMOA = 1.50
att.Mult_Range = .785

att.Mult_HipDispersion = 1.25
att.Mult_ShootPitch = 1.25

att.ActivateElements = {"barrel_obrez"}

att.Mult_PhysBulletMuzzleVelocity = 0.80

    ArcCW.LoadAttachmentType(att, "uc_mosin_barrel_obrez")
end
-- END BUNDLED ATTACHMENT: uc_mosin_barrel_obrez.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_bolt_light.lua
do
    local att = {}

att.PrintName = "Light Bolt"

att.Icon = Material("", "smooth mips")
att.Description = "Lighter bolt."
att.AutoStats = true

att.Slot = "uc_mosin_bolt"

att.SortOrder = 14

att.Mult_Sway = 1.15

att.Mult_HipDispersion = 1.20

att.ActivateElements = {"bolt_light"}

att.Mult_Recoil = 1.25
att.Mult_VisualRecoilMult = 1.175
att.Mult_CycleTime = 0.75
att.Mult_ShootSpeedMult = 1.15
att.Mult_ReloadTime = 0.85
att.Mult_SpeedMult = 1.05
att.Mult_SightedSpeedMult = 1.05
att.Mult_DrawTime = 0.90
att.Mult_HolsterTime = 0.90

    ArcCW.LoadAttachmentType(att, "uc_mosin_bolt_light")
end
-- END BUNDLED ATTACHMENT: uc_mosin_bolt_light.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_cal_20ga.lua
do
    local att = {}

att.PrintName = "20 Gauge Conversion"
att.AbbrevName = "20 Gauge"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Frolovka 20 Gauge Conversion"
    att.AbbrevName = "Frolovka"
end

att.Icon = Material("entities/att/uc_bullets/20g.png", "mips smooth")
att.Description = "Tula's answer, in the twenties, to a country with no cheap hunting guns and warehouses full of rifles too battered by two wars to be worth reissuing: bore the rifling out, open the chamber up, sell it to a farmer. They made them down to 32 gauge. This is the biggest of them, and it is still a Mosin, so you get one pattern of shot and then a second and a half of working the bolt to think about how it went."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_mosin_cal"
att.SortOrder = 20
att.AutoStats = true
att.Model = "models/uc_mosin/frolovka_reload.mdl"
att.BoneMerge = true
att.UCMosinShells = true

att.Hook_ModifyBodygroups = function(wep, data)
    if CLIENT and UCMosinAmmo then UCMosinAmmo.Apply(wep, data.vm, data.wm) end
end

att.Override_Damage = 18
att.Override_DamageMin = 11
att.Override_Penetration = 2
att.Override_Num = 7
att.Override_Range = 45
att.Override_RangeMin = 5
att.Override_DamageType = DMG_BULLET + DMG_BUCKSHOT

att.Override_AccuracyMOA = 30
att.Override_AccuracyMOA_Priority = 0
att.Override_HullSize = 0.15
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
att.Override_IsShotgun = true

att.Override_Ammo = "buckshot"
att.Override_Trivia_Class = "Shotgun"
att.Override_Trivia_Calibre = "20 Gauge"
att.Override_Trivia_Year = 1925

att.Override_ClipSize = 3

att.Mult_Recoil = 1.20
att.Mult_VisualRecoilMult = 0.85
att.Mult_CycleTime = 1.10
att.Mult_ReloadTime = 1.05
att.Mult_MuzzleVelocity = 0.44
att.Override_PhysBulletMuzzleVelocity = 380

att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
att.Override_ShellScale = 0.9
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_UC_ShellColor = Color(0.9 * 255, 0.68 * 255, 0.16 * 255)

att.GivesFlags = {"mosin_20ga"}

local path = ")arccw_uc/common/ub12ga/"

local fire = {path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"}
local dist = {path .. "fire-dist-02.ogg", path .. "fire-dist-03.ogg", path .. "fire-dist-04.ogg", path .. "fire-dist-05.ogg", path .. "fire-dist-06.ogg"}

att.Hook_GetShootSound = function(wep, fsound)
    if wep:GetBuff_Override("Silencer") then return end
    return fire
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end
    return dist
end

    ArcCW.LoadAttachmentType(att, "uc_mosin_cal_20ga")
end
-- END BUNDLED ATTACHMENT: uc_mosin_cal_20ga.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_cal_65x53r.lua
do
    local att = {}

att.PrintName = "6.5x53mmR Conversion"
att.AbbrevName = "6.5x53mmR"

att.Icon = Material("entities/att/uc_bullets/65creedmoor.png", "mips smooth")
att.Description = "A rebarrel to the old Dutch Mannlicher round. Long, thin, heavy for its calibre, and it goes through things a much bigger cartridge will stop against - the reason men with more nerve than sense once took the 6.5 after elephant. It does not hit as hard as the 7.62, but it shoots flatter and it barely moves the rifle."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_mosin_cal"
att.SortOrder = 21
att.AutoStats = true

att.Override_Damage = 62
att.Override_DamageMin = 42
att.Override_Penetration = 25
att.Override_Range = 800
att.Override_RangeMin = 175

att.Mult_Recoil = 0.60
att.Mult_RecoilSide = 0.65
att.Mult_VisualRecoilMult = 0.70
att.Mult_AccuracyMOA = 0.85
att.Mult_Sway = 0.95
att.Mult_CycleTime = 0.92

att.Override_Trivia_Calibre = "6.5x53mmR"
att.Mult_MuzzleVelocity = 0.94
att.Override_PhysBulletMuzzleVelocity = 820

att.Override_ShellModel = "models/weapons/comradebear/ww2/shells/762x54r.mdl"
att.Override_ShellScale = 0.92

att.GivesFlags = {"mosin_65x53r"}

att.Mult_ShootPitch = 0.92

local path = ")weapons/arccw_ur/ak/545_39/"
local tail = ")/arccw_uc/common/556x45/"

local fire = {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"}
local dist = {tail .. "fire-dist-556x45-rif-ext-01.ogg", tail .. "fire-dist-556x45-rif-ext-02.ogg", tail .. "fire-dist-556x45-rif-ext-03.ogg", tail .. "fire-dist-556x45-rif-ext-04.ogg", tail .. "fire-dist-556x45-rif-ext-05.ogg", tail .. "fire-dist-556x45-rif-ext-06.ogg"}

att.Hook_GetShootSound = function(wep, fsound)
    if wep:GetBuff_Override("Silencer") then return end
    return fire
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end
    return dist
end

    ArcCW.LoadAttachmentType(att, "uc_mosin_cal_65x53r")
end
-- END BUNDLED ATTACHMENT: uc_mosin_cal_65x53r.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_cal_762x39.lua
do
    local att = {}

att.PrintName = "7.62x39mm Conversion"
att.AbbrevName = "7.62x39mm"

att.Icon = Material("entities/att/uc_bullets/762x39.png", "mips smooth")
att.Description = "A short barrel and a new bolt face, so the thing eats the cheapest rifle ammunition on the continent. Nobody converts a Mosin to this because it makes the rifle better. They do it because a crate of it costs less than a tank of petrol."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_mosin_cal"
att.SortOrder = 23
att.AutoStats = true

att.Override_Damage = 50
att.Override_DamageMin = 25
att.Override_Penetration = 16
att.Override_Range = 350
att.Override_RangeMin = 50

att.Override_ClipSize = 6

att.Mult_Recoil = 0.45
att.Mult_RecoilSide = 0.55
att.Mult_VisualRecoilMult = 0.55
att.Mult_AccuracyMOA = 1.15
att.Mult_CycleTime = 0.85
att.Mult_ReloadTime = 0.95
att.Mult_SpeedMult = 1.03

att.Override_Trivia_Calibre = "7.62x39mm"
att.Mult_MuzzleVelocity = 0.84
att.Override_PhysBulletMuzzleVelocity = 730

att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1

att.GivesFlags = {"mosin_762x39"}

local path = ")weapons/arccw_ur/ak/"
local tail = ")/arccw_uc/common/762x39/"

local fire = {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"}
local dist = {tail .. "fire-dist-762x39-rif-ext-01.ogg", tail .. "fire-dist-762x39-rif-ext-02.ogg", tail .. "fire-dist-762x39-rif-ext-03.ogg", tail .. "fire-dist-762x39-rif-ext-04.ogg", tail .. "fire-dist-762x39-rif-ext-05.ogg", tail .. "fire-dist-762x39-rif-ext-06.ogg"}

att.Hook_GetShootSound = function(wep, fsound)
    if wep:GetBuff_Override("Silencer") then return end
    return fire
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end
    return dist
end

    ArcCW.LoadAttachmentType(att, "uc_mosin_cal_762x39")
end
-- END BUNDLED ATTACHMENT: uc_mosin_cal_762x39.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_cal_93x53r.lua
do
    local att = {}

att.PrintName = "9.3x53mmR Conversion"
att.AbbrevName = "9.3x53mmR"

att.Icon = Material("entities/att/uc_bullets/366tkm.png", "mips smooth")
att.Description = "The service case opened up to take a bullet nearly four tenths of an inch across, because the men who inherited these rifles wanted to shoot moose with them. Everything forward of the muzzle has a bad day. Everything behind the buttplate does too, and the magazine gives up a round to fit the things."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_mosin_cal"
att.SortOrder = 22
att.AutoStats = true

att.Override_Damage = 105
att.Override_DamageMin = 40
att.Override_Penetration = 15
att.Override_Range = 400
att.Override_RangeMin = 90

att.Override_ClipSize = 4

att.Mult_Recoil = 1.55
att.Mult_RecoilSide = 1.35
att.Mult_VisualRecoilMult = 1.40
att.Mult_AccuracyMOA = 1.20
att.Mult_Sway = 1.10
att.Mult_CycleTime = 1.12
att.Mult_ReloadTime = 1.05

att.Override_Trivia_Calibre = "9.3x53mmR"
att.Mult_MuzzleVelocity = 0.80
att.Override_PhysBulletMuzzleVelocity = 700

att.Override_ShellModel = "models/weapons/comradebear/ww2/shells/762x54r.mdl"
att.Override_ShellScale = 1.06
att.Mult_ShootVol = 1.10

att.GivesFlags = {"mosin_93x53r"}

local path = ")weapons/arccw_ur/aw_placeholders/"
local tail = ")/arccw_uc/common/338lm/"

local fire = {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"}
local dist = {tail .. "fire-dist-338lm-rif-ext-01.ogg", tail .. "fire-dist-338lm-rif-ext-02.ogg", tail .. "fire-dist-338lm-rif-ext-03.ogg", tail .. "fire-dist-338lm-rif-ext-04.ogg", tail .. "fire-dist-338lm-rif-ext-05.ogg", tail .. "fire-dist-338lm-rif-ext-06.ogg"}

att.Hook_GetShootSound = function(wep, fsound)
    if wep:GetBuff_Override("Silencer") then return end
    return fire
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end
    return dist
end

    ArcCW.LoadAttachmentType(att, "uc_mosin_cal_93x53r")
end
-- END BUNDLED ATTACHMENT: uc_mosin_cal_93x53r.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_mag_10.lua
do
    local att = {}

att.PrintName = "10-Round Extended Mag"
att.AbbrevName = "10-Round Internal Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "10-Round Extended Mag"
end

att.SortOrder = 20
att.Icon = Material("", "smooth mips")
att.Description = "Extended internal magazine that doubles the amount of shots fired before having to reload."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_mosin_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 10
att.Override_ClipSize_Priority = 2

att.Mult_SightTime = 1.05
att.Mult_Sway = 1.075

att.Mult_SpeedMult = 0.95
att.Mult_SightedSpeedMult = 0.95
att.Mult_ShootSpeedMult = 0.95

att.Mult_DrawTime = 1.05
att.Mult_HolsterTime = 1.05

att.ActivateElements = {"mag_10"}

    ArcCW.LoadAttachmentType(att, "uc_mosin_mag_10")
end
-- END BUNDLED ATTACHMENT: uc_mosin_mag_10.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_muzzle_bayonet.lua
do
    local att = {}

att.PrintName = "M1891 Cruciform Bayonet"
att.AbbrevName = "Bayonet"

att.Icon = Material("", "smooth mips")
att.Description = "The socket bayonet the rifle was issued and zeroed with, fixed rather than carried. Sixteen inches of cruciform spike that does not cut so much as bore, and enough weight out past the muzzle to settle the rifle down and slow it into the shoulder."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.AutoStats = true

att.Slot = "uc_mosin_muzzle"
att.SortOrder = 5

att.ExcludeFlags = {"barrel_obrez"}

att.Add_MeleeRange = 12
att.Mult_MeleeDamage = 1.6
att.Mult_MeleeTime = 1.1
att.Override_MeleeDamageType = DMG_SLASH

att.Mult_Recoil = 0.95
att.Mult_VisualRecoilMult = 0.95

att.Mult_SightTime = 1.06
att.Mult_Sway = 1.08
att.Mult_MoveDispersion = 1.05
att.Mult_SpeedMult = 0.98
att.Mult_SightedSpeedMult = 0.98

att.ActivateElements = {"bayonet", "bayonet_sniper"}

    ArcCW.LoadAttachmentType(att, "uc_mosin_muzzle_bayonet")
end
-- END BUNDLED ATTACHMENT: uc_mosin_muzzle_bayonet.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_reload_clip.lua
do
    local att = {}

att.PrintName = "Stripper Clips"
att.AbbrevName = "Stripper Clips"

att.Icon = Material("", "smooth mips")
att.Description = "The charger bridge on top of the receiver is there for a reason. Five rounds held in a sheet-metal strip, dropped into the guide, thumbed down in one motion and the empty strip flicked away - the whole magazine in one movement instead of five. It is what the rifle was designed around, and it is why the bolt has to be all the way back to use it."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_mosin_reload"
att.SortOrder = 5
att.AutoStats = true

att.ExcludeFlags = {"mosin_sniper"}

att.Override_InsertAmount = 5

att.Hook_SelectInsertAnimation = function(wep, data)
    data.anim = "sgreload_insert_clip"
    if wep:CheckFlags(nil, {"mosin_20ga"}) then data.count = 3 end
    return data
end

att.GivesFlags = {"mosin_clips"}

    ArcCW.LoadAttachmentType(att, "uc_mosin_reload_clip")
end
-- END BUNDLED ATTACHMENT: uc_mosin_reload_clip.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_stock_none.lua
do
    local att = {}

att.PrintName = "Obrez Stock"
att.AbbrevName = "Obrez Stock"
att.Slot = "uc_mosin_stock"
att.Icon = Material("", "smooth mips")
att.Description = "Remove the stock in favour of a simple stubby grip. Really light."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.AutoStats = true
att.SortOrder = 6

att.Mult_Recoil = 1.70
att.Mult_RecoilSide = 1.25
att.Mult_VisualRecoilMult = 1.25
att.Mult_Sway = 1.37

att.Mult_SightTime = 0.50
att.Mult_SightedSpeedMult = 1.50
att.Mult_ShootSpeedMult = 1.50

att.Mult_DrawTime = 0.50
att.Mult_HolsterTime = 0.50

att.ActivateElements = {"stock_none"}

    ArcCW.LoadAttachmentType(att, "uc_mosin_stock_none")
end
-- END BUNDLED ATTACHMENT: uc_mosin_stock_none.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_trigger_light.lua
do
    local att = {}

att.PrintName = "Light Trigger"

att.Icon = Material("", "smooth mips")
att.Description = "Modified trigger system that allows for faster firing."
att.AutoStats = true

att.Slot = "uc_mosin_trigger"

att.SortOrder = 14

att.Mult_HipDispersion = 0.90

att.ActivateElements = {"trigger_light"}
att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0,
    },
}

att.Mult_RPM = 1.25
att.Mult_ShootSpeedMult = 1.15

    ArcCW.LoadAttachmentType(att, "uc_mosin_trigger_light")
end
-- END BUNDLED ATTACHMENT: uc_mosin_trigger_light.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mosin_variant_sniper.lua
do
    local att = {}

att.PrintName = "Sniper Receiver"
att.AbbrevName = "Sniper"

att.Icon = Material("", "smooth mips")
att.Description = "A rifle pulled off the line for shooting tighter groups than its neighbours, sent back to have the bolt handle drawn out and turned down so it clears a scope, and the sights left on in case the optic takes a knock. Everything that made it worth picking is in the barrel and the bedding, so there is nothing here you can swap out without undoing it."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.AutoStats = true

att.Slot = "uc_mosin_variant"
att.SortOrder = 5

att.Mult_AccuracyMOA = 0.70
att.Mult_Sway = 0.85
att.Mult_HipDispersion = 1.15
att.Mult_MoveDispersion = 1.15

att.Mult_CycleTime = 0.92

att.Mult_Recoil = 0.90
att.Mult_VisualRecoilMult = 0.90

att.Mult_SightTime = 1.15
att.Mult_SpeedMult = 0.95
att.Mult_SightedSpeedMult = 0.92
att.Mult_DrawTime = 1.15

att.Override_Trivia_Class = "Sniper Rifle"

att.ActivateElements = {"variant_sniper"}
att.GivesFlags = {"mosin_sniper"}

local swap = {
    [")uc_mosin/mech.wav"] = ")uc_mosin/mech_sniper.wav",
    [")uc_mosin/cycle_infantry.wav"] = ")uc_mosin/cycle.wav",
    [")uc_mosin/boltback.wav"] = ")uc_mosin/boltback_sniper.wav",
    [")uc_mosin/boltforward.wav"] = ")uc_mosin/boltforward_sniper.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    if !isstring(fsound) then return end
    return swap[fsound]
end

    ArcCW.LoadAttachmentType(att, "uc_mosin_variant_sniper")
end
-- END BUNDLED ATTACHMENT: uc_mosin_variant_sniper.lua
