SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "Korsair C45"
SWEP.TrueName = "KRISS Vector"
SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = "Personal defence weapon built around a bolt that does not travel straight back. The carrier and a separate counterweight run down and rearward into a channel behind the magazine well, so the impulse of each shot is redirected below the bore instead of straight into the shooter's shoulder.\n\nThe result is a weapon that gets flatter the longer the trigger is held, which is the opposite of every other automatic it shares a magazine with. The mass has to be moving for that to happen, so the first round out of a rest kicks harder than it should, and the counterweight is tuned to the weight of a .45 bullet. Anything lighter and the system does less of its job."
SWEP.Trivia_Manufacturer = "KORS USA"
SWEP.Trivia_Calibre = ".45 ACP"
SWEP.Trivia_Mechanism = "Delayed Blowback, Super V"
SWEP.Trivia_Country = "United States"
SWEP.Trivia_Year = 2009

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "KRISS USA"
end

SWEP.Slot = 2

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/tfa_trepang2/c_trepang2_vector.mdl"
SWEP.WorldModel = "models/weapons/tfa_trepang2/c_trepang2_vector.mdl"
SWEP.MirrorVMWM = true
SWEP.ViewModelFOV = 70

SWEP.DefaultBodygroups = "0000"

SWEP.Damage = 45
SWEP.DamageMin = 18
SWEP.Range = 40
SWEP.RangeMin = 8
SWEP.Penetration = 9
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.PhysBulletMuzzleVelocity = 285
SWEP.CanFireUnderwater = false

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 25
SWEP.ExtendedClipSize = 50
SWEP.ReducedClipSize = 13

SWEP.Recoil = 0.55
SWEP.RecoilSide = 0.42
SWEP.RecoilRise = 0
SWEP.RecoilDirection = Angle(0, 0, 0)
SWEP.RecoilDirectionSide = Angle(0, 1, 0)
SWEP.VisualRecoilMult = 0.35
SWEP.MaxRecoilBlowback = 0.35
SWEP.MaxRecoilPunch = 0.35
SWEP.Sway = 0.35

SWEP.Malfunction = true
SWEP.MalfunctionMean = 300
SWEP.MalfunctionTakeRound = false

SWEP.Delay = 60 / 1200
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = -2,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.NPCWeaponType = "weapon_smg1"
SWEP.NPCWeight = 65

SWEP.AccuracyMOA = 6
SWEP.HipDispersion = 175
SWEP.MoveDispersion = 45
SWEP.JumpDispersion = 400

SWEP.Primary.Ammo = "pistol"
SWEP.MagID = "vector"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

local path = ")uc_vector/"
local common = ")/arccw_uc/common/"
local rottle = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local rutle = {common .. "movement-pistol-01.ogg", common .. "movement-pistol-02.ogg", common .. "movement-pistol-03.ogg", common .. "movement-pistol-04.ogg"}
local mech = {path .. "mech_1.wav", path .. "mech_2.wav", path .. "mech_3.wav", path .. "mech_4.wav"}
local dry = {path .. "empty1.wav", path .. "empty2.wav"}

SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = nil
SWEP.ShootDrySound = dry
SWEP.FiremodeSound = {path .. "selector1.wav", path .. "selector2.wav"}

SWEP.ShootSound = {
    path .. "fire_45_1.wav",
    path .. "fire_45_2.wav",
    path .. "fire_45_3.wav",
    path .. "fire_45_4.wav"
}
SWEP.ShootSoundSilenced = {
    path .. "fire_45_1_sup.wav",
    path .. "fire_45_2_sup.wav",
    path .. "fire_45_3_sup.wav",
    path .. "fire_45_4_sup.wav"
}

local tail = ")/arccw_uc/common/45acp/"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-45acp-pistol-ext-01.ogg",
    tail .. "fire-dist-45acp-pistol-ext-02.ogg",
    tail .. "fire-dist-45acp-pistol-ext-03.ogg",
    tail .. "fire-dist-45acp-pistol-ext-04.ogg",
    tail .. "fire-dist-45acp-pistol-ext-05.ogg",
    tail .. "fire-dist-45acp-pistol-ext-06.ogg"
}
SWEP.DistantShootSoundIndoors = {
    tail .. "fire-dist-45acp-pistol-int-01.ogg",
    tail .. "fire-dist-45acp-pistol-int-02.ogg",
    tail .. "fire-dist-45acp-pistol-int-03.ogg",
    tail .. "fire-dist-45acp-pistol-int-04.ogg",
    tail .. "fire-dist-45acp-pistol-int-05.ogg",
    tail .. "fire-dist-45acp-pistol-int-06.ogg"
}
SWEP.DistantShootSoundOutdoorsSilenced = {
    common .. "sup-tail-01.ogg",
    common .. "sup-tail-02.ogg",
    common .. "sup-tail-03.ogg",
    common .. "sup-tail-04.ogg",
    common .. "sup-tail-05.ogg",
    common .. "sup-tail-06.ogg",
    common .. "sup-tail-07.ogg",
    common .. "sup-tail-08.ogg",
    common .. "sup-tail-09.ogg",
    common .. "sup-tail-10.ogg"
}
SWEP.DistantShootSoundIndoorsSilenced = {
    common .. "fire-dist-int-pistol-light-01.ogg",
    common .. "fire-dist-int-pistol-light-02.ogg",
    common .. "fire-dist-int-pistol-light-03.ogg",
    common .. "fire-dist-int-pistol-light-04.ogg",
    common .. "fire-dist-int-pistol-light-05.ogg",
    common .. "fire-dist-int-pistol-light-06.ogg"
}

SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

SWEP.MuzzleEffect = "muzzleflash_smg"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
SWEP.ShellScale = 1
SWEP.ShellPitch = 90

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 3

SWEP.SpeedMult = 0.95
SWEP.SightedSpeedMult = 0.87
SWEP.SightTime = 0.28
SWEP.ShootSpeedMult = 0.95

SWEP.BulletBones = {}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-0.88, 0, 2.52),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
    CrosshairInSights = false,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "smg"
SWEP.HoldtypeSights = "smg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

SWEP.ActivePos = Vector(3.4, 0, 1.52)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(3.5, -0.5, -0.4)
SWEP.CrouchAng = Angle(0, 0, -3)

SWEP.CustomizePos = Vector(7.2, -1.951, 0.96)
SWEP.CustomizeAng = Angle(13.659, 34.146, 9.756)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.BarrelOffsetHip = Vector(0, 0, 0)

SWEP.BarrelLength = 14
SWEP.ExtraSightDist = 10

local UP = "models/weapons/tfa_trepang2/upgrades/"

SWEP.AttachmentElements = {
    ["irons"] = {
        VMElements = {
            {
                Model = UP .. "a_t2_vector_iron.mdl",
                BoneMerge = true,
                Offset = {
                    pos = Vector(0, 0, 0),
                    ang = Angle(0, 0, 0),
                }
            }
        },
    },
    ["irons_down"] = {
        VMElements = {
            {
                Model = UP .. "a_t2_vector_irondown.mdl",
                BoneMerge = true,
                Offset = {
                    pos = Vector(0, 0, 0),
                    ang = Angle(0, 0, 0),
                }
            }
        },
    },
    ["vector_grip"] = {
        VMElements = {
            {
                Model = UP .. "a_t2_vector_foregrip.mdl",
                BoneMerge = true,
                Offset = {
                    pos = Vector(0, 0, 0),
                    ang = Angle(0, 0, 0),
                }
            }
        },
    },
    ["laser"] = {
        VMElements = {
            {
                Model = UP .. "a_t2_vector_laser.mdl",
                BoneMerge = true,
                Offset = {
                    pos = Vector(0, 0, 0),
                    ang = Angle(0, 0, 0),
                }
            }
        },
    },
    ["barrel_sd"] = {
        VMElements = {
            {
                Model = UP .. "a_t2_vector_suppressor.mdl",
                BoneMerge = true,
                Offset = {
                    pos = Vector(0, 0, 0),
                    ang = Angle(0, 0, 0),
                }
            }
        },
    },
    ["barrel_carbine"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
        WMBodygroups = {
            {ind = 1, bg = 1},
        },
        AttPosMods = {
            [3] = {
                vpos = Vector(3.455, 0, 0),
            },
        },
    },
    ["barrel_long"] = {
        VMBodygroups = {
            {ind = 1, bg = 2},
        },
        WMBodygroups = {
            {ind = 1, bg = 2},
        },
        AttPosMods = {
            [3] = {
                vpos = Vector(7.802, 0, 0),
            },
        },
    },
    ["mag_13"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
        WMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
    ["mag_drum"] = {
        VMBodygroups = {
            {ind = 2, bg = 2},
        },
        WMBodygroups = {
            {ind = 2, bg = 2},
        },
    },
    ["stock_folded"] = {
        VMBodygroups = {
            {ind = 3, bg = 1},
        },
        WMBodygroups = {
            {ind = 3, bg = 1},
        },
    },
    ["stock_none"] = {
        VMBodygroups = {
            {ind = 3, bg = 2},
        },
        WMBodygroups = {
            {ind = 3, bg = 2},
        },
    },
    ["cal_9mm"] = {
        NameChange = "Korsair C9",
        TrueNameChange = "KRISS Vector 9mm",
    },
    ["cal_10mm"] = {
        NameChange = "Korsair C10",
        TrueNameChange = "KRISS Vector 10mm",
    },
    ["cal_308"] = {
        NameChange = "Korsair C308",
        TrueNameChange = "KRISS Vector .308",
    },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "No Optic",
        Slot = {"optic", "optic_lp", "optic_sniper"},
        Bone = "A_Optic",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, 90),
        },
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_vector_barrel"},
        DefaultAttIcon = Material("", "mips smooth"),
        DefaultAttName = "5.5\" PDW Barrel",
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "A_Suppressor",
        Offset = {
            vpos = Vector(-0.595, 0, 0),
            vang = Angle(0, 0, -90),
        },
        ExcludeFlags = {"vector_sd"},
    },
    {
        PrintName = "Tactical",
        Slot = {"uc_vector_tac", "tac"},
        Bone = "A_LaserFlashlight",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 0, -90),
        },
    },
    {
        PrintName = "Calibre",
        Slot = {"uc_vector_cal"},
        DefaultAttIcon = Material("entities/att/uc_bullets/45acp.png", "mips smooth"),
        DefaultAttName = ".45 ACP",
        DefaultFlags = {"cal_subsonic"},
    },
    {
        PrintName = "Magazine",
        Slot = {"uc_vector_mag"},
        DefaultAttIcon = Material("", "mips smooth"),
        DefaultAttName = "25-Round Magazine",
    },
    {
        PrintName = "Upper Receiver",
        Slot = {"uc_vector_upper"},
        DefaultAttIcon = Material("", "mips smooth"),
        DefaultAttName = "SBR Upper",
    },
    {
        PrintName = "Recoil Mitigator",
        Slot = {"uc_vector_lower"},
        DefaultAttIcon = Material("", "mips smooth"),
        DefaultAttName = "Standard Counterweight",
    },
    {
        PrintName = "Stock",
        DefaultAttName = "Factory Stock",
        DefaultAttIcon = Material("", "mips smooth"),
        Slot = "uc_vector_stock",
    },
    {
        PrintName = "Ammo Type",
        DefaultAttName = "\"FMJ\" Full Metal Jacket",
        DefaultAttIcon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth"),
        Slot = "uc_ammo",
    },
    {
        PrintName = "Powder Load",
        Slot = "uc_powder",
        DefaultAttName = "Standard Load"
    },
    {
        PrintName = "Training Package",
        Slot = "uc_tp",
        DefaultAttName = "Basic Training"
    },
    {
        PrintName = "Internals",
        Slot = "uc_fg",
        DefaultAttName = "Standard Internals"
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "base_idle",
        Time = 10,
    },
    ["idle_empty"] = {
        Source = "empty_idle",
        Time = 6,
    },
    ["idle_iron_empty"] = {
        Source = "iron_empty_idle",
        Time = 6,
    },
    ["idle_sprint"] = {
        Source = "base_sprint",
        Time = 0.6,
    },
    ["idle_sprint_empty"] = {
        Source = "empty_sprint",
        Time = 0.6,
    },
    ["idle_inspect"] = {
        Source = "inspect",
        Time = 5.25,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_release.wav", t = 0.825, c = CHAN_ITEM},
            {s = path .. "mag_out.wav", t = 0.925, c = CHAN_ITEM},
            {s = rutle, t = 1.825},
            {s = path .. "mag_in.wav", t = 3.125, c = CHAN_ITEM},
            {s = path .. "mag_foley.wav", t = 3.5, c = CHAN_ITEM},
        },
    },
    ["idle_inspect_empty"] = {
        Source = "inspect_empty",
        Time = 5.7,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_release.wav", t = 0.825, c = CHAN_ITEM},
            {s = path .. "mag_out_empty.wav", t = 0.925, c = CHAN_ITEM},
            {s = rutle, t = 1.75},
            {s = path .. "mag_in.wav", t = 3.625, c = CHAN_ITEM},
            {s = path .. "mag_foley.wav", t = 3.95, c = CHAN_ITEM},
        },
    },
    ["ready"] = {
        Source = "base_ready",
        Time = 2.05,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.3,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0.02},
            {s = rottle, t = 0.1},
            {s = path .. "mag_foley.wav", t = 0.475, c = CHAN_ITEM},
            {s = path .. "bolt_cycle.wav", t = 1.1, c = CHAN_ITEM},
        },
    },
    ["draw"] = {
        Source = "draw",
        Time = 0.444,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.2,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0.02},
            {s = rottle, t = 0.06},
        },
    },
    ["draw_empty"] = {
        Source = "empty_draw",
        Time = 0.667,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.2,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0.02},
            {s = rottle, t = 0.06},
        },
    },
    ["holster"] = {
        Source = "holster",
        Time = 0.444,
        LHIK = true,
        LHIKIn = 1,
        LHIKOut = 1,
        SoundTable = {
            {s = common .. "cloth_2.ogg", t = 0},
        },
    },
    ["holster_empty"] = {
        Source = "empty_holster",
        Time = 0.444,
        LHIK = true,
        LHIKIn = 1,
        LHIKOut = 1,
        SoundTable = {
            {s = common .. "cloth_2.ogg", t = 0},
        },
    },
    ["fire"] = {
        Source = "fire",
        Time = 0.222,
        ShellEjectAt = 0,
        SoundTable = {
            {s = mech, t = 0.005},
        },
    },
    ["fire_empty"] = {
        Source = "firelast",
        Time = 0.222,
        ShellEjectAt = 0,
        SoundTable = {
            {s = mech, t = 0.005},
        },
    },
    ["fire_iron"] = {
        Source = "iron_fire",
        Time = 0.222,
        ShellEjectAt = 0,
        SoundTable = {
            {s = mech, t = 0.005},
        },
    },
    ["fire_iron_empty"] = {
        Source = "iron_firelast",
        Time = 0.222,
        ShellEjectAt = 0,
        SoundTable = {
            {s = mech, t = 0.005},
        },
    },
    ["fire_dry"] = {
        Source = "dryfire",
        Time = 0.222,
        SoundTable = {
            {s = dry, t = 0.005},
        },
    },
    ["fire_dry_iron"] = {
        Source = "fireirondry",
        Time = 0.222,
        SoundTable = {
            {s = dry, t = 0.005},
        },
    },
    ["bash"] = {
        Source = "base_melee_bash",
        Time = 0.769,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.3,
        SoundTable = {
            {s = rottle, t = 0.015},
        },
    },
    ["bash_empty"] = {
        Source = "base_melee_bash_empty",
        Time = 0.769,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.3,
        SoundTable = {
            {s = rottle, t = 0.015},
        },
    },
    ["reload"] = {
        Source = "reload",
        Time = 2.575,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_release.wav", t = 0.625, c = CHAN_ITEM},
            {s = path .. "mag_out.wav", t = 0.85, c = CHAN_ITEM},
            {s = common .. "magpouch_pull_small.ogg", t = 0.95},
            {s = rutle, t = 1.05},
            {s = path .. "mag_in.wav", t = 1.2, c = CHAN_ITEM},
            {s = path .. "mag_foley.wav", t = 1.425, c = CHAN_ITEM},
            {s = common .. "magpouch_replace_small.ogg", t = 1.625},
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        Time = 3,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_release.wav", t = 0.281, c = CHAN_ITEM},
            {s = path .. "mag_out_empty.wav", t = 0.5, c = CHAN_ITEM},
            {s = common .. "magpouch_pull_small.ogg", t = 0.7},
            {s = rutle, t = 0.9},
            {s = path .. "mag_in.wav", t = 1.25, c = CHAN_ITEM},
            {s = path .. "mag_foley.wav", t = 1.656, c = CHAN_ITEM},
            {s = common .. "magpouch_replace_small.ogg", t = 1.85},
            {s = path .. "bolt_release.wav", t = 2.062, c = CHAN_ITEM},
        },
    },
    ["reload_small"] = {
        Source = "reload",
        Time = 2.4,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_release.wav", t = 0.583, c = CHAN_ITEM},
            {s = path .. "mag_out_small.wav", t = 0.792, c = CHAN_ITEM},
            {s = path .. "mag_small_pull.wav", t = 0.885},
            {s = rutle, t = 0.978},
            {s = path .. "mag_in_small.wav", t = 1.118, c = CHAN_ITEM},
            {s = path .. "mag_small_hit.wav", t = 1.328, c = CHAN_ITEM},
            {s = common .. "magpouch_replace_small.ogg", t = 1.514},
        },
    },
    ["reload_empty_small"] = {
        Source = "reload_empty",
        Time = 2.8,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_release.wav", t = 0.262, c = CHAN_ITEM},
            {s = path .. "mag_out_small_empty.wav", t = 0.467, c = CHAN_ITEM},
            {s = path .. "mag_small_pull.wav", t = 0.653},
            {s = rutle, t = 0.84},
            {s = path .. "mag_in_small.wav", t = 1.167, c = CHAN_ITEM},
            {s = path .. "mag_small_hit.wav", t = 1.546, c = CHAN_ITEM},
            {s = common .. "magpouch_replace_small.ogg", t = 1.727},
            {s = path .. "bolt_release.wav", t = 1.925, c = CHAN_ITEM},
        },
    },
    ["reload_50"] = {
        Source = "reload",
        Time = 3.05,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_release.wav", t = 0.74, c = CHAN_ITEM},
            {s = path .. "mag_out_drum.wav", t = 1.007, c = CHAN_ITEM},
            {s = common .. "magpouch_pull_small.ogg", t = 1.125},
            {s = rutle, t = 1.244},
            {s = path .. "mag_in_drum.wav", t = 1.421, c = CHAN_ITEM},
            {s = path .. "mag_foley.wav", t = 1.688, c = CHAN_ITEM},
            {s = common .. "magpouch_replace_small.ogg", t = 1.925},
        },
    },
    ["reload_empty_50"] = {
        Source = "reload_empty",
        Time = 3.55,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_release.wav", t = 0.333, c = CHAN_ITEM},
            {s = path .. "mag_out_drum.wav", t = 0.592, c = CHAN_ITEM},
            {s = common .. "magpouch_pull_small.ogg", t = 0.828},
            {s = rutle, t = 1.065},
            {s = path .. "mag_in_drum.wav", t = 1.479, c = CHAN_ITEM},
            {s = path .. "mag_small_hit.wav", t = 1.96, c = CHAN_ITEM},
            {s = common .. "magpouch_replace_small.ogg", t = 2.19},
            {s = path .. "bolt_release.wav", t = 2.44, c = CHAN_ITEM},
        },
    },
}

local FG_SOURCE = {
    ["idle"] = "foregrip_idle",
    ["idle_empty"] = "foregrip_empty_idle",
    ["idle_sprint"] = "sprint_magpul",
    ["idle_sprint_empty"] = "sprint_empty_magpul",
    ["idle_inspect"] = "foregrip_inspect",
    ["idle_inspect_empty"] = "foregrip_inspect_EMPTY",
    ["ready"] = "foregrip_ready",
    ["draw"] = "foregrip_draw",
    ["draw_empty"] = "foregrip_draw_empty",
    ["holster"] = "foregrip_holster",
    ["holster_empty"] = "foregrip_holster_empty",
    ["fire"] = "foregrip_fire",
    ["fire_empty"] = "foregrip_fire_last",
    ["fire_iron"] = "foregrip_iron_fire",
    ["fire_iron_empty"] = "foregrip_iron_firelast_b",
    ["fire_dry"] = "foregrip_dryfire",
    ["fire_dry_iron"] = "foregrip_iron_dryfire_b",
    ["bash"] = "foregrip_bash",
    ["bash_empty"] = "foregrip_bash_empty",
    ["reload"] = "foregrip_reload",
    ["reload_empty"] = "foregrip_reload_empty",
    ["reload_small"] = "foregrip_reload",
    ["reload_empty_small"] = "foregrip_reload_empty",
    ["reload_50"] = "foregrip_reload",
    ["reload_empty_50"] = "foregrip_reload_empty",
}

for key, src in pairs(FG_SOURCE) do
    local base = SWEP.Animations[key]

    if base then
        local copy = table.Copy(base)
        copy.Source = src
        SWEP.Animations["fg_" .. key] = copy
    end
end

local RELOAD_SUFFIX = {
    {"mag_13", "_small"},
    {"mag_drum", "_50"},
}

local SETTLE = 8
local SLAM = 1.35
local HORIZONTAL = 0.72
local SIDE = 1.45
local DISP = 0.72

local function hasElement(wep, name)
    for _, v in ipairs(wep:GetActiveElements()) do
        if v == name then return true end
    end

    return false
end

local function settle(wep)
    return math.Clamp(((wep:GetBurstCount() or 0) - 1) / SETTLE, 0, 1)
end

local function tune(wep)
    local cal = wep:GetBuff_Override("SuperVTune", 1) or 1
    local gain = wep:GetBuff_Override("SuperVGain", 1) or 1

    return math.Clamp(cal * gain, 0, 1.25)
end

local LASER = {
    {
        LaserBone = "A_LaserFlashlight",
        LaserColor = Color(255, 32, 32),
        LaserStrength = 1,
    }
}

SWEP.Hook_Think = function(wep)
    wep.Lasers = hasElement(wep, "laser") and LASER or nil
end

SWEP.Hook_TranslateAnimation = function(wep, key)
    if wep:GetBuff_Override("VectorForegrip") then return "fg_" .. key end
end

SWEP.Hook_SelectReloadAnimation = function(wep, anim)
    local suffix

    for _, v in ipairs(RELOAD_SUFFIX) do
        if hasElement(wep, v[1]) then
            suffix = v[2]
            break
        end
    end

    if !suffix then return end

    local base = string.find(anim, "_empty", 1, true) and "reload_empty" or "reload"
    local out = base .. suffix

    if wep.Animations[out] then return out end
end

SWEP.Hook_ModifyRecoil = function(wep, rec)
    local k = settle(wep)
    local t = tune(wep)

    -- Recoil still has to remain non-zero because ArcCW also uses it to drive
    -- lateral view punch. RecoilDirection removes the vertical component.
    rec.Recoil = rec.Recoil * Lerp(k, SLAM, Lerp(t, 1, HORIZONTAL))
    rec.RecoilSide = rec.RecoilSide * Lerp(k, 1, Lerp(t, 1, SIDE))
    rec.VisualRecoilMul = rec.VisualRecoilMul * Lerp(k, SLAM, Lerp(t, 1, 0.45))

    return rec
end

SWEP.Hook_ModDispersion = function(wep, hip)
    return hip * Lerp(settle(wep), 1.15, Lerp(tune(wep), 1, DISP))
end

local BASE_DESC = SWEP.Trivia_Desc

SWEP.Hook_DescChange = function(wep, desc)
    local k = settle(wep)
    local t = tune(wep)
    local state

    if k < 0.05 then
        state = "at rest, first shot unbuffered"
    elseif k < 0.5 then
        state = "moving, muzzle settling"
    elseif k < 0.95 then
        state = "in rhythm, rise mostly cancelled"
    else
        state = "fully cycled, rise cancelled"
    end

    local match

    if t >= 0.95 then
        match = "matched to the load"
    elseif t >= 0.7 then
        match = "slightly light for the load"
    elseif t >= 0.4 then
        match = "poorly matched to the load"
    else
        match = "overwhelmed by the load"
    end

    return BASE_DESC .. "\n\nCounterweight: " .. state .. ", " .. match .. "."
end


local HAND = "ValveBiped.Bip01_L_Hand"

local function lhikModel(wep)
    local fallback

    for i, k in pairs(wep.Attachments) do
        if !k.Installed then continue end

        local ele = k.VElement

        if !ele then continue end

        local mdl = ele.Model

        if !IsValid(mdl) or !mdl:LookupBone(HAND) then continue end

        if wep:GetBuff_Stat("LHIK", i) then return mdl end

        fallback = fallback or mdl
    end

    return fallback
end

local function lhikDelta(wep)
    local tl = wep.LHIKTimeline

    if !tl then return 1 end

    local now = UnPredictedCurTime()
    local start = wep.LHIKStartTime or 0
    local idx

    for i, k in ipairs(tl) do
        if k and k.t and k.t + start > now then
            idx = i
            break
        end
    end

    local a, b

    if idx == 1 then
        a, b = {t = 0, lhik = 0}, tl[1]
    elseif idx then
        a, b = tl[idx - 1], tl[idx]
    else
        a = tl[#tl]
        b = {t = wep.LHIKEndTime or a.t, lhik = a.lhik}
    end

    local lo = math.Clamp(a.lhik or 1, 0, 1)
    local hi = math.Clamp(b.lhik or 1, 0, 1)
    local span = b.t - a.t

    if span == 0 or span != span or span == math.huge or span == -math.huge then
        return hi
    end

    local f = ((now - start) - a.t) / span

    if f != f then return hi end

    f = math.Clamp(-(f ^ 2) + (f * 2), 0, 1)

    return math.Clamp(Lerp(f, lo, hi), 0, 1)
end

function SWEP:DoLHIK()
    local owner = self:GetOwner()

    if !IsValid(owner) then return end

    local vm = owner:GetViewModel()

    if !IsValid(vm) then return end

    local mdl = lhikModel(self)

    if !mdl then
        if self.BaseClass and self.BaseClass.DoLHIK then
            return self.BaseClass.DoLHIK(self)
        end

        return
    end

    mdl:SetupBones()

    local delta = lhikDelta(self)

    for _, bone in ipairs(ArcCW.LHIKBones) do
        local vmbone = vm:LookupBone(bone)
        local atbone = mdl:LookupBone(bone)

        if !vmbone or !atbone then continue end

        local vmtr = vm:GetBoneMatrix(vmbone)
        local attr = mdl:GetBoneMatrix(atbone)

        if !vmtr or !attr then continue end

        local out = Matrix()

        out:SetTranslation(LerpVector(delta, vmtr:GetTranslation(), attr:GetTranslation()))
        out:SetAngles(LerpAngle(delta, vmtr:GetAngles(), attr:GetAngles()))

        vm:SetBoneMatrix(vmbone, out)
    end
end
