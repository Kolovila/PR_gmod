local SWEP = { Primary = {}, Secondary = {} }

SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "9Urban Expedition"
SWEP.AdminOnly = false

SWEP.PrintName = "Aurolaroix C1"
SWEP.TrueName = "C1A1"

SWEP.Trivia_Class = "Battle Rifle"
SWEP.Trivia_Desc = [[Shipped back from Départment du Nord, a land of constant snowstorm prohibits the use of conventional magazine. Conserve your ammo and take either 10 or 5 round load to fill up this machine.]]
SWEP.Trivia_Manufacturer = [[Héristal van Hoog-Zert [Département du Nord] ]]
SWEP.Trivia_Calibre = "7.62x51mm NATO"
SWEP.Trivia_Mechanism = "Gas-Operated Tilting Bolt"
SWEP.Trivia_Country = "Canada"
SWEP.Trivia_Year = 1953

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "FN Herstal"
    SWEP.Trivia_Country = "Belgium"
end

SWEP.Slot = 2
SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/arccw/c_uc_myt_fal_ux.mdl"
SWEP.WorldModel = "models/weapons/arccw/c_uc_myt_fal_ux.mdl"
SWEP.ViewModelFOV = 70

SWEP.DefaultBodygroups = "00000000000000000"

SWEP.ShotgunReload = true
SWEP.HybridReload = true

SWEP.Damage = 65
SWEP.DamageMin = 35
SWEP.RangeMin = 50
SWEP.Range = 400
SWEP.Penetration = 20
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 840
SWEP.PhysBulletMuzzleVelocity = 840

SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 20

SWEP.Recoil = 1.45
SWEP.RecoilSide = 0.6

SWEP.RecoilRise = 0.6
SWEP.RecoilPunch = 1
SWEP.VisualRecoilMult = 1
SWEP.MaxRecoilBlowback = 1
SWEP.MaxRecoilPunch = 1
SWEP.RecoilPunchBack = 2

SWEP.Sway = 0.6

SWEP.Delay = 60 / 650
SWEP.Num = 1
SWEP.Firemodes = {
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

SWEP.ShootPitch = 100
SWEP.ShootVol = 120

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 60

SWEP.AccuracyMOA = 2
SWEP.HipDispersion = 950
SWEP.MoveDispersion = 250
SWEP.JumpDispersion = 1000

SWEP.Primary.Ammo = "ar2"
SWEP.MagID = "ak"

SWEP.HeatCapacity = 75
SWEP.HeatDissipation = 15
SWEP.HeatDelayTime = 3

SWEP.MalfunctionMean = 200
SWEP.MeleeAttackTime = 0.1

SWEP.SpeedMult = 0.9
SWEP.SightedSpeedMult = 0.75
SWEP.SightTime = 0.5
SWEP.ShootSpeedMult = 0.75

local tail = ")/arccw_uc/common/308/"
local common = ")/arccw_uc/common/"
local rottle = {common .. "cloth_1.ogg", common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_5.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-308-rif-ext-01.ogg",
    tail .. "fire-dist-308-rif-ext-02.ogg",
    tail .. "fire-dist-308-rif-ext-03.ogg",
    tail .. "fire-dist-308-rif-ext-04.ogg",
    tail .. "fire-dist-308-rif-ext-05.ogg",
    tail .. "fire-dist-308-rif-ext-06.ogg"
}
SWEP.DistantShootSoundIndoors = {
    tail .. "fire-dist-308-rif-int-01.ogg",
    tail .. "fire-dist-308-rif-int-02.ogg",
    tail .. "fire-dist-308-rif-int-03.ogg",
    tail .. "fire-dist-308-rif-int-04.ogg",
    tail .. "fire-dist-308-rif-int-05.ogg",
    tail .. "fire-dist-308-rif-int-06.ogg"
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

SWEP.DistantShootSound = "myt_c1a1/shot_dist.wav"
SWEP.DistantShootSoundSilenced = nil
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

SWEP.DistantShootSoundSilenced = nil
SWEP.ShootSound = {"myt_c1a1/FAL-1.wav", "myt_c1a1/FAL-2.wav", "myt_c1a1/FAL-3.wav"}
SWEP.ShootSoundSilenced = {"myt_c1a1/shot_sd.ogg"}
SWEP.ShootDrySound = ""

SWEP.MuzzleEffect = "muzzleflash_6"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
SWEP.ShellScale = 1.145
SWEP.ShellPitch = 90
SWEP.ShellScale = 1
SWEP.ShellRotateAngle = Angle(0, 0, 0)

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2

SWEP.IronSightStruct = {
    Pos = Vector(-2.73, -1, 0.875),
    Ang = Angle(0, 0.02, 0),
    Magnification = 1.1,
    ViewModelFOV = 65,
    SwitchToSound = "",
    CrosshairInSights = false
}
SWEP.LaserOffsetAngle = Angle(0, 0, 0)
SWEP.LaserIronsAngle = Angle(0, 0, 0)

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0.3, 1, 0.8)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(0.5, 1, 0.5)
SWEP.SprintAng = Angle(-8.5, 15, -10)

SWEP.CrouchPos = Vector(-0.7, 0.6, 0)
SWEP.CrouchAng = Angle(0, 0, -14)

SWEP.HolsterPos = Vector(-1, -1, 1.2)
SWEP.HolsterAng = Angle(-15, 8, -10)

SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.BarrelOffsetHip = Vector(0, 0, 0)

SWEP.CustomizePos = Vector(0, 2, 1)
SWEP.CustomizeAng = Angle(0, 0, 0)

SWEP.BarrelLength = 24

SWEP.BulletBones = {
    [0] = "b_wpn_mag_b1",
    [1] = "b_wpn_mag_b1"
}

SWEP.AttachmentElements = {
    ["o_rail"] = { VMBodygroups = { {ind = 8, bg = 1}, }, },

    ["stock_none"] = { VMBodygroups = { {ind = 7, bg = 4}, }, },
    ["stock_fold"] = { VMBodygroups = { {ind = 7, bg = 1}, }, },
    ["stock_wood"] = { VMBodygroups = { {ind = 7, bg = 2}, }, },
    ["stock_prs"] = { VMBodygroups = { {ind = 7, bg = 3}, }, },

    ["grip_para"] = { VMBodygroups = { {ind = 6, bg = 1}, }, },

    ["conv_556"] = {
    NameChange = "Relicosseur I2",
    TrueNameChange = "IMBEL-A2",
    VMBodygroups = { {ind = 5, bg = 1}, {ind = 2, bg = 3}, },
    },
    ["conv_12g"] = {
        NameChange = "Relicosseur 12G",
        TrueNameChange = "FAL-12",
        VMBodygroups = { {ind = 5, bg = 4}, {ind = 3, bg = 2}, {ind = 2, bg = 6}, },
        },
    ["conv_762"] = {
        NameChange = "Aurolaroix C62",
        TrueNameChange = "FAL .762",
        VMBodygroups = { {ind = 5, bg = 3}, {ind = 2, bg = 5}, },
        VMElements = {
            {
                Model = "models/weapons/arc9/darsu_eft/mods/mag_ak_molot_rpk_drum_762x39_75_ux.mdl",
                Bone = "b_wpn_mag_b1",
                Offset = {
                    pos = Vector(0, 1.557, -0.519),
                    ang = Angle(0,0,0),
                }
            }
        },
    },
	["conv_val"] = {
    NameChange = "Loinukta V9",
    TrueNameChange = "AS FAL",
    VMBodygroups = { {ind = 5, bg = 2}, {ind = 2, bg = 4}, },
    },
    ["x_40"] = { VMBodygroups = { {ind = 2, bg = 2}, }, },
    ["x_10"] = { VMBodygroups = { {ind = 2, bg = 1}, }, },

	["ironsalt"] = { VMBodygroups = { {ind = 6, bg = 1}, }, },

	["l_s"] = { VMBodygroups = { {ind = 10, bg = 1}, {ind = 9, bg = 1} },	AttPosMods = {[5] = { vpos = Vector(0, -0.1, 14.55) }, [7] = { vpos = Vector(-0.4, -0.1, 13.9) },} },
    ["l_n"] = { VMBodygroups = { {ind = 10, bg = 6}, {ind = 9, bg = 3}, {ind = 1, bg = 7} },	AttPosMods = {[5] = { vpos = Vector(0, -0.1, 2.849) },} },
	["l_l"] = { VMBodygroups = { {ind = 10, bg = 2}, {ind = 9, bg = 2} },	AttPosMods = {[5] = { vpos = Vector(0, -0.1, 23.45) },} },

    ["hg_sd"] = { VMBodygroups = { {ind = 1, bg = 4}, {ind = 10, bg = 3} },	AttPosMods = {[6] = { vpos = Vector(0, 0.85, 8) },} },
    ["hg_wood"] = { VMBodygroups = { {ind = 1, bg = 5} }, },
    ["hg_para"] = { VMBodygroups = { {ind = 1, bg = 2} },	AttPosMods = {[6] = { vpos = Vector(0, 1.35, 7) }, [14] = { vpos = Vector(0, 0.25, 5) },} },
    ["hg_dsa"] = { VMBodygroups = { {ind = 1, bg = 10} },	AttPosMods = {[3] = { vpos = Vector(0, 0, 14.5) }, [4] = { vpos = Vector(0, 0.85, 7) },} },
    ["hg_aus"] = { VMBodygroups = { {ind = 1, bg = 6} },	AttPosMods = {[3] = { vpos = Vector(0, 0, 25.25) },} },
}

SWEP.Hook_ModifyBodygroups = function(wep, data)
    local vm = data.vm
    local handguard = wep.Attachments[4].Installed
    if wep.Attachments[2].Installed == "uc_myt_fal_l_s" then
		if handguard == "uc_myt_fal_hg_xs" then vm:SetBodygroup(1, 1)
			elseif handguard == "uc_myt_fal_hg_para" then vm:SetBodygroup(1, 3)
			elseif handguard == "uc_myt_fal_hg_l" then vm:SetBodygroup(1, 9)
			elseif handguard == "uc_myt_fal_hg_aus" then vm:SetBodygroup(1, 11)
			elseif handguard == "uc_myt_fal_hg_sd" then	vm:SetBodygroup(10, 4)
			elseif handguard == "uc_myt_fal_hg_sd" then vm:SetBodygroup(1, 4)
            else	vm:SetBodygroup(1, 8)
        end
    end
    if wep.Attachments[2].Installed == "uc_myt_fal_l_l" then
			if handguard == "uc_myt_fal_hg_sd" then vm:SetBodygroup(10, 5)
		end
	end

    if wep.Attachments[6].Installed || wep.Attachments[14].Installed then
        if handguard == "uc_myt_fal_hg_xs" then vm:SetBodygroup(11, 0)
            elseif handguard == "uc_myt_fal_hg_para" then vm:SetBodygroup(11, 2)
            else   vm:SetBodygroup(11, 1)
        end
    end

    if wep.Attachments[5].Installed || handguard == "uc_myt_fal_hg_sd" then vm:SetBodygroup(9, 3) end
    if wep.Attachments[7].Installed then
		if wep.Attachments[2].Installed == "uc_myt_fal_l_s" then vm:SetBodygroup(12, 2)
			else   vm:SetBodygroup(12, 1)
		end
	end
    if wep.Attachments[1].Installed then
		if wep.Attachments[1].Installed == "uc_myt_fal_guh" then vm:SetBodygroup(6, 1)
			else   vm:SetBodygroup(6, 3)
		end
	end

end

SWEP.ExtraSightDist = 2
SWEP.GuaranteeLaser = false

SWEP.WorldModelOffset = {
    pos = Vector(-5, 3, -5.5),
    ang = Angle(-10, 0, 180)
}

SWEP.MirrorVMWM = true

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        InstalledEles = {"o_rail"},
        Slot = {"optic", "uc_myt_fal_iron", "optic_sniper", "optic_lp"},
        Bone = "W_Main",
        VMScale = Vector(0.85, 0.85, 0.85),
        Offset = {
            vpos = Vector(-0, -1.6, -4.75),
            vang = Angle(90, 0, -90),
        },
        MergeSlots = {16},
    },
    {
        PrintName = "Barrel",
        DefaultAttName = "21\" Standard Barrel",
        DefaultAttIcon = Material("entities/att/ue_fal/b_def.png", "smooth mips"),
        Slot = "uc_myt_fal_b",
        Bone = "W_Main",
        Offset = {
            vpos = Vector(3.5, -4.25, -7),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = [[Receiver/Magazine]],
        Slot = "uc_myt_fal_mag",
        DefaultAttName = "20-Round .308 Mag",
        DefaultAttIcon = Material("entities/att/ue_fal/r_def.png", "smooth mips"),
    },
    {
        PrintName = "Handguard",
        DefaultAttName = "Standard Handguard",
        DefaultAttIcon = Material("entities/att/ue_fal/hg_wood1.png", "smooth mips"),
        Slot = "uc_myt_fal_hg",
        Bone = "W_Main",
        Offset = {
            vpos = Vector(3.5, -4.75, -5),
            vang = Angle(90, 0, -90),
        },
        ExcludeFlags = {"fal_nobr"},
    },
    {
        PrintName = "Muzzle",
        Slot = "muzzle",
        Bone = "W_Main",
        ExcludeFlags = {"fal_nomuz"},
        Offset = {
            vpos = Vector(0, -0.1, 18.65),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip"},
        Bone = "W_Main",
        Offset = {
            vpos = Vector(0, 0.65, 6.5),
            vang = Angle(90, 0, -90),
        },
        InstalledEles = {"mount_underbarrel"},
        ExcludeFlags = {"fal_noub"},
        MergeSlots = {14},
    },
    {
        PrintName = "Tactical",
        Slot = "tac",
        Bone = "W_Main",
        Offset = {
            vpos = Vector(-0.4, -0.1, 17.5),
            vang = Angle(90, 0, 180),
        },
        InstalledEles = {"mount_tactical"},
        ExcludeFlags = {"fal_tac"},
    },
    {
        PrintName = "Stock",
        Slot = {"uc_myt_fal_stock"},
        DefaultAttIcon = Material("entities/att/ue_fal/s_wood.png", "smooth mips"),
        DefaultAttName = "Standard Stock",
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
        Slot = {"charm", "fml_charm", "uc_myt_fal_c"},
        Hidden = false,
        FreeSlot = true,
        Bone = "W_Main",
        Offset = {
            vpos = Vector(0.55, 0.2, -4.5),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "M203 slot",
        Slot = {"uc_ubgl", "ubgl"},
        Bone = "W_Main",
        Offset = {
            vpos = Vector(0, -0.4, 5),
            vang = Angle(90, 0, -90),
        },
        Hidden = true,
        ExcludeFlags = {"fal_noub"},
        InstalledEles = {"mount_underbarrel"},
    },

    {
        PrintName = "Tube Stock Adaptor",
        Slot = {"go_stock"},
        Hidden = true,
        InstalledEles = {"stock_tube"},
        Bone = "W_Main",
        VMScale = Vector(1.05, 1.05, 1.05),
        Offset = {
            vpos = Vector(0, 0.5, -10.5),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Optic Sniper",
        InstalledEles = {"o_rail", "blockstrip"},
        Hidden = true,
        Slot = {"optic_sniper"},
        Bone = "W_Main",
        VMScale = Vector(0.95, 0.95, 0.95),
        Offset = {
            vpos = Vector(0, -1.6, -5),
            vang = Angle(90, 0, -90),
        },
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle"
    },
    ["idle_empty"] = {
        Source = "idle_empty",
    },
    ["fix"] = {
        Source = "fix",
        ShellEjectAt = 0.35,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.7,
        SoundTable = {
			{s = "myt_c1a1/boltfix.ogg", t = 10/40},
        },
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {s = common .. "raise.ogg", t = 0},
            {s = common .. "shoulder.ogg", t = 12/40},
        },
    },
    ["draw_empty"] = {
        Source = "draw_empty",
        Time = 20 / 30,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0},
            {s = common .. "shoulder.ogg", t = 12/40},
        },
    },
    ["ready"] = {
        Source = "deploy",
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0},
            {s = common .. "rattle.ogg", t = 0.2 + 5/40},
			{s = "myt_c1a1/boltfix.ogg", t = 10/40},
            {s = common .. "shoulder.ogg", t = 37/40},
        },
        ProcDraw = false,
    },
    ["holster"] = {
        Source = "holster",
        LHIK = false,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0},
            {s = common .. "shoulder.ogg", t = 12/40},
        },
    },
    ["holster_empty"] = {
        Source = "holster_empty",
        LHIK = false,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0},
            {s = common .. "shoulder.ogg", t = 12/40},
        },
    },
    ["fire"] = {
        Source = "fire",
        ShellEjectAt = 0.01,
    },
    ["fire_iron"] = {
        Source = "fire_iron",
        ShellEjectAt = 0.01,
        SoundTable = {
        },
    },
    ["fire_empty"] = {
        Source = "fire_empty",
        ShellEjectAt = 0.01,
        SoundTable = {
        },
    },
    ["fire_iron_empty"] = {
        Source = "fire_iron_empty",
        ShellEjectAt = 0.01,
        SoundTable = {
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 132/40,
        LastClip1OutTime = 58/40,
        LHIK = true,
        LHIKIn = 4.275,
        LHIKEaseIn = 0.35,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.7,
        SoundTable = {
			{s = "myt_c1a1/load10_seg.ogg", t = 19/40},
			{s = "myt_c1a1/load10_seg.ogg", t = 92/40},
			{s = "myt_c1a1/boltfull.ogg", t = 162/40},
        },
    },
    ["reload_shotgun"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 132/40,
        LastClip1OutTime = 58/40,
        LHIK = true,
        LHIKIn = 4.275,
        LHIKEaseIn = 0.35,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.7,
        SoundTable = {
			{s = "weapons/misc/fal_load12g.ogg", t = 19/40},
			{s = "weapons/misc/fal_load12g.ogg", t = 92/40},
			{s = "myt_c1a1/boltfull.ogg", t = 162/40},
        },
    },
    ["reload_empty_40"] = {
        Source = "reload_empty_40",
        RareSourceChance = 100,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 273/40,
        LastClip1OutTime = 58/40,
        LHIK = true,
        LHIKIn = 7.9,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.7,
        SoundTable = {
			{s = "myt_c1a1/load10_seg.ogg", t = 19/40},
			{s = "myt_c1a1/load10_seg.ogg", t = 92/40},
			{s = "myt_c1a1/load10_seg.ogg", t = 164/40},
			{s = "myt_c1a1/load10_seg.ogg", t = 237/40},
			{s = "myt_c1a1/boltfull.ogg", t = 309/40},
        },
    },
	["reload_empty_10"] = {
        Source = "reload_empty_10",
        RareSourceChance = 100,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 60/40,
        LastClip1OutTime = 20/40,
        LHIK = true,
        LHIKIn = 2.275,
        LHIKEaseIn = 0.35,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.7,
        SoundTable = {
			{s = "myt_c1a1/load10_seg.ogg", t = 19/40},
			{s = "myt_c1a1/boltfull.ogg", t = 87/40},
        },
    },

    ["sgreload_start"] = {
        Source = "sgreload_start",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKOut = 0,
        SoundTable = {
			{s = "myt_c1a1/boltback_seg.ogg", t = 13/40},
        }
    },
    ["sgreload_start_empty"] = {
        Source = "sgreload_start_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
		RestoreAmmo = 0,
        LHIKIn = 0.175,
        LHIKOut = 0,
        SoundTable = {
            {s = common .. "magpouch.ogg",	t = 4/40},
        }
    },
    ["sgreload_insert"] = {
        Source = "sgreload_insert",
        MinProgress = 0.24,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        TPAnimStartTime = 0.3,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
        SoundTable = {
			{s = "myt_c1a1/load1_seg.ogg", t = 7/40},
        },
    },
    ["sgreload_insert_5"] = {
        Source = "sgreload_insert_5",
        RestoreAmmo = 5,
        MinProgress = 0.24,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        TPAnimStartTime = 0.3,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
        SoundTable = {
			{s = "myt_c1a1/load5_seg.ogg", t = 9/40},
        },
    },
    ["sgreload_insert_10"] = {
        Source = "sgreload_insert_10",
        RestoreAmmo = 10,
        MinProgress = 0.24,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        TPAnimStartTime = 0.3,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
        SoundTable = {
            {s = "myt_c1a1/load10_seg.ogg", t = 11/40},
        },
    },
    ["sgreload_finish"] = {
        Source = "sgreload_finish",
        LHIK = true,
        LHIKIn = 0,
        MinProgress = 0.24,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.3,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        TPAnimStartTime = 0.8,
        SoundTable = {
			{s = "myt_c1a1/boltfoward_seg.ogg", t = 10/40},
        },
    },

    ["reload_empty_556"] = {
        Source = "reload_empty_556",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0.5,
        LHIKEaseOut = 0.25,
        MinProgress = 80/40,
        LastClip1OutTime = 20/40,
        SoundTable = {
			{s = "myt_c1a1/magout_556.ogg", t = 15/40},
            {s = common .. "magpouch.ogg",	t = 30/40},
			{s = "myt_c1a1/magin_556.ogg", t = 46/40},
			{s = "myt_c1a1/boltfull.ogg", t = 74/40},
        },
    },
    ["reload_556"] = {
        Source = "reload_556",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0.5,
        LHIKEaseOut = 0.25,
        MinProgress = 2.1,
        LastClip1OutTime = 50/40,
        SoundTable = {
			{s = "myt_c1a1/magout_wet_556.ogg", t = 12/40},
			{s = common .. "magpouch.ogg",	t = 30/40},
            {s = common .. "magpouch.ogg",	t = 30/40},
			{s = "myt_c1a1/magin_556.ogg", t = 46/40},
        },
    },

    ["reload_empty_sd"] = {
        Source = "reload_empty_sd",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0.5,
        LHIKEaseOut = 0.25,
        MinProgress = 2.1,
        LastClip1OutTime = 50/40,
        SoundTable = {
			{s = "myt_c1a1/magout_939.ogg", t = 10/40},
            {s = common .. "magpouch.ogg",	t = 30/40},
			{s = "myt_c1a1/magin_939.ogg", t = 46/40},
			{s = "myt_c1a1/boltfull.ogg", t = 80/40},
        },
    },
    ["reload_sd"] = {
        Source = "reload_sd",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0.5,
        LHIKEaseOut = 0.25,
        MinProgress = 2.1,
        LastClip1OutTime = 50/30,
        SoundTable = {
			{s = "myt_c1a1/magout_939.ogg", t = 10/40},
			{s = "myt_c1a1/magin_939.ogg", t = 46/40},
        },
    },

    ["bash"] = { Source = "stab", },
    ["bash_empty"] = { Source = "stab_emp", },
    ["bash_bayo"] = { Source = "stab", },
    ["bash_empty_bayo"] = { Source = "stab_emp", },

	["enter_inspect"] = {
        Source = "inspect_enter",
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "movement-rifle-02.ogg", t = 0.1},
        },
    },
    ["idle_inspect"] = {
        Source = "inspect_loop",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect"] = {
        Source = "inspect_exit",
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.375,
        LHIKOut = 0.6,
        SoundTable = {
            {s = rottle, 			                    t = 14/40},
            {s = common .. "shoulder.ogg", 	        	t = 55/40, v = .5},
        },
    },
    ["enter_inspect_empty"] = {
        Source = "inspect_enter_empty",
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "movement-rifle-02.ogg", t = 0.1},
        },
    },
    ["idle_inspect_empty"] = {
        Source = "inspect_loop_empty",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect_empty"] = {
        Source = "inspect_exit_empty",
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.375,
        LHIKOut = 0.6,
        SoundTable = {
			{s = rottle, 			                    t = 14/40},
            {s = common .. "shoulder.ogg", 	        	t = 55/40, v = .5},
        },
    },
}

SWEP.Hook_SelectInsertAnimation = function(wep, data)
    local insertAmt = wep:HasBottomlessClip() and math.huge or math.min(wep:GetCapacity() + wep:GetChamberSize() - wep:Clip1())
    if !wep:HasInfiniteAmmo() then
        insertAmt = math.min(insertAmt, wep:GetOwner():GetAmmoCount(wep:GetPrimaryAmmoType()))
    end
    if !wep.Attachments[16].Installed and insertAmt >= 10 then
        return {count = 10, anim = "sgreload_insert_10", empty = false}
    elseif !wep.Attachments[16].Installed and insertAmt >= 5 then
        return {count = 5, anim = "sgreload_insert_5", empty = false}
    end
end

SWEP.Hook_Think = ArcCW.UC.ADSReload and function(wep, data)

	if wep.Attachments[16].Installed then
		wep.HybridReload = false
	else wep.HybridReload = true
	end

end

UCExtras_RegisterWeapon(SWEP, "arccw_myt_c1a1")
