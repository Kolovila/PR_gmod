AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("9x18MM", "9x18MM Rounds", 9, 18)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "PL-14"
	
	SWEP.IconLetter = "a"
	killicon.AddFont("", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true

	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -1, y = 2.5, z = 4.5}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_pist_fiveseven.mdl"
	SWEP.WMPos = Vector(-1, 0, 0)
	SWEP.WMAng = Vector(0, 0, 180)
		
	SWEP.IronsightPos = Vector(-1.55, 0, 0.569)
	SWEP.IronsightAng = Vector(0.2, 0.039, 1.404)
	
	SWEP.MicroT1Pos = Vector(-1.491, 1.608, -0.681)
	SWEP.MicroT1Ang = Vector(0.5, 0.05, 1.404)
	
	SWEP.SprintPos = Vector(0.85, -1.658, -3.822)
	SWEP.SprintAng = Vector(38.504, -3.553, 0)
	
	SWEP.CustomizePos = Vector(2.522, 0, 0)
	SWEP.CustomizeAng = Vector(3, 18.851, 0)
	
	--SWEP.PronePos = Vector(3.668, 0.492, -0.991)
	--SWEP.ProneAng = Vector(-5.232, 20.628, 0)

	SWEP.ReticleInactivityPostFire = 0.3
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 0.8
	SWEP.FullAimViewmodelRecoil = true
	SWEP.BoltBonePositionRecoverySpeed = 25
	SWEP.OffsetBoltDuringNonEmptyReload = true
	SWEP.BoltReloadOffset = Vector(0, 0, 0)
	SWEP.ReloadBoltBonePositionRecoverySpeed = 20
	SWEP.ReloadBoltBonePositionMoveSpeed = 100
	SWEP.StopReloadBoneOffset = 0.8
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = true
	SWEP.DisableSprintViewSimulation = true
	SWEP.SightWithRail = true
	SWEP.FOVPerShot = 0.3

	SWEP.AttachmentModelsVM = {
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "barrel", rel = "", pos = Vector(0.004, -4.169, -0.69), angle = Angle(0, 0, 0), size = Vector(0.536, 0.536, 0.536)},
		["md_rail"] = {model = "models/cw2/attachments/pistolrail.mdl", bone = "body", rel = "", pos = Vector(-0.005, 0.574, 0.656), angle = Angle(-90, 90, 0), size = Vector(0.138, 0.138, 0.138)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(-0.015, -1.821, 1), angle = Angle(0, 0, -90), size = Vector(0.347, 0.347, 0.347)},
		["md_insight_x2"] = {model = "models/cw2/attachments/pistollaser.mdl", bone = "body", rel = "", pos = Vector(-0.051, -0.489, 1.896), angle = Angle(-90, 0, -90), size = Vector(0.112, 0.112, 0.112)}
	}
	
	SWEP.LaserPosAdjust = Vector(0.5, 0, -1.5)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.25, hor = 0.5, roll = 2, forward = 0, pitch = 1}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 17 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	SWEP.SlideBGs = {main = 1, pm = 0, pb = 1}
	SWEP.SuppressorBGs = {main = 2, pm = 1, pb = 2, none = 0}
	SWEP.MagBGs = {main = 3, regular = 0, extended = 1}
	
	SWEP.AttachmentPosDependency = {["md_insight_x2"] = {["md_microt1"] = Vector(-0, 0, 1.6)}}
	
	SWEP.LuaViewmodelRecoil = false
    SWEP.LuaViewmodelRecoilOverride = false
    SWEP.FullAimViewmodelRecoil = false
end

SWEP.MuzzleVelocity = 600 -- in meter/s

SWEP.LuaViewmodelRecoilOverride = true
SWEP.CanRestOnObjects = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {200, -400}, atts = {"md_microt1"}},
    [2] = {header = "Barrel", offset = {-350, -200}, atts = {"md_tundra9mm"}},
	[3] = {header = "Rail", offset = {-350, 200}, atts = {"md_insight_x2"}},
	["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {reload = "reload_unsil",
	fire = {"shoot1_unsil", "shoot2_unsil", "shoot3_unsil"},
	fire_dry = "shootlast_unsil",
	idle = "idle_unsil",
	draw = "draw_unsil"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_LIGHT"}},

	reload_unsil = {{time = 0, sound = "CW_pl-14_SLIDEBACK"},
	{time = 0.2, sound = "CW_pl-14_CLOTH2"},
	{time = 0.3, sound = "CW_pl-14_MAGOUT"},
	{time = 1.0, sound = "CW_pl-14_CLOTH"},
	{time = 1.15, sound = "CW_pl-14_MAGIN"},
	{time = 1.7, sound = "CW_pl-14_CLOTH3"},
	{time = 1.75, sound = "CW_pl-14_SLIDE_RELEASE"},
	{time = 1.8, sound = "CW_pl-14_CLOTH4"}}

}

SWEP.SpeedDec = 5

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_pist_pl14.mdl"
SWEP.WorldModel		= "models/weapons/w_pist_fiveseven.mdl"
SWEP.ADSFireAnim = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 16
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.155
SWEP.FireSound = "CW_pl-14_FIRE"
SWEP.FireSoundSuppressed = "CW_pl-14_FIRE_SUPPRESSED"
SWEP.Recoil = 0.72

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.02
SWEP.SpreadPerShot = 0.015
SWEP.SpreadCooldown = 0.14
SWEP.Shots = 1
SWEP.Damage = 26
SWEP.DeployTime = 0.4
--SWEP.Chamberable = false

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.6
SWEP.ReloadHalt = 2.6

SWEP.ReloadTime_Empty = 2.6
SWEP.ReloadHalt_Empty = 2.6

SWEP.SnapToIdlePostReload = true