-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: ua_m82_charm_tlp.lua
do
    local att = {}

att.PrintName = "Tactical Laser Position"
att.Description = "Give your AN/PEQ a reason to be thin."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {
    "ua.m82.tl.1",
    "ua.m82.tl.2"
}
att.Slot = "ua_m82_charm"

att.SortOrder = 998
att.RequireFlags = {"tac"}
att.GivesFlags = {"ak_norail"}

    ArcCW.LoadAttachmentType(att, "ua_m82_charm_tlp")
end
-- END BUNDLED ATTACHMENT: ua_m82_charm_tlp.lua

-- BEGIN BUNDLED ATTACHMENT: ua_m82_mag_20.lua
do
    local att = {}

att.PrintName = "M82 20-Round Drum Mag"
att.AbbrevName = "20-Round Drum Mag"

att.SortOrder = 20
att.Description = "A gargantuan drum magazine, which gives an exceptional ammo capacity, at the cost of horrendous weight and handling. Only a madman or space marine could arguably find such modification practical"
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ua_m82_mag"

att.AutoStats = true

att.Mult_SightTime = 1.15
att.Mult_ReloadTime = 1.10
att.Override_ClipSize = 20
att.Mult_Sway = 1.10
att.Mult_SpeedMult = 0.85

att.ActivateElements = {"ua_m82_mag_20"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_20"
end

    ArcCW.LoadAttachmentType(att, "ua_m82_mag_20")
end
-- END BUNDLED ATTACHMENT: ua_m82_mag_20.lua

-- BEGIN BUNDLED ATTACHMENT: ua_m82_mag_5.lua
do
    local att = {}

att.PrintName = "M82 5-Round Flush Mag"
att.AbbrevName = "5-Round Flush Mag"

att.SortOrder = 5
att.Description = "A lighter, and arguably more practical magazine for this monstrosity of a gun. Greatly reduces weights and improves handling, at the cost of only 5 rounds per magazine. Not that you would need more with such power in your hands."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ua_m82_mag"

att.AutoStats = true

att.Mult_SightTime = 0.9
att.Mult_ReloadTime = 0.85
att.Override_ClipSize = 5
att.Mult_Sway = 0.75
att.Mult_SpeedMult = 1.075

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_5"
end

    ArcCW.LoadAttachmentType(att, "ua_m82_mag_5")
end
-- END BUNDLED ATTACHMENT: ua_m82_mag_5.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m82_barrel_sawnoff.lua
do
    local att = {}

att.PrintName = "17\" Obrez Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Atrocious. Horrendous. Horrifying. Cut down your .50BMG rifle’s barrel to a ridiculously short length, making recoil control and precision unachievable dreams. Your ears and eyes will never forgive you. \n\n If paired with 20 round drum, ultimately turns this anti-material rifle in a CQB sweeper, allowing to disable your enemies with just the sound and muzzle flash"
att.AutoStats = true

att.Slot = "ua_m82_barrel"

att.SortOrder = 17

att.Add_BarrelLength = -6
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

    ArcCW.LoadAttachmentType(att, "uc_m82_barrel_sawnoff")
end
-- END BUNDLED ATTACHMENT: uc_m82_barrel_sawnoff.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m82_barrel_short.lua
do
    local att = {}

att.PrintName = "25\" Short Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "A shortened barrel, which significantly worsens accuracy and recoil, with a benefit of being lighter and slightly easier to handle. Makes your Barret reasonably effective in CQB, but you can forget about sniping."
att.AutoStats = true

att.Slot = "ua_m82_barrel"

att.SortOrder = 25

att.Add_BarrelLength = -4
att.Mult_Sway = .85
att.Mult_SightTime = .95
att.Mult_RPM = 1.10

att.Mult_Recoil = 1.20
att.Mult_AccuracyMOA = 1.50
att.Mult_Range = .885

att.Mult_HipDispersion = 1.10
att.Mult_ShootPitch = 1.10

att.ActivateElements = {"barrel_short"}

att.Mult_PhysBulletMuzzleVelocity = 0.90

    ArcCW.LoadAttachmentType(att, "uc_m82_barrel_short")
end
-- END BUNDLED ATTACHMENT: uc_m82_barrel_short.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m82_cal_23mm.lua
do
    local att = {}

att.PrintName = "23mm Receiver"
att.AbbrevName = "23mm Receiver"

att.Icon = Material("entities/att/uc_bullets/12g.png", "mips smooth")
att.Description = "A conversion which turns your anti-material rifle into an anti-material shotgun. Allows for a devastating close-combat performance, at the price of higher recoil, non-existent long range performance and slightly lowered mag capacity. Just use a KS-23 at this point."

att.Desc_Pros = {
}
att.Desc_Cons = {

}
att.Desc_Neutrals = {
}
att.Slot = "ua_m82_cal"
att.AutoStats = true

att.Mult_RPM = 0.77

att.Mult_Damage = 72 / 70
att.Mult_DamageMin = 20 / 17
att.Override_Penetration = 1
att.Override_Num = 29
att.Override_AccuracyMOA = 35
att.Override_AccuracyMOA_Priority = 0

att.Mult_Range = 0.5
att.Mult_ShootSpeedMult = 1.2
att.Mult_Recoil = 1.35
att.Mult_VisualRecoilMult = 0.2
att.Mult_ClipSize = 0.7
att.Override_HullSize = 0.1
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
att.Override_IsShotgun = true
att.Override_Ammo = "Buckshot"

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
att.Override_ShellScale = 1
att.Override_Trivia_Class = "Shotgun"
att.Override_Trivia_Calibre = "12 Gauge"
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {"weapons/arccw_ue/m82/fire_23mm.wav"} end
    if fsound == wep.ShootSoundSilenced then return path .. "weapons/ak50/ak-12g_fire_sup.wav" end
end

    ArcCW.LoadAttachmentType(att, "uc_m82_cal_23mm")
end
-- END BUNDLED ATTACHMENT: uc_m82_cal_23mm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m82_cal_gl.lua
do
    local att = {}

att.PrintName = "Barrett XM109 Conversion"
att.AbbrevName = "25x59mm HE"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "AMPR Conversion"
end

att.SortOrder = 70
att.Icon = Material("", "smooth mips")
att.Description = "The Barrett XM109, originally known as the Objective Sniper Weapon (OSW) and now called the Anti-Materiel Payload Rifle (AMPR), is a prototype semi-automatic grenade launcher. It is chambered for 25x59mm grenade rounds and was developed by Barrett Firearms Manufacturing. It was designed in accordance with a requirement set out in 1994, and is capable of defeating light armor and equipment out to 2 km (1.2 miles)."
att.Desc_Pros = {"Explosions, explosions everywhere"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ua_m82_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "25x59mm HE"
att.Override_Ammo = "SMG1_Grenade"

att.Mult_AccuracyMOA = 0.60
att.Mult_Penetration = 2
att.Mult_Range = 2.25
att.Mult_Precision = 1.50
att.Mult_Recoil = 1.97
att.Mult_MalfunctionMean = 2
att.Mult_PhysBulletMuzzleVelocity = 350
att.Override_PhysTracerProfile = 1
att.Override_AlwaysPhysBullet = true
att.Mult_Damage = 2
att.Mult_DamageMin = 1.85
att.Mult_VisualRecoilMult = 1.15
att.Mult_RPM = 0.70
att.Mult_ShootSpeedMult = 0.70
att.Mult_ReloadTime = 1.10
att.Override_ShootEntity = "arccw_uc_40mm_hv"
att.Mult_MuzzleVelocity = 350

att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 4.5
att.Override_ShellSounds = {"arccw_uc/common/40mm_casing_1.ogg"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return "weapons/m1911_357mag/m1911_pap_fire_sup.wav"
    else
        return "weapons/misc/17incinerator_fire.wav"
    end
end

    ArcCW.LoadAttachmentType(att, "uc_m82_cal_gl")
end
-- END BUNDLED ATTACHMENT: uc_m82_cal_gl.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m82_grip_skel.lua
do
    local att = {}

att.PrintName = "Skeleton Grip"

att.Icon = Material("", "smooth mips")
att.Description = "A light skeleton grip, which noticeably reduces weights at the cost of slightly worse recoil control. Looks quite fancy and tacticool too."
att.AutoStats = true

att.Slot = "ua_m82_grip"

att.SortOrder = 15

att.Mult_Sway = 0.90
att.Mult_SightTime = 0.90

att.Mult_Recoil = 1.05
att.Mult_RecoilSide = 1.05
att.Mult_SpeedMult = 1.10
att.Mult_SightedSpeedMult = 1.075
att.Mult_ShootSpeedMult = 1.075

att.Mult_HipDispersion = 1.05

att.ActivateElements = {"grip_skel"}

    ArcCW.LoadAttachmentType(att, "uc_m82_grip_skel")
end
-- END BUNDLED ATTACHMENT: uc_m82_grip_skel.lua
