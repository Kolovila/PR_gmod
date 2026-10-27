AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")
// SCK Name: bob
// Cover: bobimag
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Boberg XR9"
	SWEP.CSMuzzleFlashes = true

	SWEP.IconLetter = "i"
	killicon.Add("cw_boberg", "vgui/kills/cw_boberg", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_boberg")
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = {x = 0, y = 0, z = 0}
	SWEP.NoShells = false
	SWEP.ShellScale = 0.35
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = -1, z = 0}
	
	//Hk pack attachments
	SWEP.CoD4ReflexPos = Vector(2.69, 0, 0)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)

	SWEP.CoD4TascoPos = Vector(2.71, 0, 0.409)
	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.FAS2AimpointPos = Vector(2.705, 0, 0.21)
	SWEP.FAS2AimpointAng = Vector(0, 0, 0)

	SWEP.LeupoldPos = Vector(3.319, 0, 0.119)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	SWEP.LeupoldAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.HoloPos = Vector(2.68, 0, -0.281)
	SWEP.HoloAng = Vector(0, 0, 0)
	
	SWEP.EoTech552Pos = Vector(2.655, 0, -0.22)
	SWEP.EoTech552Ang = Vector(0, 0, 0)

	SWEP.EoTech553Pos = Vector(2.71, 0, 0.059)
	SWEP.EoTech553Ang = Vector(0, 0, 0)
	
	//White Snow attachments
	SWEP.WS_DocterPos = Vector(2.73, 0, 0.5)
	SWEP.WS_DocterAng = Vector(0, 0, 0)
	
	SWEP.WS_CMOREPos = Vector(2.72, 0, -0.051)
	SWEP.WS_CMOREAng = Vector(0, 0, 0)
	
	SWEP.WS_BarskaPos = Vector(2.72, 0, -0.01)
	SWEP.WS_BarskaAng = Vector(0, 0, 0)
	
	SWEP.WS_EoTech557Pos = Vector(2.69, 0, -0.13)
	SWEP.WS_EoTech557Ang = Vector(0, 0, 0)
	
	//aTTACHMENTS THAT COME WITH THE PACK
	SWEP.AimpointPos = Vector(2.71, 0, -0.04)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(2.68, 0, -0.01)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(2.71, 0, -0.04)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(-0.721, -4.222, -2.481)
	SWEP.SprintAng = Vector(36.583, 0, 0)

	SWEP.CustomizePos = Vector(-3.401, -3.82, -0.95)
	SWEP.CustomizeAng = Vector(19.697, -33.77, -7.035)

	SWEP.IronsightPos = Vector(2.72, 0, 1.6)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(0.256, 0.01, 1.2)
	SWEP.SprintAng = Vector(-17.778, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.281, 1.325, -0.52)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.SightWithRail = true
	
	SWEP.ViewModelMovementScale = 0.5
	SWEP.FullAimViewmodelRecoil = true
	
	SWEP.BoltBone = "Slide"
	SWEP.BoltShootOffset = Vector(0, 1.5, 0)
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 3, forward = 1, pitch = 4}
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.AttachmentModelsVM = {
		["md_fas2_holo"] = { type = "Model", model = "models/v_holo_sight_kkrc.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0, 6, -0.101), angle = Angle(0, 90, 0), size = Vector(0.899, 0.899, 0.899), adjustment = {min = 5, max = 7.3, axis = "y", inverse = true}},
		["md_fas2_holo_aim"] = { type = "Model", model = "models/v_holo_sight_orig_hx.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0, 6, -0.101), angle = Angle(0, 90, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_fas2_aimpoint"] = { type = "Model", model = "models/c_fas2_aimpoint_rigged.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0, -0.201, 4), angle = Angle(0, 90, 0), size = Vector(1.2, 1.2, 1.2), adjustment = {min = -2, max = 0.4, axis = "y", inverse = true}},
		["md_cod4_aimpoint_v2"] = { type = "Model", model = "models/v_cod4_aimpoint.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0, 7.699, 1.557), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0.25, 9.3, -0.71), angle = Angle(0, -180, 0), size = Vector(1, 1, 1), adjustment = {min = 8.3, max = 9.8, axis = "y", inverse = true}},
		["md_fas2_eotech"] = { type = "Model", model = "models/c_fas2_eotech.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0, 0, 4.4), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), size = Vector(1, 1, 1), adjustment = {min = -1, max = 0.45, axis = "y", inverse = true}},
		["md_fas2_eotech_stencil"] = { type = "Model", model = "models/c_fas2_eotech_stencil.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0, 0, 4.4), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_ws_eotech557"] = { type = "Model", model = "models/attachments/ws_eotech557.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(1, 11.7, -1.17), angle = Angle(0, 90, 0), size = Vector(1.1, 1.1, 1.1)},
		["md_cod4_eotech_v2"] = { type = "Model", model = "models/v_cod4_eotech.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(-0.02, 7.55, 1.557), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(-0.301, 14.026, -5.85), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), adjustment = {min = 12.7, max = 15, axis = "y", inverse = true}},
		["md_cod4_reflex"] = { type = "Model", model = "models/v_cod4_reflex.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0.009, 7.5, 1.57), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), adjustment = {min = 6.7, max = 8.03, axis = "y", inverse = true}},
		["md_ws_barska"] = { type = "Model", model = "models/attachments/White_Snow/ws_barska.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0.029, 3, 5), angle = Angle(0, -180, 0), size = Vector(0.219, 0.219, 0.219), adjustment = {min = 1.5, max = 3.5, axis = "y", inverse = true}},
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0, 3, 5.099), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), adjustment = {min = 1.5, max = 4.03, axis = "y", inverse = true}},
		["md_ws_c_more"] = { type = "Model", model = "models/attachments/White_Snow/ws_c_more.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0.1, 2.7, 5), angle = Angle(0, -180, 0), size = Vector(0.3, 0.3, 0.3)},
		["md_ws_docter"] = { type = "Model", model = "models/attachments/White_Snow/ws_docterdick.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(-0.101, 3.635, 5.139), angle = Angle(0, -180, 0), size = Vector(1, 1, 1), adjustment = {min = 1.5, max = 4.03, axis = "y", inverse = true}},
		["md_ws_swr_silencer"] = { type = "Model", model = "models/attachments/White_Snow/ws_swr.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0.029, -4.676, 3.9), angle = Angle(180, 180, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_ws_scifi_silencer"] = { type = "Model", model = "models/attachments/White_Snow/ws_scifi_silencer.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(-2.701, -68.651, -1.9), angle = Angle(0, 0, 0), size = Vector(1, 1.988, 1)},
		["md_ws_pistollaser"] = { type = "Model", model = "models/attachments/white_snow/ws_pistollaser.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0.699, 3.849, 1.299), angle = Angle(0, 90, 0), size = Vector(0.4, 1, 0.5)},
		["md_rail"] = { type = "Model", model = "models/weapons/CW2 Rails/v_railwspistol.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(2.039, 13.85, 6.099), angle = Angle(0, 90, 0), size = Vector(1, 1, 1.1)}
	}
	
	SWEP.CompM4SBoneMod = {}
	
	function SWEP:RenderTargetFunc()
	local fagal = self.AttachmentModelsVM.md_ws_c_more.ent
	fagal:SetSkin(1)
	local fagal13 = self.AttachmentModelsVM.md_ws_barska.ent
	fagal13:SetSkin(0)

		if self.ActiveAttachments.skin_bobergscifi then
			fagal:SetSkin(0)
			fagal13:SetSkin(1)
		end
		
	end
	
	SWEP.WS_PistolLaserPosAdjust = Vector(0, 0, 0)
	SWEP.WS_PistolLaserAngAdjust = Angle(0, 0, 0) 
end

SWEP.BarrelBGs = {main = 1, regular = 1, long = 2, short = 0}
SWEP.LuaViewmodelRecoil = false
SWEP.CanRestOnObjects = false

if CustomizableWeaponry_KK_HK416 and CustomizableWeaponry_WS_Pack then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {-450, -400},  atts = {"md_ws_docter", "md_microt1", "md_ws_c_more", "md_cod4_reflex", "md_ws_barska", "md_eotech", "md_ws_eotech557", "md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_fas2_holo"}},
		[2] = {header = "Muzzle", offset = {-450, 0}, atts = {"md_ws_swr_silencer", "md_ws_scifi_silencer"}},
		[3] = {header = "Frame", offset = {-450, 400}, atts = {"md_ws_pistollaser"}},
		["+reload"] = {header = "Ammo", offset = {600, 400}, atts = {"am_magnum","am_matchgrade"}},
		["impulse 100"] = {header = "Skin", offset = {600, 0}, atts = {"skin_bobergblack", "skin_bobergscifi"}}
	}
elseif CustomizableWeaponry_KK_HK416 then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {-450, -400},  atts = {"md_microt1", "md_cod4_reflex", "md_eotech", "md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_fas2_holo"}},
		["+reload"] = {header = "Ammo", offset = {-450, 400}, atts = {"am_magnum", "am_matchgrade"}},
		["impulse 100"] = {header = "Skin", offset = {600, 0}, atts = {"skin_bobergblack", "skin_bobergscifi"}}
	}
elseif CustomizableWeaponry_WS_Pack then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {-450, -400},  atts = {"md_ws_docter", "md_microt1", "md_ws_c_more", "md_ws_barska", "md_eotech", "md_ws_eotech557", "md_aimpoint"}},
		[2] = {header = "Muzzle", offset = {-450, 0}, atts = {"md_ws_swr_silencer", "md_ws_scifi_silencer"}},
		[3] = {header = "Frame", offset = {-450, 400}, atts = {"md_ws_pistollaser"}},
		["+reload"] = {header = "Ammo", offset = {600, 400}, atts = {"am_magnum", "am_matchgrade"}},
		["+attack2"] = {header = "Perks", offset = {800, 100}, atts = {"pk_sleightofhand", "pk_light"}},
		["impulse 100"] = {header = "Skin", offset = {600, 0}, atts = {"skin_bobergblack", "skin_bobergscifi"}}
	}
else
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {-450, -400},  atts = {"md_microt1", "md_eotech", "md_aimpoint"}},
		["+reload"] = {header = "Ammo", offset = {-450, 150}, atts = {"am_magnum", "am_matchgrade"}},
		["impulse 100"] = {header = "Skin", offset = {600, 0}, atts = {"skin_bobergblack", "skin_bobergscifi"}}
	}
end

SWEP.Animations = {fire = {"shoot2"},
	reload = "reload",
	//idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {
draw = {{time = 0, sound = "CW_BOBERG_SLIDEBACK"}},

	reload = {
	[1] = {time = 0.2, sound = "CW_BOBERG_CLIPOUT"},
	[2] = {time = 1.05, sound = "CW_BOBERG_CLIPIN1"},
	[3] = {time = 1.3, sound = "CW_BOBERG_CLIPIN2"},
	[4] = {time = 1.75, sound = "CW_BOBERG_SLIDEFORWORD"}}
	}

SWEP.SpeedDec = 5

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "White Snow"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 85
SWEP.AimViewModelFOV = 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/bobs_burgers/v_pist_boberg.mdl"
SWEP.WorldModel		= "models/weapons/bobs_burgers/w_pist_boberg.mdl"

SWEP.ADSFireAnim = false
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/bobs_burgers/w_pist_boberg.mdl"
SWEP.WMPos = Vector(-0.5, -1, -1.1)
SWEP.WMAng = Vector(0,0,180)
SWEP.CustomizationMenuScale = 0.01
SWEP.magType = "pistolMag"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 7
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.1
SWEP.FireSound = "CW_BOBERG_FIRE"
SWEP.FireSoundSuppressed = "CW_BOBERG_FIRE_SUPPRESSED"
SWEP.Recoil = 0.9

SWEP.HipSpread = 0.050
SWEP.AimSpread = 0.015
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.25
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1.5
SWEP.ReloadTime = 1
SWEP.ReloadHalt = 2

SWEP.ReloadTime_Empty = 1
SWEP.ReloadHalt_Empty = 2