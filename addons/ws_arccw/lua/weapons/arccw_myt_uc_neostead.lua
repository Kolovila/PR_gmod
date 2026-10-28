SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "9Urban Expedition"
SWEP.AdminOnly = false
SWEP.UseHands = true

-- Muzzle and shell effects --

SWEP.MuzzleEffect = "muzzleflash_shotgun"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
SWEP.ShellPitch = 100
SWEP.ShellSounds = ArcCW.ShotgunShellSoundsTable
SWEP.ShellScale = 1
SWEP.UC_ShellColor = Color(0.7*255, 0.2*255, 0.2*255)

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.CamAttachment = 3

-- Fake name --

SWEP.PrintName = "Paatopveer-20"

-- True name --

SWEP.TrueName = "NeoStead 2000"

-- Trivia --

SWEP.Trivia_Class = "Shotgun"
SWEP.Trivia_Desc = "Foward pumping shotgun feeding from two alternating tubes with increased capacity. Bullpup configuration gives it more ergonomics"
SWEP.Trivia_Manufacturer = "Trouwenvorst Wapenkamer"
SWEP.Trivia_Calibre = "12 Gauge"
SWEP.Trivia_Mechanism = "Pump Action"
SWEP.Trivia_Country = "Zuid Afrika"
SWEP.Trivia_Year = 2001

-- Weapon slot --

SWEP.Slot = 3

-- Weapon's manufacturer real name --

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Truvelo Armoury" 
	SWEP.Trivia_Country = "South Africa"
end

-- Viewmodel / Worldmodel / FOV --

SWEP.ViewModel = "models/weapons/arccw/c_uc_myt_neostead.mdl"
SWEP.WorldModel = "models/weapons/arccw/c_uc_myt_neostead.mdl"
SWEP.ViewModelFOV = 70
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.DefaultBodygroups = "000000000"

SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-5.5, 5, -5.5),
    ang        =    Angle(-12, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale = 1 - ( 0.35 * 0.5 )
}

-- Damage parameters --

SWEP.Damage = 16 -- 6 pellets to kill
SWEP.DamageMin = 8 -- 10 pellets to kill
SWEP.Range = 35
SWEP.RangeMin = 4
SWEP.Num = 9
SWEP.Penetration = 2
SWEP.DamageType = DMG_BUCKSHOT
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 365
SWEP.PhysBulletMuzzleVelocity = 365

SWEP.HullSize = 0.5

SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun

-- Mag size --

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 12
SWEP.ExtendedClipSize = 8
SWEP.ReducedClipSize = 6

-- Recoil --

SWEP.Recoil = 2.9
SWEP.RecoilSide = 1.2

SWEP.RecoilRise = 0.26
SWEP.VisualRecoilMult = 1
SWEP.MaxRecoilBlowback = 1
SWEP.MaxRecoilPunch = 1

SWEP.Sway = 0.5

-- Firerate / Firemodes --

SWEP.Delay = 60 / 300
SWEP.Firemodes = {
    {
        PrintName = "fcg.pump",
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.NoLastCycle = true
SWEP.ManualAction = true
SWEP.ShotgunReload = true

SWEP.ShootVol = 160
SWEP.ShootPitch = 100

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

-- NPC --

SWEP.NPCWeaponType = "weapon_shotgun"
SWEP.NPCWeight = 210

-- Accuracy --

SWEP.AccuracyMOA = 30
SWEP.HipDispersion = 400
SWEP.MoveDispersion = 100
SWEP.JumpDispersion = 1000

SWEP.Primary.Ammo = "buckshot"

-- Speed multipliers --

SWEP.SpeedMult = 0.9
SWEP.SightedSpeedMult = 0.75
SWEP.SightTime = 0.4
SWEP.ShootSpeedMult = 0.75

-- Length --

SWEP.BarrelLength = 24
SWEP.ExtraSightDist = 2

-- Ironsights / Customization / Poses --

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.IronSightStruct = {
	Pos = Vector(-3.72, 0, 0.225),
	Ang = Angle(-1.2, 0, 0),
	Magnification = 1.1,
	SwitchToSound = "",
}

SWEP.HolsterPos = Vector(2, 0, -2)
SWEP.HolsterAng = Angle(-5.5, 20, -20)

SWEP.SprintPos = Vector(-1, 0, -3.5)
SWEP.SprintAng = Angle(3.5, 15, -20)

SWEP.ActivePos = Vector(0, 2, 0.5)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(-3.8, 0, -1)
SWEP.CrouchAng = Angle(0, 0, -30)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(3, 0, -4)

SWEP.CustomizePos = Vector(0, 2, 1)
SWEP.CustomizeAng = Angle(0, 0, 0)


SWEP.Malfunction = true
SWEP.MalfunctionTakeRound = true
SWEP.MalfunctionMean = 500
SWEP.MalfunctionVariance = 0.99
-- Firing sounds --

local common = ")/arccw_uc/common/"
local tail = ")/arccw_uc/common/12ga/"
SWEP.ShootSound = {"myt_uc_neostead/fire.ogg"}
SWEP.ShootSoundSilenced = {"myt_uc_neostead/firesd.ogg"}
SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-12ga-pasg-ext-01.ogg",
    tail .. "fire-dist-12ga-pasg-ext-02.ogg",
    tail .. "fire-dist-12ga-pasg-ext-03.ogg",
    tail .. "fire-dist-12ga-pasg-ext-04.ogg",
    tail .. "fire-dist-12ga-pasg-ext-05.ogg",
    tail .. "fire-dist-12ga-pasg-ext-06.ogg"
}
SWEP.DistantShootSoundIndoors = {
    common .. "fire-dist-int-shotgun-01.ogg",
    common .. "fire-dist-int-shotgun-02.ogg",
    common .. "fire-dist-int-shotgun-03.ogg",
    common .. "fire-dist-int-shotgun-04.ogg",
    common .. "fire-dist-int-shotgun-05.ogg",
    common .. "fire-dist-int-shotgun-06.ogg"
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

SWEP.Hook_Think = ArcCW.UC.ADSReload

SWEP.Animations = {
    ["ready"] = {
        Source = "sgreload_finish_empty",
        Time = 50 / 40,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 1.2,
        LHIKOut = 1.4,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0.2},
            {s = common .. "rattle.ogg", t = 0.2},
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.5},
			{s = "myt_uc_neostead/pump2.ogg", t = 30/40},
            {s = common .. "shoulder.ogg",  t = 0.9},
        },
        ProcDraw = true,
    },
    ["idle"] = {
        Source = "idle",
    },
    ["draw"] = {
        Source = "draw",
        Time = 20 / 30,
        SoundTable = ArcCW.UC.DrawSounds,
    },
    ["holster"] = {
        Source = "holster",
        Time = 20 / 30,
        SoundTable = ArcCW.UC.HolsterSounds,
    },
    ["fire"] = {
        Source = "fire",
        MinProgress = 8 / 30,
    },
    ["fire_iron"] = {
        Source = "fire_iron",
        MinProgress = 8 / 30,
    },
    ["cycle"] = {
        Source = "cycle",
        Time = 26/40,
        ShellEjectAt = 0.1,
        MinProgress = 0.26,
        SoundTable = {
			{s = {"myt_uc_neostead/pump.ogg", "myt_uc_neostead/pump2.ogg"}, t = 0/40},	
        },
    },
	
    ["sgreload_start"] = {
        Source = "sgreload_start",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = common .. "shoulder.ogg",  t = 0.1},
			{s = "myt_uc_neostead/open_foley.ogg", t = 0/40},
			{s = "myt_uc_neostead/open.ogg", t = 0/40},
        },
    },	
    ["sgreload_insert"] = {
        Source = "sgreload_insert_1",
        MinProgress = 0.24,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        TPAnimStartTime = 0.3,
        SoundTable = {
			{s = "myt_uc_neostead/load.ogg", t = 3/40},	
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
        },
    }, 
	["sgreload_insert_2"] = {
        Source = "sgreload_insert",
        MinProgress = 38/40,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        TPAnimStartTime = 0.3,
        LastClip1OutTime = 38/40,
        SoundTable = {
			{s = "myt_uc_neostead/load2.ogg", t = 3/40},	
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
        },
    },
    ["sgreload_finish"] = {
        Source = "sgreload_finish",
        MinProgress = 28/40,
        TPAnimStartTime = 0.8,
        LastClip1OutTime = 28/40,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0},
            {s = common .. "shoulder.ogg",  t = 0.27},
			{s = "myt_uc_neostead/close.ogg", t = 4/40},
        },
    },
    ["sgreload_finish_empty"] = {
        Source = "sgreload_finish_empty",
        MinProgress = 45/40,
        LastClip1OutTime = 45/40,
        TPAnimStartTime = 0.5,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        ShellEjectAt = 35/40,
        SoundTable = {
            {s = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}, t = 0.5},
			{s = "myt_uc_neostead/close.ogg", t = 4/40},
			{s = "myt_uc_neostead/pump2.ogg", t = 32/40},
            {s = common .. "shoulder.ogg",  t = 0.9},
        },
    },

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
}


SWEP.BulletBones = { -- WHICH IS WHICH?????????
    [0] = {"W_AmmoC1","W_AmmoC"}, 
	[1] = {"W_AmmoC1","W_AmmoC"},
	[2] = {"W_AmmoC"},
}

-- Bodygroups --
SWEP.Hook_ModifyBodygroups = function(wep, data)
    local vm = data.vm

    if wep.Attachments[4].Installed then
		if wep.Attachments[3].Installed then vm:SetBodygroup(5, 0) 
			else   vm:SetBodygroup(5, 1) 
		end
	end
end

SWEP.AttachmentElements = {
    ["optic_rail"] = { VMBodygroups = { {ind = 1, bg = 1},} }, 
	["muz_ex"] = { VMBodygroups = { {ind = 6, bg = 1}, } },	
	["rail_bot"] = { VMBodygroups = { {ind = 4, bg = 1}, },	AttPosMods = {[4] = { vpos = Vector(-1.325, -1.15, 0) },} },
	["rail_side"] = { VMBodygroups = { {ind = 5, bg = 1}, } },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic_lp","optic","optic_sniper"},
        Bone = "W_Main",
        Offset = {
            vpos = Vector(0, -4.6, -2),
            vang = Angle(90, 0, -90),
        },
        VMScale = Vector(1, 1, 1),
        CorrectiveAng = Angle(0, 0, 0),
        InstalledEles = {"optic_rail"}
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle_shotgun"},
        Bone = "W_Main",
        Offset = {
            vpos = Vector(0, 0, 20.2),
            vang = Angle(90, 0, -90),
        },
        InstalledEles = {"muz_ex"},
        MergeSlots = {9},
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip"},
        Bone = "W_Pump",
        Offset = {
            vpos = Vector(0, 0.375, 0),
            vang = Angle(90, 0, -90),
        },
        InstalledEles = {"rail_bot"}
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "W_Pump",
        InstalledEles = {"rail_side"},
        Offset = {
            vpos = Vector(-1.325, -1.35, 0),
            vang = Angle(90, 0, 180),
        },
    },
    {
        PrintName = "Ammo Type",
        DefaultAttName = "\"BUCK\" #00 Buckshot",
        DefaultAttIcon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth"),
        Slot = "ud_ammo_shotgun",
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
            vpos = Vector(1.05, 0, -0.5),
            vang = Angle(90, 0, -90),
        },
    },
    {	--9--
        PrintName = "Choke",
        InstalledEles = {"o_rail", "blockstrip"},
        Hidden = true,
        Slot = {"choke"},
        Bone = "W_Main",
    },
}


SWEP.Hook_SelectInsertAnimation = function(wep, data)
    local insertAmt = wep:HasBottomlessClip() and math.huge or math.min(wep:GetCapacity() + wep:GetChamberSize() - wep:Clip1())
    if !wep:HasInfiniteAmmo() then
        insertAmt = math.min(insertAmt, wep:GetOwner():GetAmmoCount(wep:GetPrimaryAmmoType()))
    end
    if insertAmt >= 2 then
        return {count = 2, anim = "sgreload_insert_2", empty = false}
    end
end