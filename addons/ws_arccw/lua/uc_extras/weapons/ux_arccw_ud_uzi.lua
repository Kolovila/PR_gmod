local SWEP = { Primary = {}, Secondary = {} }

SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "1Urban Decay"
SWEP.AdminOnly = false
SWEP.UseHands = true

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
SWEP.ShellScale = 1
SWEP.ShellPitch = 100
SWEP.ShellSounds = ArcCW.PistolShellSoundsTable

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.CamAttachment = 3
SWEP.TracerNum = 1
SWEP.TracerCol = Color(25, 255, 25)
SWEP.TracerWidth = 2

SWEP.PrintName = "IAL-9"

SWEP.TrueName = "Uzi"

SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = "Revolutionary submachine gun developed to arm a young State of Israel following the Second World War. Its ergonomic design, low cost, reliability, and great handling made it popular among militaries, police forces, and private security firms worldwide.\n\nBoasts excellent recoil control partially due to a below average cyclic rate. Good for hip firing in close quarters."
SWEP.Trivia_Manufacturer = "IAL Metal Industries"
SWEP.Trivia_Calibre = "9x19mm Parabellum"
SWEP.Trivia_Mechanism = "Open Bolt"
SWEP.Trivia_Country = "Israel"
SWEP.Trivia_Year = 1950

SWEP.Slot = 2

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Israeli Military Industries"
end

SWEP.ViewModel = "models/weapons/arccw/c_ud_uzi_ux.mdl"
SWEP.WorldModel = "models/weapons/arccw/c_ud_uzi_ux.mdl"
SWEP.ViewModelFOV = 70
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.Damage = ArcCW.UC.StdDmg["9mm"].max
SWEP.DamageMin = ArcCW.UC.StdDmg["9mm"].min
SWEP.Penetration = ArcCW.UC.StdDmg["9mm"].pen

SWEP.RangeMin = 15
SWEP.Range = 100

SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 400
SWEP.PhysBulletMuzzleVelocity = 400

SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 32
SWEP.ExtendedClipSize = 40
SWEP.ReducedClipSize = 16

SWEP.Recoil = 0.28
SWEP.RecoilSide = 0.35

SWEP.RecoilRise = 0.2
SWEP.RecoilPunch = 1
SWEP.VisualRecoilMult = 1
SWEP.MaxRecoilBlowback = 1
SWEP.MaxRecoilPunch = 0.6
SWEP.RecoilPunchBack = 1.5

SWEP.Sway = 0.3

SWEP.TriggerDelay = true

SWEP.Delay = 60 / 700
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2,
        Mult_TriggerDelayTime = 2,
    },
    {
        Mode = 1,
        Mult_TriggerDelayTime = 1,
    },
    {
        Mode = 0,
    },
}

SWEP.ShootPitch = 100
SWEP.ShootVol = 120

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

SWEP.NPCWeaponType = "weapon_smg1"
SWEP.NPCWeight = 60

SWEP.AccuracyMOA = 6
SWEP.HipDispersion = 400
SWEP.MoveDispersion = 100
SWEP.JumpDispersion = 1000

SWEP.Primary.Ammo = "pistol"
SWEP.MagID = "uzi"

SWEP.HeatCapacity = 75
SWEP.HeatDissipation = 15
SWEP.HeatDelayTime = 3

SWEP.MalfunctionMean = 200
SWEP.MalfunctionTakeRound = false

SWEP.SpeedMult = 0.95
SWEP.SightedSpeedMult = 0.75
SWEP.SightTime = 0.3
SWEP.ShootSpeedMult = 0.95

SWEP.BarrelLength = 24
SWEP.ExtraSightDist = 7

SWEP.HolsterPos = Vector(0.5, -2, 1)
SWEP.HolsterAng = Angle(-8.5, 8, -10)

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.IronSightStruct = {
     Pos = Vector(-2.869, -6, 1.95),
     Ang = Angle(0, 0, 0),
     Magnification = 1,
     SwitchToSound = "",
     ViewModelFOV = 55,
}

SWEP.ActivePos = Vector(0.4, -1.9, 1.4)
SWEP.ActiveAng = Angle(0, 0, -3)

SWEP.CustomizePos = Vector(5, -2, -2)
SWEP.CustomizeAng = Angle(15, 25, 0)

SWEP.CrouchPos = Vector(-3, -3, 0)
SWEP.CrouchAng = Angle(0, 0, -30)

SWEP.BarrelOffsetHip = Vector(4, 0, -4)

SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-16, 4, -3),
    ang        =    Angle(-12, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale = 1
}

local path = ")weapons/arccw_ud/uzi/"
local path1 = ")weapons/arccw_ud/glock/"
local common = ")/arccw_uc/common/"
SWEP.ShootSoundSilenced = path1 .. "fire_supp.ogg"
SWEP.ShootDrySound = path .. "dryfire.ogg"

SWEP.ShootSound = {
    path .. "fire-01.ogg",
    path .. "fire-02.ogg",
    path .. "fire-03.ogg",
    path .. "fire-04.ogg",
    path .. "fire-05.ogg",
    path .. "fire-06.ogg"
}

local tail = ")/arccw_uc/common/9x19/"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-9x19-smg-ext-01.ogg",
    tail .. "fire-dist-9x19-smg-ext-02.ogg",
    tail .. "fire-dist-9x19-smg-ext-03.ogg",
    tail .. "fire-dist-9x19-smg-ext-04.ogg",
    tail .. "fire-dist-9x19-smg-ext-05.ogg",
    tail .. "fire-dist-9x19-smg-ext-06.ogg"
}
SWEP.DistantShootSoundIndoors = {
    common .. "fire-dist-int-pistol-01.ogg",
    common .. "fire-dist-int-pistol-02.ogg",
    common .. "fire-dist-int-pistol-03.ogg",
    common .. "fire-dist-int-pistol-04.ogg",
    common .. "fire-dist-int-pistol-05.ogg",
    common .. "fire-dist-int-pistol-06.ogg"
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
SWEP.DistantShootSoundIndoorsVolume = 0.5
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

SWEP.BulletBones = {
    [1] = "uzi_b1", [2] = "uzi_b2", [3] = "uzi_b3", [4] = "uzi_b4"
}

SWEP.AttachmentElements = {

    ["ud_uzi_mag_20"] = {
        VMBodygroups = {{ind = 2, bg = 1}},
    },
    ["ud_uzi_mag_40"] = {
        VMBodygroups = {{ind = 2, bg = 2}},
    },
    ["ud_uzi_mag_32_rifle"] = {
        VMBodygroups = {{ind = 2, bg = 4}},
    },
    ["ud_uzi_mag_32_762"] = {
        VMBodygroups = {{ind = 2, bg = 6}},
    },
    ["ud_uzi_mag_75_762"] = {
        VMBodygroups = {{ind = 2, bg = 7}},
    },
    ["ud_uzi_mag_100"] = {
        VMBodygroups = {{ind = 2, bg = 3}},
    },
    ["ud_uzi_mag_45_10"] = {
        VMBodygroups = {{ind = 2, bg = 1}},
    },
    ["ud_uzi_mag_45_22"] = {
        VMBodygroups = {{ind = 2, bg = 2}},
    },

    ["ud_uzi_rail_optic"] = {
        VMBodygroups = {{ind = 4, bg = 2}},
    },

    ["ud_uzi_clamp"] = {
        VMBodygroups = {{ind = 6, bg = 1}},
    },

    ["ud_uzi_rail_fg"] = {
        VMBodygroups = {{ind = 5, bg = 1}},
    },
    ["ud_uzi_rail_fg_micro"] = {
        VMBodygroups = {{ind = 5, bg = 2}},
    },
    ["ud_uzi_stock_wood"] = {
        VMBodygroups = {{ind = 3, bg = 2}},
    },
    ["ud_uzi_stock_polymer"] = {
        VMBodygroups = {{ind = 3, bg = 3}},
    },
    ["ud_uzi_stock_folded"] = {
        VMBodygroups = {{ind = 3, bg = 1}},
    },
    ["ud_uzi_stock_remove"] = {
        VMBodygroups = {{ind = 3, bg = 4}},
    },

    ["ud_uzi_body_carbine"] = {
        VMBodygroups = {{ind = 1, bg = 1}},
        NameChange = "IAL-C9",
        TrueNameChange = "Uzi Carbine",
        AttPosMods = {
            [4] = {
                vpos = Vector(-0.2, 0.5, 20.8),
            },
        },
    },
    ["ud_uzi_body_mini"] = {
        VMBodygroups = {{ind = 1, bg = 2}},
        NameChange = "IAL-S9",
        TrueNameChange = "Mini Uzi",
        AttPosMods = {
            [4] = {
                vpos = Vector(-0.2, 0.5, 11.8),
            },
        },
    },
    ["ud_uzi_body_micro"] = {
        VMBodygroups = {{ind = 1, bg = 3},{ind = 4, bg = 1},{ind = 3, bg = 4}},
        NameChange = "IAL-M9",
        TrueNameChange = "Micro Uzi",
        Override_IronSightStruct = {
            Pos = Vector(-2.869, 3, 1.95),
            Ang = Angle(-0, 0.035, 0),
            Magnification = 1,
            CrosshairInSights = false
        },
        AttPosMods = {
            [1] = {
                vpos = Vector(-0.2, -1.8, -1.5),
            },
            [4] = {
                vpos = Vector(-0.2, 0.3, 7.8),
            },
            [6] = {
                vpos = Vector(-0.25, 1.4, 6),
                vang = Angle(90, 0, -90),
            },
        },
    },
    ["ud_uzi_body_micro_railed"] = {
        VMBodygroups = {{ind = 1, bg = 3},{ind = 4, bg = 1},{ind = 3, bg = 4}, {ind = 5, bg = 2}},
        NameChange = "IAL-M9 Tactical",
        TrueNameChange = "Micro Uzi Tactical",
        Override_IronSightStruct = {
            Pos = Vector(-2.869, 3, 1.95),
            Ang = Angle(-0, 0.035, 0),
            Magnification = 1,
            CrosshairInSights = false
        },
        AttPosMods = {
            [1] = {
                vpos = Vector(-0.2, -1.8, -1.5),
            },
            [4] = {
                vpos = Vector(-0.2, 0.3, 7.8),
            },
            [5] = {
                vpos = Vector(0, 1.557, 5.669),
            },
            [6] = {
                vpos = Vector(-0.25, 1.4, 6),
                vang = Angle(90, 0, -90),
            },
        },
    },
    ["ud_uzi_body_civvy"] = {
        VMBodygroups = {{ind = 1, bg = 4}},
        NameChange = "IAL-C9 Model GB",
        TrueNameChange = "Uzi Action-B",
        AttPosMods = {
            [4] = {
                vpos = Vector(-0.2, 0.5, 23.8),
            },
        },
    },
    ["ud_uzi_body_sd"] = {
        VMBodygroups = {{ind = 1, bg = 6}},
        NameChange = "IAL-C9 SD",
        TrueNameChange = "Uzi SD",
    },
    ["ud_uzi_body_rifle"] = {
        VMBodygroups = {{ind = 1, bg = 5}, {ind = 0, bg = 1}},
        NameChange = "IAL-C9 \"Big Boy\"",
        TrueNameChange = "Uzi \"Big Boy\"",
        AttPosMods = {
            [1] = {
                vpos = Vector(-0.201, -1.961, 0),
            },
        },
        Override_IronSightStruct = {
            Pos = Vector(-2.951, -5.89, 0.959),
            Ang = Angle(0, 0, 0),
            Magnification = 1,
            SwitchToSound = "",
            ViewModelFOV = 55,
        },
    },
}

SWEP.Hook_ModifyBodygroups = function(wep, data)
    local vm = data.vm
    if !IsValid(vm) then return end
    local barrel = wep.Attachments[2].Installed
    if barrel == "ud_uzi_body_micro" then
        if wep.Attachments[1].Installed then
            vm:SetBodygroup(4, 3)
        end
        if wep.Attachments[6].Installed then
            vm:SetBodygroup(6, 0)
            vm:SetBodygroup(5, 2)
        end
    end
end
SWEP.Hook_ModifyBodygroups = function(wep, data)
    local vm = data.vm
    if !IsValid(vm) then return end
    local barrel = wep.Attachments[2].Installed
    if barrel == "ud_uzi_body_micro_railed" then
        if wep.Attachments[1].Installed then
            vm:SetBodygroup(4, 3)
        end
        if wep.Attachments[7].Installed then
            vm:SetBodygroup(6, 0)
        end
    end
end

SWEP.Hook_Think = ArcCW.UC.ADSReload

SWEP.Animations = {
    ["ready"] = {
        Source = "fix",
        Time = 40 / 30,
        ShellEjectAt = false,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0},
            {s = common .. "rattle.ogg", t = 0.2},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.15},
            {s = path .. "chback.ogg",         t = 0.3, c = ci},
            {s = path .. "chforward.ogg",         t = 0.65, c = ci},
        },
        ProcDraw = true,
    },
    ["idle"] = {
        Source = "idle",
    },
    ["idle_empty"] = {
        Source = "idle_empty",
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = ArcCW.UC.DrawSounds,
    },
    ["draw_empty"] = {
        Source = "draw_empty",
        SoundTable = ArcCW.UC.DrawSounds,
    },
    ["holster"] = {
        Source = "holster",
        Time = 0.25,
        SoundTable = ArcCW.UC.HolsterSounds,
    },
    ["holster_empty"] = {
        Source = "holster_empty",
        Time = 0.25,
        SoundTable = ArcCW.UC.HolsterSounds,
    },
    ["fire"] = {
        Source = "fire",
        Time = 13 / 30,
        ShellEjectAt = 0.03,
        SoundTable = {{ s = {path .. "mech-01.ogg", path .. "mech-02.ogg"}, t = 0, v = 0.25 }},
    },
    ["fire_iron"] = {
        Source = "fire",
        Time = 13 / 30,
        ShellEjectAt = 0.03,
        SoundTable = {{ s = {path .. "mech-01.ogg", path .. "mech-02.ogg"}, t = 0 }},
    },
    ["fire_empty"] = {
        Source = "fire_empty",
        Time = 13 / 30,
        ShellEjectAt = 0.03,
        SoundTable = {{ s = path .. "chforward.ogg", t = 0 }},
    },

    ["trigger"] = {
        Source = "idle",
        Time = 0.025,
        SoundTable = {
            {s = path .. "prefire.ogg",         t = 0, c = ci},
        },
    },
    ["trigger_empty"] = {
        Source = "idle",
        Time = 0,
        SoundTable = nil,
    },

    ["fix"] = {
        Source = "fix",
        Time = 40 / 30,
        ShellEjectAt = false,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.15},
            {s = path .. "chback.ogg",         t = 0.3, c = ci},
            {s = path .. "chforward.ogg",         t = 0.65, c = ci},
        },
    },
    ["fix_empty"] = {
        Source = "fix_empty",
        Time = 40 / 30,
        ShellEjectAt = false,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.15},
            {s = path .. "chback.ogg",         t = 0.3, c = ci},
            {s = path .. "chforward.ogg",         t = 0.65, c = ci},
        },
    },
    ["cycle"] = {
        Source = "fix",
        Time = 40 / 30,
        ShellEjectAt = false,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.15},
            {s = path .. "chback.ogg",         t = 0.3, c = ci},
            {s = path .. "chforward.ogg",         t = 0.65, c = ci},
        },
    },
    ["cycle_empty"] = {
        Source = "fix_empty",
        Time = 40 / 30,
        ShellEjectAt = false,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.15},
            {s = path .. "chback.ogg",         t = 0.3, c = ci},
            {s = path .. "chforward.ogg",         t = 0.65, c = ci},
        },
    },

    ["fix_micro"] = {
        Source = "fix_micro",
        Time = 40 / 30,
        ShellEjectAt = false,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.15},
            {s = path .. "chback.ogg",         t = 0.3, c = ci},
            {s = path .. "chforward.ogg",         t = 0.65, c = ci},
        },
    },
    ["fix_empty_micro"] = {
        Source = "fix_empty_micro",
        Time = 40 / 30,
        ShellEjectAt = false,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.15},
            {s = path .. "chback.ogg",         t = 0.3, c = ci},
            {s = path .. "chforward.ogg",         t = 0.65, c = ci},
        },
    },

    ["cycle_micro"] = {
        Source = "fix_micro",
        Time = 40 / 30,
        ShellEjectAt = false,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.15},
            {s = path .. "chback.ogg",         t = 0.3, c = ci},
            {s = path .. "chforward.ogg",         t = 0.65, c = ci},
        },
    },
    ["cycle_empty_micro"] = {
        Source = "fix_empty_micro",
        Time = 40 / 30,
        ShellEjectAt = false,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.15},
            {s = path .. "chback.ogg",         t = 0.3, c = ci},
            {s = path .. "chforward.ogg",         t = 0.65, c = ci},
        },
    },

    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 67 / 30,
        MinProgress = 1.2,
        LastClip1OutTime = 67 / 30,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = common .. "magpouch.ogg", t = 0.025},
            {s = path .. "magout.ogg",        t = 0.25, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = path .. "magin.ogg",         t = 0.55, c = ci},
            {s = common .. "magpouchin.ogg", t = 1.35, v = .35},
            {s = common .. "shoulder.ogg",  t = 1.75},
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 90 / 30,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = path .. "magout.ogg",        t = 0.4, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = common .. "magpouch.ogg", t = 0.85},
            {s = common .. "magdrop_smg.ogg",  t = 1.0},
            {s = path .. "magin.ogg",         t = 1.1, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 1.25},
            {s = path .. "chback.ogg",         t = 1.935, c = ci},
            {s = path .. "chforward.ogg",         t = 2.15, c = ci},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },
    ["reload_rifle"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 67 / 30,
        MinProgress = 1.2,
        LastClip1OutTime = 67 / 30,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = common .. "magpouch.ogg", t = 0.025},
            {s = "weapons/misc/uzi_rifle_magout.ogg",        t = 0.25, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = "weapons/misc/uzi_rifle_magin.ogg",         t = 0.55, c = ci},
            {s = common .. "magpouchin.ogg", t = 1.35, v = .35},
            {s = common .. "shoulder.ogg",  t = 1.75},
        },
    },
    ["reload_empty_rifle"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 90 / 30,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = "weapons/misc/uzi_rifle_magout.ogg",        t = 0.4, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = common .. "magpouch.ogg", t = 0.85},
            {s = common .. "rifle_magdrop.ogg",  t = 1.0},
            {s = "weapons/misc/uzi_rifle_magin.ogg",         t = 1.1, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 1.25},
            {s = path .. "chback.ogg",         t = 1.935, c = ci},
            {s = path .. "chforward.ogg",         t = 2.15, c = ci},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },
    ["reload_762drum"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 67 / 30,
        MinProgress = 1.2,
        LastClip1OutTime = 67 / 30,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = common .. "magpouch.ogg", t = 0.025},
            {s = "weapons/misc/uzi_762_drumout.ogg",        t = 0.25, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = "weapons/misc/uzi_762_drumin.ogg",         t = 0.55, c = ci},
            {s = common .. "magpouchin.ogg", t = 1.35, v = .35},
            {s = common .. "shoulder.ogg",  t = 1.75},
        },
    },
    ["reload_empty_762drum"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 90 / 30,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = "weapons/misc/uzi_762_drumout.ogg",        t = 0.4, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = common .. "magpouch.ogg", t = 0.85},
            {s = common .. "rifle_magdrop.ogg",  t = 1.0},
            {s = "weapons/misc/uzi_762_drumin.ogg",         t = 1.1, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 1.25},
            {s = path .. "chback.ogg",         t = 1.935, c = ci},
            {s = path .. "chforward.ogg",         t = 2.15, c = ci},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },

    ["reload_16"] = {
        Source = "reload_16",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 67 / 30,
        MinProgress = 1.2,
        LastClip1OutTime = 67 / 30,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = common .. "magpouch.ogg", t = 0.025},
            {s = path .. "magout.ogg",        t = 0.25, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = path .. "magin.ogg",         t = 0.55, c = ci},
            {s = common .. "magpouchin.ogg", t = 1.35, v = .35},
            {s = common .. "shoulder.ogg",  t = 1.75},
        },
    },
    ["reload_empty_16"] = {
        Source = "reload_empty_16",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 90 / 30,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = path .. "magout.ogg",        t = 0.4, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = common .. "magpouch.ogg", t = 0.85},
            {s = common .. "magdrop_smg.ogg",  t = 1.0},
            {s = path .. "magin.ogg",         t = 1.1, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 1.25},
            {s = path .. "chback.ogg",         t = 1.947, c = ci},
            {s = path .. "chforward.ogg",         t = 2.15, c = ci},
            {s = common .. "shoulder.ogg",  t = 2.45},
        },
    },

    ["reload_41"] = {
        Source = "reload_41",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 67 / 30,
        MinProgress = 1.2,
        LastClip1OutTime = 67 / 30,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.6,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = common .. "magpouch.ogg", t = 0.025},
            {s = path .. "magout.ogg",        t = 0.35, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = path .. "magin.ogg",         t = 0.65, c = ci},
            {s = common .. "magpouchin.ogg", t = 1.35, v = .35},
            {s = common .. "shoulder.ogg",  t = 1.75},
        },
    },
    ["reload_empty_41"] = {
        Source = "reload_empty_41",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 90 / 30,
        MinProgress = 2.2,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = path .. "magout.ogg",        t = 0.4, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = common .. "magpouch.ogg", t = 0.85},
            {s = common .. "magdrop_smg.ogg",  t = 1.0},
            {s = path .. "magin.ogg",         t = 1.1, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 1.25},
            {s = path .. "chback.ogg",         t = 1.947, c = ci},
            {s = path .. "chforward.ogg",         t = 2.15, c = ci},
            {s = common .. "shoulder.ogg",  t = 2.6},
        },
    },

    ["reload_100"] = {
        Source = "reload_100",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 67 / 30,
        MinProgress = 1.6,
        LastClip1OutTime = 1,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = path .. "magout.ogg",        t = 0.25, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.75},
            {s = path .. "magin.ogg",         t = 1.15, c = ci},
            {s = common .. "cloth_4.ogg",  t = 1.65},
            {s = common .. "shoulder.ogg",  t = 1.95},
        },
    },
    ["reload_empty_100"] = {
        Source = "reload_empty_100",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Time = 90 / 30,
        MinProgress = 2.4,
        LastClip1OutTime = 1.8,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.3,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.55,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = path .. "magout.ogg",        t = 0.25, c = ci},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.25},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.75},
            {s = common .. "magdrop.ogg",  t = 1.0},
            {s = path .. "magin.ogg",         t = 1.15, c = ci},
            {s = common .. "cloth_4.ogg",  t = 1.65},
            {s = path .. "chback.ogg",         t = 2.0, c = ci},
            {s = path .. "chforward.ogg",         t = 2.25, c = ci},
            {s = common .. "shoulder.ogg",  t = 2.7},
        },
    },
}

SWEP.AutosolveSourceSeq = "idle"

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic_lp","optic", "optic_sniper"},
        Bone = "uzi_parent",
        Offset = {
            vpos = Vector(-0.2, -1.55, -0.5),
            vang = Angle(90, 0, -90),
        },
        InstalledEles = {"ud_uzi_rail_optic"}
    },
    {
        PrintName = "Barrel",
        DefaultAttName = "10\" Standard Barrel",
        DefaultAttIcon = Material("entities/att/acwatt_ud_uzi_body.png", "smooth mips"),
        Slot = "ud_uzi_frame",
        Bone = "uzi_parent",
        Offset = {
            vpos = Vector(2.6, -3.7, -17.3),
            vang = Angle(90, 0, -90),
        },
        ExcludeFlags = {"ud_uzi_mag_32_rifle"},
    },
    {
        PrintName = "Caliber",
        DefaultAttName = "9x19mm Parabellum",
        DefaultAttIcon = Material("entities/att/uc_bullets/9x19.png", "smooth mips"),
        Slot = "ud_uzi_caliber",
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "uzi_parent",
        Offset = {
            vpos = Vector(-0.2, 0.5, 14.8),
            vang = Angle(90, 0, -90),
        },
        ExcludeFlags = {"ud_uzi_body_sd"}
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip"},
        Bone = "uzi_parent",
        MergeSlots = {6},
        Offset = {
            vpos = Vector(-0.2, 1.85, 6.9),
            vang = Angle(90, 0, -90),
        },
        ExcludeFlags = {"micro"}
    },
    {
        PrintName = "M203 slot",
        Slot = {"uc_ubgl", "ubgl"},
        Bone = "uzi_parent",
        Offset = {
            vpos = Vector(-0.2, 0.520, 6.9),
            vang = Angle(90, 0, -90),
        },
        Hidden = true,
    },
    {
        PrintName = "Tactical",
        Slot = {"tac_pistol"},
        Bone = "uzi_parent",
        Offset = {
            vpos = Vector(-1.35, 0.9,5.8),
            vang = Angle(90, 0, 180),
        },
        InstalledEles = {"ud_uzi_clamp"}
    },
    {
        PrintName = "Stock",
        Slot = {"ud_uzi_stock"},
        DefaultAttName = "Folding Stock",
        DefaultAttIcon = Material("entities/att/acwatt_ud_uzi_stock.png", "smooth mips"),
        ExcludeFlags = {"micro"},
    },
    {
        PrintName = "Magazine",
        Slot = {"ud_uzi_mag"},
        DefaultAttName = "32-Round Mag",
        DefaultAttIcon = Material("entities/att/acwatt_ud_uzi_mag_32.png", "smooth mips"),
        ExcludeFlags = {"ud_uzi_mag_32_rifle", "ud_uzi_mag_32_762", "ud_uzi_mag_75_762"},
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
    {
        PrintName = "Charm",
        Slot = {"charm", "fml_charm"},
        FreeSlot = true,
        Bone = "uzi_parent",
        Offset = {
            vpos = Vector(0.4, 1.3, 2.3),
            vang = Angle(90, 0, -90),
        },
    },
}

UCExtras_RegisterWeapon(SWEP, "arccw_ud_uzi")
