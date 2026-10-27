AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "PP-19 Vityaz"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.7
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_smg_pp19vityaz.mdl"
	SWEP.WMPos = Vector(-1, -2, -0.5)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-3.116, -4.801, 1.1)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-3.066, 0, 0.518)
	SWEP.AimpointAng = Vector(-0.104, 0.165, 0)
	
	SWEP.MicroT1Pos = Vector(-3.056, 0, 0.439)
	SWEP.MicroT1Ang = Vector(0.8, 0.219, 0)
	
	SWEP.EoTechPos = Vector(-3.12, 0, 0.024)
	SWEP.EoTechAng = Vector(0.391, -0.04, 0)
	
	SWEP.ACOGPos = Vector(-3.095, 0, 0.273)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.RMRPos = Vector(-3.07, 0, 0.633)
	SWEP.RMRAng = Vector(0.90, 0.15, 0)

	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-3.125, -4.548, -0.581), [2] = Vector(0, 0, 0)}}
	
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.IconLetter = "x"
	killicon.AddFont("cw_mp5", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.ShellScale = 0.7
	SWEP.Shell = "smallshell"
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 4, y = -1, z = 3}
	
	SWEP.BoltBone = "bolt"
	SWEP.BoltShootOffset = Vector(-1, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "wpn_body", rel = "", pos = Vector(-0.331, -2.813, -2.355), angle = Angle(0, -90, 0), size = Vector(0.879, 0.879, 0.879)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "wpn_body", rel = "", pos = Vector(0.31, -11.962, -10.155), angle = Angle(0, -90, 0), size = Vector(1.195, 1.195, 1.195)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "wpn_body", rel = "", pos = Vector(-0.231, -3.543, -2.3), angle = Angle(0, 0, 0), size = Vector(0.879, 0.879, 0.879)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "wpn_body", rel = "", pos = Vector(-0.02, 2.201, 2.828), angle = Angle(-0.002, 0, 0), size = Vector(0.358, 0.358, 0.358)},
     --   ["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "wpn_body", rel = "", pos = Vector(-0.301, -3.087, -1.976), angle = Angle(0, 0, 0), size = Vector(0.818, 0.818, 0.818)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "wpn_body", rel = "", pos = Vector(0, 1.822, -0.325), angle = Angle(0, 0, 0), size = Vector(0.517, 0.517, 0.517)}
		}

end

SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {600, -100},  atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech"}},
	[2] = {header = "Barrel", offset = {-500, -100}, atts = {"md_saker"}},
	["+reload"] = {header = "Ammo", offset = {200, 400}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"},
    {time = 0.2, sound = "Weapon_PP19V_draw"}},
	
    reload = {[1] = {time = 0.35, sound = "CW_AR15_MAGOUT"},
	[2] = {time = 1.0, sound = "Weapon_PP19V_Cliprelease"},
    [3] = {time = 1.2, sound = "Weapon_Cloth2"},
	[4] = {time = 1.3, sound = "Weapon_PP19V_Clipout"},
    [5] = {time = 1.7, sound = "Weapon_Cloth1"},
    [6] = {time = 1.8, sound = "Weapon_PP19V_Clipin"},
    [7] = {time = 1.9, sound = "Weapon_Cloth3"},
    [8] = {time = 2.5, sound = "Weapon_Cloth4"},
	[9] = {time = 2.55, sound = "Weapon_PP19V_Slideback"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_smg_pp19vityaz.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_pp19vityaz.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.076
SWEP.FireSound = "Weapon_PP19V"
SWEP.FireSoundSuppressed = "CW_PP19V_SUPPRESSED"
SWEP.Recoil = 0.8

SWEP.HipSpread = 0.040
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.02
SWEP.SpreadPerShot = 0.055
SWEP.SpreadCooldown = 0.6
SWEP.Shots = 1
SWEP.Damage = 27
SWEP.DeployTime = 1.5

SWEP.ReloadSpeed = 1.0
SWEP.ReloadTime = 3.6
SWEP.ReloadTime_Empty = 3.6
SWEP.ReloadHalt = 3.6
SWEP.ReloadHalt_Empty = 3.6
SWEP.SnapToIdlePostReload = true