SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "SAR-100"
SWEP.TrueName = "Ultimax-100"
SWEP.Trivia_Class = "Lightmachine Gun"
SWEP.Trivia_Desc = "Unconventional yet reliable open-bolt lightmachine gun developed in Singapore in 1982, in response to the Singapore Armed Forces' need for a reliable and lightweight squad automatic weapon. It is chambered in the 5.56×45mm NATO caliber and utilizes a gas-operated, rotating bolt system with a short-stroke gas piston. The constant-recoil mechanism provides exceptional accuracy and low recoil."
SWEP.Trivia_Manufacturer = "Temasek Arms"
SWEP.Trivia_Calibre = "5.56×45mm NATO"
SWEP.Trivia_Mechanism = "Gas-Operated"
SWEP.Trivia_Country = "Singapore"
SWEP.Trivia_Year = 1982

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "CIS"
end

SWEP.Slot = 2

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/ultimax_v_fx.mdl"
SWEP.WorldModel = "models/weapons/ultimax_v_fx.mdl"
SWEP.MirrorVMWM = true
SWEP.ViewModelFOV = 70
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.ProceduralIronFire = true

SWEP.Damage = ArcCW.UC.StdDmg["556"].max
SWEP.DamageMin = ArcCW.UC.StdDmg["556"].min
SWEP.RangeMin = 60
SWEP.Range = 200

SWEP.Penetration = ArcCW.UC.StdDmg["556"].pen
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 970
SWEP.PhysBulletMuzzleVelocity = 970

SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults
SWEP.CanFireUnderwater = false
SWEP.Primary.ClipSize = 30
SWEP.ExtendedClipSize = 100
SWEP.ReducedClipSize = 10

SWEP.Recoil = 0.10
SWEP.RecoilSide = 0.10
SWEP.RecoilRise = 0.08
SWEP.MaxRecoilBlowback = 0.30
SWEP.MaxRecoilPunch = 0.35
SWEP.Sway = 0.70

SWEP.Delay = 60 / 500
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0
    }
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 85

SWEP.MalfunctionMean = 200
SWEP.MalfunctionTakeRound = false

SWEP.AccuracyMOA = 5
SWEP.HipDispersion = 500
SWEP.MoveDispersion = 250
SWEP.JumpDispersion = 1025

SWEP.Primary.Ammo = "smg1"
SWEP.MagID = "u100"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

local path = ")uc_u100/"
local common = ")/arccw_uc/common/"
local rottle = {common .. "cloth_1.ogg", common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local ratel = {common .. "rattle1.ogg", common .. "rattle2.ogg", common .. "rattle3.ogg"}

SWEP.ShootSound = {
    path .. "fire1.wav",
    path .. "fire2.wav",
    path .. "fire3.wav",
    path .. "fire4.wav"
}
SWEP.ShootSoundSilenced = {
    path .. "fire1_sup.wav",
    path .. "fire2_sup.wav",
    path .. "fire3_sup.wav",
    path .. "fire4_sup.wav"
}

SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = nil

local tail = ")/arccw_uc/common/556x45/"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-556x45-rif-ext-01.ogg",
    tail .. "fire-dist-556x45-rif-ext-02.ogg",
    tail .. "fire-dist-556x45-rif-ext-03.ogg",
    tail .. "fire-dist-556x45-rif-ext-04.ogg",
    tail .. "fire-dist-556x45-rif-ext-05.ogg",
    tail .. "fire-dist-556x45-rif-ext-06.ogg"
}
SWEP.DistantShootSoundIndoors = {
    common .. "fire-dist-int-rifle-01.ogg",
    common .. "fire-dist-int-rifle-02.ogg",
    common .. "fire-dist-int-rifle-03.ogg",
    common .. "fire-dist-int-rifle-04.ogg",
    common .. "fire-dist-int-rifle-05.ogg",
    common .. "fire-dist-int-rifle-06.ogg"
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
SWEP.ShootDrySound = {path .. "mech1.wav", path .. "mech2.wav", path .. "mech3.wav"}
SWEP.FiremodeSound = {path .. "mag_release.wav", path .. "mag_release.wav"}

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
SWEP.ShellScale = .666
SWEP.ShellPitch = 100

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2

SWEP.SpeedMult = 0.87
SWEP.SightedSpeedMult = 0.78
SWEP.SightTime = 0.55
SWEP.VisualRecoilMult = 0.30
SWEP.ShootSpeedMult = 0.80

SWEP.BulletBones = {
}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-2.285, 0.976, 1.08),
    Ang = Angle(-0.5, 0, 0),
    Magnification = 1.1,
    CrosshairInSights = false,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(1.12, 5.854, -0.48)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(7.44, 2.927, -2.36)
SWEP.CustomizeAng = Angle(26.341, 33.171, 14.634)

SWEP.SprintPos = Vector(9.35, 1, -5.28)
SWEP.SprintAng = Angle(-10.732, 47.805, -28.293)

SWEP.CrouchPos = Vector(0.12, 3.902, -1.92)
SWEP.CrouchAng = Angle(-0.976, -0.976, -9.756)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.BarrelLength = 20
SWEP.ExtraSightDist = 10

SWEP.WElements = {
	["ultimax_w"] = { type = "Model", model = "models/weapons/ultimax_v_fx.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-3, -8, 10), angle = Angle(50, 200, -40), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.AttachmentElements = {

    ["barrel_short"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
        AttPosMods = {
            [3] = {
                vpos = Vector(0.25, 13, 1.5),
            },
        }
    },
    ["barrel_sd"] = {
        VMBodygroups = {
            {ind = 1, bg = 2},
        },
    },
    ["handguard_wood"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
    ["bipod_open"] = {
        VMBodygroups = {
            {ind = 6, bg = 1},
        },
    },
    ["stock_none"] = {
        VMBodygroups = {
            {ind = 4, bg = 1},
        },
    },
    ["stock_wood"] = {
        VMBodygroups = {
            {ind = 4, bg = 2},
        },
    },
    ["grip_wood"] = {
        VMBodygroups = {
            {ind = 5, bg = 1},
        },
    },
    ["mag_drum"] = {
        VMBodygroups = {
            {ind = 3, bg = 1},
        },
    },
    ["mag_10"] = {
        VMBodygroups = {
            {ind = 3, bg = 2},
        },
    },
    ["rec_mk5"] = {
        NameChange = "SAR-100 Mk.5",
        TrueNameChange = "Ultimax-100 Mk.5",
    },
    ["rec_308"] = {
        NameChange = "SAR-308",
        TrueNameChange = "Ultimax-308",
    },

}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic", "optic_lp", "optic_sniper"},
        Bone = "Weapon",
        Offset = {
            vpos = Vector(0.2, -5.031, 2.9),
            vang = Angle(0, -90, 0),
        },
        CorrectivePos = Vector(0, 0, 0.0),
        CorrectiveAng = Angle(0, 180, 0),
        VMScale = Vector(1, 1, 1),
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_u100_barrel"},
        DefaultAttIcon = Material("shit/ultimax_barrel.png","mips smooth"),
        DefaultAttName = "20.5\" Factory Barrel",
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = "muzzle",
        Bone = "Weapon",
        Offset = {
            vpos = Vector(0.25, 20.5, 1.5),
            vang = Angle(0, -90, 0),
        },
    },
    {
        PrintName = "Handguard",
        Slot = {"uc_u100_hg"},
        DefaultAttIcon = Material("","mips smooth"),
        DefaultAttName = "Factory Handguard",
    },
    {
        PrintName = "Bipod",
        Slot = {"uc_u100_bipod"},
        DefaultAttIcon = Material("","mips smooth"),
        DefaultAttName = "Closed Bipod",

    },
    {
        PrintName = "Receiver",
        Slot = {"uc_u100_cal"},
        DefaultAttIcon = Material("shit/ultimax_receiver.png","mips smooth"),
        DefaultAttName = "Ultimax-100 Receiver",
        ExcludeFlags = {"mag1_9mm"},
    },
    {
        PrintName = "Magazine",
        Slot = {"uc_u100_mag"},
        DefaultAttIcon = Material("entities/att/acwatt_ud_m16_mag_15.png","mips smooth"),
        DefaultAttName = "30-Round Magazine",
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "Weapon",
        Offset = {
            vpos = Vector(-0.5, -2, 1.6),
            vang = Angle(0, -90, -90),
        },
    },
    {
        PrintName = "Pistol Grip",
        DefaultAttName = "Factory Grip",
        DefaultAttIcon = Material("entities/att/acwatt_ud_m16_grip_default.png","mips smooth"),
        Slot = "uc_u100_grip",
    },
    {
        PrintName = "Stock",
        DefaultAttName = "Factory Stock",
        DefaultAttIcon = Material("shit/ultimax_stock.png","mips smooth"),
        Slot = "uc_u100_stock",
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
        Source = "foregrip_idle",
        Time = 0,
    },
    ["draw"] = {
        SoundTable = ArcCW.UC.DrawSounds,
        Source = "foregrip_draw",
        Time = 0.75,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["holster"] = {
        SoundTable = ArcCW.UC.HolsterSounds,
        Source = "foregrip_holster",
        Time = 0.75,
        LHIK = true,
        LHIKIn = 1,
        LHIKOut = 1,
    },
    ["ready"] = {
        Source = "foregrip_draw",
        Time = 0.75,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0},
            {s = rottle, t = 0.15},
            {s = path .. "bolt_cycle.wav", t = 0.35},
            {s = ratel, t = 0.7},
            {s = common .. "shoulder.ogg", t = 0.85},
        },
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["fire"] = {
        Source = {"foregrip_fire"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_u100/mech1.wav","uc_u100/mech2.wav","uc_u100/mech3.wav"}, t = 0.005},
        },
        ShellEjectAt = 0,
    },
    ["fire_iron"] = {
        Source = "foregrip_iron_fire_a",
        Time = 0.5,
        SoundTable = {
            {s = {"uc_u100/mech1.wav","uc_u100/mech2.wav","uc_u100/mech3.wav"}, t = 0.005},
        },
        ShellEjectAt = 0,
    },
    ["fire_empty"] = {
        Source = {"foregrip_dryfire"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_u100/empty1.wav","uc_vector/empty2.wav"}, t = 0.005},
        },
    },
    ["fire_iron_empty"] = {
        Source = {"foregrip_iron_dryfire"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_u100/empty1.wav","uc_vector/empty2.wav"}, t = 0.005},
        },
    },
    ["reload"] = {
        Source = "foregrip_reload",
        Time = 90 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_u100/mag_release.wav", t = 10 / 35},
            {s = "uc_u100/mag_out.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 45 / 35 },
            {s = "uc_u100/mag_in.wav", t = 48 / 35},
        },
    },
    ["reload_10"] = {
        Source = "foregrip_reload",
        Time = 90 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_u100/mag_release.wav", t = 10 / 35},
            {s = "uc_u100/mag_out_small.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 45 / 35 },
            {s = "uc_u100/mag_in_small.wav", t = 48 / 35},
        },
    },
    ["reload_100"] = {
        Source = "foregrip_reload_drum",
        Time = 120 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_u100/mag_release.wav", t = 12 / 35},
            {s = "uc_u100/mag_out_drum2.wav", t = 10 / 35},
            { s = common .. "magpouch_gear.ogg", t = 23 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 80 / 35 },
            {s = "uc_u100/mag_in_drum2.wav", t = 70 / 35},
            {s = "uc_u100/mag_hit_drum2.wav", t = 95 / 35},
        },
    },
    ["reload_empty"] = {
        Source = "foregrip_reloadempty",
        Time = 105 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_u100/mag_release.wav", t = 12 / 35},
            {s = "uc_u100/mag_out.wav", t = 16 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 45 / 35 },
            {s = "uc_u100/mag_in.wav", t = 47 / 35},
            {s = "uc_u100/bolt_cycle2.wav", t = 70 / 35}
        },
    },
    ["reload_empty_10"] = {
        Source = "foregrip_reloadempty",
        Time = 105 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_u100/mag_release.wav", t = 12 / 35},
            {s = "uc_u100/mag_out_small.wav", t = 16 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 45 / 35 },
            {s = "uc_u100/mag_in_small.wav", t = 47 / 35},
            {s = "uc_u100/bolt_cycle2.wav", t = 70 / 35}
        },
    },
    ["reload_empty_100"] = {
        Source = "foregrip_reload_empty_drum",
        Time = 135 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_u100/mag_release.wav", t = 12 / 35},
            {s = "uc_u100/mag_out_drum2.wav", t = 10 / 35},
            { s = common .. "magpouch_gear.ogg", t = 23 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 45 / 35 },
            {s = "uc_u100/mag_in_drum2.wav", t = 63 / 35},
            {s = "uc_u100/mag_hit_drum2.wav", t = 85 / 35},
            {s = "uc_u100/bolt_cycle2.wav", t = 100 / 35}
        },
    },

    ["1_to_2"] = {
        SoundTable = {
            {s = rottle, t = 0.02},
            {s = path .. "mech2.wav", t = 0.12},
        },
        Source = "foregrip_fireselect",
        Time = 0.40,
    },
    ["2_to_1"] = {
        SoundTable = {
            {s = rottle, t = 0.02},
            {s = path .. "mech2.wav", t = 0.12},
        },
        Source = "foregrip_fireselect",
        Time = 0.40,
    },
    ["1_to_0"] = {
        Source = "foregrip_fireselect",
        Time = 0.40,
    },
    ["0_to_2"] = {
        Source = "foregrip_fireselect",
        Time = 0.40,
    },
}

if CLIENT then
    function SWEP:DrawWorldModel()
        local owner = self:GetOwner()
        local welem = self.WElements and self.WElements["ultimax_w"]

        if IsValid(owner) and welem then
            local bone = owner:LookupBone(welem.bone or "ValveBiped.Bip01_R_Hand")
            if not bone then self:DrawModel() return end

            local pos, ang = owner:GetBonePosition(bone)
            if not pos then self:DrawModel() return end

            ang:RotateAroundAxis(ang:Forward(), welem.angle.y)
            ang:RotateAroundAxis(ang:Right(),    welem.angle.p)
            ang:RotateAroundAxis(ang:Up(),       welem.angle.r)

            pos = pos
                + ang:Right()   * welem.pos.x
                + ang:Forward() * welem.pos.y
                + ang:Up()      * welem.pos.z

            self:SetRenderOrigin(pos)
            self:SetRenderAngles(ang)
            self:DrawModel()
        else
            self:DrawModel()
        end
    end
end
