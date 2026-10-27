AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MOE-RPK-74"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.3
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_ak74"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 0.0
	SWEP.ShellPosOffset = {x = 0.5, y = 1, z = -1}
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0.4
	SWEP.ForeGripOffsetCycle_Reload = 0.7
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	SWEP.BoltShootOffset = Vector(-1, 0, -0)
	SWEP.OffsetBoltOnBipodShoot = false
	SWEP.BoltBone = "bolt"
	SWEP.ADSFireAnim = false
	
	SWEP.WM = "models/weapons/wkalashnikovrpk.mdl"
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WMPos = Vector(-1.4, 2.0, -1)
	SWEP.WMAng = Vector(170, 180, -0)
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(-1.708, 0, 0.39)
	SWEP.IronsightAng = Vector(2.052, -0.009, 0)
	
	SWEP.EFT1P87Pos = Vector(-1.665, 2, -0.35)
	SWEP.EFT1P87Ang = Vector(0.605, 0, 0)
	
		SWEP.EFTEKPPos = Vector(-1.7, 1, -0.2)
	SWEP.EFTEKPAng = Vector(0.605, 0, 0)
	
		SWEP.EFTMICROT1Pos = Vector(-1.7, 1, 0.5)
	SWEP.EFTMICROT1Ang = Vector(0.605, 0, 0)
	
	SWEP.M203Pos = Vector(0.091, -4.321, 0.839)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(1, 1, -0.5)
	SWEP.AlternativeAng = Vector(3.947, 0, -3)
	
	SWEP.CustomizePos = Vector(3.989, -0.313, 0.199)
	SWEP.CustomizeAng = Vector(6.018, 18.659, 0)
	
	SWEP.SprintPos = Vector(2.378, 0, -0.401)
	SWEP.SprintAng = Vector(-10.801, 24.122, 0) 
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-5.08, -2.698, -0.78), [2] = Vector(-2, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.0, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = -0.0, forward = 0}
	
	SWEP.BaseArm = "arm_controller_01"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
					----
	SWEP.BoltBone = "bolt"
	SWEP.BoltShootOffset = Vector(-2.5, 0, 0)
	SWEP.BoltBonePositionRecoverySpeed = 40
	SWEP.EmptyBoltHoldAnimExclusion = "shoot2"

	SWEP.StopReloadBoneOffset = 0
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DontHoldWhenReloading = true
	
	SWEP.AttachmentModelsVM = {
		["md_eft_si_1p87"] = {model = "models/weapons/cw_eft/upgrades/scopes/1p87/v_1p87.mdl", bone = "rpk", rel = "", pos = Vector(0.35, 0.2, 1.68), angle = Angle(0, -90, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_eft_si_cobra"] = {model = "models/weapons/cw_eft/upgrades/scopes/cobra/v_ekp.mdl", bone = "rpk", rel = "", pos = Vector(0.35, 01, 1.68), angle = Angle(0, -90, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_eft_si_t1"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/t1/v_t1.mdl", bone = "rpk", rel = "", pos = Vector(0.35, 01, 1.68), angle = Angle(0, -90, 0), size = Vector(0.7, 0.7, 0.7)},

	    ["md_eft_fg_rvg"] = {model = "models/weapons/cw_eft/upgrades/foregrips/rvg/v_rvg.mdl", bone = "rpk", rel = "", pos = Vector(0.4, 7, -0.4), angle = Angle(0, -90, 0), size = Vector(0.35, 0.35, 0.35)},

		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "rpk", rel = "", pos = Vector(0.166, -3.191, -1.895), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "body", rel = "", pos = Vector(7.73, -14.799, 5.117), angle = Angle(0, 90, 180), size = Vector(0.6, 0.6, 0.6)},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "rpk", rel = "", pos = Vector(0.351, 20.885, -0.862), angle = Angle(0, 180, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", bone = "rpk", rel = "", pos = Vector(0.416, 8.628, -1.127), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		
	}
	
	SWEP.M203HoldPos = {
		["r-upperarm-movement"] = { scale = Vector(1, 1, 1), pos = Vector(2.956, -0.082, -1.928), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
		["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 3.582, 47.046) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.01, 0), angle = Angle(3.2, 19.788, 59.991) },
	["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.245, 0.181), angle = Angle(1.236, 0, 0) },
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(12.939, -9.054, 0) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.519, -0.125), angle = Angle(49.625, 21.764, 0) },
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(2.299, 0.924, -2.333), angle = Angle(-2.648, 0.328, -0.987) },
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(55.604, 16.679, 0) }


	}	
	
	SWEP.ForegripOverridePos = {
	["md_eft_fg_rvg"] = {
	["arm_controller_01"] = { scale = Vector(1, 1, 1), pos = Vector(0.2, 1.4, 0.2), angle = Angle(0, 0, 20) },

	["l_armtwist_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 20) },
	
	["l_armtwist_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 10) },
	
	["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, -19, 40) },
		
	["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },
	["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 0, 0) },
	["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30, 0, 0) },
	
	["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-40, -5, 0) },
	["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 0, -10) },
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },
	
	["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(7, 0, 0) },
	["l_middle_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_middle_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	
	["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.2, 0), angle = Angle(20, 10, 10) },
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 50, 0) },
	["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 50, 0) },
	
	["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-20, 0, 0) },
	["l_ring_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_ring_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(60, 0, 0) },
		
	},
	
	["md_eft_fg_afg_blk"] = {
	
	["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(6, 0.2, 0), angle = Angle(0, 0, 40) },

	["Bip01 L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	
	["Bip01 L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(15, 15, 20) },
	
	["Bip01 L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, -10, 10) },
	["Bip01 L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 0, 0) },
	["Bip01 L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }		}
		}
	
	SWEP.AttachmentPosDependency = {[""] = {[""] = Vector(-0.225, 13, 3.15)},
	[""] = {[""] = Vector(-0.042, 9, -0.1), [""] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(-0.2, 0, 0)
	SWEP.LaserAngAdjust = Angle(0.0, 180, 0) 
end
SWEP.PSO1AxisAlign = {right = -0.01, up = 0.0, forward = 90}
SWEP.SchmidtShortDotAxisAlign = {right = 0.0, up = 0.0, forward = 0}
SWEP.SightBGs = {main = 4, carryhandle = 0, foldsight = 1, none = 2}
SWEP.StockBGs = {main = 2, regular = 0, heavy = 1, sturdy = 2}
SWEP.MagBGs = {main = 0, regular = 0, fastmag = 1, exmagmk1 = 2}
SWEP.LuaViewmodelRecoil = false

SWEP.CustomizationMenuScale = 0.012

SWEP.Attachments = {
    [1] = {header = "Sight", offset = {-1000, -300}, atts = {"md_eft_si_t1", "md_eft_si_cobra", "md_eft_si_1p87"}},
	[2] = {header = "Barrel", offset = {-1000, 0}, atts = {"md_pbs1"}},
	[3] = {header = "Bipod", offset = {-1000, 430}, atts = {"md_eft_fg_rvg"}},
	["+reload"] = {header = "Ammo", offset = {700, 400}, atts = {"am_magnum", "am_matchgrade"}}}
	

	SWEP.LuaVMRecoilAxisMod = {vert = 0.02, hor = 0.05, roll = 0.5, forward = -0.2, pitch = -0.1}
    SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
    SWEP.ADSFireAnim = false  

SWEP.Animations = {fire = {"shoot2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0.2, sound = "CW_FOLEY_HEAVY"}},

	reload = {[1] = {time = 0.2, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 1.8, sound = "CW_RPK74MAGOUT"},
	[3] = {time = 2.9, sound = "CW_RPK74MAGIN"},
	[4] = {time = 3.1, sound = "CW_RPK74MAGFINISH"},
	[5] = {time = 4.6, sound = "CW_RPK74BOLTRELEASE"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW2.0 good ak"

SWEP.Author			= "Silent"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 75
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/kalashnikovrpk7.mdl"
SWEP.WorldModel		= "models/weapons/wkalashnikovrpk.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 60
SWEP.Primary.DefaultClip	= 290
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.45x39MM"

SWEP.FireDelay = 0.0923
SWEP.FireSound = "CW_AKMS_FIRE"
SWEP.FireSoundSuppressed = "CW_RPK74FIRE_SUPPRESSED"
SWEP.Recoil = 0.9

SWEP.HipSpread = 0.07
SWEP.AimSpread = 0.02
SWEP.VelocitySensitivity = 1.0
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.06
SWEP.SpreadCooldown = 0.02
SWEP.Shots = 1
SWEP.Damage = 35
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.6
SWEP.ReloadTime = 5.8
SWEP.ReloadTime_Empty = 5.8
SWEP.ReloadHalt = 3.7
SWEP.ReloadHalt_Empty = 5.1
SWEP.SnapToIdlePostReload = true

	function SWEP:RenderTargetFunc()
		self.ForegripOverride = false
		if self.ActiveAttachments.md_eft_fg_rvg or self.ActiveAttachments.md_eft_fg_vpg or self.ActiveAttachments.md_eft_fg_bgv_blk then
			self.ForegripParent = "md_eft_fg_rvg"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_eft_fg_afg_blk or self.ActiveAttachments.md_eft_fg_cobra then
			self.ForegripParent = "md_eft_fg_afg_blk"
			self.ForegripOverride = true
			return
		elseif self.ActiveAttachments.md_foregrip then
			self.ForegripParent = "md_foregrip"
			self.ForegripOverride = true
			return		
		end

	end
