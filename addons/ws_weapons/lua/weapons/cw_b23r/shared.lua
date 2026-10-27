AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("9x23MM", "9x23MM Rounds", 9, 23)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "B23R"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.ViewModelMovementScale = 0.85
	
--   SWEP.BoltBone = "j_bolt"
--   SWEP.BoltShootOffset = Vector(-1.6, 0, 0)

--   SWEP.OffsetBoltDuringNonEmptyReload = false
--   SWEP.BoltReloadOffset = Vector(0, 0, 0)
--   SWEP.EmptyBoltHoldAnimExclusion = "reload_empty"
--   SWEP.StopReloadBoneOffset = 0.8
--   SWEP.HoldBoltWhileEmpty = true
--   SWEP.DontHoldWhenReloading = true
--   SWEP.ReloadBoltBonePositionRecoverySpeed = 20
--   SWEP.ReloadBoltBonePositionMoveSpeed = 100	

	SWEP.IconLetter = "a"
	killicon.AddFont("", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 6, y = -1, z = -0.5}
	SWEP.Shell = "smallshell"
	
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.65
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_bo2_b23r.mdl"
    SWEP.WMPos = Vector(-1, -17, 1.2)
    SWEP.WMAng = Vector(180, 190, 0)
	
	SWEP.IronsightPos = Vector(-2.424, 1, 0.4)
	SWEP.IronsightAng = Vector(0.22, 0.015, 0)
	
	SWEP.DocterPos = Vector(-2.40, 0, 0.145)
	SWEP.DocterAng = Vector(-0.6, 0.06, 0)

    SWEP.RMRPos = Vector(-1.851, 0, -0.091)
    SWEP.RMRAng = Vector(0.33, -0, 0)
	
	SWEP.DeltaPointPos = Vector(-2.415, 0, -0.12)
    SWEP.DeltaPointAng = Vector(-0.212, 0.1, 0)

	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(3.573, -1.078, -2.382)
    SWEP.CustomizeAng = Vector(11.869, 17.059, 0)

	SWEP.SprintPos = Vector(3.582, -3.352, -8.933)
	SWEP.SprintAng = Vector(45.5, -5.802, 0)
	
	SWEP.MoveType = 1
	SWEP.CustomizationMenuScale = 0.0075
	SWEP.ReticleInactivityPostFire = 0.1

--	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-3.201, 0, -1.137), [2] = Vector(-0.119, 0.01, 0)}}
	
--	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
--	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
--	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_insight_x2"] = {model = "models/cw2/attachments/pistollaser.mdl", bone = "tag_weapon", rel = "", pos = Vector(3.408, -0, -0.783), angle = Angle(0, 180, 0), size = Vector(0.19, 0.19, 0.19)},
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "tag_weapon", rel = "", pos = Vector(11.64, 0, 0.33), angle = Angle(0, -90, 0), size = Vector(0.981, 0.981, 0.981)},
  --    ["md_pist_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "slide", rel = "", pos = Vector(0.219, 3.707, -3.668), angle = Angle(0, 90, 0), size = Vector(0.694, 0.56, 0.694)},
		["md_pist_docter"] = {model = "models/attachments/2octorrds.mdl", bone = "j_bolt", rel = "", pos = Vector(0, 0.3, 0.43), angle = Angle(0, 90, 0), size = Vector(1.299, 1.299, 1.299)},
		["md_special_pistol_sight"] = {model = "models/attachments/delta_point.mdl", bone = "j_bolt", rel = "", pos = Vector(0.449, -0.01, 0.019), angle = Angle(0, 0, 0), size = Vector(1.399, 1.353, 1.399)},
	    ["md_special_suppressor"] = {model = "models/attachments/special_suppressor.mdl", bone = "tag_weapon", rel = "", pos = Vector(11.64, 0, 0.33), angle = Angle(0, -90, 0), size = Vector(0.981, 0.981, 0.981)}
	}
	
--	SWEP.ForegripOverridePos = {
--    ["One_Hand"] = {
--	["j_elbow_le"] = { scale = Vector(0, 0, 0), pos = Vector(0, 0, 0), angle = Angle(0, 85.851, -22.089) }}
--	}

	SWEP.LaserPosAdjust = Vector(-1, 0, 0.5)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 0, roll = 0, forward = 1.5, pitch = 0.6}
end

SWEP.MuzzleVelocity = 700 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}
SWEP.LuaViewmodelRecoil = false

SWEP.StockBGs = {main = 1, regular = 0, stock = 1, nostock = 0, none = 0}

if CustomizableWeaponry_OP_Perks then

    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {500, -700}, atts = {"md_pist_docter", "md_special_pistol_sight"}},
       [2] = {header = "Barrel", offset = {-1250, -300}, atts = {"md_tundra9mm", "md_special_suppressor"}},
	   [3] = {header = "Rail", offset = {-800, 500}, atts = {"md_insight_x2"}},
	   [4] = {header = "Stock", offset = {1100, 1100}, atts = {"bg_pist_stock"}},
	   [5] = {header = "Perks", offset = {1400, 500}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Cod_Double_Tap", "Perk_Stopping_Power"}},
	   ["+reload"] = {header = "Ammo", offset = {500, 1100}, atts = {"am_magnum", "am_matchgrade"}}
	}
	
    elseif not CustomizableWeaponry_OP_Perks then

    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {500, -700}, atts = {"md_pist_docter", "md_special_pistol_sight"}},
       [2] = {header = "Barrel", offset = {-1250, -300}, atts = {"md_tundra9mm", "md_special_suppressor"}},
	   [3] = {header = "Rail", offset = {-800, 500}, atts = {"md_insight_x2"}},
	   [4] = {header = "Stock", offset = {1200, 1100}, atts = {"bg_pist_stock"}},
	   ["+reload"] = {header = "Ammo", offset = {500, 1100}, atts = {"am_magnum", "am_matchgrade"}}
	}
end

SWEP.Animations = {fire = {"fire"},
	reload_empty = "reload_empty",
	reload = "reload_tac",
	fire_dry = "fire_last",
	idle = "idle",
	draw = "draw_first"}
	
SWEP.Sounds = {

    draw_first = {{time = 0, sound = "CW_FOLEY_MEDIUM"},
    {time = 0.56, sound = "CW_B23R_SAFE"}},

	reload_empty = {[1] = {time = 0.27, sound = "CW_B23R_MAGOUT"},
	[2] = {time = 0.6, sound = "CW_B23R_CLOTH"},
	[3] = {time = 0.75, sound = "CW_B23R_MAGIN"},
	[4] = {time = 1, sound = "CW_B23R_SLIDE"}},
	
	reload_tac = {[1] = {time = 0.27, sound = "CW_B23R_MAGOUT"},
	[2] = {time = 0.6, sound = "CW_B23R_CLOTH"},
	[3] = {time = 0.75, sound = "CW_B23R_MAGIN"}}}	

SWEP.SpeedDec = 25

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/c_bo2_b23r_1.mdl"
SWEP.WorldModel		= "models/weapons/w_bo2_b23r.mdl"
SWEP.UseHands       = true
SWEP.ADSFireAnim = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 15
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x23MM"

SWEP.FireDelay = 0.08
SWEP.FireSound = "CW_B23R_FIRE"
SWEP.FireSoundSuppressed = "CW_B23R_SILFIRE"
SWEP.Recoil = 0.75

SWEP.HipSpread = 0.035
SWEP.AimSpread = 0.0015
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.045
SWEP.SpreadPerShot = 1.3
SWEP.SpreadCooldown = 0.08
SWEP.Shots = 1
SWEP.Damage = 36
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 0.9
SWEP.ReloadTime = 1.2
SWEP.ReloadTime_Empty = 1.4
SWEP.ReloadHalt = 1.2
SWEP.ReloadHalt_Empty = 1.4
SWEP.SnapToIdlePostReload = true