SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "SVD Dragunov"
SWEP.TrueName = "SVD Dragunov"
SWEP.Trivia_Class = "Marksman Rifle"
SWEP.Trivia_Desc =
    [[Designed as the worlds first Dedicated Marksman Rifle, the SVD Dragunov was designed in the late 1950s and early 1960s by the Soviet Union. Intended to replace the aging Mosin-Nagant and pre-war SVT-40 rifles, it was the first of it's kind to be officially adopted anywhere.

An accurate rifle, firing a powerful round, somewhat let down by its low magazine capacity and dated design features.]]
SWEP.Trivia_Manufacturer = "Izhmash"
SWEP.Trivia_Calibre = "7.62x54mmR"
SWEP.Trivia_Mechanism = "Gas-Operated Rotating Bolt"
SWEP.Trivia_Country = "Soviet Union"
SWEP.Trivia_Year = 1963

SWEP.Slot = 2

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Izmash"
    SWEP.Trivia_Country = "Soviet Union"
end

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/inss_svd/vm_svd_uc_r4.mdl"
SWEP.WorldModel = "models/weapons/inss_svd/wm_svd_uc_r4.mdl"

SWEP.MirrorVMWM = false

SWEP.ViewModelFOV = 70

SWEP.WorldModelOffset = {
    pos = Vector(5, 1, -1),
    ang = Angle(170, 180, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.9,
}

SWEP.DefaultBodygroups = "0000000000"

SWEP.Damage = 70
SWEP.DamageMin = 40
SWEP.RangeMin = 150
SWEP.Range = 625

SWEP.Penetration = 18
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 850
SWEP.PhysBulletMuzzleVelocity = 850
SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 10
SWEP.ExtendedClipSize = 10
SWEP.ReducedClipSize = 10

SWEP.Recoil = 1.75
SWEP.RecoilSide = 0.7

SWEP.RecoilRise = 0.7
SWEP.RecoilPunch = 1.1
SWEP.VisualRecoilMult = 1
SWEP.MaxRecoilBlowback = 0
SWEP.MaxRecoilPunch = 0
SWEP.RecoilPunchBack = 2

SWEP.Sway = 0.4

SWEP.Delay = 60 / 350
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0,
    },
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 125

SWEP.AccuracyMOA = 2
SWEP.HipDispersion = 750
SWEP.MoveDispersion = 150

SWEP.Primary.Ammo = "ar2"
SWEP.MagID = "svd"

SWEP.ShootVol = 120
SWEP.ShootPitch = 100

local path = ")^uc_evolys/"
local common = ")^arccw_uc/common/"
local rottle = {
    common .. "cloth_1.ogg",
    common .. "cloth_2.ogg",
    common .. "cloth_3.ogg",
    common .. "cloth_4.ogg",
    common .. "cloth_6.ogg",
    common .. "rattle.ogg",
}
local ratel = { common .. "rattle1.ogg", common .. "rattle2.ogg", common .. "rattle3.ogg" }

SWEP.ShootSound = "weapons/svd/svd_fp.wav"
SWEP.ShootSoundSilenced = "weapons/svd/svd_suppressed_fp.wav"

local tail = ")/arccw_uc/common/762x39/"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-762x39-rif-ext-01.ogg",
    tail .. "fire-dist-762x39-rif-ext-02.ogg",
    tail .. "fire-dist-762x39-rif-ext-03.ogg",
    tail .. "fire-dist-762x39-rif-ext-04.ogg",
    tail .. "fire-dist-762x39-rif-ext-05.ogg",
    tail .. "fire-dist-762x39-rif-ext-06.ogg",
}
SWEP.DistantShootSoundIndoors = {
    common .. "fire-dist-int-rifle-01.ogg",
    common .. "fire-dist-int-rifle-02.ogg",
    common .. "fire-dist-int-rifle-03.ogg",
    common .. "fire-dist-int-rifle-04.ogg",
    common .. "fire-dist-int-rifle-05.ogg",
    common .. "fire-dist-int-rifle-06.ogg",
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
    common .. "sup-tail-10.ogg",
}
SWEP.DistantShootSoundIndoorsSilenced = {
    common .. "fire-dist-int-pistol-light-01.ogg",
    common .. "fire-dist-int-pistol-light-02.ogg",
    common .. "fire-dist-int-pistol-light-03.ogg",
    common .. "fire-dist-int-pistol-light-04.ogg",
    common .. "fire-dist-int-pistol-light-05.ogg",
    common .. "fire-dist-int-pistol-light-06.ogg",
}
SWEP.DistantShootSoundIndoorsSilenced = {
    common .. "sup_tail.ogg",
}
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.ShellModel = "models/shells/shell_762nato.mdl"
SWEP.ShellPitch = 90
SWEP.ShellRotate = 0
SWEP.ShellScale = 1.25

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 3

SWEP.SpeedMult = 0.85
SWEP.SightedSpeedMult = 0.5

SWEP.BulletBones = {}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-2.76, 3, 1.4),
    Ang = Angle(0.5, 0.005, 0),
    Magnification = 1.1,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0.1, 1, 1)
SWEP.ActiveAng = Angle(0.1, 0.25, 0)

SWEP.CrouchPos = Vector(0.2, 1.75, 1.3)
SWEP.CrouchAng = Angle(0.5, 0.5, -7.5)

SWEP.SprintPos = Vector(3, 2, -1)
SWEP.SprintAng = nil

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.CustomizePos = Vector(7.824, 0.5, -1.897)
SWEP.CustomizeAng = Angle(12.149, 30.547, 0)

SWEP.BarrelLength = 30

SWEP.DefaultElements = { "nofs" }

SWEP.AttachmentElements = {
    ["extendedmag"] = {
        VMBodygroups = { { ind = 1, bg = 1 } },
        WMBodygroups = { { ind = 1, bg = 1 } },
    },
    ["reducedmag"] = {
        VMBodygroups = { { ind = 1, bg = 2 } },
        WMBodygroups = { { ind = 1, bg = 2 } },
    },
    ["svdmount_optic"] = {
        ExcludeFlags = { "uc_optic_pso1", "uc_optic_kobra" },
        VMElements = {
            {
                Model = "models/weapons/inss_svd/upgrades/a_svd_modkit.mdl",
                Bone = "b_wpn",
                Offset = {
                    pos = Vector(0.4, -6.60, 31.45),
                    ang = Angle(90, -0, 90),
                },
                ModelSkin = 0,
                ModelBodygroups = "",
                Scale = Vector(0.9, 1, 1),
                IsMuzzleDevice = false,
            },
        },
        WMElements = {
            {
                Model = "models/weapons/inss_svd/upgrades/a_svd_modkit.mdl",
                Offset = {
                    pos = Vector(2.4, 1, -41.1),
                    ang = Angle(-100, -0, -0),
                },
                IsMuzzleDevice = false,
            },
        },
    },
}

SWEP.ExtraSightDist = 6

SWEP.Attachments = {
    {
        PrintName = "Optic",
        Slot = { "optic", "ur_ak_optic" },
        DefaultAttName = "Iron Sights",
        Bone = "b_wpn",
        Offset = {
            vpos = Vector(0.4, -7, 3.02),
            vang = Angle(0, -90, 0),
            wpos = Vector(8, 1, -6.5),
            wang = Angle(170, 180, 0),
        },
        VMScale = Vector(1, 1, 1),
        InstalledEles = { "svdmount_optic" },
        CorrectivePos = Vector(0, 0, 0),
        CorrectiveAng = Angle(0, -180, 0),
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = "muzzle",
        Bone = "b_wpn",
        Offset = {
            vpos = Vector(0.415, 20.7, 1.55),
            vang = Angle(-0, -90, 0),
            wpos = Vector(44.5, 1, -11.05),
            wang = Angle(-10, 0, 180),
        },
    },
    {
        PrintName = "Underbarrel",
        Slot = { "foregrip", "ubgl", "bipod" },
        Bone = "b_wpn",
        Offset = {
            vpos = Vector(0.5, 6, 1.3),
            vang = Angle(-0, -90, 0),
            wpos = Vector(18, 1, -5.7),
            wang = Angle(-10.216, 0, 180),
        },
    },
    {
        PrintName = "Tactical",
        Slot = "tac",
        Bone = "b_wpn",
        Offset = {
            vpos = Vector(0.2, 9, 1.55),
            vang = Angle(-90, -90, 0),
            wpos = Vector(29, 0.7, -8.35),
            wang = Angle(-10, 0, 90),
        },
    },
    {
        PrintName = "Fire Group",
        Slot = "fcg",
        DefaultAttName = "Standard FCG",
    },
    {
        PrintName = "Ammo Type",
        Slot = "ammo_bullet",
    },
    {
        PrintName = "Powder Load",
        Slot = "uc_powder",
        DefaultAttName = "Standard Load",
    },
    {
        PrintName = "Training Package",
        Slot = "uc_tp",
        DefaultAttName = "Basic Training",
    },
    {
        PrintName = "Internals",
        Slot = "uc_fg",
        DefaultAttName = "Standard Internals",
    },
    {
        PrintName = "Perk",
        Slot = "perk",
    },
    {
        PrintName = "Charm",
        Slot = "charm",
        FreeSlot = true,
        Bone = "b_wpn",
        Offset = {
            vpos = Vector(1, -5.25, 1),
            vang = Angle(-90, 270, -270),
            wpos = Vector(7.3, 2, -3.2),
            wang = Angle(-10.393, 0, 180),
        },
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "base_idle",
        Time = 1,
    },
    ["idle_empty"] = {
        Source = "empty_idle",
        Time = 0.001,
    },
    ["idle_iron_empty"] = {
        Source = "iron_empty_idle",
        Time = 1,
    },
    ["draw"] = {
        Source = "base_draw",
        Time = 1,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["holster"] = {
        Source = "base_holster",
        Time = 0.75,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["ready"] = {
        Source = "base_ready",
        Time = 4,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["fire"] = {
        Source = "base_fire",
        Time = 1,
        ShellEjectAt = 0,
    },
    ["fire_iron"] = {
        Source = "iron_fire",
        Time = 1,
        ShellEjectAt = 0,
    },
    ["fire_empty"] = {
        Source = "base_firelast",
        Time = 1,
        ShellEjectAt = 0,
    },
    ["fire_iron_empty"] = {
        Source = "iron_firelast",
        Time = 1,
        ShellEjectAt = 0,
    },
    ["reload"] = {
        Source = "base_reload",
        Time = 3.5,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
    },
    ["reload_empty"] = {
        Source = "base_reloadempty",
        Time = 3.75,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
    },
}

local native = SWEP.Attachments
local function slot(label, category, default, icon)
    return {
        PrintName = label,
        Slot = category,
        DefaultAttName = default,
        DefaultAttIcon = Material(
            icon or ("entities/att/uc_svd_" .. category:sub(8) .. ".png"),
            "mips smooth"
        ),
    }
end
SWEP.Attachments = {
    native[1],
    slot("Barrel", "uc_svd_barrel", "24.4\" Factory Barrel", "entities/att/uc_svd_barrel.png"),
    native[2],
    native[3],
    native[4],
    slot("Caliber", "uc_svd_caliber", "7.62x54mmR", "entities/att/uc_bullets/762x54.png"),
    slot("Magazine", "uc_svd_magazine", "10-Round Steel", "entities/att/uc_svd_magazine.png"),
    slot("Stock", "uc_svd_stock", "Factory Thumbhole", "entities/att/uc_svd_stock.png"),
    slot("Furniture", "uc_svd_furniture", "Laminated Wood", "entities/att/uc_svd_furniture.png"),
    native[6],
    native[7],
    native[8],
    native[9],
    native[5],
    native[10],
    native[11],
}
SWEP.DefaultBodygroups = "00000"
SWEP.DefaultWMBodygroups = "00000"
SWEP.DefaultElements = {}
SWEP.AttachmentElements.extendedmag = nil
SWEP.AttachmentElements.reducedmag = nil
for _, item in ipairs({
    { "svd_barrel_compact", 1, 1 },
    { "svd_barrel_marksman", 1, 2 },
    { "svd_mag_five", 2, 1 },
    { "svd_mag_twenty", 2, 2 },
    { "svd_stock_compact", 3, 1 },
    { "svd_stock_target", 3, 2 },
}) do
    SWEP.AttachmentElements[item[1]] = {
        VMBodygroups = { { ind = item[2], bg = item[3] } },
        WMBodygroups = { { ind = item[2], bg = item[3] } },
    }
end
SWEP.AttachmentElements.svd_polymer = { VMSkin = 1, WMSkin = 1 }
SWEP.Attachments[3].Offset.vpos = Vector(0.415, 21.58, 1.55)
SWEP.AttachmentElements.svd_barrel_compact.AttPosMods =
    { [3] = { vpos = Vector(0.415, 16.38, 1.55), wpos = Vector(37.874, 1, -11.05) } }
SWEP.AttachmentElements.svd_barrel_marksman.AttPosMods =
    { [3] = { vpos = Vector(0.415, 24.58, 1.55), wpos = Vector(48.336, 1, -11.05) } }
SWEP.Hook_ModifyBodygroups = function(wep, data)
    if IsValid(data.vm) then
        data.vm:SetSkin(wep:GetBuff_Override("Override_SVDFurnitureSkin") or 0)
    end
end
SWEP.Attachments[10].Slot = "uc_ammo"
SWEP.Attachments[10].DefaultAttName = "Full Metal Jacket"

for _, option in ipairs({
    { "svd_ndm86_handguard", 4, 1 },
    { "svd_ndm86_barrel", 1, 3 },
    { "svd_ndm86_magazine", 2, 3 },
    { "svd_ndm86_stock", 3, 3 },
}) do
    SWEP.AttachmentElements[option[1]] = {
        VMBodygroups = { { ind = option[2], bg = option[3] } },
        WMBodygroups = { { ind = option[2], bg = option[3] } },
    }
end
SWEP.AttachmentElements.svd_ndm86_receiver =
    { VMBodygroups = { { ind = 0, bg = 1 } }, WMBodygroups = { { ind = 0, bg = 1 } } }
SWEP.AttachmentElements.svd_ndm86_barrel.AttPosMods =
    { [3] = { vpos = Vector(0.4025, 21.08, 1.55), wpos = Vector(43.864, 1, -11.05) } }

local originalDescription = SWEP.Trivia_Desc
SWEP.Hook_DescChange = function(wep, description)
    if wep:GetBuff_Override("Override_NDM86") then
        return [[Chinese export version of the Type 79/85 marksman rifle, manufactured at Factory 26 and sold by Norinco. Offered in both the original rimmed cartridge and .308 Winchester, the latter uses a distinctive straight ten-round magazine. Its laminated thumbhole stock and ventilated handguards follow the Soviet pattern closely.

Retains the long-range reach and quick follow-up shots of the original rifle, with slightly softer recoil and reduced penetration. The ten-round magazine favors deliberate fire over extended engagements.]]
    end
    return originalDescription
end
