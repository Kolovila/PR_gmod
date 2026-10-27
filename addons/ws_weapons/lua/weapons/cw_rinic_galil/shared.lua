AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "IMI Galil (Galil-chan)"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IronsightPos = Vector(-2.814, -3.287, 0.36)
	SWEP.IronsightAng = Vector(0, 0.025, 0)

	SWEP.CoD4ReflexPos = Vector(-2.82, 0, -0.188)

	SWEP.CoD4ReflexAng = Vector(0, 0, 0)

	SWEP.CSGOACOGPos = Vector(-2.789, -1.499, -0.212)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos = Vector(-2.837, 0.03, 0.224)
	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.803, -1.869, -0.41)
	SWEP.EoTechAng = Vector(1.473, 0, 0)
	
	SWEP.SprintPos = Vector(4.019, 0.804, 0.402)
	SWEP.SprintAng = Vector(-16.181, 35.175, -17.539)

	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "b"
	killicon.AddFont("cw_ak74", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePsMod = {x = -2, y = 0, z = -3}
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.75

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_rinic_galil.mdl"
	SWEP.WMPos = Vector(-0.5, -1, 0.2)
	SWEP.WMAng = Vector(-5, 0, 180)
	
	SWEP.BoltBone = "j_bolt"
	SWEP.BoltShootOffset = Vector (-1, 0, 0)
	SWEP.OffsetBoltOnBipodShoot = true

	SWEP.M203OffsetCycle_Reload = 0.8
	SWEP.M203OffsetCycle_Reload_Empty = 0.9
	SWEP.M203OffsetCycle_Draw = 0

	SWEP.BaseArm = "j_shoulder_le"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/cw2/attachments/slimpistolrail.mdl", bone = "j_gun", rel = "", pos = Vector(-1.346, -0.009, 0.224), angle = Angle(0, 180, 0), size = Vector(0.2, 0.2, 0.2)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "j_gun", rel = "", pos = Vector(-10.976, -0.285, -7.217), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "j_gun", rel = "", pos = Vector(-4.303, 0.001, 0.172), angle = Angle(0, 180, 0), size = Vector(1, 1, 1)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "j_gun", rel = "", pos = Vector(-7.086, -0.077, -0.63), angle = Angle(0, 0, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_cod4_aimpoint_v2"] = {model = "models/v_cod4_aimpoint.mdl", bone = "j_gun", rel = "", pos = Vector(-4.402, 0.001, 0.157), angle = Angle(0, 180, 0), size = Vector(1, 1, 1)},
		["md_saker"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "j_gun", rel = "", pos = Vector(29.287, 0, 0.708), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_m203"] = {model = "Model", model = "models/cw2/attachments/m203.mdl", bone = "j_gun", rel = "", pos = Vector(-9.881, -3.066, 4.794), angle = Angle(0, 0, 0), size = Vector(1.299, 1.299, 1.299), animated = true}
	}

	SWEP.ForeGripHoldPos = {
		["Left12"] = {pos = Vector(0, 0, 0), angle = Angle(19.048, 0, 0) },
		["Left19"] = {pos = Vector(0, 0, 0), angle = Angle(7.56, -5.153, -33.453) },
		["Left3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 98.859, 0) },
		["Left8"] = {pos = Vector(0, 0, 0), angle = Angle(28.447, 0, 0) },
		["Left18"] = {pos = Vector(0, 0, 0), angle = Angle(31.268, 8.871, -34.725) },
		["Left17"] = {pos = Vector(0, 0, 0), angle = Angle(4.524, 0.3, -39.885) },
		["Left11"] = {pos = Vector(0, 0, 0), angle = Angle(17.864, 0, 0) },
		["Left9"] = {pos = Vector(0, 0, 0), angle = Angle(8.972, 0, 0) },
		["Left_L_Arm"] = {pos = Vector(1.231, 2.617, -1.206), angle = Angle(0, 0, 84.377) },
		["Left24"] = {pos = Vector(0, 0, 0), angle = Angle(31.447, -4.021, -22.029) },
		["Left16"] = {pos = Vector(0, 0, 0), angle = Angle(7.047, 11.637, -22.139) },
		["Left14"] = {pos = Vector(0, 0, 0), angle = Angle(14.432, -4.611, 0) },
		["Left2"] = {pos = Vector(0, 0, 0), angle = Angle(0, 40.631, 0) },
		["Left_U_Arm"] = {pos = Vector(2.54, 0.004, 0), angle = Angle(0, 0, 0) }}

	SWEP.M203HoldPos = {
		["j_shoulder_le"] = { scale = Vector(1, 1, 1), pos = Vector(3.299, 0.505, -1.956), angle = Angle(0, 0, 0) }
	}
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500},  atts = {"md_eotech", "md_csgo_acog"}},
	[2] = {header = "Barrel", offset = {300, -500}, atts = {"md_saker"}},
	[3] = {header = "Grenade Launcher", offset = {-300, 200}, atts = {"md_m203"}},
	["+attack2"] = {header = "Perks", offset = {1500, 0}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}

	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 1, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 3, "md_cod4_aimpoint_v2")
end

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {	draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.45, sound = "CW_RINIC_GALIL_MAGOUT"},
	[2] = {time = 1.92, sound = "CW_RINIC_GALIL_MAGIN"}},

	reload_empty = {[1] = {time = 0.45, sound = "CW_RINIC_GALIL_MAGOUT"},
	[2] = {time = 1.92, sound = "CW_RINIC_GALIL_MAGIN"},
	[3] = {time = 2.78, sound = "CW_RINIC_GALIL_BOLTPULL"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_rinic_galil.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_rinic_galil.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 35
SWEP.Primary.DefaultClip	= 140
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 60/750
SWEP.FireSound = "CW_RINIC_GALIL_FIRE"
SWEP.FireSoundSuppressed = "CW_RINIC_GALIL_FIRE_SUPPRESSED"
SWEP.Recoil = 0.4

SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.02
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.97
SWEP.ReloadTime_Empty = 3.13
SWEP.ReloadHalt = 2.13
SWEP.ReloadHalt_Empty = 3.35

	function SWEP:fireAnimFunc()
		local cyc = 0
		local clip = self:Clip1()
		
		if self:isAiming() or self.dt.BipodDeployed then
			cyc = 1
		end
		
		if clip > 1 then
			self:sendWeaponAnim("fire",1,cyc)
		else
			self:sendWeaponAnim("fire_dry",1,cyc)
		end
	end //*/