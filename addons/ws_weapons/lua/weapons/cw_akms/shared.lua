AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Tactics-AKMS"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.3
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_suppressed"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 0.0
	SWEP.ShellPosOffset = {x = -0.8, y = 0, z = -3.0}
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0.4
	SWEP.ForeGripOffsetCycle_Reload = 0.7
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	SWEP.BoltShootOffset = Vector(-0.0, 0, -0.7)
	SWEP.OffsetBoltOnBipodShoot = false
	SWEP.BoltBone = "bolt"
	SWEP.ADSFireAnim = false
	
	SWEP.WM = "models/weapons/w_rif_akms.mdl"
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WMPos = Vector(-1.2, 3.5, -1.5)
	SWEP.WMAng = Vector(168, 180, -0)
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(-2.277, 0, -0.15)
	SWEP.IronsightAng = Vector(2.15, 0.0, 0.0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EFTUH1Pos = Vector(-2.27, -2, -0.45)  --EFT
	SWEP.EFTUH1Ang = Vector(0, 0, 0)
		
	SWEP.EFT1P87Pos = Vector(-2.25, -1, -0.7)  --EFT
	SWEP.EFT1P87Ang = Vector(0, 0, 0)
	
	SWEP.EFTEKPPos = Vector(-2.275, -1, -0.5)  --EFT
	SWEP.EFTEKPAng = Vector(0, 0, 0)
	
	SWEP.EFTFF3Pos = Vector(-2.275, 0, 0.18)  --EFT
	SWEP.EFTFF3Ang = Vector(0, 0, 0)
	
	SWEP.EFTPS320Pos = Vector(-2.275, -1.5, -0.45)  --EFT
	SWEP.EFTPS320Ang = Vector(0, 0, 0)
	
	
	SWEP.KobraPos = Vector(-2.299, -1, -0.315)
	SWEP.KobraAng = Vector(0.834, -0.029, 0)
	
	
	SWEP.M203Pos = Vector(0.091, -4.321, 0.839)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(0.3, 0.6, -0.8)
	SWEP.AlternativeAng = Vector(2.358, 0, -6)
	
	SWEP.CustomizePos = Vector(4, 1.5, 0.5)
	SWEP.CustomizeAng = Vector(6.018, 20, 20)
	
	SWEP.SprintPos = Vector(3, 0, -1)
	SWEP.SprintAng = Vector(-12, 35, 0) 
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-5.08, -2.698, -0.78), [2] = Vector(-2, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.0, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "arm_controller_01"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	SWEP.SprintViewNormals = {x = 1.5, y = -1, z = 5} --
	
		----
	SWEP.BoltBone = "bolt"
	SWEP.BoltShootOffset = Vector(0, 0, -1.3)
	SWEP.BoltBonePositionRecoverySpeed = 20
	SWEP.EmptyBoltHoldAnimExclusion = "ak47_fire1"

	SWEP.StopReloadBoneOffset = 0
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DontHoldWhenReloading = true
	----

	SWEP.AttachmentModelsVM = {
		["md_eft_si_uh1"] = {model = "models/weapons/cw_eft/upgrades/scopes/UH1/v_uh1.mdl", bone = "weapon", pos = Vector(0, -3.01, 3), angle = Angle(90, 90, 180), size = Vector(0.65, 0.65, 0.65)},	
		["md_eft_si_1p87"] = {model = "models/weapons/cw_eft/upgrades/scopes/1p87/v_1p87.mdl", bone = "weapon", pos = Vector(0, -3, 1.5), angle = Angle(90, 90, 180), size = Vector(0.65, 0.65, 0.65)},	
		["md_eft_si_cobra"] = {model = "models/weapons/cw_eft/upgrades/scopes/cobra/v_ekp.mdl", bone = "weapon", pos = Vector(0, -3.01, 2.5), angle = Angle(90, 90, 180), size = Vector(0.65, 0.65, 0.65)},	
		["md_eft_si_ff3"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/ff3/v_ff3.mdl", bone = "weapon", pos = Vector(0, -3.02, 4), angle = Angle(90, 90, 180), size = Vector(0.65, 0.65, 0.65)},	
		["md_eft_si_ps320"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ps320/v_ps320.mdl", bone = "weapon", pos = Vector(0, -3.04, 1.6), angle = Angle(90, 90, 180), size = Vector(0.65, 0.65, 0.65)},	

		["md_eft_fg_afg_blk"] = {model = "models/weapons/cw_eft/upgrades/foregrips/afg/v_afg_blk.mdl", pos = Vector(0, -0.9, 9.8), angle = Angle(90, 180, 90), size = Vector(0.35, 0.35, 0.35), bone = "weapon"},
		["md_eft_fg_rvg"] = {model = "models/weapons/cw_eft/upgrades/foregrips/rvg/v_rvg.mdl", pos = Vector(0, -1, 9.5), angle = Angle(90, 180, 90), size = Vector(0.35, 0.35, 0.35), bone = "weapon"},
		--["md_eft_fg_vpg"] = {model = "models/weapons/cw_eft/upgrades/foregrips/vpg/v_vpg.mdl", pos = Vector(0, -1.1, 10.5), angle = Angle(0, 0, -90), size = Vector(0.35, 0.35, 0.35), bone = "weapon"},

		["md_eft_ld_la5"] = {model = "models/weapons/cw_eft/upgrades/tactical/la5/v_la5.mdl", pos = Vector(-0.7, -1.7, 14), angle = Angle(90, 90, 90), size = Vector(0.77, 0.77, 0.77), bone = "weapon"},
		["md_eft_ld_ls321"] = {model = "models/weapons/cw_eft/upgrades/tactical/ls321/v_ls321.mdl", pos = Vector(-0.7, -1.7, 14), angle = Angle(90, 90, 90), size = Vector(0.77, 0.77, 0.77), bone = "weapon"},
		["md_eft_ld_anpeq15"] = {model = "models/weapons/cw_eft/upgrades/tactical/anpeq15/v_anpeq15.mdl", pos = Vector(-0.7, -1.7, 14), angle = Angle(90, 90, 90), size = Vector(0.77, 0.77, 0.77), bone = "weapon"},
		
		["md_eft_fl_wf501b"] = {model = "models/weapons/cw_eft/upgrades/tactical/wf501b/v_wf501b.mdl", pos = Vector(0, -1, 14), angle = Angle(90, -90, 0), size = Vector(0.77, 0.77, 0.77), bone = "weapon"},


		["md_rail"] = {model = "models/weapons/v_models/rail/famasrail.mdl", bone = "weapon", pos = Vector(0, -0.02, 2.3), angle = Angle(-90, 0, -90), size = Vector(0.6, 0.75, 0.75)},


		--["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "body", rel = "", pos = Vector(1.713, -2.566, 1.774), angle = Angle(0, -90, 0), size = Vector(0.737, 0.737, 0.737)},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "weapon", rel = "", pos = Vector(0.018, -2.56, 17.6), angle = Angle(0, 0, 90), size = Vector(0.7, 0.7, 0.7)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "weapon", rel = "", pos = Vector(8.963, 0.578, 10.032), angle = Angle(90, 180, 90), size = Vector(0, 0, 0)},
		["md_schmidt_shortdot_fixed"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "weapon", rel = "", pos = Vector(-0.267, 0.601, -0.616), angle = Angle(90, 0, -90), size = Vector(0.699, 0.699, 0.699)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "Base", rel = "", pos = Vector(-2.337, 10.144, 2.598), angle = Angle(0, 90, 0), size = Vector(0.999, 0.999, 0.999), animated = true}
		
	}
	
	SWEP.M203HoldPos = {
		["r-upperarm-movement"] = { scale = Vector(1, 1, 1), pos = Vector(2.956, -0.082, -1.928), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
	["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 3.582, 47.046) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.01, 0), angle = Angle(3.2, 19.788, 59.991) },
	["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 5, 0.181), angle = Angle(1.236, 0, 0) },
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 10) },
	["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, 20, 0) }, --拇指头
	["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 10) }, --拇指	
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-13, -2.764, 0) },
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(2.299, 0.924, -2.333), angle = Angle(-2.648, 0.328, -2.2) },
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(55.604, 16.679, 0) }
	}	
	
		SWEP.ForegripOverridePos = {
	["md_eft_fg_rvg"] = {
    ["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0.2, 0.5, 0), angle = Angle(0, 0, 0) }

	},
	["md_foregrip"] = {
	["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 3.582, 47.046) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.01, 0), angle = Angle(3.2, 19.788, 59.991) },
	["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 5, 0.181), angle = Angle(1.236, 0, 0) },
	["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 10) },
	["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, 20, 0) }, --拇指头
	["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 10) }, --拇指
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-13, -2.764, 0) },
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(2.299, 0.924, -2.333), angle = Angle(-2.648, 0.328, -2.2) },
	["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(55.604, 16.679, 0) }
	},
	
	["md_eft_fg_afg_blk"] = {
	--["l_upperarm"] = { scale = Vector(1, 1, 1), pos = Vector(10, 10, 0), angle = Angle(20, 50, 0) },
	--["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(7.2, -4, 7), angle = Angle(40, 30, 20) },
    ["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(-1.4, 1, 5), angle = Angle(0, 20, 0) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 30, 20) },

	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 10, 0) },
	["L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(2.3, -0.2, -1.8), angle = Angle(0, 0, 0) }
			}
		}
	
	SWEP.AttachmentPosDependency = {[""] = {[""] = Vector(-0.225, 13, 3.15)},
	[""] = {[""] = Vector(-0.042, 9, -0.1), [""] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(-1, 0.08, 0) 
end
SWEP.PSO1AxisAlign = {right = -0.01, up = 0.0, forward = 90}
SWEP.SchmidtShortDotAxisAlign = {right = 0.0, up = 0.0, forward = 0}
SWEP.SightBGs = {main = 4, carryhandle = 0, foldsight = 1, none = 2}
SWEP.StockBGs = {main = 2, regular = 0, heavy = 1, sturdy = 2}
SWEP.MagBGs = {main = 0, regular = 0, fastmag = 1, exmagmk1 = 2}

    SWEP.LuaVMRecoilAxisMod = {vert = 0.05, hor = 0.21, roll = 0.6, forward = 0.5, pitch = 0}
    SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
    SWEP.ADSFireAnim = false  

SWEP.CustomizationMenuScale = 0.012

SWEP.Attachments = {
    [1] = {header = "Sight", offset = {-1000, -600}, atts = {"md_eft_si_ff3", "md_eft_si_cobra", "md_eft_si_uh1", "md_eft_si_1p87","md_eft_si_ps320"}},
	[2] = {header = "Barrel", offset = {-1000, -200}, atts = {"md_pbs1"}},
	[3] = {header = "Grip", offset = {-1000, 230}, atts = {"md_foregrip", "md_eft_fg_afg_blk"}},
	[4] = {header = "device", offset = {-1000, 600}, atts = {"md_eft_ld_la5", "md_eft_ld_ls321","md_eft_ld_anpeq15" }},
	[5] = {header = "misc", offset = {-200, 600}, atts = {"md_eft_fl_wf501b"}},

	["+reload"] = {header = "Ammo", offset = {500, 700}, atts = {"am_magnum", "am_matchgrade"}}}
	

SWEP.Animations = {fire = {"ak47_fire1", "ak47_fire2"},
	reload = "ak47_reload",
	idle = "ak47_idle",
	draw = "ak47_draw"}
	
SWEP.Sounds = {ak47_draw = {{time = 0.3, sound = "CW_DRAWAKMS"}},

	ak47_reload = {[1] = {time = 0.25, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.3, sound = "CW_AKMS_MAGOUT"},
	[3] = {time = 0.7, sound = "CW_AKMS_REACHMAG"},
	[4] = {time = 1.4, sound = "CW_AKMS_MAGSTART"},
	[5] = {time = 1.9, sound = "CW_AKMS_MAGIN"},
	[6] = {time = 2.7, sound = "CW_AKMS_BOLTBACK"},
	[7] = {time = 2.9, sound = "CW_AKMS_BOLTRELEASE"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW2.0 good ak"

SWEP.Author			= "Silent"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_rif_akms.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_akms.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 260
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x39MM"

SWEP.FireDelay = 0.09
SWEP.FireSound = "CW_AKMS_FIRE"
SWEP.FireSoundSuppressed = "CW_AKMS_FIRE_SUPPRESSED"
SWEP.Recoil = 1.1

SWEP.HipSpread = 0.051
SWEP.AimSpread = 0.0034
SWEP.VelocitySensitivity = 1.0
SWEP.MaxSpreadInc = 0.3
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 0.045
SWEP.Shots = 1
SWEP.Damage = 43
SWEP.DeployTime = 1.5

SWEP.ReloadSpeed = 1.1
SWEP.ReloadTime = 2.3
SWEP.ReloadTime_Empty = 3.4
SWEP.ReloadHalt = 2.8
SWEP.ReloadHalt_Empty = 3.4
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