AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "FN FNC (Funco-chan)"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.3
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = -2, z = -1}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.85
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.BoltBone = "bolt"
	SWEP.BoltShootOffset = Vector(0, -1, 0)
	SWEP.OffsetBoltOnBipodShoot = true
	SWEP.HoldBoltWhileEmpty = false
	SWEP.FullAimViewmodelRecoil = true
	SWEP.DontHoldWhenReloading = true

	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_rif_fnfunco.mdl"
	SWEP.WMPos = Vector(0, -1, 0.2)
	SWEP.WMAng = Vector(-5, 0, 180)
	
	SWEP.IronsightPos = Vector(-1.94, -2.017, 0.563)

	SWEP.IronsightAng = Vector(4.981, 2.733, -2.365)
		
	SWEP.EoTechPos = Vector(-1.989, -3.018, -0.671)
	SWEP.EoTechAng = Vector(4.981, 2.733, -1.663)
	
	SWEP.CoD4TascoPos = Vector(-1.997, -3.135, -0.042)
	SWEP.CoD4TascoAng = Vector(5.48, 2.654, -1.663)
	
	SWEP.MicroT1Pos = Vector(-2.837, -2.185, -0.361)
	SWEP.MicroT1Ang = Vector(0, 0.27, 0)
	
	SWEP.CoD4ReflexPos = Vector(-2.001, -3.018, -0.276)

	SWEP.CoD4ReflexAng = Vector(4.981, 2.733, -1.663)

	SWEP.CSGOACOGPos = Vector(-2.021, -3.517, -0.399)

	SWEP.CSGOACOGAng = Vector(5.48, 2.654, -1.663)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(0, 0, -1.497)
	SWEP.M203Ang = Vector(6.39, 0, 0)

	SWEP.SprintPos = Vector(2.9, 0, -0.621)
	SWEP.SprintAng = Vector(-11.214, 35.901, -8.619)

	SWEP.PronePos = Vector(0.228, -7.337, -3.599)
	SWEP.ProneAng = Vector(3.881, 70, -42.166)

	SWEP.CustomizePos = Vector(5.866, -2.027, -0.017)
	SWEP.CustomizeAng = Vector(9.177, 43.897, 0.699)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.SightWithRail = true
	SWEP.CSGOACOGAxisAlign = {right = -0.5, up = 0, forward = -40}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "l_upperarm"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/cw2/attachments/pistolrail.mdl", bone = "weapon", rel = "", pos = Vector(0, -2.086, -0.145), angle = Angle(180, -90, 0), size = Vector(0.15, 0.15, 0.15)},
		["md_cod4_aimpoint_v2"] = {model = "models/v_cod4_aimpoint.mdl", bone = "weapon", rel = "", pos = Vector(0.028, 1.774, -0.283), angle = Angle(180, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "weapon", rel = "", pos = Vector(0, 1.708, -0.283), angle = Angle(180, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "weapon", rel = "", pos = Vector(0.296, 9.649, 8.114), angle = Angle(180, -90, 0), size = Vector(1, 1, 1)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "body", rel = "", pos = Vector(-0.382, -2.927, -1.239), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_saker"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "weapon", rel = "", pos = Vector(0.02, -19.691, -1.821), angle = Angle(0, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(0.059, 1.401, 3.345), angle = Angle(0, 180, 0), size = Vector(0.449, 0.449, 0.449)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "weapon", rel = "", pos = Vector(0.052, 4.164, 0.596), angle = Angle(0, 90, -180), size = Vector(0.699, 0.699, 0.699)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "smdimport001", pos = Vector(-0.225, 9.715, 3.15), angle = Angle(0, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "weapon", rel = "", pos = Vector(2.111, 6.022, -3.448), angle = Angle(180, -90, 0), size = Vector(0.899, 0.899, 0.899), animated = true},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "smdimport001", pos = Vector(-0.35, -2.554, -1.627), angle = Angle(0, -90, 0), size = Vector(0.899, 0.899, 0.899)}
	}
	
	SWEP.M203HoldPos = {
		["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(2.102, 0.303, -2.145), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
		["l-ring-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20.981, 0, 0) },
	
		["l-thumb-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.392, -16.043, 0) },
	
		["l-pinky-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-1.443, 0, 0) },
	
		["l-thumb-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(39.412, 19.054, 0) },
	
		["l-middle-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(32.888, 0, 0) },
	
		["l-pinky-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(31.947, 0, 0) },
	
		["l-ring-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(19.121, -1.326, -1.742) },
	
		["l-middle-tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10.008, -6.74, 7.054) },
	
		["l-forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -33.077, 0) },
	
		["lwrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(8.574, 25.795, 14.046) },
	
		["l-middle-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30.518, 1.514, -4.152) },
	
		["l-ring-tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(86.656, -4.474, 7.471) },
	
		["l-thumb-tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(77.417, 0, 0) },
	
		["l-pinky-tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(79.408, 0, 0) },
	
		["l-index-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(23.16, 0, 0) },
	
		["l-upperarm-movement"] = { scale = Vector(1, 1, 1), pos = Vector(-3.846, -4.867, 1.386), angle = Angle(-51.069, -16.98, 62.507) },
	
		["l-index-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(56.424, 0, 0) }
	}
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_saker"] = {["bg_longbarrel"] = Vector(-0.042, 9, -0.1), ["bg_longris"] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(2, 180, 0)
	
	SWEP.LuaVMRecoilAxisMod = {vert = -0.55, hor = 0, roll = -25, forward = 0, pitch = 0}

end

SWEP.LuaViewmodelRecoil = true
SWEP.ADSFireAnim = false
SWEP.ZoomAmount = 15

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500}, atts = {"md_eotech", "md_csgo_acog"}},
	[2] = {header = "Barrel", offset = {300, -500}, atts = {"md_saker"}},
	[3] = {header = "More Nade's, yep", offset = {-400, 0}, atts = {"md_m203"}},
	["+attack2"] = {header = "Perks", offset = {-400, -500}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}

	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 1, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 3, "md_cod4_aimpoint_v2")
end

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"},
	{time = 0.6, sound = "CW_FUNCO_CHAN_BOLTBACK"},
	{time = 0.92, sound = "CW_FUNCO_CHAN_BOLTFORWARD"}},

	reload = {{time = 0.2, sound = "CW_FOLEY_LIGHT"},
	{time = 0.48, sound = "CW_FUNCO_CHAN_MAGOUT"},
	{time = 1.37, sound = "CW_FUNCO_CHAN_MAGIN"},
	{time = 1.87, sound = "CW_FOLEY_LIGHT"}},
	
	reload_empty = {{time = 0.2, sound = "CW_FOLEY_LIGHT"},
	{time = 0.48, sound = "CW_FUNCO_CHAN_MAGOUT"},
	{time = 1.37, sound = "CW_FUNCO_CHAN_MAGIN"},
	{time = 2.44, sound = "CW_FUNCO_CHAN_BOLTBACK"},
	{time = 2.69, sound = "CW_FUNCO_CHAN_BOLTFORWARD"},
	{time = 2.92, sound = "CW_FOLEY_LIGHT"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_rif_fnfunco.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_rif_fnfunco.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 150
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.0857142857142857
SWEP.FireSound = "CW_FUNCO_CHAN_FIRE"
SWEP.FireSoundSuppressed = "CW_FUNCO_CHAN_FIRE_SUPPRESSED"
SWEP.Recoil = 0.25

SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.02
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 35
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.1
SWEP.ReloadTime = 1.65
SWEP.ReloadTime_Empty = 2.78
SWEP.ReloadHalt = 1.95
SWEP.ReloadHalt_Empty = 2.45
SWEP.SnapToIdlePostReload = false

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
end

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.2
	end
end //*/