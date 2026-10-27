AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")
// SCK name: wa

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Walther WA 2000"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.Add("cw_wa2000", "vgui/kills/cw_wa2000", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_wa2000")
	
	SWEP.MuzzleEffect = "muzzleflash_g3"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 4, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	
	SWEP.IronsightPos = Vector(-2.131, 0, 0.67)
	SWEP.IronsightAng = Vector(2, 0, 0)

	SWEP.TroySightPos = Vector(-2.096, 0, -0.26)
	SWEP.TroySightAng = Vector(2, 0, 0)
	SWEP.FoldSightPos = Vector(-2.096, 0, -0.26)
	SWEP.FoldSightAng = Vector(2, 0, 0)
	
	SWEP.CoD4ReflexPos = Vector(-2.135, 0, -0.5)
	SWEP.CoD4ReflexAng = Vector(3, 0, 0)

	SWEP.EoTech552Pos = Vector(-2.12, 0, -0.04)
	SWEP.EoTech552Ang = Vector(0, 0, 0)
	
	SWEP.EoTech553Pos = Vector(-2.096, 0, -0.11)
	SWEP.EoTech553Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.165, 0, 0.079)
	SWEP.EoTechAng = Vector(0, 0, 0)

	SWEP.AimpointPos = Vector(-2.135, 0, 0.09)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos = Vector(-2.1, 0, 0.4)
	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.FAS2AimpointPos = Vector(-2.09, 0, 0.13)
	SWEP.FAS2AimpointAng = Vector(0, 0, 0)

	SWEP.MicroT1Pos = Vector(-2.151, 0, 0.1)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.14, 0, -0.2)
	SWEP.ACOGAng = Vector(0, 0, 0)

	SWEP.CoD4ACOGPos = Vector(-2.141, 0, 0)
	SWEP.CoD4ACOGAng = Vector(0, 0, 0)
	
	SWEP.LeupoldPos = Vector(-2.08, 0, -0.03)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	SWEP.LeupoldAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.RscopePos  = Vector(-2.151, 0, 0.17)
	SWEP.RscopeAng = Vector(0 ,0, 0)
	SWEP.BFRIFLEAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.MW3SPos  = Vector(-2.11, 0, -0.671)
	SWEP.MW3SAng = Vector(0 ,0 , 0)
	SWEP.MW3SAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.HoloPos = Vector(-2.076, 0, 0.054)
	SWEP.HoloAng = Vector(0, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.1, 0, -1.351), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = false
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.CoD4ACOGAxisAlign = {right = 0, up = 180, forward = 0}
			
	SWEP.AlternativePos = Vector(0.319, 1.325, -1.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
if CustomizableWeaponry_KK_HK416 then
	SWEP.AttachmentModelsVM = {
		["md_troyrearsight_kk"] = { type = "Model", model = "models/c_troy_sight_rear.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.901, -17, 2.596), angle = Angle(0, 90, 180), size = Vector(1.149, 1.149, 1.149), active = true},
		["md_troyfrontsight_kk"] = { type = "Model", model = "models/c_troy_sight_front.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.901, -25.455, 3.099), angle = Angle(0, 90, -180), size = Vector(1.149, 1.149, 1.149), active = true},
		["md_mw3scope"] = { type = "Model", model = "models/rageattachments/v_msrscope.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.77, -11.948, 3.4), angle = Angle(0, 90, -180), size = Vector(1, 1, 1)},
		["md_bfriflescope"] = { type = "Model", model = "models/rageattachments/sniperscopesv.mdl", bone = "WA_Body", rel = "", pos = Vector(-3, -10.91, 2.45), angle = Angle(-180, 0, 0), size = Vector(1, 1, 1)},
		["md_fas2_eotech"] = { type = "Model", model = "models/c_fas2_eotech.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.901, -15.065, 2.7), angle = Angle(0, 90, -180), size = Vector(1.2, 1.2, 1.2)},
		["md_fas2_eotech_stencil"] = { type = "Model", model = "models/c_fas2_eotech_stencil.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.901, -15.065, 2.7), angle = Angle(0, 90, -180), size = Vector(1.2, 1.2, 1.2)},
		["md_fas2_holo"] = { type = "Model", model = "models/v_holo_sight_kkrc.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.901, -8.832, 6), angle = Angle(180, -90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_fas2_holo_aim"] = { type = "Model", model = "models/v_holo_sight_orig_hx.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.901, -8.832, 6), angle = Angle(180, -90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "WA_Body", rel = "", pos = Vector(-3, -19.222, 2.799), angle = Angle(0, -90, -180), size = Vector(0.699, 0.699, 0.699)},
		["md_cod4_acog_v2"] = { type = "Model", model = "models/v_cod4_acog.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.945, -7.7, 5.199), angle = Angle(0, -90, -180), size = Vector(1, 1, 1)},
		["md_fas2_aimpoint"] = { type = "Model", model = "models/c_fas2_aimpoint_rigged.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.901, -15, 2.95), angle = Angle(0, 90, -180), size = Vector(1.25, 1.25, 1.25)},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "WA_Body", rel = "", pos = Vector(-3.201, -5.301, 7.8), angle = Angle(0, 0, -180), size = Vector(1, 1, 1)},
		["md_cod4_aimpoint_v2"] = { type = "Model", model = "models/v_cod4_aimpoint.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.901, -7, 5.409), angle = Angle(0, -90, -180), size = Vector(1, 1, 1)},
		["md_cod4_eotech_v2"] = { type = "Model", model = "models/v_cod4_eotech.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.955, -7.801, 5.099), angle = Angle(0, -90, -180), size = Vector(0.898, 0.898, 0.898)},
		["md_hk416_bipod"] = { type = "Model", model = "models/c_bipod.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.85, -25.701, 5.714), angle = Angle(-180, -180, 0), size = Vector(0.898, 0.898, 0.898)},	
		["md_cod4_reflex"] = { type = "Model", model = "models/v_cod4_reflex.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.951, -7, 5.48), angle = Angle(0, -90, -180), size = Vector(1, 1, 1)},
		["md_fas2_leupold"] = { type = "Model", model = "models/v_fas2_leupold.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.901, -9.87, 0.899), angle = Angle(0, 90, -180), size = Vector(2, 2, 2)},
		["md_fas2_leupold_mount"] = { type = "Model", model = "models/v_fas2_leupold_mounts.mdl", bone = "WA_Body", rel = "", pos = Vector(-3, -9.87, 0.899), angle = Angle(-180, -90, 0), size = Vector(2, 2, 2)},
		["md_saker"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.951, -15.065, 1.299), angle = Angle(0, -180, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.701, -0.519, 12.899), angle = Angle(-180, -90, 0), size = Vector(1, 1, 1)},
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.931, -11.4, 2), angle = Angle(-180, 0, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_acog"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "WA_Body", rel = "", pos = Vector(-3.3, -5.401, 7.849), angle = Angle(-180, -180, 0), size = Vector(1, 1, 1)}
	}
else
	SWEP.AttachmentModelsVM = {
		["md_mw3scope"] = { type = "Model", model = "models/rageattachments/v_msrscope.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.77, -11.948, 3.4), angle = Angle(0, 90, -180), size = Vector(1, 1, 1)},
		["md_bfriflescope"] = { type = "Model", model = "models/rageattachments/sniperscopesv.mdl", bone = "WA_Body", rel = "", pos = Vector(-3, -10.91, 2.45), angle = Angle(-180, 0, 0), size = Vector(1, 1, 1)},
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "WA_Body", rel = "", pos = Vector(-3, -19.222, 2.799), angle = Angle(0, -90, -180), size = Vector(0.699, 0.699, 0.699)},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "WA_Body", rel = "", pos = Vector(-3.201, -5.301, 7.8), angle = Angle(0, 0, -180), size = Vector(1, 1, 1)},
		["md_saker"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.951, -15.065, 1.299), angle = Angle(0, -180, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.701, -0.519, 12.899), angle = Angle(-180, -90, 0), size = Vector(1, 1, 1)},
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "WA_Body", rel = "", pos = Vector(-2.931, -11.4, 2), angle = Angle(-180, 0, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_acog"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "WA_Body", rel = "", pos = Vector(-3.3, -5.401, 7.849), angle = Angle(-180, -180, 0), size = Vector(1, 1, 1)}
	}
end
	
	if CustomizableWeaponry_KK_HK416 then
	function SWEP:RenderTargetFunc()
	local wm = self.WMEnt
	local isAiming = self:isAiming()
		
			wm:SetBodygroup(self.SightBGs.main, self.CW_VM:GetBodygroup(self.SightBGs.main))
				local fent = self.AttachmentModelsVM.md_troyfrontsight_kk.ent
				local rent = self.AttachmentModelsVM.md_troyrearsight_kk.ent
			
				if not (self.AimPos == self.TroySightPos and self.AimAng == self.TroySightAng) then
					fent:ManipulateBoneAngles(fent:LookupBone("sight"), Angle(0, 0, -85))
					rent:ManipulateBoneAngles(rent:LookupBone("sight"), Angle(0, 0, -85))
					fent:ManipulateBonePosition(rent:LookupBone("boner"), Vector(0, 0, 850))
					rent:ManipulateBonePosition(rent:LookupBone("boner"), Vector(0, 0, 850))
				else
					fent:ManipulateBoneAngles(fent:LookupBone("sight"), Angle(0, 0, 0))
					rent:ManipulateBoneAngles(rent:LookupBone("sight"), Angle(0, 0, 0))
					fent:ManipulateBonePosition(rent:LookupBone("boner"), Vector(0, 0, 0))
					rent:ManipulateBonePosition(rent:LookupBone("boner"), Vector(0, 0, 0))
				end
						
	end
	end
	
	SWEP.CompM4SBoneMod = {}

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
	SWEP.LaserPosAdjust = Vector(-1, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.SightBGs		= {main = 2, carryhandle = 0, foldsight = 2, none = 1, foldfold = 3}
SWEP.ForegripBGs	= {main = 3, regular = 0, covered = 1}
SWEP.MagBGs			= {main = 4, regular = 0, round34 = 1, round100 = 2, round100_empty = 3, none = 4, regular_empty = 5, round34_empty = 6}
SWEP.StockBGs		= {main = 5, regular = 0, heavy = 1, none = 2}
SWEP.SilencerBGs	= {main = 6, off = 0, on = 1, long_off = 2, long_on = 3}
SWEP.LuaViewmodelRecoil = false

if CustomizableWeaponry_KK_HK416 and CustomizableWeaponry_Fluffy_Zorua then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {100, -450},  atts = {"bg_hk416_foldsight", "md_cod4_reflex","md_microt1","md_eotech","md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2","md_fas2_aimpoint","md_acog","md_cod4_acog_v2","md_fas2_holo", "md_fas2_leupold", "md_bfriflescope", "md_mw3scope"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Handguard", offset = {-250, 150}, atts = {"md_hk416_bipod"}},
		[4] = {header = "Rail", offset = {-250, 600}, atts = {"md_anpeq15"}},
		["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}},
		["+attack2"] = {header = "Perks", offset = {1300, 100}, atts = {"pk_sleightofhand", "pk_light"}}
	}
elseif CustomizableWeaponry_KK_HK416 then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {100, -450},  atts = {"bg_hk416_foldsight", "md_cod4_reflex","md_microt1","md_eotech","md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2","md_fas2_aimpoint","md_acog","md_cod4_acog_v2","md_fas2_holo", "md_fas2_leupold"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Handguard", offset = {-250, 150}, atts = {"md_hk416_bipod"}},
		[4] = {header = "Rail", offset = {-250, 600}, atts = {"md_anpeq15"}},
		["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_Fluffy_Zorua then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {100, -450},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_acog", "md_bfriflescope", "md_mw3scope"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Rail", offset = {-250, 600}, atts = {"md_anpeq15"}},
		["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}},
		["+attack2"] = {header = "Perks", offset = {1300, 100}, atts = {"pk_sleightofhand", "pk_light"}}
	}
else
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {100, -450},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_acog"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Rail", offset = {-250, 600}, atts = {"md_anpeq15"}},
		["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}
	}
end
	
SWEP.Animations = {fire = {"wa2000_fire1", "wa2000_fire2"},
	reload = "wa2000_reload",
	idle = "wa2000_idle",
	draw = "wa2000_draw"}
	
SWEP.Sounds = {
	
	wa2000_draw = {[1] = {time = 0, sound = "CW_WA2000_FOLEY"},
	[2] = {time = 0, sound = "CW_WA2000_CLOTH"}},
	
	wa2000_reload = {
	[1] = {time = 0.45, sound = "CW_WA2000_MAGRETRACT"},
	[2] = {time = 0.5, sound = "CW_WA2000_MAGOUT"},
	[3] = {time = 1.75, sound = "CW_WA2000_MAGFIX"},
	[4] = {time = 1.85, sound = "CW_WA2000_MAGIN"},
	[5] = {time = 2.35, sound = "CW_WA2000_PULL"},
	[6] = {time = 2.38, sound = "CW_WA2000_BOLTRELEASE"}}}
	
	

SWEP.SpeedDec = 35

SWEP.ADSFireAnim = false
SWEP.BipodFireAnim = true
SWEP.AimBreathingIntensity = 1
SWEP.AimBreathingEnabled = true

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "White Snow"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/wwa2000/v_snip_wa200.mdl"
SWEP.WorldModel		= "models/weapons/wwa2000/w_snip_wa200.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/wwa2000/w_snip_wa200.mdl"
SWEP.WMPos = Vector(-1, -1.2, -0.2)
SWEP.WMAng = Vector(-3,1,180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x51MM"
SWEP.magType = "srMag"

SWEP.FireDelay = 0.20
SWEP.FireSound = "CW_WA2000_FIRE"
SWEP.FireSoundSuppressed = "CW_WA2000_SUB"
SWEP.Recoil = 1
SWEP.AimViewModelFOV = 45
SWEP.CustomizationMenuScale = 0.013

SWEP.HipSpread = 0.02
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.01
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 62
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.8
SWEP.ReloadTime_Empty = 2.8
SWEP.ReloadHalt = 0.1
SWEP.ReloadHalt_Empty = 0.1
//SWEP.SnapToIdlePostReload = true