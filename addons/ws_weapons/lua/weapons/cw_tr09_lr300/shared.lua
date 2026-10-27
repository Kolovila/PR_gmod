AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "ZM LR300"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "w"
	killicon.Add("cw_tr09_lr300", "vgui/kills/cw_tr09_lr300_kill", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_tr09_lr300_select")
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0.3
	SWEP.ForeGripOffsetCycle_Reload = 0.75
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.75
	
	SWEP.M203OffsetCycle_Reload = 0.75
	SWEP.M203OffsetCycle_Reload_Empty = 0.75
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.CustomizePos = Vector(5, 0, -0.5)
	SWEP.CustomizeAng = Vector(20, 35, 15)
	
	SWEP.IronsightPos = Vector(-2.025, -2, 0.3)
	SWEP.IronsightAng = Vector(-0.13, -0.02, 0)
	SWEP.FOVPerShot = 0
	
	SWEP.MicroT1Pos = Vector(-2.025, 0, 0.695)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.CmorePos = Vector(-2.03, -3, 0.59)
	SWEP.CmoreAng = Vector(0, 0, 0)
	
	SWEP.WS_CMOREPos = Vector(-2.02, -3, 0.57)
	SWEP.WS_CMOREAng = Vector(0, 0, 0)
	
	SWEP.ReflexPos = Vector(-2.03, -3, 0.72)
	SWEP.ReflexAng = Vector(0, 0, 0)
	
	SWEP.CoD4ReflexPos = Vector(-2.02, -3, 0.76)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.WS_BarskaPos = Vector(-2.03, -2.5, 0.57)
	SWEP.WS_BarskaAng = Vector(0, 0, 0)
	
	SWEP.TrijiconPos = Vector(-1.995, -3, 0.65)
	SWEP.TrijiconAng = Vector(0, 0, 0)
		
	SWEP.EoTechPos = Vector(-2.035, -2, 0.19)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.EoTech553Pos = Vector(-2.04, -2, 0.42)
	SWEP.EoTech553Ang = Vector(0, 0, 0)
	
	SWEP.WS_EoTech557Pos = Vector(-2.03, -2, 0.355)
	SWEP.WS_EoTech557Ang = Vector(0, 0, 0)
	
	SWEP.HoloPos = Vector(-2.02, -2, 0.49)
	SWEP.HoloAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.035, -2, 0.545)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos = Vector(-2.035, -3, 0.85)
	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.FAS2AimpointPos = Vector(-2.02, -2.5, 0.695)
	SWEP.FAS2AimpointAng = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.015, -2.5, 0.66)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.ELCANPos = Vector(-2.015, -2, 0.4)
	SWEP.ELCANAng = Vector(0, 0, 0)
	
	SWEP.WS_ELCANPos = Vector(-2.015, -2, 0.36)
	SWEP.WS_ELCANAng = Vector(0, 0, 0)
	SWEP.WS_ELCANAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.ACOGPos = Vector(-2.015, -2.5, 0.485)
	SWEP.ACOGAng = Vector(0, 0, 0)
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.CSGOACOGPos = Vector(-2.01, -2.5, 0.62)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.CoD4ACOGPos = Vector(-2.02, -3.5, 0.7)
	SWEP.CoD4ACOGAng = Vector(0, 0, 0)
	SWEP.CoD4ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.WS_ACOGPos  = Vector(-2.035, -2.5, 0.58)
	SWEP.WS_ACOGAng = Vector(0 ,0 , 0)
	SWEP.WS_ACOGAxisAlign = {right = -0.05, up = 0.03, forward = -135}
	
	SWEP.LeupoldPos = Vector(-2.035, -2, 0.48)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	SWEP.LeupoldAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.CSGOSSGPos = Vector(-2.015, -1, 0.61)
	SWEP.CSGOSSGAng = Vector(0, 0, 0)
	SWEP.CSGOSSGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.M203Pos = Vector(-0.6, -2.5, 0.7)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(3, 0, -0.5)
	SWEP.SprintAng = Vector(-13.75, 37, -15)
	
	SWEP.AlternativePos = Vector(-0.5, 1, -0.3)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.015, -2.5, -0.17), [2] = Vector(0, 0, 0)},
	["md_elcan"] = {[1] = Vector(-2.02, -1.5, -0.16), [2] = Vector(-0.06, -0.12, 0)},
	["md_ws_elcan"] = {[1] = Vector(-2, -1.5, -0.23), [2] = Vector(0, 0.1, 0)},
	["md_ws_acog"] = {[1] = Vector(-2.018, -2.5, 0.04), [2] = Vector(-0.55, 0, 0)}}

	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	SWEP.CustomizationMenuScale = 0.01
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_fas2_leupold"] = { type = "Model", model = "models/v_fas2_leupold.mdl", bone = "Honey_Body", rel = "", pos = Vector(-0.01, 9.17, 47.72), angle = Angle(0, -90, 0), size = Vector(1.15, 1.15, 1.15)},
		["md_fas2_leupold_mount"] = { type = "Model", model = "models/v_fas2_leupold_mounts.mdl", bone = "Honey_Body", rel = "", pos = Vector(-0.01, 9.17, 47.72), angle = Angle(0, -90, 0), size = Vector(1.15, 1.15, 1.15)},
		["md_uecw_csgo_scope_ssg"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_scope_bender.mdl", bone = "Honey_Body", rel = "", pos = Vector(0.035, 10.13, 46.79), angle = Angle(0, -90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "Honey_Body", rel = "", pos = Vector(0, 7.85, 45.25), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_ws_eotech557"] = {model = "models/attachments/ws_eotech557.mdl", bone = "Honey_Body", pos = Vector(-0.72, 3.9, 42.51), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_ws_elcan"] = { type = "Model", model = "models/attachments/ws_elcan.mdl", bone = "Honey_Body", rel = "", pos = Vector(-0.08, 6.22, 44.42), angle = Angle(0, -90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_ws_grippod"] = {model = "models/attachments/white_snow/ws_grippod.mdl", bone = "Honey_Body", rel = "", pos = Vector(-14.49, 20.35, 42.42), angle = Angle(0, -15, 0), size = Vector(2.4, 2.4, 2.4)},
		["md_ws_dbal"] = { type = "Model", model = "models/attachments/White_Snow/ws_dbal.mdl", bone = "Honey_Body", rel = "", pos = Vector(0.9, 20.45, 45.68), angle = Angle(180, -90, -90), size = Vector(0.5, 0.5, 0.5)},
		["md_ws_c_more"] = { type = "Model", model = "models/attachments/white_snow/ws_c_more.mdl", bone = "Honey_Body", rel = "", pos = Vector(-0.04, 10.45, 47), angle = Angle(0, 0, 0), size = Vector(0.18, 0.18, 0.18)},
		["md_ws_barska"] = { type = "Model", model = "models/attachments/white_snow/ws_barska.mdl", bone = "Honey_Body", rel = "", pos = Vector(0, 9.95, 46.98), angle = Angle(0, 0, 0), size = Vector(0.14, 0.14, 0.14)},
		["md_cmore"] = { type = "Model", model = "models/attachments/cmore.mdl", bone = "Honey_Body", rel = "", pos = Vector(0, 10.45, 46.9), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_fas2_eotech"] = { type = "Model", model = "models/c_fas2_eotech.mdl", bone = "Honey_Body", rel = "", pos = Vector(0.01, 12.590, 46.54), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_fas2_aimpoint"] = {model = "models/c_fas2_aimpoint_rigged.mdl", bone = "Honey_Body", rel = "", pos = Vector(0.01, 12, 46.4), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_fas2_holo_aim"] = {model = "models/v_holo_sight_orig_hx.mdl", bone = "Honey_Body", rel = "", pos = Vector(0, 8, 44.16), angle = Angle(0, -90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_fas2_holo"] = {model = "models/v_holo_sight_kkrc.mdl", bone = "Honey_Body", rel = "", pos = Vector(0, 8, 44.16), angle = Angle(0, -90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_cod4_aimpoint_v2"] = { type = "Model", model = "models/v_cod4_aimpoint.mdl", bone = "Honey_Body", rel = "", pos = Vector(0, 6.95, 44.74), angle = Angle(0, 90, 0), size = Vector(0.65, 0.65, 0.65)},
		["md_elcan"] = { type = "Model", model = "models/bunneh/elcan.mdl", bone = "Honey_Body", rel = "", pos = Vector(-0.21, 6.5, 43.51), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_reflex"] = { type = "Model", model = "models/attachments/kascope.mdl", bone = "Honey_Body", rel = "", pos = Vector(-0.005, 11.77, 47.07), angle = Angle(0, 0, 0), size = Vector(0.46, 0.46, 0.46)},
		["md_trijicon"] = { type = "Model", model = "models/att_trijicon.mdl", bone = "Honey_Body", rel = "", pos = Vector(0.03, 11.6, 45.27), angle = Angle(0, 0, 0), size = Vector(1.4, 1.4, 1.4)},
		["md_cod4_acog_v2"] = {model = "models/v_cod4_acog.mdl", bone = "Honey_Body", rel = "", pos = Vector(0, 8.1, 45.31), angle = Angle(0, 90, 0), size = Vector(0.52, 0.52, 0.52)},
		["md_ws_acog"] = { type = "Model", model = "models/attachments/White_Snow/ws_acog.mdl", bone = "Honey_Body", rel = "", pos = Vector(-1.395, 1.77, 48.16), angle = Angle(0, 0, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_uecw_csgo_acog"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_acog.mdl", bone = "Honey_Body", rel = "", pos = Vector(0.04, 6.03, 44.57), angle = Angle(0, -90, 0), size = Vector(0.52, 0.52, 0.52)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Honey_Body", rel = "", pos = Vector(-0.175, 6, 43.26), angle = Angle(0, 0, 0), size = Vector(0.65, 0.65, 0.65)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Honey_Body", rel = "", pos = Vector(0.245, 0.55, 36.82), angle = Angle(3, -90, 0), size = Vector(0.9, 0.9, 0.9)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "Honey_Body", rel = "", pos = Vector(-0.28, 12.53, 43.27), angle = Angle(0, 0, 0), size = Vector(0.52, 0.52, 0.52)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Honey_Body", pos = Vector(0, 10.307, 43.62), angle = Angle(0, 0, 0), size = Vector(0.72, 0.72, 0.72)},
		["md_ws_scifi_silencer"] = { type = "Model", model = "models/attachments/White_Snow/ws_scifi_silencer.mdl", bone = "Honey_Body", rel = "", pos = Vector(-3.78, -20.6, 37.77), angle = Angle(0, 0, 0), size = Vector(1.4, 1.4, 1.4)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Honey_Body", pos = Vector(0.01, 10, 47.02), angle = Angle(0, 180, 0), size = Vector(0.26, 0.26, 0.26)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Honey_Body", pos = Vector(-0.21, 6.6, 43.61), angle = Angle(0, 0, 0), size = Vector(0.58, 0.58, 0.58)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "Honey_Body", pos = Vector(0.52, 20.5, 45.71), angle = Angle(180, -90, -90), size = Vector(0.4, 0.4, 0.4)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "Honey_Body", pos = Vector(-0.21, 6.6, 43.62), angle = Angle(0, -90, 0), size = Vector(0.58, 0.58, 0.58)},
		["md_hk416_bipod"] = { type = "Model", model = "models/c_bipod.mdl", bone = "Honey_Body", rel = "", pos = Vector(0.03, 20.5, 44.5), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "Honey_Body", pos = Vector(1.65, 4.4, 46.95), angle = Angle(0, -90, 0), size = Vector(0.7, 0.7, 0.7), animated = true}
	}
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, -2), angle = Angle(0, 0, 0) }
	}
	
	SWEP.ForeGripHoldPos = {
		["Bip01 L Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, 45, 45) },
		["Bip01 L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, 25, 0) },
		["Bip01 L Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 80, 40) },
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(3, -1.15, -1.079), angle = Angle(-30, 10, 0) },
		["Bip01 L Finger22"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },
		["Bip01 L Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(7, 25, 0) },
		["Bip01 L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 55, 0) },
		["Bip01 L Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 60, -15) },
		["Bip01 L Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-5, 20, 35) },
		["Bip01 L Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 105, 55) },
		["Bip01 L Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 80, 0) },
		["Bip01 L Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 42.409) },
		["Bip01 L Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(12, 60, 0) },
		["Bip01 L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, -10, 0) },
		["Bip01 L Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 25, 0) },
		["Bip01 L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-15, 15, -10) },
		["Bip01 L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-5, 50, -20) }
	}
	
	SWEP.ForegripOverridePos = {
		["md_ws_grippod"] = { ["Bip01 L Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, 45, 45) },
		["Bip01 L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, 25, 0) },
		["Bip01 L Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 80, 40) },
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(3, -1.15, -1.079), angle = Angle(-30, 10, 0) },
		["Bip01 L Finger22"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },
		["Bip01 L Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(7, 25, 0) },
		["Bip01 L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 55, 0) },
		["Bip01 L Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 60, -15) },
		["Bip01 L Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-5, 20, 35) },
		["Bip01 L Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 105, 55) },
		["Bip01 L Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 80, 0) },
		["Bip01 L Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 42.409) },
		["Bip01 L Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(12, 60, 0) },
		["Bip01 L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, -10, 0) },
		["Bip01 L Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 25, 0) },
		["Bip01 L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-15, 15, -10) },
		["Bip01 L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-5, 50, -20) }}
	}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	SWEP.WS_DbalPosAdjust = Vector(0, 0, 0)
	SWEP.WS_DbalAngAdjust = Angle(0, 180, 0)
end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.BarrelBGs = {main = 4, long = 1, regular = 0}
SWEP.ReceiverBGs = {main = 3, m16 = 1, regular = 0} //lua_run Entity(1):GetViewModel():SetBodygroup(3,1)
SWEP.MagBGs = {main = 5, regular = 0, round60 = 1}
SWEP.LuaViewmodelRecoil = true
SWEP.BipodFireAnim = true

function SWEP:fireAnimFunc()
	local cyc = 0
	local clip = self:Clip1()
		
	if self:isAiming() or self.ActiveAttachments.md_m203 then
		cyc = 1
	end
		
	if clip > 1 then
		self:sendWeaponAnim("fire",1,cyc)
	end
end

SWEP.AttachmentDependencies = {
	["md_ws_scifi_silencer"] = {"lr300_scifi"},
	["md_m203"] = {"lr300_longreceiver"}}
	
SWEP.AttachmentPosDependency = {
	["md_anpeq15"] = {["lr300_longreceiver"] = Vector(0.65, 20.3, 45.9)},
	["md_ws_dbal"] = {["lr300_longreceiver"] = Vector(0.9, 20.4, 45.84)},
	["md_saker"] = {["lr300_longbarrel"] = Vector(0, 14.8, 43.62)},
	["md_ws_scifi_silencer"] = {["lr300_longbarrel"] = Vector(-3.78, -16, 37.77)},
}

if CustomizableWeaponry_KK_HK416 and CustomizableWeaponry_G4P_UECW and CustomizableWeaponry_WS_Pack then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {-500, -520}, atts = {"md_microt1", "md_cmore", "md_ws_c_more", "md_reflex", "md_cod4_reflex", "md_ws_barska", "md_trijicon", "md_eotech", "md_fas2_eotech", "md_ws_eotech557", "md_fas2_holo", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_schmidt_shortdot", "md_elcan", "md_ws_elcan", "md_acog", "md_uecw_csgo_acog", "md_cod4_acog_v2", "md_ws_acog", "md_fas2_leupold", "md_uecw_csgo_scope_ssg"}},
		[2] = {header = "Suppressor", offset = {-500, -100}, atts = {"md_saker", "md_ws_scifi_silencer"}},
		[3] = {header = "Laser", offset = {-500, 320}, atts = {"md_anpeq15", "md_ws_dbal"}},
		[4] = {header = "Handguard", offset = {150, 500}, atts = {"md_foregrip", "md_ws_grippod", "md_hk416_bipod", "md_m203"}},
		[5] = {header = "Receiver", offset = {150, -100}, atts = {"lr300_longreceiver"}},
		[6] = {header = "Barrel", offset = {700, -100}, atts = {"lr300_longbarrel"}},
		[7] = {header = "Magazine", offset = {850, 700}, atts = {"bg_ar1560rndmag"}},
		["impulse 100"] = {header = "Skin", offset = {1300, 300}, atts = {"lr300_tan", "lr300_green", "lr300_scifi"}},
		["+reload"] = {header = "Ammo", offset = {1300, -100}, atts = {"am_greentip", "am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_WS_Pack and CustomizableWeaponry_KK_HK416 then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {100, -400}, atts = {"md_microt1", "md_ws_c_more", "md_cod4_reflex", "md_ws_barska", "md_eotech", "md_fas2_eotech", "md_ws_eotech557", "md_fas2_holo", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_schmidt_shortdot", "md_ws_elcan", "md_acog", "md_cod4_acog_v2", "md_ws_acog", "md_fas2_leupold"}},
		[2] = {header = "Suppressor", offset = {-400, -400}, atts = {"md_saker", "md_ws_scifi_silencer"}},
		[3] = {header = "Laser", offset = {-400, 50}, atts = {"md_anpeq15", "md_ws_dbal"}},
		[4] = {header = "Handguard", offset = {-400, 500}, atts = {"md_foregrip", "md_ws_grippod", "md_hk416_bipod", "md_m203"}},
		[5] = {header = "Receiver", offset = {500, 50}, atts = {"lr300_longreceiver"}},
		[6] = {header = "Barrel", offset = {500, 400}, atts = {"lr300_longbarrel"}},
		[7] = {header = "Magazine", offset = {500, 850}, atts = {"bg_ar1560rndmag"}},
		["impulse 100"] = {header = "Skin", offset = {1200, 400}, atts = {"lr300_tan", "lr300_green", "lr300_scifi"}},
		["+reload"] = {header = "Ammo", offset = {1200, 50}, atts = {"am_greentip", "am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_G4P_UECW and CustomizableWeaponry_KK_HK416 then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {100, -400}, atts = {"md_microt1", "md_cmore", "md_reflex", "md_cod4_reflex", "md_trijicon", "md_eotech", "md_fas2_eotech", "md_fas2_holo", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_schmidt_shortdot", "md_elcan", "md_acog", "md_uecw_csgo_acog", "md_cod4_acog_v2", "md_fas2_leupold", "md_uecw_csgo_scope_ssg"}},
		[2] = {header = "Suppressor", offset = {-400, -400}, atts = {"md_saker"}},
		[3] = {header = "Laser", offset = {-400, 50}, atts = {"md_anpeq15"}},
		[4] = {header = "Handguard", offset = {-400, 500}, atts = {"md_foregrip", "md_hk416_bipod", "md_m203"}},
		[5] = {header = "Receiver", offset = {500, 50}, atts = {"lr300_longreceiver"}},
		[6] = {header = "Barrel", offset = {500, 400}, atts = {"lr300_longbarrel"}},
		[7] = {header = "Magazine", offset = {500, 850}, atts = {"bg_ar1560rndmag"}},
		["impulse 100"] = {header = "Skin", offset = {1200, 400}, atts = {"lr300_tan", "lr300_green", "lr300_scifi"}},
		["+reload"] = {header = "Ammo", offset = {1200, 50}, atts = {"am_greentip", "am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_WS_Pack and CustomizableWeaponry_G4P_UECW then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {100, -400}, atts = {"md_microt1", "md_cmore", "md_ws_c_more", "md_reflex", "md_ws_barska", "md_trijicon", "md_eotech", "md_ws_eotech557", "md_aimpoint", "md_schmidt_shortdot", "md_elcan", "md_ws_elcan", "md_acog", "md_uecw_csgo_acog", "md_ws_acog", "md_uecw_csgo_scope_ssg"}},
		[2] = {header = "Suppressor", offset = {-400, -400}, atts = {"md_saker", "md_ws_scifi_silencer"}},
		[3] = {header = "Laser", offset = {-400, 50}, atts = {"md_anpeq15", "md_ws_dbal"}},
		[4] = {header = "Handguard", offset = {-400, 500}, atts = {"md_foregrip", "md_ws_grippod", "md_m203"}},
		[5] = {header = "Receiver", offset = {500, 50}, atts = {"lr300_longreceiver"}},
		[6] = {header = "Barrel", offset = {500, 400}, atts = {"lr300_longbarrel"}},
		[7] = {header = "Magazine", offset = {500, 850}, atts = {"bg_ar1560rndmag"}},
		["impulse 100"] = {header = "Skin", offset = {1200, 400}, atts = {"lr300_tan", "lr300_green", "lr300_scifi"}},
		["+reload"] = {header = "Ammo", offset = {1200, 50}, atts = {"am_greentip", "am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_KK_HK416 then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -400}, atts = {"md_microt1", "md_cod4_reflex", "md_eotech", "md_fas2_eotech", "md_fas2_holo", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_schmidt_shortdot", "md_acog", "md_cod4_acog_v2", "md_fas2_leupold"}},
		[2] = {header = "Suppressor", offset = {-400, -400}, atts = {"md_saker"}},
		[3] = {header = "Laser", offset = {-400, 50}, atts = {"md_anpeq15"}},
		[4] = {header = "Handguard", offset = {-400, 500}, atts = {"md_foregrip", "md_hk416_bipod", "md_m203"}},
		[5] = {header = "Receiver", offset = {500, 50}, atts = {"lr300_longreceiver"}},
		[6] = {header = "Barrel", offset = {500, 400}, atts = {"lr300_longbarrel"}},
		[7] = {header = "Magazine", offset = {500, 850}, atts = {"bg_ar1560rndmag"}},
		["impulse 100"] = {header = "Skin", offset = {1200, 400}, atts = {"lr300_tan", "lr300_green", "lr300_scifi"}},
		["+reload"] = {header = "Ammo", offset = {1200, 50}, atts = {"am_greentip", "am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_G4P_UECW then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -400}, atts = {"md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_eotech", "md_aimpoint", "md_schmidt_shortdot", "md_elcan", "md_acog", "md_uecw_csgo_acog", "md_uecw_csgo_scope_ssg"}},
		[2] = {header = "Suppressor", offset = {-400, -400}, atts = {"md_saker"}},
		[3] = {header = "Laser", offset = {-400, 50}, atts = {"md_anpeq15"}},
		[4] = {header = "Handguard", offset = {-400, 500}, atts = {"md_foregrip", "md_m203"}},
		[5] = {header = "Receiver", offset = {500, 50}, atts = {"lr300_longreceiver"}},
		[6] = {header = "Barrel", offset = {500, 400}, atts = {"lr300_longbarrel"}},
		[7] = {header = "Magazine", offset = {500, 850}, atts = {"bg_ar1560rndmag"}},
		["impulse 100"] = {header = "Skin", offset = {1200, 400}, atts = {"lr300_tan", "lr300_green", "lr300_scifi"}},
		["+reload"] = {header = "Ammo", offset = {1200, 50}, atts = {"am_greentip", "am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_WS_Pack then
	SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -400}, atts = {"md_microt1", "md_ws_c_more", "md_ws_barska", "md_eotech", "md_ws_eotech557", "md_aimpoint", "md_schmidt_shortdot", "md_ws_elcan", "md_acog", "md_ws_acog"}},
		[2] = {header = "Suppressor", offset = {-400, -400}, atts = {"md_saker", "md_ws_scifi_silencer"}},
		[3] = {header = "Laser", offset = {-400, 50}, atts = {"md_anpeq15", "md_ws_dbal"}},
		[4] = {header = "Handguard", offset = {-400, 500}, atts = {"md_foregrip", "md_ws_grippod", "md_m203"}},
		[5] = {header = "Receiver", offset = {500, 50}, atts = {"lr300_longreceiver"}},
		[6] = {header = "Barrel", offset = {500, 400}, atts = {"lr300_longbarrel"}},
		[7] = {header = "Magazine", offset = {500, 850}, atts = {"bg_ar1560rndmag"}},
		["impulse 100"] = {header = "Skin", offset = {1200, 400}, atts = {"lr300_tan", "lr300_green", "lr300_scifi"}},
		["+reload"] = {header = "Ammo", offset = {1200, 50}, atts = {"am_greentip", "am_magnum", "am_matchgrade"}}
	}
else
	SWEP.Attachments = {[1] = {header = "Sight", offset = {500, -400}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_schmidt_shortdot", "md_acog"}},
		[2] = {header = "Suppressor", offset = {-400, -400}, atts = {"md_saker"}},
		[3] = {header = "Laser", offset = {-400, 50}, atts = {"md_anpeq15"}},
		[4] = {header = "Handguard", offset = {-400, 500}, atts = {"md_foregrip", "md_m203"}},
		[5] = {header = "Receiver", offset = {500, 50}, atts = {"lr300_longreceiver"}},
		[6] = {header = "Barrel", offset = {500, 400}, atts = {"lr300_longbarrel"}},
		[7] = {header = "Magazine", offset = {500, 850}, atts = {"bg_ar1560rndmag"}},
		["impulse 100"] = {header = "Skin", offset = {1200, 400}, atts = {"lr300_tan", "lr300_green", "lr300_scifi"}},
		["+reload"] = {header = "Ammo", offset = {1200, 50}, atts = {"am_greentip", "am_magnum", "am_matchgrade"}}
	}
end

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
--	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_LR300_DEPLOY"}},

	reload = {[1] = {time = 0.1, sound = "CW_LR300_MAGOUT"},
	[2] = {time = 1.65, sound = "CW_LR300_MAGIN"},
	[3] = {time = 1.9, sound = "CW_LR300_FOLEY"}}}

--[[	reload_empty = {[1] = {time = 0.1, sound = "CW_LR300_MAGOUT"},
	[2] = {time = 1.75, sound = "CW_LR300_MAGIN"},
	[3] = {time = 2.45, sound = "CW_LR300_BOLTPULL"},
	[4] = {time = 2.95, sound = "CW_LR300_FOLEY"}}} ]]--

SWEP.SpeedDec = 30

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 TheRambotnic09"

SWEP.Author			= "TheRambotnic09"
SWEP.Contact		= ""
SWEP.Purpose		= "To kill bad guys. Duh!"
SWEP.Instructions	= "Press your primary PEW-PEW key to kill the bad guys."

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/therambotnic09/v_cw2_lr300.mdl"
SWEP.WorldModel		= "models/weapons/therambotnic09/w_cw2_lr300.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/therambotnic09/w_cw2_lr300.mdl"
SWEP.WMPos = Vector(-0.5, -0.5, 0)
SWEP.WMAng = Vector(0, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 150
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.06315
SWEP.FireSound = "CW_LR300_FIRE"
SWEP.FireSoundSuppressed = "CW_AR15_FIRE_SUPPRESSED"
SWEP.Recoil = 0.9

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 0.7

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.7
SWEP.ReloadTime_Empty = 2.7 --3.8
SWEP.ReloadHalt = 2.7
SWEP.ReloadHalt_Empty = 2.7 --3.8
SWEP.SnapToIdlePostReload = true