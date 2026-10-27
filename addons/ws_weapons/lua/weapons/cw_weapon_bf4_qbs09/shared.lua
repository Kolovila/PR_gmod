AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "QBS 09"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "k"
	killicon.AddFont("cw_ump45", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 2, z = 3}
	SWEP.Shell = "shotshell"
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_bf4_qbs09.mdl"
	SWEP.WMPos = Vector(-0.5, 2, 0)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 1
	
	SWEP.SightWithRail = false
		
	SWEP.IronsightPos = Vector(2.94, -1.04, 1.039)
	SWEP.IronsightAng = Vector(0.3, -0.03, 0)
	
	SWEP.MicroT1Pos = Vector(2.94, 4.492, 1.049)
	SWEP.MicroT1Ang = Vector(-1, -0, 0)

	SWEP.EoTechPos = Vector(2.829, 0, 0.54)
	SWEP.EoTechAng = Vector(-2.79, -1.341, 0)
	
	SWEP.AimpointPos = Vector(2.94, 0, 1.126)
	SWEP.AimpointAng = Vector(-1.142, -0.051, 0)

	SWEP.ACOGPos = Vector(-2.599, -4.803, -0.109)
	SWEP.ACOGAng = Vector(1, 0, 0)
	
	SWEP.SprintPos = Vector(-1.724, 0, 0)
	SWEP.SprintAng = Vector(-9.554, -25.893, 0)
		
	SWEP.CustomizePos = Vector(-3.237, 0, 0)
	SWEP.CustomizeAng = Vector(2.719, -22.816, 0)
		
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.593, -3.803, -1), [2] = Vector(0, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.PronePos = Vector(-2.905, 0, -1.89)
	SWEP.ProneAng = Vector(4.223, -19.925, 0)
	
	SWEP.CustomizationMenuScale = 0.016
	SWEP.ReticleInactivityPostFire = 0.5

	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "XM1014_Parent", rel = "", pos = Vector(-0.24, -5.237, -0.897), angle = Angle(0, -0, 0), size = Vector(0.741, 0.741, 0.741)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "XM1014_Parent", rel = "", pos = Vector(0.25, -14.568, -10.726), angle = Angle(0, -90, 0), size = Vector(1.312, 1.312, 1.312)},
		["md_microt1"] = {model =  "models/cw2/attachments/microt1.mdl", bone = "XM1014_Parent", rel = "", pos = Vector(-0.071, -0.187, 3.5), angle = Angle(0, -0, 0), size = Vector(0.368, 0.368, 0.368)},
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0.8, 0, 0.3)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.MuzzleVelocity = 381 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}
SWEP.ADSFireAnim = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -300}, atts = {"md_microt1", "md_aimpoint", "md_eotech"}},
	["+reload"] = {header = "Ammo", offset = {-200, 300}, atts = {"am_slugrounds", "am_flechetterounds"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload_start = "start_reload",
	insert = "insert",
	reload_end = "after_reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {start_reload = {{time = 0.05, sound = "CW_FOLEY_LIGHT"}},
	insert = {{time = 0.1, sound = "CW_QBS09_INSERT2"},
	         {time = 0.15, sound = "CW_QBS09_INSERT"}},
	
	draw = {{time = 0, sound = "CW_QBS09_DRAW"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/v_bf4_qbs09.mdl"
SWEP.WorldModel		= "models/weapons/w_bf4_qbs09.mdl"
SWEP.UseHands = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 0.3
SWEP.FireSound = "CW_QBS09_FIRE"
SWEP.Recoil = 4

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.03
SWEP.ClumpSpread = 0.015
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 0.5
SWEP.Shots = 12
SWEP.Damage = 15
SWEP.DeployTime = 1

SWEP.ReloadStartTime = 0.55
SWEP.InsertShellTime = 0.6
SWEP.ReloadFinishWait = 1
SWEP.ShotgunReload = true

SWEP.Chamberable = true