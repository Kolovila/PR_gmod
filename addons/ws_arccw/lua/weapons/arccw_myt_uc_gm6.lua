SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "9Urban Expedition"
SWEP.AdminOnly = false
SWEP.UseHands = true

-- Muzzle and shell effects --

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
SWEP.ShellScale = 1.5
SWEP.ShellPitch = 100
SWEP.UC_ShellColor = Color(0.7*255, 0.2*255, 0.2*255)

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.CamAttachment = 3
SWEP.TracerNum = 1
SWEP.TracerCol = Color(25, 255, 25)
SWEP.TracerWidth = 2

-- Fake name --

SWEP.PrintName = "Mozsarato .50"
-- True name --
SWEP.TrueName = "GM6 Lynx"

-- Trivia --

SWEP.Trivia_Class = "Anti-materiel Rifle"
SWEP.Trivia_Desc = [[
Destruction in a bullpup configuration.

Dubbed the mini-howitzer. The might of this calibre knows no boundary of armour.
]]
SWEP.Trivia_Calibre = ".50 Browning Machine Gun"
SWEP.Trivia_Country = "Hungary"
SWEP.Trivia_Manufacturer = "Szerona Nemzetkoezi"
SWEP.Trivia_Year = 1991

-- Weapon slot --

SWEP.Slot = 2

-- Weapon's manufacturer real name --

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Sero International"
end

-- Viewmodel / Worldmodel / FOV --

SWEP.ViewModel = "models/weapons/arccw/c_uc_myt_gm6.mdl"
SWEP.WorldModel = "models/weapons/arccw/c_uc_myt_gm6.mdl"
SWEP.ViewModelFOV = 70
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

-- Damage --

SWEP.Damage = ArcCW.UC.StdDmg["50bmg"].max
SWEP.DamageMin = ArcCW.UC.StdDmg["50bmg"].min 
--SWEP.RangeMin = 1 -- is it 1 or 0???
SWEP.Range = 1800 -- in METRES
SWEP.Penetration = ArcCW.UC.StdDmg["50bmg"].pen
SWEP.DamageType = DMG_AIRBOAT + DMG_BULLET + DMG_ALWAYSGIB
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = ArcCW.UC.StdDmg["50bmg"].vel
SWEP.PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["50bmg"].vel

SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults

-- Mag size --

SWEP.chreleaseSize = 1
SWEP.Primary.ClipSize = 7
SWEP.ExtendedClipSize = 10
SWEP.ReducedClipSize = 4

-- Recoil --

SWEP.Recoil = 4
SWEP.RecoilSide = 2

SWEP.RecoilRise = 2
SWEP.RecoilPunch = 1
SWEP.VisualRecoilMult = 1
SWEP.MaxRecoilBlowback = 1
SWEP.MaxRecoilPunch = 1
SWEP.RecoilPunchpull = 1

SWEP.Sway = 1.5

-- Firerate / Firemodes --

SWEP.Delay = 60 / 200
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}


SWEP.ShootVol = 100 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound
SWEP.ShootPitchVariation = 0

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

-- NPC --

SWEP.NPCWeaponType = {"weapon_crossbow",}
SWEP.NPCWeight = 75

-- Accuracy --

SWEP.AccuracyMOA = 3.5
SWEP.HipDispersion = 750
SWEP.MoveDispersion = 220
SWEP.JumpDispersion = 1000

SWEP.Primary.Ammo = "SniperPenetratedRound"

-- Speed multipliers --

SWEP.SpeedMult = 0.7
SWEP.SightedSpeedMult = 0.35
SWEP.SightTime = 0.7
SWEP.ShootSpeedMult = 0.9

-- Length --

SWEP.BarrelLength = 48
SWEP.ExtraSightDist = 7

-- Ironsights / Customization / Poses --

SWEP.HolsterPos = Vector(0.5, 8, -0.5)
SWEP.HolsterAng = Angle(-10, 8, -15)

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.IronSightStruct = {
     Pos = Vector(-3.31, 3, 0.55),
     Ang = Angle(0, 0, 0),
     Magnification = 1.1,
     SwitchToSound = "",
}

SWEP.ActivePos = Vector(0, 5, 0.5)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, 5, 0.5)
SWEP.CustomizeAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(-1, 5, -0.25)
SWEP.CrouchAng = Angle(0, 0, -14)

SWEP.BarrelOffsetHip = Vector(2, 0, -5)

SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-3, 4, -8),
    ang        =    Angle(-6, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
}

-- Firing sounds --

local path = ")myt_uc_gm6/"
local path_308 = ")myt_uc_gm6/308/"
local common = ")/arccw_uc/common/"
local rottle = {common .. "cloth_1.ogg", common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_5.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local mech = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}
local mech_308 = {path_308 .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}
local ratel = {common .. "rattle1.ogg", common .. "rattle2.ogg", common .. "rattle3.ogg"}
local rutle = {common .. "movement-rifle-01.ogg", common .. "movement-rifle-02.ogg", common .. "movement-rifle-03.ogg", common .. "movement-rifle-04.ogg"}
local magdrop = {common .. "rifle_magdrop_1.ogg", common .. "rifle_magdrop_2.ogg", common .. "rifle_magdrop_3.ogg", common .. "rifle_magdrop_4.ogg"}
--SWEP.FirstShootSound = path .. "fire_first.ogg"

SWEP.ShootSound = {
    path .. "fire-01.ogg",
    path .. "fire-02.ogg",
    path .. "fire-03.ogg",
}
SWEP.ShootSoundSilenced = {
    path .. "fire-sup-01.ogg",

}
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = nil
SWEP.ShootDrySound = path .. "dryfire.ogg"

local tail = ")^/arccw_uc/common/50bmg/"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-50bmg-rif-ext-01.ogg",
    tail .. "fire-dist-50bmg-rif-ext-02.ogg",
    tail .. "fire-dist-50bmg-rif-ext-03.ogg",
    tail .. "fire-dist-50bmg-rif-ext-04.ogg",
    tail .. "fire-dist-50bmg-rif-ext-05.ogg",
    tail .. "fire-dist-50bmg-rif-ext-06.ogg"
}
SWEP.DistantShootSoundIndoors = {
    tail .. "fire-dist-50bmg-rif-int-01.ogg",
    tail .. "fire-dist-50bmg-rif-int-02.ogg",
    tail .. "fire-dist-50bmg-rif-int-03.ogg",
    tail .. "fire-dist-50bmg-rif-int-04.ogg",
    tail .. "fire-dist-50bmg-rif-int-05.ogg",
    tail .. "fire-dist-50bmg-rif-int-06.ogg"
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
SWEP.FiremodeSound = {
    path .. "selector-01.ogg",
    path .. "selector-02.ogg",
    path .. "selector-03.ogg",
    path .. "selector-04.ogg",
}
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

-- Bodygroups --

SWEP.BulletBones = {
    [1] = "W_BulletA",
    [2] = "W_Bullet"
}

SWEP.AttachmentElements = {	
    ["conv_308"] = {
        NameChange = "Egharovi 308",
        TrueNameChange = "GM6 Felisza",
        VMBodygroups = {
            {ind = 1, bg = 2},
            {ind = 2, bg = 1},
			{ind = 3, bg = 1},
			{ind = 4, bg = 1},	
			{ind = 7, bg = 2},
			{ind = 6, bg = 2},
        },
    },
    ["s_4"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
            {ind = 2, bg = 1},
        },
    },

	["l_s"] = {
        VMBodygroups = {
            {ind = 6, bg = 1},
            {ind = 7, bg = 1}, 
			{ind = 5, bg = 3},
        },
		AttPosMods = {
			[3] = { vpos = Vector(0, 0, 1.2) },
		},
		Override_IronSightStruct = {
			Pos = Vector(-3.31, 3, 1.35),
			Ang = Angle(0, 0, 0),
			Magnification = 1.1,
			SwitchToSound = "",
		},
    },	 
}

SWEP.DefaultBodygroups = "000000000000000"

SWEP.Hook_ModifyBodygroups = function(wep, data)
	local vm = data.vm
	local barrel_short = wep.Attachments[2].Installed == "uc_myt_gm6_b_s"
	local calibre_308 = wep.Attachments[7].Installed  == "uc_myt_gm6_cal_308"
	
	if wep.Attachments[1].Installed then 
        if barrel_short then vm:SetBodygroup(5, 4) 
	    else   vm:SetBodygroup(5, 1) end
	end

	if calibre_308 and barrel_short then vm:SetBodygroup(7, 3) end

	if wep.Attachments[3].Installed then vm:SetBodygroup(6, 2) end
end

SWEP.Hook_Think = ArcCW.UC.ADSReload

SWEP.NoHideLeftHandInCustomization = true
SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },

    ["ready"] = {
        Source = "deploy",
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.65,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0},
            {s = common .. "rattle.ogg", t = 0.2 + 5/40},
            {s = common .. "cloth_4.ogg",  t = 0.5 + 5/40},
            {s = "myt_uc_gm6/chforward.ogg", 		t = 18/40},
        },
        ProcDraw = false,
    },	
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {s = common .. "raise.ogg", t = 0},
            {s = common .. "shoulder.ogg", t = 0.15},
        },
    },
    ["holster"] = {
        Source = "holster",
        LHIK = false,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = ratel, t = 0},
            {s = common .. "cloth_6.ogg", t = 0.2},
        },
    },
    ["fire"] = {
        Source = "fire",
        ShellEjectAt = 0.01,
        SoundTable = {{ s = mech, t = 0, v = 1/3 }},
    },  
	["fire_iron"] = {
        Source = "fire",
        ShellEjectAt = 0.01,
        SoundTable = {
            {s = common .. "common_mech_light.ogg", t = 0},
            { s = mech, t = 0, v = 1 }
        },
    },

    -- Base --

    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 1.8,
        LastClip1OutTime = 0.9,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.65,
        SoundTable = {
            {s = rottle, 			                    t = 0/40},
            {s = "myt_uc_gm6/mag_dis.ogg", 				t = 18/40}, 
			{s = "myt_uc_gm6/mag_out.ogg", 				t = 33/40},
            {s = rottle, 			                    t = 20/40},
            {s = common .. "magpouch.ogg",              t = 32/40},
            {s = "myt_uc_gm6/mag_in.ogg",				t = 62/40},
            {s = "myt_uc_gm6/mag_hit.ogg", 				t = 81/40},
            {s = rottle, 			                    t = 90/40},
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 2.25,
        LastClip1OutTime = 60/40,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.8,
        SoundTable = {
            {s = rottle, 			                    t = 0/40},
            {s = "myt_uc_gm6/mag_dis.ogg", 				t = 26/40}, 
			{s = "myt_uc_gm6/mag_out.ogg", 				t = 38/40},
            {s = rottle, 			                    t = 40/40},
            {s = magdrop, 			                    t = 53/40, v = 0.5},
            {s = common .. "magpouch.ogg",              t = 65/40},
            {s = "myt_uc_gm6/mag_in.ogg",				t = 73/40},
            {s = "myt_uc_gm6/mag_hit.ogg", 				t = 95/40},
            {s = rottle, 			                    t = 69/40},
            {s = "myt_uc_gm6/bolt1.ogg",				t = 116/40},
            {s = "myt_uc_gm6/chforward.ogg", 			t = 125/40},
            {s = rottle, 			                    t = 140/40},
        },
    },

    ["enter_inspect"] = {
        Source = "inspect_enter",
        LHIK = true,
        LHIKIn = 0.3,
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
        LHIKEaseOut = 0.3,
        LHIKOut = 0.7,
        SoundTable = {
            {s = rottle, 			                    t = 0/40},
            {s = rottle, 			                    t = 17/40},
            {s = rottle, 			                    t = 69/40},
            {s = common .. "shoulder.ogg", 	        	t = 88/40, v = .5},
        },
    },

    -- 308 --

    ["reload_308"] = {
        Source = "reload_308",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 2,
        LastClip1OutTime = 0.9,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.575,
        SoundTable = {
            {s = rottle, 			                    t = 0/40},
			{s = "myt_uc_gm6/mag_out.ogg", 				t = 18/40},
            {s = rottle, 			                    t = 20/40},
            {s = common .. "magpouch.ogg",              t = 32/40},
            {s = "myt_uc_gm6/mag_in_308.ogg",			t = 52/40},
            {s = rottle, 			                    t = 74/40},
        },
    },
    ["reload_empty_308"] = {
        Source = "reload_empty_308",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 1.6,
        LastClip1OutTime = 60/40,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.8,
        SoundTable = {
            {s = rottle, 			                    t = 0/40},
			{s = "myt_uc_gm6/mag_out.ogg", 				t = 20/40},
            {s = rottle, 			                    t = 40/40},
            {s = magdrop, 			                    t = 35/40, v = 0.25},
            {s = common .. "magpouch.ogg",              t = 48/40},
            {s = "myt_uc_gm6/mag_in_308.ogg",			t = 52/40},
            {s = rottle, 			                    t = 70/40},
            {s = "myt_uc_gm6/chback.ogg",				t = 82/40},
            {s = "myt_uc_gm6/chforward.ogg", 			t = 87/40},
            {s = rottle, 			                    t = 106/40},
        },
    },
	
    ["fire_308"] = {
        Source = "fire_308",
        ShellEjectAt = 0.01,
        SoundTable = {{ s = mech_308, t = 0, v = 0.25 }},
    },  
	["fire_iron_308"] = {
        Source = "fire_308",
        ShellEjectAt = 0.01,
        SoundTable = {
            {s = common .. "common_mech_light.ogg", t = 0},
            { s = mech_308, t = 0 }
        },
    },

    ["enter_inspect_308"] = {
        Source = "inspect_enter_308",
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "movement-rifle-02.ogg", t = 0.1},
        },
    },
    ["idle_inspect_308"] = {
        Source = "inspect_loop_308",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect_308"] = {
        Source = "inspect_exit_308",
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.7,
        SoundTable = {
            {s = rottle, 			                    t = 0/40},
            {s = rottle, 			                    t = 17/40},
            {s = rottle, 			                    t = 69/40},
        },
    },

    -- flush --

    ["reload_f"] = {
        Source = "reload_f",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 2,
        LastClip1OutTime = 0.9,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.65,
        SoundTable = {
            {s = rottle, 			                    t = 0/40},
            {s = "myt_uc_gm6/mag_dis.ogg", 				t = 18/40}, 
			{s = "myt_uc_gm6/mag_out.ogg", 				t = 33/40},
            {s = rottle, 			                    t = 20/40},
            {s = common .. "magpouch.ogg",              t = 32/40},
            {s = "myt_uc_gm6/mag_in_308.ogg",				t = 62/40},
            {s = rottle, 			                    t = 74/40},
        },
    },
    ["reload_empty_f"] = {
        Source = "reload_empty_f",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 2.7,
        LastClip1OutTime = 60/40,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.8,
        SoundTable = {
            {s = rottle, 			                    t = 0/40},
            {s = "myt_uc_gm6/mag_dis.ogg", 				t = 26/40}, 
			{s = "myt_uc_gm6/mag_out.ogg", 				t = 38/40},
            {s = rottle, 			                    t = 40/40},
            {s = magdrop, 			                    t = 50/40, v = 0.25},
            {s = common .. "magpouch.ogg",              t = 65/40},
            {s = "myt_uc_gm6/mag_in_308.ogg",				t = 73/40},
            {s = rottle, 			                    t = 55/40},
            {s = "myt_uc_gm6/bolt1.ogg",				t = 101/40},
            {s = "myt_uc_gm6/chforward.ogg", 				t = 110/40},
            {s = rottle, 			                    t = 126/40},
        },
    },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        --InstalledEles = {"upper_flat"}, no such thing
        Slot = {"optic","optic_sniper"},
        Bone = "W_Main",
        VMScale = Vector(1.1, 1.1, 1.1),
        Offset = {
            vpos = Vector(0, -2.25, 3),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Barrel",
        DefaultAttName = "43.3\" Standard Barrel", -- they obviously made it with metric in mind first
        DefaultAttIcon = Material("entities/att/ue_gm6/b_b.png", "smooth mips"),
        Slot = "uc_myt_gm6_b",
        Bone = "W_Main",
        Offset = {
            vpos = Vector(3.5, -4.25, -7),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "W_Barrel",
        Offset = {
            vpos = Vector(0, 0, 4.5),
            vang = Angle(90, 0, -90),
        },
        ExcludeFlags = {"sd"},
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip"},
        Bone = "W_Main",
        Offset = {
            vpos = Vector(0, 1.5, 9.5),
            vang = Angle(90, 0, -90),
        },
        MergeSlots = {13},
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "W_Main",
        Offset = {
            vpos = Vector(-1.35, 0, 3.5),
            vang = Angle(90, 0, 180),
        },
        VMScale = Vector(1.1, 1.1, 1.1),
        GivesFlags = {"tac"},
        --InstalledEles = {"ud_m16_clamp_fullsize"}
    },
    {
        PrintName = "Grip Type",
        Slot = {"uc_myt_scar_grip"},
		Hidden = true,
        DefaultAttName = "Standard Grip",
    },
    {
        PrintName = [[Calibre/Magazine]],
        DefaultAttIcon = Material("entities/att/ue_gm6/c_b.png", "smooth mips"),
        Slot = {"uc_myt_gm6_mag"},
        Bone = "W_Main",
        Offset = {
            vpos = Vector(0, -0.75, 9),
            vang = Angle(90, 0, -90),
        },
        DefaultAttName = "7-Round .50 BMG Mag",
    },
    {
        PrintName = "Ammo Type",
        DefaultAttName = "\"FMJ\" Full Metal Jacket",
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
        Slot = "uc_fg", -- Fire group
        DefaultAttName = "Standard Internals"
    },
    {
        PrintName = "Charm",
        Slot = {"charm", "fml_charm"},
        FreeSlot = true,
        Bone = "W_Main",
        Offset = {
            vpos = Vector(1, 0, 0),
            vang = Angle(90, 0, -75),
        },
	},
    {
        PrintName = "M203 slot",
        Slot = "uc_ubgl",
        Bone = "W_Main",
        Offset = {
            vpos = Vector(0, 0.5, 8.5),
            vang = Angle(90, 0, -90),
        },
        Hidden = true,
        InstalledEles = {"mount_underbarrel"},
	},
}