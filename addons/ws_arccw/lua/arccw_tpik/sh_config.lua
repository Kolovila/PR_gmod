ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK

TPIK.Version = "1.0.0"

TPIK.RightHandBones = {
    "ValveBiped.Bip01_R_Hand",
    "ValveBiped.Bip01_R_Finger4",
    "ValveBiped.Bip01_R_Finger41",
    "ValveBiped.Bip01_R_Finger42",
    "ValveBiped.Bip01_R_Finger3",
    "ValveBiped.Bip01_R_Finger31",
    "ValveBiped.Bip01_R_Finger32",
    "ValveBiped.Bip01_R_Finger2",
    "ValveBiped.Bip01_R_Finger21",
    "ValveBiped.Bip01_R_Finger22",
    "ValveBiped.Bip01_R_Finger1",
    "ValveBiped.Bip01_R_Finger11",
    "ValveBiped.Bip01_R_Finger12",
    "ValveBiped.Bip01_R_Finger0",
    "ValveBiped.Bip01_R_Finger01",
    "ValveBiped.Bip01_R_Finger02"
}

TPIK.LeftHandBones = {
    "ValveBiped.Bip01_L_Hand",
    "ValveBiped.Bip01_L_Finger4",
    "ValveBiped.Bip01_L_Finger41",
    "ValveBiped.Bip01_L_Finger42",
    "ValveBiped.Bip01_L_Finger3",
    "ValveBiped.Bip01_L_Finger31",
    "ValveBiped.Bip01_L_Finger32",
    "ValveBiped.Bip01_L_Finger2",
    "ValveBiped.Bip01_L_Finger21",
    "ValveBiped.Bip01_L_Finger22",
    "ValveBiped.Bip01_L_Finger1",
    "ValveBiped.Bip01_L_Finger11",
    "ValveBiped.Bip01_L_Finger12",
    "ValveBiped.Bip01_L_Finger0",
    "ValveBiped.Bip01_L_Finger01",
    "ValveBiped.Bip01_L_Finger02"
}

TPIK.HandBones = {}

for _, bone in ipairs(TPIK.RightHandBones) do
    TPIK.HandBones[#TPIK.HandBones + 1] = bone
end

for _, bone in ipairs(TPIK.LeftHandBones) do
    TPIK.HandBones[#TPIK.HandBones + 1] = bone
end

TPIK.AnchorBone = "ValveBiped.Bip01_R_Hand"

TPIK.SpineBone = "ValveBiped.Bip01_Spine4"
TPIK.HeadBone = "ValveBiped.Bip01_Head1"

TPIK.ArmBones = {
    Left = {
        UpperArm = "ValveBiped.Bip01_L_UpperArm",
        Forearm  = "ValveBiped.Bip01_L_Forearm",
        Hand     = "ValveBiped.Bip01_L_Hand"
    },
    Right = {
        UpperArm = "ValveBiped.Bip01_R_UpperArm",
        Forearm  = "ValveBiped.Bip01_R_Forearm",
        Hand     = "ValveBiped.Bip01_R_Hand"
    }
}

local ZERO = {Pos = Vector(0, 0, 0), Ang = Angle(0, 0, 0)}

TPIK.PoseOffsets = {
    default  = ZERO,

    ar2      = ZERO,
    smg      = ZERO,
    shotgun  = ZERO,
    crossbow = ZERO,
    rpg      = ZERO,
    physgun  = ZERO,
    pistol   = ZERO,
    revolver = ZERO,
    melee    = ZERO,
    melee2   = ZERO,
    knife    = ZERO,
    fist     = ZERO,
    duel     = ZERO,
    grenade  = ZERO,
    slam     = ZERO,
    camera   = ZERO,
    magic    = ZERO,
    passive  = ZERO,
    normal   = ZERO
}

TPIK.PropBoneTokens = {
    "mag",
    "clip",
    "bullet",
    "shell",
    "ammo",
    "belt",
    "rocket",
    "warhead",
    "projectile",
    "grenade",
    "round",
    "cartridge",
    "speedload",
    "speedreload",
    "moonclip",
    "moon",
    "strip",
    "stripper",
    "loader",
    "casing"
}

TPIK.PropLoadedTokens = {
    "warhead",
    "projectile",
    "rocket"
}

TPIK.PropReloadOnlyTokens = {
    "speedload",
    "speedreload",
    "moonclip",
    "strip",
    "stripper",
    "loader",
    "ammo_clip"
}

TPIK.NotMagTokens = {
    "round",
    "bullet",
    "shell",
    "casing",
    "case",
    "cart"
}

TPIK.ProjectileTokens = {
    "grenade",
    "nade",
    "rocket",
    "warhead",
    "projectile",
    "proj",
    "slug",
    "bullet",
    "round"
}

TPIK.CharacterBoneTokens = {
    "valvebiped",
    "bip01",
    "b_ch_",
    "camera",
    "ik_hand_root",
    "clavic",
    "spine",
    "finger",
    "thumb",
    "wrist",
    "hand",
    "arm"
}

TPIK.PropBoneExclude = {
    "magrel",
    "mag_rel",
    "magcatch",
    "mag_catch",
    "magwell",
    "mag_well",
    "release",
    "button",
    "lever",
    "latch",
    "port",
    "guide"
}

TPIK.PropBoneMaxDist = 20

TPIK.PropIdleScale = 1

TPIK.BoneClamp = 40

TPIK.IKVerticalGuard = 0.06

TPIK.UBGLCaseCycle = 0.25

TPIK.AnimHideBones = {
    ["arccw_uc_mosin"] = {
        ["sgreload_insert_clip"] = {"chamberedround"},
    },
    ["arccw_myt_c1a1"] = {
        ["reload_556"] = {"strip"},
        ["reload_empty_556"] = {"strip"},
        ["reload_sd"] = {"strip"},
        ["reload_empty_sd"] = {"strip"},
        ["reload_shotgun"] = {"strip"},
        ["reload_empty_40"] = {"strip"},
        ["reload_empty_10"] = {"strip"},
    },
}

TPIK.UBGLCaseAtts = {
    ["uc_ubgl_m203"] = true,
}

TPIK.ADSPush = Vector(0, 4, -0.75)

TPIK.HipOffsets = {
    pistol   = Vector(-2, 3.5, 0),
    revolver = Vector(-2, 3.5, 0)
}

TPIK.AimOffsets = {
    pistol   = Vector(-1, 1.5, 0),
    revolver = Vector(-1, 1.5, 0)
}

TPIK.HoldDrop = {
    pistol   = 0.55,
    revolver = 0.55
}

TPIK.ShoulderBones = {
    {"ValveBiped.Bip01_L_Clavicle", "ValveBiped.Bip01_L_Hand"},
    {"ValveBiped.Bip01_R_Clavicle", "ValveBiped.Bip01_R_Hand"}
}

TPIK.ViewLeadMax = 35

TPIK.AimTrack = 14

TPIK.ShoulderPush = {
    pistol   = 2.5,
    revolver = 2.5
}

TPIK.DefaultLimbLength = 12

TPIK.ArmStretch = 1.35

TPIK.HeadSightAng = Angle(4, -18, 12)
TPIK.HeadReloadAng = Angle(8, -4, -2)

TPIK.AimEyeFlexes = {
    left_lid_closer = 1,
    left_lid_tightener = 0.45
}

TPIK.AimEyeSuppress = {"blink"}
TPIK.AimEyeSpeed = 2.5

TPIK.HeadMotionScale = 1
TPIK.HeadMotionMax = 18

TPIK.BlockGrace = 0.15

TPIK.DefaultConfig = {
    NoTPIK = false,
    NoLeftHand = false,
    ForceLeftHand = false,
    PropDist = TPIK.PropBoneMaxDist,
    Offsets = {},
    HideBones = {},
    KeepBones = {}
}
