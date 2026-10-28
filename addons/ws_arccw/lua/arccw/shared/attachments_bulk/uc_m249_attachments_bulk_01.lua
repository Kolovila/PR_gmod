-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_m249_barrel_long.lua
do
    local att = {}

att.PrintName = "25\" Long Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Longer barrel for the M249."
att.AutoStats = true

att.Slot = "uc_m249_barrel"

att.SortOrder = 15

att.Add_BarrelLength = 4
att.Mult_Sway = 1.20
att.Mult_SightTime = 1.10
att.Mult_RPM = 0.85

att.Mult_Recoil = 0.80
att.Mult_AccuracyMOA = 0.75
att.Mult_Range = 1.25

att.Mult_HipDispersion = 0.90
att.Mult_ShootPitch = 0.85

att.Mult_DrawTime = 1.05
att.Mult_HolsterTime = 1.05

att.ActivateElements = {"barrel_long"}

att.Mult_PhysBulletMuzzleVelocity = 1.40

    ArcCW.LoadAttachmentType(att, "uc_m249_barrel_long")
end
-- END BUNDLED ATTACHMENT: uc_m249_barrel_long.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_barrel_none.lua
do
    local att = {}

att.PrintName = "No Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Remove barrel completely"
att.AutoStats = true

att.Slot = "uc_m249_barrel"

att.SortOrder = 3

att.Add_BarrelLength = -13
att.Mult_Sway = .70
att.Mult_SightTime = .70
att.Mult_RPM = 1.4
att.Mult_SpeedMult = 1.20
att.Mult_SightedSpeedMult = 1.20
att.Mult_ShootSpeedMult = 1.20
att.Mult_DrawTime = 0.75
att.Mult_HolsterTime = 0.75

att.Mult_Recoil = 1.55
att.Mult_AccuracyMOA = 1.20
att.Mult_Range = 0.550

att.Mult_HipDispersion = 1.30
att.Mult_ShootPitch = 1.20

att.ActivateElements = {"barrel_none"}

att.Mult_PhysBulletMuzzleVelocity = 0.55

    ArcCW.LoadAttachmentType(att, "uc_m249_barrel_none")
end
-- END BUNDLED ATTACHMENT: uc_m249_barrel_none.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_barrel_short.lua
do
    local att = {}

att.PrintName = "10\" Short Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Short barrel for the m249."
att.AutoStats = true

att.Slot = "uc_m249_barrel"

att.SortOrder = 3

att.Add_BarrelLength = -10
att.Mult_Sway = .80
att.Mult_SightTime = .80
att.Mult_RPM = 1.2
att.Mult_SpeedMult = 1.10
att.Mult_SightedSpeedMult = 1.10
att.Mult_ShootSpeedMult = 1.10
att.Mult_DrawTime = 0.85
att.Mult_HolsterTime = 0.85

att.Mult_Recoil = 1.40
att.Mult_AccuracyMOA = 1.15
att.Mult_Range = 0.650

att.Mult_HipDispersion = 1.20
att.Mult_ShootPitch = 1.15

att.ActivateElements = {"barrel_short"}

att.Mult_PhysBulletMuzzleVelocity = 0.65

    ArcCW.LoadAttachmentType(att, "uc_m249_barrel_short")
end
-- END BUNDLED ATTACHMENT: uc_m249_barrel_short.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_bipod_open.lua
do
    local att = {}

att.PrintName = "Open Bipod"
att.AbbrevName = "Open Bipod"
att.Icon = Material("", "mips smooth")
att.Description = "Open the Bipod"
att.Slot = {"uc_m249_bipod"}
att.AutoStats = true

att.SortOrder = 99999

att.Mult_Sway = 1.5

att.Mult_Recoil = .8

att.Bipod = true
att.Mult_BipodRecoil = .25
att.Mult_BipodDispersion = .2

att.ActivateElements = {"bipod_open"}

    ArcCW.LoadAttachmentType(att, "uc_m249_bipod_open")
end
-- END BUNDLED ATTACHMENT: uc_m249_bipod_open.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_box_100.lua
do
    local att = {}

att.PrintName = "100-Round Box"
att.AbbrevName = "100-Round Ammobox"

att.SortOrder = 20
att.Icon = Material("", "smooth mips")
att.Description = "100 round ammobox for a lighter load."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_m249_mag"

att.AutoStats = true

att.Override_ClipSize = 100

att.Mult_SightTime = 0.87
att.Mult_ReloadTime = 0.87
att.Mult_Sway = 1.05

att.Mult_SpeedMult = 1.1
att.Mult_SightedSpeedMult = 1.1
att.Mult_ShootSpeedMult = 1.1

att.Mult_DrawTime = 0.87
att.Mult_HolsterTime = 0.87

att.ActivateElements = {"box_100"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_box100"
end

    ArcCW.LoadAttachmentType(att, "uc_m249_box_100")
end
-- END BUNDLED ATTACHMENT: uc_m249_box_100.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_cal_22lr.lua
do
    local att = {}

att.PrintName = "XM422 .22 Long Rifle Receiver"
att.AbbrevName = ".22 Long Rifle"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M249 .22 Long Rifle Receiver"
end

att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "A converted receiver that fires .22 Long Rifle rounds and feeds from UZI magazines. Very controllable recoil, but not much lethality."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_m249_cal"
att.SortOrder = -10

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 1 / .85

att.Mult_Damage = ArcCW.UC.CalConv("556", "22lr", "max")
att.Mult_DamageMin = ArcCW.UC.CalConv("556", "22lr", "min")
att.Mult_Penetration = ArcCW.UC.CalConv("556", "22lr", "pen")

att.Mult_Range = 0.5
att.Mult_ShootSpeedMult = 1.2
att.Mult_Recoil = 0.2
att.Mult_VisualRecoilMult = 0.2

att.Override_ClipSize_Priority = -1
att.Override_ClipSize = 45

att.Mult_HeatCapacity = 2

att.Override_PhysTracerProfile = "uc_plinking"
att.Override_PhysBulletMuzzleVelocity = 375 / 0.8333

att.Override_Ammo = "plinking"
att.Override_Trivia_Calibre = ".22 Long Rifle"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.TinyShellSoundsTable

att.ActivateElements = {"mag_smg"}

local path = "arccw_uc/common/"

local fire22 = {path .. "fire-22-01.ogg",path .. "fire-22-02.ogg",path .. "fire-22-03.ogg",path .. "fire-22-04.ogg",path .. "fire-22-05.ogg",path .. "fire-22-06.ogg"}
local fire22sup = {path .. "fire-22-sup-01.ogg",path .. "fire-22-sup-02.ogg",path .. "fire-22-sup-03.ogg",path .. "fire-22-sup-04.ogg",path .. "fire-22-sup-05.ogg",path .. "fire-22-sup-06.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "fire-22-dist-01.ogg", path .. "fire-22-dist-02.ogg", path .. "fire-22-dist-03.ogg", path .. "fire-22-dist-04.ogg", path .. "fire-22-dist-05.ogg", path .. "fire-22-dist-06.ogg"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "fire-dist-int-pistol-light-01.ogg", path .. "fire-dist-int-pistol-light-02.ogg", path .. "fire-dist-int-pistol-light-03.ogg", path .. "fire-dist-int-pistol-light-04.ogg", path .. "fire-dist-int-pistol-light-05.ogg", path .. "fire-dist-int-pistol-light-06.ogg"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_smg"
end

    ArcCW.LoadAttachmentType(att, "uc_m249_cal_22lr")
end
-- END BUNDLED ATTACHMENT: uc_m249_cal_22lr.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_cal_338.lua
do
    local att = {}

att.PrintName = "M249 .338 Lapua Receiver"
att.AbbrevName = ".338 Lapua Magnum"

att.Icon = Material("entities/att/uc_bullets/338lapua.png", "mips smooth")
att.Description = "Special manual-action M249 receiver loaded in .338 Lapua Magnum, for marksman purposes."

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "XM422 .338 Lapua Receiver"
end

att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "uc_m249_cal"
att.AutoStats = true

att.Mult_Damage = 1.25
att.Mult_DamageMin = 1.32
att.Mult_Range = 2.35
att.Mult_PrecisionMOA = 2.15
att.Mult_Penetration = 1.625
att.Mult_ReloadTime = 1.05

att.Mult_RPM = 0.80
att.Mult_Recoil = 1.22
att.Mult_ShootVol = 1.15

att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
att.Override_ShellScale = 1.25
att.Override_Trivia_Calibre = ".338 Lapua Magnum"

att.Mult_RPM = 0.7

att.Mult_CycleTime = 0.90
att.Mult_MalfunctionMean = 1.5
att.Override_Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.bolt",
    },
    {
        Mode = 0
    }
}

att.Override_ManualAction = true

local path = ")weapons/ar458/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "ar762_fire.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "ar762_fire_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "uc_m249_cal_338")
end
-- END BUNDLED ATTACHMENT: uc_m249_cal_338.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_cal_762.lua
do
    local att = {}

att.PrintName = "XM422 7.62x39mm Receiver"
att.AbbrevName = "7.62x39mm"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M249 7.62x39mm Receiver"
end

att.Icon = Material("entities/att/uc_bullets/762x39.png", "smooth mips")
att.Description = "A converted receiver that fires 7.62x39mm rounds and feeds from AKM magazines. The high pressure of this round makes the weapon liable to feeding failures."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_m249_cal"
att.SortOrder = -10

att.AutoStats = true

att.Mult_ReloadTime = 0.88
att.Override_ClipSize = 30
att.Mult_ShootSpeedMult = 0.8
att.Mult_RPM = 360 / 540

att.Mult_Recoil = 1.25
att.Mult_RecoilSide = 1.5
att.Mult_HipDispersion = 1.5

att.Mult_Damage = ArcCW.UC.CalConv("556", "762_39", "max")
att.Mult_DamageMin = ArcCW.UC.CalConv("556", "762_39", "min")
att.Mult_Penetration = ArcCW.UC.CalConv("556", "762_39", "pen")
att.Mult_Range = 2

att.Override_Malfunction = true
att.Mult_MalfunctionVariance = 1.5

att.Override_Ammo = "ar2"
att.Override_Trivia_Calibre = "7.62x39mm Soviet"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 0.666

att.ActivateElements = {"mag_762"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/arccw_ud/mini14/fire_762_supp.ogg"
    else
        return "weapons/arccw_ud/mini14/fire_762.ogg"
    end
end

local tail = ")/arccw_uc/common/762x39/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "fire-dist-762x39-rif-ext-01.ogg",
            tail .. "fire-dist-762x39-rif-ext-02.ogg",
            tail .. "fire-dist-762x39-rif-ext-03.ogg",
            tail .. "fire-dist-762x39-rif-ext-04.ogg",
            tail .. "fire-dist-762x39-rif-ext-05.ogg",
            tail .. "fire-dist-762x39-rif-ext-06.ogg"
        }
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_762"
end

    ArcCW.LoadAttachmentType(att, "uc_m249_cal_762")
end
-- END BUNDLED ATTACHMENT: uc_m249_cal_762.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_cal_9mm.lua
do
    local att = {}

att.PrintName = "XM422 9x19mm Receiver"
att.AbbrevName = "9x19mm"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M249 9x19mm Receiver"
end

att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = "A converted receiver that fires 9x19mm Parabellum rounds and feeds from UZI magazines. The smaller caliber drastically reduces recoil, but has much less range and is less accurate."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_m249_cal"
att.SortOrder = -10

att.AutoStats = true
att.SortOrder = 3

att.Mult_Penetration = 6 / 14
att.Mult_RPM = 1 / .85

att.Mult_Damage = ArcCW.UC.CalConv("556", "9mm", "max")
att.Mult_DamageMin = ArcCW.UC.CalConv("556", "9mm", "min")
att.Mult_Penetration = ArcCW.UC.CalConv("556", "9mm", "pen")

att.Mult_Range = 0.4
att.Mult_ShootSpeedMult = 1.1
att.Mult_Recoil = 0.5
att.Mult_HipDispersion = 0.85

att.Mult_ReloadTime = 0.85
att.Mult_SightTime = 0.9

att.Override_ClipSize_Priority = -1
att.Override_ClipSize = 32

att.Mult_HeatCapacity = 1.5

att.ActivateElements = {"mag_smg"}

att.Override_PhysBulletMuzzleVelocity = 396 / 0.833333

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = "9x19mm Parabellum"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

local path = ")^weapons/arccw_ud/glock/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return "weapons/arccw_ud/m16/fire_9.ogg" end
    if fsound == wep.ShootSoundSilenced then return {path .. "fire-sup-01.ogg", path .. "fire-sup-02.ogg", path .. "fire-sup-03.ogg", path .. "fire-sup-04.ogg", path .. "fire-sup-05.ogg", path .. "fire-sup-06.ogg"} end
end

local tail = ")^/arccw_uc/common/9x19/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "fire-dist-9x19-pistol-ext-01.ogg",
            tail .. "fire-dist-9x19-pistol-ext-02.ogg",
            tail .. "fire-dist-9x19-pistol-ext-03.ogg",
            tail .. "fire-dist-9x19-pistol-ext-04.ogg",
            tail .. "fire-dist-9x19-pistol-ext-05.ogg",
            tail .. "fire-dist-9x19-pistol-ext-06.ogg"
        }
    end
end

local tail = ")^/arccw_uc/common/9x19/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            tail .. "fire-dist-9x19-pistol-ext-01.ogg",
            tail .. "fire-dist-9x19-pistol-ext-02.ogg",
            tail .. "fire-dist-9x19-pistol-ext-03.ogg",
            tail .. "fire-dist-9x19-pistol-ext-04.ogg",
            tail .. "fire-dist-9x19-pistol-ext-05.ogg",
            tail .. "fire-dist-9x19-pistol-ext-06.ogg"
        }
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_smg"
end

    ArcCW.LoadAttachmentType(att, "uc_m249_cal_9mm")
end
-- END BUNDLED ATTACHMENT: uc_m249_cal_9mm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_grip_wood.lua
do
    local att = {}

att.PrintName = "Competition Grip"
att.AbbrevName = "Competition Grip"
att.Icon = Material("", "mips smooth")
att.Description = "Robust grip made out of wood."
att.AutoStats = true
att.Slot = {"uc_m249_grip"}

att.Mult_Recoil = 1.125
att.Mult_SightedSpeedMult = 1.10

att.ActivateElements = {"grip_wood"}

    ArcCW.LoadAttachmentType(att, "uc_m249_grip_wood")
end
-- END BUNDLED ATTACHMENT: uc_m249_grip_wood.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_hg_wood.lua
do
    local att = {}

att.PrintName = "Competition Handguard"
att.Icon = Material("", "mips smooth")
att.Description = "Heavy handguard"
att.Slot = {"uc_m249_hg"}

att.AutoStats = true

att.Mult_SightedSpeedMult = 0.85
att.Mult_HipDispersion = 1.25

att.Mult_Sway = 0.65
att.Mult_Recoil = 0.70

att.ActivateElements = {"heatshield_wood"}

    ArcCW.LoadAttachmentType(att, "uc_m249_hg_wood")
end
-- END BUNDLED ATTACHMENT: uc_m249_hg_wood.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_mag_10.lua
do
    local att = {}

att.PrintName = "10-Round Mag"
att.AbbrevName = "10-Round Magazine"

att.SortOrder = 10
att.Icon = Material("", "smooth mips")
att.Description = "10 round stanag magazine for a far lighter load."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_m249_mag"

att.AutoStats = true

att.Override_ClipSize = 10

att.Mult_SightTime = 0.75
att.Mult_ReloadTime = 0.70
att.Mult_Sway = 1.10

att.Mult_SpeedMult = 1.175
att.Mult_SightedSpeedMult = 1.135
att.Mult_ShootSpeedMult = 1.135

att.Mult_DrawTime = 0.75
att.Mult_HolsterTime = 0.75

att.ActivateElements = {"mag_10"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_mag10"
end

    ArcCW.LoadAttachmentType(att, "uc_m249_mag_10")
end
-- END BUNDLED ATTACHMENT: uc_m249_mag_10.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_mag_100.lua
do
    local att = {}

att.PrintName = "100-Round C-Mag"
att.AbbrevName = "100-Round Magazine"

att.SortOrder = 20
att.Icon = Material("", "smooth mips")
att.Description = "100 round double drum magazine for a somewhat lighter load."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_m249_mag"

att.AutoStats = true

att.Override_ClipSize = 100

att.Mult_SightTime = 0.90
att.Mult_ReloadTime = 0.85
att.Mult_Sway = 1.05

att.Mult_SpeedMult = 1.100
att.Mult_SightedSpeedMult = 1.100
att.Mult_ShootSpeedMult = 1.100

att.Mult_DrawTime = 0.90
att.Mult_HolsterTime = 0.90

att.ActivateElements = {"mag_100"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_mag100"
end

    ArcCW.LoadAttachmentType(att, "uc_m249_mag_100")
end
-- END BUNDLED ATTACHMENT: uc_m249_mag_100.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_mag_30.lua
do
    local att = {}

att.PrintName = "30-Round Mag"
att.AbbrevName = "30-Round Magazine"

att.SortOrder = 20
att.Icon = Material("", "smooth mips")
att.Description = "30 round stanag magazine for a far lighter load."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_m249_mag"

att.AutoStats = true

att.Override_ClipSize = 30

att.Mult_SightTime = 0.75
att.Mult_ReloadTime = 0.75
att.Mult_Sway = 1.10

att.Mult_SpeedMult = 1.175
att.Mult_SightedSpeedMult = 1.135
att.Mult_ShootSpeedMult = 1.135

att.Mult_DrawTime = 0.75
att.Mult_HolsterTime = 0.75

att.ActivateElements = {"mag_30"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_mag30"
end

    ArcCW.LoadAttachmentType(att, "uc_m249_mag_30")
end
-- END BUNDLED ATTACHMENT: uc_m249_mag_30.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_mag_60.lua
do
    local att = {}

att.PrintName = "60-Round Mag"
att.AbbrevName = "60-Round Magazine"

att.SortOrder = 20
att.Icon = Material("", "smooth mips")
att.Description = "60 round stanag magazine for a far lighter load."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_m249_mag"

att.AutoStats = true

att.Override_ClipSize = 60

att.Mult_SightTime = 0.85
att.Mult_ReloadTime = 0.85
att.Mult_Sway = 1.10

att.Mult_SpeedMult = 1.165
att.Mult_SightedSpeedMult = 1.125
att.Mult_ShootSpeedMult = 1.125

att.Mult_DrawTime = 0.85
att.Mult_HolsterTime = 0.85

att.ActivateElements = {"mag_60"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_mag"
end

    ArcCW.LoadAttachmentType(att, "uc_m249_mag_60")
end
-- END BUNDLED ATTACHMENT: uc_m249_mag_60.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_stock_carbine.lua
do
    local att = {}

att.PrintName = "Carbine Stock"
att.AbbrevName = "Carbine Stock"
att.Slot = "uc_m249_stock"
att.Icon = Material("entities/att/acwatt_ud_m16_stock_waffle.png", "smooth mips")
att.Description = "Carbine stock for the M249"
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.AutoStats = true
att.SortOrder = 6

att.Mult_Sway = 1.25
att.Mult_SightedSpeedMult = 1.1
att.Mult_SpeedMult = 1.07

att.ActivateElements = {"stock_carbine"}

    ArcCW.LoadAttachmentType(att, "uc_m249_stock_carbine")
end
-- END BUNDLED ATTACHMENT: uc_m249_stock_carbine.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_stock_none.lua
do
    local att = {}

att.PrintName = "M249 Stockless"
att.AbbrevName = "No Stock"

att.Icon = Material("","smooth mips")
att.Description = "Remove that bulky stock."
att.AutoStats = true
att.Slot = {"uc_m249_stock"}

att.SortOrder = 10

att.Mult_SightTime = 0.75

att.Mult_Recoil = 1.3
att.Mult_RecoilSide = 1.05

att.Mult_SightedSpeedMult = 0.90
att.Mult_ShootSpeedMult = 0.85

att.Mult_Sway = 1.4
att.Add_BarrelLength = -4

att.ActivateElements = {"stock_none"}

    ArcCW.LoadAttachmentType(att, "uc_m249_stock_none")
end
-- END BUNDLED ATTACHMENT: uc_m249_stock_none.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_stock_stilt.lua
do
    local att = {}

att.PrintName = "M249 SAW Stilt Stock"
att.AbbrevName = "Stilt Stock"

att.Icon = Material("", "smooth mips")
att.Description = "Iconic stilt stock used on the Minimi variant of the M249. Can be rotated and pushed in, to collapse it."
att.AutoStats = true
att.Slot = "uc_m249_stock"

att.ToggleLockDefault = true
att.ToggleSound = "arccw_uc/common/stockslide.ogg"

att.Mult_MoveDispersion = 1.15
att.Mult_Sway = 1.10
att.Mult_SightTime = 0.85
att.Mult_RecoilSide = 1.15
att.Mult_HipDispersion = 1.10
att.Mult_SpeedMult = 1.175
att.Mult_SightedSpeedMult = 1.135
att.Mult_ShootSpeedMult = 1.135

att.ToggleStats = {
    {
        PrintName = "Extended",
        ActivateElements = {"stock_stilt"},
        AutoStats = true,
    },
    {
        PrintName = "Collapsed",
        ActivateElements = {"stock_stilt_retracted"},
        AutoStats = true,
        Mult_ShootSpeedMult = 1.05,
        Add_BarrelLength = -1.5
    },
}

    ArcCW.LoadAttachmentType(att, "uc_m249_stock_stilt")
end
-- END BUNDLED ATTACHMENT: uc_m249_stock_stilt.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m249_stock_wood.lua
do
    local att = {}

att.PrintName = "Competition Stock"
att.AbbrevName = "Competition Stock"
att.Slot = "uc_m249_stock"
att.Icon = Material("", "smooth mips")
att.Description = "Heavy wooden sporter stock for the M249."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.AutoStats = true
att.SortOrder = 6

att.Mult_Recoil = 0.75
att.Mult_RecoilSide = 0.855
att.Mult_VisualRecoilMult = 0.865
att.Mult_Sway = 0.85

att.Mult_SightTime = 1.20
att.Mult_SightedSpeedMult = 0.80
att.Mult_ShootSpeedMult = 0.80

att.Mult_DrawTime = 1.20
att.Mult_HolsterTime = 1.20

att.ActivateElements = {"stock_wood"}

    ArcCW.LoadAttachmentType(att, "uc_m249_stock_wood")
end
-- END BUNDLED ATTACHMENT: uc_m249_stock_wood.lua
