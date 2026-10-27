if CustomizableWeaponry then


AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "SIG 552"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "w"
	killicon.Add("cw_ber_sig552", "weaponicons/sg552-k", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("weaponicons/select/sg552-h")
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.4
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 1, y = 0.5, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0.4
	SWEP.ForeGripOffsetCycle_Reload = 0.74
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.88
	SWEP.FireMoveMod = 1
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_dber_sg52.mdl"
	SWEP.WMPos = Vector(0, -0.5, 0.5)
	SWEP.WMAng = Vector(0, 0, 180)

	SWEP.IronsightPos = Vector(-1.696, 0, 0.196)
	SWEP.IronsightAng = Vector(0.142, 0, -0.424)

	SWEP.MicroT1Pos = Vector(-1.69, -2.836, -0.073)
	SWEP.MicroT1Ang = Vector(0.25, 0.045, -0.244)

	SWEP.EoTechPos = Vector(-1.7, -2.623, -0.34)
	SWEP.EoTechAng = Vector(0.335, 0, 0)

	SWEP.AimpointPos = Vector(-2.899, -1.93, -1.257)
	SWEP.AimpointAng = Vector(-0.086, -0.728, 1.909)

	SWEP.ACOGV2Pos = Vector(-1.7, -3.139, -0.406)
	SWEP.ACOGV2Ang = Vector(0.136, 0.109, 0)
	
	SWEP.SprintPos = Vector(0.119, 0, -1.165)
	SWEP.SprintAng = Vector(-4.434, 18.485, -19.466)
		
	SWEP.CustomizePos = Vector(3.252, -1.104, -1.621)
	SWEP.CustomizeAng = Vector(15.14, 28.389, 8.637)

	SWEP.BackupSights = {["md_acogv2"] = {[1] = Vector(-1.698, -3.139, -1.346), [2] = Vector(0.73, 0.046, 0)}}

    SWEP.BaseArm = "L_Arm_Controller"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.SightWithRail = true
	SWEP.ACOGV2AxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.AlternativePos = Vector(0.519, 0, -0.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.015

	SWEP.AttachmentModelsVM = {
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "SIG552_Body", pos = Vector(10.309, 6.988, 8.277), angle = Angle(-87.474, 90, 0.004), size = Vector(0.876, 0.876, 0.876)},		
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "SIG552_Body", pos = Vector(10.534, -2.882, -2.659), angle = Angle(0, 0, -90), size = Vector(0.349, 0.349, 0.349)}, 
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "SIG552_Body", pos = Vector(10.529, -3.541, 2.247), angle = Angle(0, 0, 90.001), size = Vector(0.759, 0.759, 0.759)},
		["md_acogv2"] = {model = "models/wystan/attachments/2cog.mdl", bone = "SIG552_Body", pos = Vector(10.845, 1.83, 3.198), angle = Angle(179.932, 0.004, -89.678), size = Vector(0.81, 0.81, 0.81)},
		--["md_acogv2"] = {model = "models/wystan/attachments/2cog.mdl", bone = "SIG552_Body", pos = Vector(10.822, 1.891, 2.888), angle = Angle(180, 0.001, -90), size = Vector(0.814, 0.814, 0.814)},
	}

	SWEP.ForeGripHoldPos = {
	["Bone_L_UpperArm01"] = { scale = Vector(1, 1, 1), pos = Vector(-2.602, 2.496, -4.27), angle = Angle(0.25, 3.171, 8.776) },
	["Bone10"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-96.788, -2.596, 0) },
	["Bone09"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(81.705, -15.391, -1.971) },
	["Dummy05"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-8.157, 0, 0) },
	["Bone_L_LowerThumb01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(55.305, -1.657, 11.159) },
	["Bone_L_LowerArm01"] = { scale = Vector(1, 1, 1.006), pos = Vector(0.504, 0.272, -0.007), angle = Angle(-0.511, 0, 4.914) },
	["Bone05"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(76, -24.925, -1.981) },
	["Bone13"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(41.092, 15.26, 22.017) },
	["Bone_L_Hand01"] = { scale = Vector(1, 1, 1), pos = Vector(0.122, 0.057, 0), angle = Angle(-19.476, 17.716, 9.927) },
	["Bone02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-29.96, 3.882, 0) },
	["Bone15"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(57.722, 0, 0) },
	["Bone01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(77.264, -24.958, 0) },
	["L_Arm_Controller"] = { scale = Vector(1, 1, 1), pos = Vector(2.78, 2, -1.127), angle = Angle(-25.108, -71.181, 22.898) },
	["Bone07"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(65.99, 0, 0) },
	["Bone06"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-81.339, 0, 0) },
	["Bone_L_UpperThumb01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(8.852, -15.148, 22.812) },
	["Bone14"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-34.304, -16.654, 7.604) },
	["Bone11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(68.041, 0, 0) }
	}
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0.7, 0, 0)
	SWEP.LaserAngAdjust = Angle(-0.25, 180, 0) 
end

SWEP.BoltBone = "SIG552_Bolt"
SWEP.BoltShootOffset = Vector(-3.2, 0, 0)
SWEP.HoldBoltWhileEmpty = true
SWEP.DontHoldWhenReloading = true


SWEP.AttachmentDependencies = {["md_anpeq15"] = {"md_sight_rail"}}

SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {600, -100},  atts = {"md_eotech", "md_acogv2"}}, --"md_microt1"
[2] = {header = "Barrel", offset = {-200, -200},  atts = {"md_saker"}}, 
["+reload"] = {header = "Ammo", offset = {-300, 200}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload_full",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}, 
    {time = 0, sound = "CW_SIG552_CLOTH"}},
	
	reload_full = {{time = 0.3, sound = "CW_SIG552_MAGOUT"},
	{time = 1, sound = "CW_FOLEY_LIGHT"},
	{time = 1.4, sound = "CW_SIG552_MAGIN"},
	{time = 2.2, sound = "CW_FOLEY_LIGHT"}},
	
	reload = {{time = 0.3, sound = "CW_SIG552_MAGOUT"},
	{time = 1, sound = "CW_FOLEY_LIGHT"},
	{time = 1.4, sound = "CW_SIG552_MAGIN"},
	{time = 2.1, sound = "CW_SIG552_BOLTRELEASE"},
	{time = 2.2, sound = "CW_FOLEY_LIGHT"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "BER_CW 2.0"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_dber_sg52.mdl"
SWEP.WorldModel		= "models/weapons/w_dber_sg52.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.075
SWEP.FireSound = "CW_SIG552_FIRE"
SWEP.FireSoundSuppressed = "CW_SIG552_FIRE_SUPPRESSED"
SWEP.Recoil = 0.9

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.18
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 0.9
SWEP.ReloadTime = 2.6
SWEP.ReloadTime_Empty = 2.6
SWEP.ReloadHalt = 2.6
SWEP.ReloadHalt_Empty = 2.6

SWEP.SnapToIdlePostReload = true

end