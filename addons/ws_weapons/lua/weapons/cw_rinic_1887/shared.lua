AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Model 1887"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.5
	
	SWEP.IconLetter = "q"
	killicon.AddFont("cw_ump45", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_shotgun"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "shotshell"
	SWEP.ShellDelay = 0.5
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_rinic_1887.mdl"
	SWEP.WMPos = Vector(-0.5, 3, -0.3)
	SWEP.WMAng = Vector(-5, 0, 180)
	
	SWEP.ShellPosOffset = {x = -1, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 1
	
	SWEP.SightWithRail = true
		
	SWEP.IronsightPos = Vector(-3.155, -3.039, 0.992)
	SWEP.IronsightAng = Vector(0.028, 0.279, 0)
	
	SWEP.MicroT1Pos = Vector(-2.618, -4.803, 0.25)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.613, -4.803, -0.06)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.613, -4.803, 0.064)
	SWEP.AimpointAng = Vector(0, 0, 0)
			
	SWEP.ACOGPos = Vector(-2.599, -4.803, -0.109)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(-1.453, -2.297, -4.158)
	SWEP.SprintAng = Vector(29.177, 34.602, -2.343)
		
	SWEP.CustomizePos = Vector(8.72, -6.432, -1.4)
	SWEP.CustomizeAng = Vector(14.9, 64.2, 0)
		
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.274, -2.335, -1.85), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = true
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.016
	SWEP.ReticleInactivityPostFire = 0.6

	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Spas_Body", pos = Vector(-2.589, -4.256, 6.44), angle = Angle(0, 0, 180), size = Vector(1, 1, 1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Spas_Body", pos = Vector(-2.053, 0.184, 12.067), angle = Angle(-3.333, 90, 180), size = Vector(1, 1, 1)},
		["md_rail"] = {model = "models/wystan/attachments/rail.mdl", bone = "Spas_Body", pos = Vector(-2.064, -11.19, 2.654), angle = Angle(0, -90, 180), size = Vector(0.6, 1.1, 1)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Spas_Body", pos = Vector(-2.32, -10.438, 0.635), angle = Angle(0, -180, -180), size = Vector(0.4, 0.4, 0.4)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Spas_Body", pos = Vector(-2.646, -4.941, 5.907), angle = Angle(0, 0, 180), size = Vector(0.899, 0.899, 0.899)}
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 2, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0.8, 0, 0.3)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.ADSFireAnim = true

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {800, -300}, atts = {"am_slugrounds", "am_flechetterounds"}},
	["+attack2"] = {header = "Perks", offset = {150, 00}, atts = {"pk_sleightofhand", "pk_light"}}}

SWEP.Animations = {fire = {"fire1", "fire2"},
	reload_start = "startreload",
	insert = "insert",
	reload_end = "endreload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {startreload = {{time = 0.22, sound = "CW_RINIC_1887_PUMPBACK"}},

	insert = {{time = 0.12, sound = "CW_RINIC_1887_INSERT"}},
	
	endreload = {{time = 0.34, sound = "CW_RINIC_1887_PUMPFORWARD"},
	{time = 0.38, sound = "CW_FOLEY_LIGHT"}},

	fire1 = {{time = 0.39, sound = "CW_RINIC_1887_PUMPBACK"},
	{time = 0.61, sound = "CW_RINIC_1887_PUMPFORWARD"}},

	fire2 = {{time = 0.39, sound = "CW_RINIC_1887_PUMPBACK"},
	{time = 0.61, sound = "CW_RINIC_1887_PUMPFORWARD"}},
	
	draw = {{time = 0, sound = "CW_FOLEY_LIGHT"},
	{time = 0.1, sound = "CW_RINIC_1887_DRAW"},
	{time = 0.17, sound = "CW_RINIC_1887_PUMPBACK"},
	{time = 0.47, sound = "CW_RINIC_1887_PUMPFORWARD"},
	{time = 0.69, sound = "CW_FOLEY_LIGHT"}}}
	
SWEP.SpeedDec = 15

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"break"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_rinic_1887.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_rinic_1887.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 28
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 0.9230769230769231
SWEP.FireSound = "CW_RINIC_1887_FIRE"
SWEP.Recoil = 5

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.35
SWEP.ClumpSpread = 0.030
SWEP.SpreadPerShot = 0.03
SWEP.SpreadCooldown = 0.05
SWEP.Shots = 8
SWEP.Damage = 35
SWEP.DeployTime = 0.9

SWEP.ReloadStartTime = 0.57
SWEP.InsertShellTime = 0.62
SWEP.ReloadFinishWait = 0.9
SWEP.ShotgunReload = true
SWEP.SnapToIdlePostReload = false

SWEP.Chamberable = false

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.3
	end
end