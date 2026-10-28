 

 
do
    local att = {}

att.PrintName = ".380 ACP"
att.AbbrevName = ".380 ACP"

att.Icon = Material("entities/att/uc_bullets/380acp.png", "smooth mips")
att.Description = "A converted frame that fires .380 ACP rounds. Has less range effectiveness but also less recoil."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_pm_cal"
att.SortOrder = -10

att.AutoStats = true
att.SortOrder = 3

att.Mult_RPM = 0.85

att.Mult_Damage = 0.83
att.Mult_DamageMin = 0.84
att.Mult_Penetration = 0.42

att.Mult_Range = 0.65
att.Mult_ShootSpeedMult = 1.1
att.Mult_Recoil = 0.5
att.Mult_HipDispersion = 0.85

att.Mult_SightTime = 0.9

att.Override_ClipSize_Priority = -1
att.Override_ClipSize = 20

att.Override_PhysBulletMuzzleVelocity = 396 / 0.93333

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = ".380 ACP"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

local path = ")^weapons/misc/"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return "weapons/misc/m16_380acp_fire.wav" end
    if fsound == wep.ShootSoundSilenced then return {path .. "m16_380acp_sup.wav"} end
end

    ArcCW.LoadAttachmentType(att, "uc_pm_cal_380acp")
end
 

 
do
    local att = {}

att.PrintName = ".50 Action Express"
att.AbbrevName = ".50 Action Express"

att.Icon = Material("entities/att/uc_bullets/50ae.png", "smooth mips")
att.Description = "Cursed conversion to .50 Action Express rounds. Extremely powerful but it's very difficult to manage the recoil."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_pm_cal"
att.SortOrder = -10

att.AutoStats = true
att.SortOrder = 3

att.Override_Trivia_Calibre = ".50 Action Express"
att.Override_Ammo = "357"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/50ae.mdl"
att.Override_ShellScale = 1

att.Mult_AccuracyMOA = 0.60
att.Mult_Penetration = 3.3
att.Mult_Range = 1.38
att.Mult_Precision = 1.05
att.Mult_Recoil = 1.85
att.Mult_MalfunctionMean = 1.23
att.Override_PhysBulletMuzzleVelocity = 290
att.Mult_Damage = 2.15
att.Mult_DamageMin = 1.65
att.Mult_RPM = 0.70
att.Mult_ClipSize = 0.80
att.Mult_ReloadTime = 1.05

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_50ae_sup.wav"
    else
        return "weapons/m1911_357mag/m1911_50ae.wav"
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then
        return "weapons/m1911_357mag/m1911_357mag_fire_dist.wav" end
end

local path = "/arccw_uc/common/"
att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return {
            path .. "fire-dist-int-pistol-heavy-01.ogg",
            path .. "fire-dist-int-pistol-heavy-02.ogg",
            path .. "fire-dist-int-pistol-heavy-03.ogg",
            path .. "fire-dist-int-pistol-heavy-04.ogg",
            path .. "fire-dist-int-pistol-heavy-05.ogg",
            path .. "fire-dist-int-pistol-heavy-06.ogg"
        }
    end
end

    ArcCW.LoadAttachmentType(att, "uc_pm_cal_50ae")
end
 

 
do
    local att = {}

att.PrintName = "APB Integral Suppressor"
att.AbbrevName = "APB Suppressor"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Auto Integral Suppressor"
    att.AbbrevName = "Auto Suppressor"
end

att.Icon = Material("entities/att/acwatt_ud_glock_slide.png", "smooth mips")
att.Description = "An integral, quick-detach suppressor for the \"Silent\" variant of the automatic pistol. Specially designed, it provides near-reportless firing and high precision, at the cost of handling and muzzle velocity."
att.Desc_Pros = {
    "pro.invistracers",
    "uc.subsonic"
}
att.AutoStats = true

att.Slot = "pm_supp"

att.SortOrder = 999

att.Silencer = true
att.Mult_ShootVol = 0.55
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.Override_PhysTracerProfile = 7
att.Override_TracerNum = 0

att.Mult_SightTime = 1.10
att.Mult_AccuracyMOA = 0.5
att.Mult_HipDispersion = 0.8

att.Mult_PhysBulletMuzzleVelocity = 0.75

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundSilenced then
        return false end
end
att.Mult_ShootPitch = 1.15

att.RequireFlags = {"ur_stechkin"}
att.ActivateElements = {"ur_apb_supp"}
att.GivesFlags = {"barrel_sd", "powder_subsonic"}

    ArcCW.LoadAttachmentType(att, "ur_pm_barrel_apb")
end
 

 
do
    local att = {}

att.PrintName = "PB Integral Suppressor"
att.AbbrevName = "PB Suppressor"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "BG-K Integral Suppressor"
    att.AbbrevName = "BG-K Suppressor"
end

att.Icon = Material("entities/att/acwatt_ud_glock_slide.png", "smooth mips")
att.Description = "An integral, quick-detach suppressor for the \"Silent\" variant of the pistol. Specially designed, it provides near-reportless firing and high precision, at the cost of handling and muzzle velocity."
att.Desc_Pros = {
    "pro.invistracers",
    "uc.subsonic"
}
att.AutoStats = true

att.Slot = "pm_supp"

att.SortOrder = 999

att.Silencer = true
att.Mult_ShootVol = 0.55
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.Override_PhysTracerProfile = 7
att.Override_TracerNum = 0

att.Mult_SightTime = 1.10
att.Mult_AccuracyMOA = 0.5
att.Mult_HipDispersion = 0.8

att.Mult_PhysBulletMuzzleVelocity = 0.75

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSoundSilenced then
        return false end
end
att.Mult_ShootPitch = 1.15

att.RequireFlags = {"ur_pb"}
att.ActivateElements = {"ur_pb_supp"}
att.GivesFlags = {"barrel_sd", "powder_subsonic"}

    ArcCW.LoadAttachmentType(att, "ur_pm_barrel_pb")
end
 

 
do
    local att = {}

att.PrintName = "APS Baikal Carbine"
att.AbbrevName = "Baikal Carbine (APS)"
att.Icon = Material("entities/att/acwatt_ud_glock_slide.png", "mips smooth")
att.Description = "An APS pistol inside of a knockoff, off-brand, aftermarket chassis made to resemble that of a Baikal carbine kit. With this being a Chinese knockoff rather than the original assembly however, some components differ, most notably the carry handle, front sight and charging handle actually originate from a defective M16A1 that was scrapped for parts, so in a way recycling does save lives, or perhaps in this case it ends lives as well. \n\n Recoil is slightly more controllable thanks to the built-in compensator and the firerate is also higher compared to the basic pistol configuration. Reliability could however be an issue due to this being a cheap, Chinese ripoff of the original product."
att.Slot = {"ur_pm_variant"}
att.AutoStats = true

att.SortOrder = 2

att.Override_ClipSize = 100
att.Mult_ReloadTime = 1.25
att.Mult_SightTime = 1.10
att.Mult_SightedSpeedMult = 0.90
att.Mult_SpeedMult = 0.85
att.Mult_Recoil = 0.85
att.Mult_Range = 1.20
att.Mult_Sway = 1.25
att.Mult_HipDispersion = 0.95
att.Mult_DrawTime = 1.10
att.Mult_HolsterTime = 1.10
att.Mult_MalfunctionMean = 0.55
att.Mult_VisualRecoilMult = 0.95
att.Mult_Precision = 1.05
att.Mult_AccuracyMOA = 1.5
att.Mult_RPM = 1.35

att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0,
    },
}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_drum"
end

att.ActivateElements = {"baikal_aps"}

    ArcCW.LoadAttachmentType(att, "ur_pm_variant_aps_baikal")
end
 

 
do
    local att = {}

att.PrintName = "Automatic Stechkin Pistol"
att.AbbrevName = "Automatic"
att.Icon = Material("entities/att/acwatt_ud_glock_slide.png", "mips smooth")
att.Description = "Fully-automatic conversion of the pistol into a completely seperate pistol design through Urbanmancy™. Though featuring a 20-round double-stack magazine and a stable rate of fire, the pistol suffers from poor accuracy, handling, and recoil."
att.Slot = {"ur_pm_variant"}
att.AutoStats = true

att.SortOrder = 2

att.Override_ClipSize = 20
att.Mult_ReloadTime = 1.15
att.Mult_SightTime = 0.9
att.Mult_SightedSpeedMult = 0.9
att.Mult_Recoil = 1.3
att.Mult_RPM = 1.304
att.Mult_AccuracyMOA = 1.5

att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0,
    },
}

att.ActivateElements = {"ur_stechkin"}

    ArcCW.LoadAttachmentType(att, "ur_pm_variant_aps")
end
 

 
do
    local att = {}

att.PrintName = "Silent Makarov Pistol"
att.AbbrevName = "Silent"
att.Icon = Material("entities/att/ur_ak/barrel/aksu.png", "mips smooth")
att.Description = [[Variant of the pistol that totally redesigns the upper assembly of the pistol to enable the use of a specially designed quick-detach suppressor, without which it has rather poor performance.
A favorite of the Soviet-era KGB.]]
att.Slot = {"ur_pm_variant"}
att.AutoStats = true

att.SortOrder = 3

att.Mult_Range = 0.65
att.Mult_Recoil = 1.05

att.ActivateElements = {"ur_peanutbutter"}
att.GivesFlags = {"ur_pb"}

    ArcCW.LoadAttachmentType(att, "ur_pm_variant_pb")
end
 

 
do
    local att = {}

att.PrintName = "PM Eagle Pistol"
att.AbbrevName = "Eagle"
att.Icon = Material("entities/att/acwatt_ud_glock_slide.png", "mips smooth")
att.Description = "The rebirth of a base classic; The extremely cursed pistol variant dubbed the \"PM Eagle\". This PM frame was brutally smashed with industrial tools in order to forcefully accomodate a threaded Desert Eagle barrel, or at least a heavily modified part of such barrel. \n\n This barrel has the benefit of greatly reducing recoil, may come in handy with a certain... conversion. However it makes manuvering the pistol quite sluggish due to the added weight."
att.Slot = {"ur_pm_variant"}
att.AutoStats = true

att.SortOrder = 2

att.Mult_ReloadTime = 1.20
att.Mult_SightTime = 1.30
att.Mult_SightedSpeedMult = 0.70
att.Mult_SpeedMult = 0.75
att.Mult_RPM = 0.85
att.Mult_Recoil = 0.50
att.Mult_Range = 0.9
att.Mult_Sway = 0.75
att.Mult_HipDispersion = 0.8
att.Mult_DrawTime = 1.30
att.Mult_HolsterTime = 1.30

att.ActivateElements = {"pm_eagle"}

    ArcCW.LoadAttachmentType(att, "ur_pm_variant_pm_eagle")
end
 

 
do
    local att = {}

att.PrintName = "PMM Baikal Carbine"
att.AbbrevName = "Baikal Carbine (PMM)"
att.Icon = Material("entities/att/acwatt_ud_glock_slide.png", "mips smooth")
att.Description = "A PMM pistol inside of a knockoff, off-brand, aftermarket chassis made to resemble that of a Baikal carbine kit. With this being a Chinese knockoff rather than the original assembly however, some components differ, most notably the carry handle, front sight and charging handle actually originate from a defective M16A1 that was scrapped for parts, so in a way recycling does save lives, or perhaps in this case it ends lives as well. \n\n Recoil is slightly more controllable thanks to the built-in compensator and the firerate is also higher compared to the basic pistol configuration. Reliability could however be an issue due to this being a cheap, Chinese ripoff of the original product."
att.Slot = {"ur_pm_variant"}
att.AutoStats = true

att.SortOrder = 2

att.Override_ClipSize = 30
att.Mult_ReloadTime = 1.10
att.Mult_SightTime = 1.10
att.Mult_SightedSpeedMult = 0.90
att.Mult_SpeedMult = 0.85
att.Mult_RPM = 1.35
att.Mult_Recoil = 0.85
att.Mult_Range = 1.20
att.Mult_Sway = 1.25
att.Mult_HipDispersion = 0.95
att.Mult_DrawTime = 1.10
att.Mult_HolsterTime = 1.10
att.Mult_MalfunctionMean = 0.55
att.Mult_VisualRecoilMult = 0.95
att.Mult_Precision = 1.05

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_baikal"
end

att.ActivateElements = {"baikal_pmm"}

    ArcCW.LoadAttachmentType(att, "ur_pm_variant_pmm_baikal")
end
 

 
do
    local att = {}

att.PrintName = "Modernized Makarov Pistol"
att.AbbrevName = "Modernized"
att.Icon = Material("entities/att/acwatt_ud_glock_slide.png", "mips smooth")
att.Description = "Modernized variant of the pistol with many redesigned features, including a new extended magazine alongside more robust grip panels. Marginally slower to reload."
att.Slot = {"ur_pm_variant"}
att.AutoStats = true

att.SortOrder = 2

att.Override_ClipSize = 12
att.Mult_ReloadTime = 1.15
att.Mult_SightTime = 0.9
att.Mult_SightedSpeedMult = 0.9

att.ActivateElements = {"ur_pmm"}

    ArcCW.LoadAttachmentType(att, "ur_pm_variant_pmm")
end
 
