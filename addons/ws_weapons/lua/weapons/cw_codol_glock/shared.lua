AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("9x19MM", "9x19MM Rounds", 9, 19)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Glock-18T"
	
	SWEP.IconLetter = "a"
	killicon.AddFont("", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = false

	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.45
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 1, y = -0.5, z = -0.5}
	
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.65
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_pist_codol_glock18.mdl"
    SWEP.WMPos = Vector(-0.25, 0.0, -0.5)
    SWEP.WMAng = Vector(180, 190, 0)

	SWEP.IronsightPos = Vector(-1.83, 3, 0.312)
	SWEP.IronsightAng = Vector(0.05, -0.045, 0)
	
--	SWEP.No_Aim_AnimPos = Vector(-1.852, 0, 0.312)
--	SWEP.No_Aim_AnimAng = Vector(-0.105, -0.03, 0)

	
	SWEP.mr01Pos = Vector(-1.851, 0, -0.091)
	SWEP.mr01Ang = Vector(0, 0, 0)
	
	SWEP.mr02Pos = Vector(-1.851, 0, -0.091)
	SWEP.mr02Ang = Vector(0, 0, 0)
	
	SWEP.mr03Pos = Vector(-1.851, 0, -0.091)
	SWEP.mr03Ang = Vector(0, 0, 0)
	
    SWEP.RMRPos = Vector(-1.851, 0, -0.091)
    SWEP.RMRAng = Vector(0.33, -0.025, 0)

	SWEP.SprintPos = Vector(-2, 1.01, 1)  --跑步晃动角度
	SWEP.SprintAng = Vector(-24, 10, -20)
	
	SWEP.CustomizePos = Vector(3, -4, -1.754)
    SWEP.CustomizeAng = Vector(8.552, 30, -5)

	SWEP.AlternativePos = Vector(1, -1, -1)
	SWEP.AlternativeAng = Vector(0, 0, -6)
	
	--SWEP.AlternativePos = Vector(-2.1, 0, -2.3)
	--SWEP.AlternativeAng = Vector(1.5, 0, -19.1)

	SWEP.ReticleInactivityPostFire = 0

	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 0.8
	
--	SWEP.DisableSprintViewSimulation = true
	SWEP.SightWithRail = true
	SWEP.FOVPerShot = 0.25
	
	----
	SWEP.BoltBone = "slide"
	SWEP.BoltShootOffset = Vector(0, -1.6, 0)
	SWEP.BoltBonePositionRecoverySpeed = 25
	SWEP.EmptyBoltHoldAnimExclusion = "fire_last"

	SWEP.StopReloadBoneOffset = 0
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = false
	----
	
	SWEP.AttachmentModelsVM = {
	["md_oil_filter_suppressor"] = {model = "models/viper/mw/attachments/attachment_vm_oil_filter_suppressor.mdl", bone = "barrel", pos = Vector(0, -3, -0.04), angle = Angle(0, 90, 0), size = Vector(0.75, 0.75, 0.75)},
    ["md_silencer04"] = {model = "models/viper/mw/attachments/attachment_vm_silencer04.mdl", bone = "barrel", pos = Vector(0, -3.15, -0.04), angle = Angle(0, 90, 46), size = Vector(0.75, 0.75, 0.75)},
    ["md_silencerpstl"] = {model = "models/viper/mw/attachments/attachment_vm_silencerpstl.mdl", bone = "barrel", pos = Vector(0, -3.1, -0.04), angle = Angle(0, 90, 0), size = Vector(0.75, 0.75, 0.75)},
    ["md_silencerpstl03"] = {model = "models/viper/mw/attachments/attachment_vm_silencerpstl03.mdl", bone = "barrel", pos = Vector(0, -3.1, -0.04), angle = Angle(0, 90, 0), size = Vector(0.75, 0.75, 0.75)},
    ["md_comp"] = {model = "models/viper/mw/attachments/attachment_vm_compensator_pstl01.mdl", bone = "barrel", pos = Vector(0, -3.06, -0.04), angle = Angle(0, 90, 0), size = Vector(0.9, 0.9, 0.9)},
    ["md_flash"] = {model = "models/viper/mw/attachments/attachment_vm_flashhider01.mdl", bone = "barrel", pos = Vector(0, -3.1, 0), angle = Angle(0, 90, 0), size = Vector(0.75, 0.75, 0.75)},

    ["md_minireddot01"] = {model = "models/viper/mw/attachments/attachment_vm_pi_minireddot01.mdl", bone = "slide", pos = Vector(0, 0.9, 0.4), angle = Angle(0, 90, 0), size = Vector(0.76, 0.76, 0.76)},	
    ["md_minireddot02"] = {model = "models/viper/mw/attachments/attachment_vm_pi_minireddot02.mdl", bone = "slide", pos = Vector(0, 0.9, 0.4), angle = Angle(0, 90, 0), size = Vector(0.76, 0.76, 0.76)},	
    ["md_minireddot03"] = {model = "models/viper/mw/attachments/attachment_vm_pi_minireddot03.mdl", bone = "slide", pos = Vector(0, 0.9, 0.4), angle = Angle(0, 90, 0), size = Vector(0.76, 0.76, 0.76)},	

	["md_rail"] = {model = "models/viper/mw/attachments/attachment_pistol_rail.mdl", bone = "slide", pos = Vector(0, 0.9, 0.4), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},

	["md_eft_fl_x400"] = {model = "models/weapons/cw_eft/upgrades/tactical/x400/x400.mdl", bone = "weapon", rel = "", pos = Vector(-0, -4.6, 1.3), angle = Angle(0, 90, 0), size = Vector(0.85, 0.85, 0.85)},
	["md_eft_fl_dbalpl"] = {model = "models/weapons/cw_eft/upgrades/tactical/dbalpl/dbalpl.mdl", bone = "weapon", rel = "", pos = Vector(-0, -4.45, 1.35), angle = Angle(0, 90, 0), size = Vector(0.85, 0.85, 0.85)},


	["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "barrel", rel = "", pos = Vector(0, -5.301, -0.82), angle = Angle(0, 0, 0), size = Vector(0.635, 0.635, 0.635)},
	}
	
	SWEP.ForegripOverridePos = {
    ["One_Hand"] = {
	["L UpperArm"] = { scale = Vector(0, 0, 0), pos = Vector(0, 0, 0), angle = Angle(-60, 98, -82.089) }}
	}

	
	SWEP.LaserPosAdjust = Vector(0, 2, 0)
	SWEP.LaserAngAdjust = Angle(0, 0.2, 0) 
	
	
	--SWEP.MagBGs = {main = 2, round30 = 1} --round15 = 2,
	
	SWEP.AttachmentPosDependency = {
	["md_insight_x2"] = {["md_microt1"] = Vector(-0.188, -3.4, 1.2)}, 
	["md_comp"] = {["bg_pist_long_barrel"] = Vector(0, -4, -0.04)},
	["md_silencerpstl03"] = {["bg_pist_long_barrel"] = Vector(0, -4, -0.04)},
	["md_silencerpstl"] = {["bg_pist_long_barrel"] = Vector(0, -4, -0.04)},
	["md_silencer04"] = {["bg_pist_long_barrel"] = Vector(0, -4, -0.04)},
	["md_oil_filter_suppressor"] = {["bg_pist_long_barrel"] = Vector(0, -4, -0.04)},


	["md_special_suppressor"] = {["bg_pist_long_barrel"] = Vector(0, -5.85, -0.665)}}

	

    SWEP.CustomizationMenuScale = 0.01

end

SWEP.slideBGs = {main = 2, glock18 = 0, PF940 = 1, g18c = 2, regular = 0}
SWEP.BarrelBGs = {main = 3, longris = 0, long = 1, short = 0, magpul = 0, ris = 0, regular = 0}
SWEP.MagBGs = {main = 4, regular = 0, glockround36 = 1,}
SWEP.StockBGs = {main = 5, regular = 0, stock = 1, nostock = 0, none = 2}

-- SWEP.GripBGs = {main = 0, on = 0, off = 0}
SWEP.MuzzleVelocity = 280 -- in meter/s

    SWEP.LuaVMRecoilAxisMod = {vert = 0.2, hor = 1.1, roll = 3.6, forward = 1.2,  pitch = -0.3}
    SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
    SWEP.ADSFireAnim = true 

SWEP.MuzzleVelocity = 280 -- in meter/s

SWEP.CanRestOnObjects = false

	 SWEP.Attachments = {
       [1] = {header = "Barrel", offset = {300, -400}, atts = {"md_flash", "md_comp", "md_silencerpstl03", "md_silencerpstl", "md_silencer04", "md_oil_filter_suppressor"}}, --, "md_eft_sil_osprey9", "md_eft_sil_aac"
	   [2] = {header = "Sight", offset = {1200, 300}, atts = {"md_minireddot01", "md_minireddot02", "md_minireddot03"}},
	   [3] = {header = "Muzzle", offset = {-300, -400}, atts = {"bg_pist_long_barrel"}},
	   [4] = {header = "Rail", offset = {-300, 200}, atts = {"md_eft_fl_x400", "md_eft_fl_dbalpl"}},
       [5] = {header = "Magazine", offset = {300, 600}, atts = {"bg_codol_glock_36_mag"}},
	   [6] = {header = "Stock", offset = {1000, 600}, atts = {"bg_pist_stock"}},
       ["+use"] = {header = "Handling", offset = {1700, 600}, atts = {"bg_p80", "bg_g18"}},
	   ["+reload"] = {header = "Ammo", offset = {300, 1000}, atts = {"am_magnum", "am_matchgrade"}}
	}


SWEP.Animations = {reload = "base_reload",
	reload_empty = "base_reloadempty",
	fire = {"fire_lastz"},
    fire_dry = "fire_last",
	idle = "base_idle",
	draw = "base_draw"} 
--  draw2 = "base_idle"}
	
SWEP.Sounds = {base_draw = {{time = 0, sound = "CW_FOLEY_LIGHT"},
    {time = 0, sound = ""}},
	
	base_reload = {{time = 0.3, sound = "CW_g18_MAGOUT"},
	{time = 0.9, sound = "CW_g18_MAGIN"}},

	base_reloadempty = {{time = 0, sound = "CW_g18_SLIDEBACK"},
	{time = 0.3, sound = "CW_g18_MAGOUT"},
	{time = 0.9, sound = "CW_g18_MAGIN"},
	{time = 1.2, sound = "CW_g18_SLIDEFORWARD"}}
}


SWEP.SpeedDec = 5

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW-Goodgun"

SWEP.Author			= "DQR"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_pist_codol_glock18.mdl"
SWEP.WorldModel		= "models/weapons/w_pist_codol_glock18.mdl"


SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 280
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.06 -- 0.15 orginal
SWEP.FireSound = "CW_g18_FIRE"
SWEP.FireSoundSuppressed = "CW_g18_FIRE_SUPPRESSED"
SWEP.Recoil = 0.62

SWEP.HipSpread = 0.08
SWEP.AimSpread = -0.15
SWEP.VelocitySensitivity = 0.75
SWEP.MaxSpreadInc = 0.2
SWEP.SpreadPerShot = 0.1
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 20
SWEP.DeployTime = 0.3

SWEP.BurstCooldownMul = 2
SWEP.BurstSpreadIncMul = 1.0
SWEP.BurstRecoilMul = 0.5

-- SWEP.Chamberable = false

SWEP.ReloadSpeed = 1.1
SWEP.ReloadTime = 1.5
SWEP.ReloadHalt = 1.5

SWEP.ReloadTime_Empty = 1.8
SWEP.ReloadHalt_Empty = 1.8

SWEP.SnapToIdlePostReload = false