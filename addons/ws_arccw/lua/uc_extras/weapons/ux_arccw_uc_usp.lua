local SWEP = { Primary = {}, Secondary = {} }

SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "5Urban One-offs"
SWEP.AdminOnly = false
SWEP.UseHands = true

SWEP.MuzzleEffect = "muzzleflash_pistol"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
SWEP.ShellScale = 1
SWEP.ShellPitch = 90

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.CamAttachment = 5
SWEP.TracerNum = 1
SWEP.TracerWidth = 1
SWEP.ShootPitch = 100

SWEP.PrintName = "P93"

SWEP.TrueName = "USP Tactical"

SWEP.Trivia_Class = "Pistol"
SWEP.Trivia_Desc = [[Versatile handgun designed for foreign and domestic law enforcement. It discards the ambitions of the P7 pattern for a more conventional form which has proved popular. This "Tactical" variant has a threaded barrel designed for sound suppressors.

Can be chambered for a variety of calibers, allowing its trademark performance to be fine-tuned for a number of roles.]]
SWEP.Trivia_Manufacturer = "Crowdley & Nelson"
SWEP.Trivia_Calibre = ".45 ACP"
SWEP.Trivia_Mechanism = "Short Recoil"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1993

SWEP.Slot = 1

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Heckler & Koch"
end

SWEP.ViewModel = "models/weapons/arccw/c_uc_usp_ux.mdl"
SWEP.WorldModel = "models/weapons/arccw/c_uc_usp_ux.mdl"
SWEP.ViewModelFOV = 66
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER

SWEP.Damage = 45
SWEP.DamageMin = 15
SWEP.RangeMin = 10
SWEP.Range = 80
SWEP.Penetration = 9
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 315
SWEP.PhysBulletMuzzleVelocity = 315

SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults

SWEP.PhysTracerProfile = 7
SWEP.TracerNum = 0

SWEP.MalfunctionJam = true
SWEP.MalfunctionPostFire = false
SWEP.MalfunctionTakeRound = true

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 12

SWEP.Recoil = 1.25
SWEP.RecoilSide = 0.75

SWEP.RecoilRise = 0.25
SWEP.VisualRecoilMult = 1.0
SWEP.MaxRecoilBlowback = .5
SWEP.MaxRecoilPunch = .8

SWEP.Sway = 1

SWEP.Delay = 60 / 420
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.ShootPitch = 100
SWEP.ShootVol = 120

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

SWEP.NPCWeaponType = "weapon_pistol"
SWEP.NPCWeight = 70

SWEP.AccuracyMOA = 5
SWEP.HipDispersion = 500
SWEP.MoveDispersion = 250
SWEP.JumpDispersion = 1000

SWEP.Primary.Ammo = "pistol"
SWEP.MagID = "m1911"

SWEP.SpeedMult = 0.965
SWEP.SightedSpeedMult = 0.875
SWEP.SightTime = 0.25
SWEP.ShootSpeedMult = 1

SWEP.BarrelLength = 8
SWEP.ExtraSightDist = 7

SWEP.HolsterPos = Vector(0.3, 3, 1.6)
SWEP.HolsterAng = Angle(-14, 0, -0.5)

SWEP.SprintPos = Vector(0.3, 3, 1)
SWEP.SprintAng = Angle(-5, 15, -20)

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "pistol"
SWEP.HoldtypeSights = "revolver"

SWEP.IronSightStruct = {
     Pos = Vector(-2.29, 10, 1.5),
     Ang = Angle(0.15, 0.07, 5.5),
     Magnification = 1,
     SwitchToSound = "",
}

SWEP.ActivePos = Vector(0.3, 3, 1.3)
SWEP.ActiveAng = Angle(0, 0, -0.5)

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(-2, 0, 0)
SWEP.CrouchAng = Angle(0, 0, -8)

SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-8.7, 2.5, -4.2),
    ang        =    Angle(-6, -6, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
}

local path = ")weapons/arccw_uc_usp/"
local path1 = ")weapons/arccw_ur/1911/"
local common = ")/arccw_uc/common/"
local rottle = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}

SWEP.ShootSound = {
    path .. "fire-01.ogg",
    path .. "fire-02.ogg",
    path .. "fire-03.ogg",
    path .. "fire-04.ogg",
    path .. "fire-05.ogg",
    path .. "fire-06.ogg"
}
SWEP.ShootSoundSilenced = {
    path .. "fire-sup-01.ogg",
    path .. "fire-sup-02.ogg",
    path .. "fire-sup-03.ogg",
    path .. "fire-sup-04.ogg",
    path .. "fire-sup-05.ogg",
    path .. "fire-sup-06.ogg"
}
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = common .. "sup_tail.ogg"
SWEP.ShootDrySound = path .. "dryfire.ogg"

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
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

SWEP.BulletBones = {
    [1] = "Bullet1",    [2] = "Bullet2",    [3] = "Bullet3", [4] = "Bullet4",    [5] = "Bullet5",    [6] = "Bullet6", [7] = "Bullet7"
}

SWEP.DefaultBodygroups = "000000000"

SWEP.AttachmentElements = {
    ["pistol_rail"] = {
        VMBodygroups = {
            {ind = 4,bg = 1},
        }
    },
    ["uc_usp_sight"] = {
        VMBodygroups = {
            {ind = 4, bg = 2},
            {ind = 5, bg = 1},
        },
        Override_IronSightStruct = {
            Pos = Vector(-2.29, 10, 1.4),
            Ang = Angle(0.2, 0.05, 5.5),
            Magnification = 1,
        }
    },
    ["uc_usp_slide_compact"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
            {ind = 1, bg = 1},
        },
        AttPosMods = {
            [4] = {
                vpos = Vector(0, -1.46, 4),
                vang = Angle(90, 0, -90),
            }
        },
        NameChange = "CP93",
        TrueNameChange = "USPCT",
    },
    ["uc_usp_slide_shorty"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
        AttPosMods = {
            [4] = {
                vpos = Vector(0, -1.46, 4),
                vang = Angle(90, 0, -90),
            }
        },
        NameChange = "CP93",
        TrueNameChange = "USPCT",
    },
    ["uc_usp_slide_ext"] = {
        VMBodygroups = {
            {ind = 1,bg = 4},
        },
        AttPosMods = {
            [4] = {
                vpos = Vector(0, -1.46, 5.25),
                vang = Angle(90, 0, -90),
            }
        },
        NameChange = "LP93",
        TrueNameChange = "USP Elite",
    },
    ["uc_usp_slide_match"] = {
        VMBodygroups = {
            {ind = 1,bg = 2},
            {ind = 3,bg = 1},
        },
        NameChange = "P93 Match",
        TrueNameChange = "USP Match",
    },
    ["uc_usp_slide_threaded"] = {
        VMBodygroups = {
            {ind = 1,bg = 2},
        },
        AttPosMods = {
            [4] = {
                vpos = Vector(0, -1.46, 5.25),
                vang = Angle(90, 0, -90),
            }
        },
        NameChange = "P93 Threaded",
        TrueNameChange = "USP Threaded",
    },
    ["uc_usp_slide_cs"] = {
        VMBodygroups = {
            {ind = 1,bg = 3},
        },
        NameChange = "K&M .45",
        TrueNameChange = "USP Agency",
    },
    ["lam"] = {
        VMBodygroups = {
            {ind = 1,bg = 5},
        },
        NameChange = "K&M23",
        TrueNameChange = "MK23",
    },
    ["uc_usp_mag_ext"] = {
        VMBodygroups = {
            {ind = 2,bg = 1},
        }
    },
    ["uc_usp_skin_nickel"] = {
        VMSkin = 1
    },
    ["uc_usp_skin_blued"] = {
        VMSkin = 2,
        VMBodygroups = {
        },
    },

    ["uc_tp_gong"] = {
        Override_ActivePos = Vector(1, 5, .75),
        Override_ActiveAng = Angle(-2, -2, 0),
        RequireFlags = {"usp_freeman_1","usp_freeman_2"},
    },

}

local altsight = {
    uc_usp_slide_ext = 3,
    uc_usp_slide_compact = 2,
}

SWEP.Hook_ModifyBodygroups = function(wep, data)
    local vm = data.vm
    if !IsValid(vm) then return end

    if wep.Attachments[1].Installed == "uc_usp_sight" then
        vm:SetBodygroup(5, altsight[wep.Attachments[2].Installed] or 1)
    end
end

local mech = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}

SWEP.Animations = {
    ["idle_empty"] = {
        Source = "idle_empty",
        Time = 10 / 30,
    },
    ["idle"] = {
        Source = "idle",
        Time = 10 / 30,
    },
    ["idle_jammed"] = {
        Source = "idle_jam",
        Time = 10 / 30,
    },
    ["ready"] = {
        Source = "fix",
        Time = 1.6,
        MinProgress = 1.2,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0,
        ShellEjectAt = false,
        ProcDraw = true,
        SoundTable = {
            { s = rottle, t = 0 / 60 },
            {s = path .. "draw.ogg", t = 0},
            { s = path .. "slidepull.ogg",t = 28 / 60},
            { s = path .. "slidedrop1.ogg",t = 35 / 60},
        },
    },
    ["draw"] = {
        Source = "draw",
        Time = .75,
        MinProgress = .4,
        SoundTable = {
            {s = path .. "draw.ogg", t = 0},
        },
    },
    ["draw_empty"] = {
        Source = "draw_empty",
        Time = .75,
        MinProgress = .4,
        SoundTable = {
            {s = path .. "draw.ogg", t = 0},
        },
    },
    ["draw_jam"] = {
        Source = "draw_jam",
        Time = .75,
        MinProgress = .4,
        SoundTable = {
            {s = path .. "draw.ogg", t = 0},
        },
    },
    ["holster"] = {
        Source = "holster",
        Time = .75,
        SoundTable = {
            {s = common .. "cloth_2.ogg", t = 0},
            {s = path .. "holster.ogg", t = 0.2},
        },
    },
    ["holster_empty"] = {
        Source = "holster_empty",
        Time = .75,
        SoundTable = {
            {s = common .. "cloth_2.ogg", t = 0},
            {s = path .. "holster.ogg", t = 0.2},
        },
    },
    ["holster_jam"] = {
        Source = "holster_jam",
        Time = 18 / 30,
        SoundTable = {
            {s = common .. "cloth_2.ogg", t = 0},
            {s = path .. "holster.ogg", t = 0.2},
        },
    },

    ["fire"] = {
        Source = "fire",
        Time = 30 / 30,
        ShellEjectAt = 0,
        SoundTable = {
            { s = mech, t = 0, v = 0.25 }
        },
    },
    ["fire_iron"] = {
        Source = "fire",
        Time = 30 / 30,
        ShellEjectAt = 0,
        SoundTable = {
            {s = common .. "common_mech_light.ogg", t = 0},
            { s = mech, t = 0 }
        },
    },
    ["fire_empty"] = {
        Source = "fire_empty",
        Time = 24 / 30,
        ShellEjectAt = 0,
        SoundTable = {{ s = path .. "mech_last.ogg", t = 0 }},
    },
    ["fire_iron_empty"] = {
        Source = "fire_empty",
        Time = 24 / 30,
        ShellEjectAt = 0,
        SoundTable = {{ s = path .. "mech_last.ogg", t = 0 }},
    },
    ["fire_jammed"] = {
        Source = "fire_jam",
        Time = 30 / 30,
        MinProgress = 0.5,
        ShellEjectAt = false,
        SoundTable = {
        },
    },

    ["fire_stock"] = {
        Source = "fire_stock",
        Time = 30 / 30,
        ShellEjectAt = 0,
        SoundTable = {{ s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0, v = 0.25 }},
    },
    ["fire_empty_stock"] = {
        Source = "fire_empty_stock",
        Time = 24 / 30,
        ShellEjectAt = 0,
        SoundTable = {{ s = path .. "mech_last.ogg", t = 0 }},
    },

    ["fire_match"] = {
        Source = "fire_match",
        Time = 30 / 30,
        ShellEjectAt = 0,
        SoundTable = {{ s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0, v = 0.25 }},
    },
    ["fire_iron_match"] = {
        Source = "fire_match",
        Time = 30 / 30,
        ShellEjectAt = 0,
        SoundTable = {
            {s = common .. "common_mech_light.ogg", t = 0},
            { s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0 }
        },
    },
    ["fire_empty_match"] = {
        Source = "fire_empty_match",
        Time = 24 / 30,
        ShellEjectAt = 0,
        SoundTable = {{ s = path .. "mech_last.ogg", t = 0 }},
    },
    ["fire_iron_empty_match"] = {
        Source = "fire_empty_match",
        Time = 24 / 30,
        ShellEjectAt = 0,
        SoundTable = {{ s = path .. "mech_last.ogg", t = 0 }},
    },

    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        MinProgress = 1.3525,
        Time = 65 / 30,
        LastClip1OutTime = 0.9,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.62,
        SoundTable = {
            { s = rottle, t = 0 / 60 },
            { s = common .. "magpouch_pull_small.ogg", t = 1 / 60 },
            { s = common .. "magrelease.ogg", t = 10 / 60 },
            { s = rottle, t = 11 / 60 },
            { s = path .. "magout1.ogg", t = 26 / 60 },
            { s = path .. "magin1.ogg", t = 42 / 60 },
            { s = rottle, t = 55 / 60 },
            { s = common ..  "magpouch_replace_small.ogg", t = 80 / 60 },
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        MinProgress = 1.75,
        Time = 75 / 30,
        LastClip1OutTime = 0.76,
        LHIK = true,
        LHIKIn = 0.1,
        LHIKEaseIn = 0.1,
        LHIKEaseOut = 0.55,
        LHIKOut = 0.7,
        SoundTable = {
            { s = rottle, t = 0 / 60 },
            { s = common .. "magrelease.ogg", t = 7 / 60 },
            { s = path .. "magout1.ogg", t = 16 / 60 },
            { s = rottle, t = 10 / 60 },
            { s = common .. "magpouch_pull_small.ogg", t = 29 / 60 },
            { s = common .. "pistol_magdrop.ogg", t = 40 / 60 },
            { s = rottle, t = 55 / 60 },
            { s = path .. "magin1.ogg", t = 64 / 60 },
            { s = rottle, t = 90 / 60 },
            { s = path .. "slidedrop1.ogg", t = 94 / 60 },
        },
    },

    ["reload_ext"] = {
        Source = "reload_ext",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        MinProgress = 1.3525,
        Time = 65 / 30,
        LastClip1OutTime = 0.9,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.62,
        SoundTable = {
            { s = rottle, t = 0 / 60 },
            { s = common .. "magpouch_pull_small.ogg", t = 0 / 60 },
            { s = common .. "magrelease.ogg", t = 10 / 60 },
            { s = path .. "magout1.ogg", t = 26 / 60 },
            { s = rottle, t = 10 / 60 },
            { s = rottle, t = 55 / 60 },
            { s = common ..  "magpouch_replace_small.ogg", t = 80 / 60 },
            { s = path .. "magin1.ogg", t = 42 / 60 },
        },
    },
    ["reload_empty_ext"] = {
        Source = "reload_empty_ext",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        MinProgress = 1.75,
        Time = 75 / 30,
        LastClip1OutTime = 0.76,
        LHIK = true,
        LHIKIn = 0.1,
        LHIKEaseIn = 0.1,
        LHIKEaseOut = 0.55,
        LHIKOut = 0.7,
        SoundTable = {
            { s = rottle, t = 0 / 60 },
            { s = common .. "magrelease.ogg", t = 7 / 60 },
            { s = path .. "magout1.ogg", t = 16 / 60 },
            { s = rottle, t = 10 / 60 },
            { s = common .. "magpouch_pull_small.ogg", t = 29 / 60 },
            { s = common .. "pistol_magdrop.ogg", t = 40 / 60 },
            { s = rottle, t = 55 / 60 },
            { s = path .. "magin1.ogg", t = 64 / 60 },
            { s = rottle, t = 90 / 60 },
            { s = path .. "slidedrop1.ogg", t = 94 / 60 },
        },
    },

    ["fix"] = {
        Source = "fix",
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0,
        ShellEjectAt = 30 / 60,
        SoundTable = {
            { s = rottle, t = 0 / 60 },
            { s = path .. "slidepull.ogg",t = 28 / 60},
            { s = path .. "slidedrop1.ogg",t = 35 / 60},
        },
    },

    ["fix_empty"] = {
        Source = "fix_empty",
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0,
        ShellEjectAt = 30 / 60,
        SoundTable = {
            { s = rottle, t = 0 / 60 },
            { s = path .. "slidepull.ogg",t = 28 / 60},
        },
    },

    ["idle_jam"] = {
        Source = "idle_jam",
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0,
    },

    ["enter_inspect"] = {
        Source = "enter_inspect",
        time = 35 / 60,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "movement-pistol-04.ogg", t = 0},
        },
    },
    ["idle_inspect"] = {
        Source = "idle_inspect",
        time = 72 / 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect"] = {
        Source = "exit_inspect",
        time = 66 / 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.84,
        SoundTable = {
            {s = rottle, t = 0.05},
            {s = common .. "movement-pistol-03.ogg", t = 0.1},
            {s = common .. "movement-pistol-01.ogg", t = 1},
            {s = rottle, t = 1},
        },
    },

    ["enter_inspect_empty"] = {
        Source = "enter_inspect_empty",
        time = 35 / 60,
        LHIK = true,
        LHIKIn = 0.1,
        LHIKOut = 0,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "movement-pistol-04.ogg", t = 0},
        },
    },
    ["idle_inspect_empty"] = {
        Source = "idle_inspect_empty",
        time = 72 / 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect_empty"] = {
        Source = "exit_inspect_empty",
        time = 66 / 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.84,
        SoundTable = {
            {s = rottle, t = 0.05},
            {s = common .. "movement-pistol-03.ogg", t = 0.1},
            {s = common .. "movement-pistol-01.ogg", t = 1},
            {s = rottle, t = 1},
        },
    },
    ["enter_inspect_jammed"] = {
        Source = "enter_inspect_jam",
        time = 35 / 60,
        LHIK = true,
        LHIKIn = 0.1,
        LHIKOut = 0,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "movement-pistol-04.ogg", t = 0},
        },
    },
    ["idle_inspect_jammed"] = {
        Source = "idle_inspect_jam",
        time = 72 / 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect_jammed"] = {
        Source = "exit_inspect_jam",
        time = 66 / 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.84,
        SoundTable = {
            {s = rottle, t = 0.05},
            {s = common .. "movement-pistol-03.ogg", t = 0.1},
            {s = common .. "movement-pistol-01.ogg", t = 1},
            {s = rottle, t = 1},
        },
    },
}

SWEP.Hook_Think = ArcCW.UC.ADSReload

SWEP.Hook_TranslateAnimation = function(wep, anim)
    if wep.Attachments[7].Installed and (anim == "fire" or anim == "fire_empty") then
        return anim .. "_stock"
    end
end

SWEP.RejectAttachments = {
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        Slot = {"optic_lp", "uc_usp_sight", "optic", "optic_sniper"},
        DefaultAttName = "Iron Sights",
        Bone = "vm_charge",
        Offset = {
            vpos = Vector(-0.01, -.6, -.3),
            vang = Angle(90, 0, -90),
        },
        VMScale = Vector(.8,.8,.8),
        WMScale = VMScale,
        InstalledEles = {"pistol_rail"},
    },
    {
        PrintName = "Slide",
        Slot = {"uc_usp_slide"},
        DefaultAttIcon = Material("entities/att/acwatt_uc_usp_slide_default.png","mips smooth"),
        DefaultAttName = "5\" Tactical Slide",
        Bone = "vm_pivot",
        Offset = {
            vpos = Vector(-0.056, 0.967, 3.191),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Caliber",
        Slot = {"uc_usp_caliber"},
        DefaultAttIcon = Material("entities/att/uc_bullets/45acp.png","mips smooth"),
        DefaultAttName = ".45 ACP",
        Bone = "vm_pivot",
        Offset = {
            vpos = Vector(3.07, -3.8, -27),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "vm_pivot",
        Offset = {
            vpos = Vector(0, -1.46, 4.6),
            vang = Angle(90, 0, -90),
        },
        ExcludeFlags = {"usp_match"},
    },
    {
        PrintName = "Tactical",
        InstalledEles = {"tac_rail"},
        Slot = {"tac_pistol", "uce_pistol_foregrip", "foregrip"},
        Bone = "vm_pivot",
        Offset = {
            vpos = Vector(0, -.4, 3.85),
            vang = Angle(90, 0, -90),
        },
        ExcludeFlags = {"usp_match", "lam"},
        MergeSlots = {6},
    },
    {
    PrintName = "M203 slot",
        Slot = {"uc_ubgl", "ubgl", "foregrip"},
        Bone = "vm_pivot",
        Offset = {
            vpos = Vector(0, -.4, 3.85),
            vang = Angle(90, 0, -90),
        },
        Hidden = true,
    },
    {
        PrintName = "Magazine",
        Slot = {"uc_usp_mag"},
        DefaultAttIcon = Material("entities/att/acwatt_uc_usp_mag_default.png","mips smooth"),
        DefaultAttName = "12-Round Mag",
    },
    {
        PrintName = "Stock",
        Slot = {"uc_stock", "go_stock_pistol_bt"},
        VMScale = Vector(1.1, 1.1, 1.1),
        Bone = "vm_pivot",
        Offset = {
            vpos = Vector(-0.05, 2.7, -3),
            vang = Angle(90, 0, -90),
        },
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
        Slot = {"uc_tp"},
        DefaultAttName = "Basic Training"
    },
    {
        PrintName = "Internals",
        Slot = "uc_fg",
        DefaultAttName = "Standard Internals"
    },
    {
        PrintName = "Charm",
        Slot = {"charm", "fml_charm", "uc_usp_tp"},
        FreeSlot = true,
        Bone = "vm_charge",
        Offset = {
            vpos = Vector(0.42, 0.8, 4.6),
            vang = Angle(90, 0, -90),
        },
        VMScale = Vector(.75,.75,.75),
    },
    {
        PrintName = "Finish",
        Slot = {"uc_usp_skin"},
        DefaultAttName = "Black",
        DefaultAttIcon = Material("entities/att/acwatt_uc_usp_skin_default.png","mips smooth"),
        FreeSlot = true,
    },
}

UCExtras_RegisterWeapon(SWEP, "arccw_uc_usp")
