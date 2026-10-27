if not CustomizableWeaponry then return end

SWEP.magType = "smgMag"
SWEP.wpnSize = "small"
SWEP.wpnEmptyType = "smg"

SWEP.WpnName = loc('mw3_smg_mp5')

if CLIENT then

--Basic Information
SWEP.DrawCrosshair = false
SWEP.PrintName = SWEP.WpnName
SWEP.CSMuzzleFlashes = true
SWEP.MuzzleEffect = "muzzleflash_smg"
SWEP.MuzzleEffect_orig = SWEP.MuzzleEffect
SWEP.PosBasedMuz = false
SWEP.SnapToGrip = false

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Vector(0, 0, 0)

SWEP.CustomizePos = Vector(6.88, -2.073, 1.12)
SWEP.CustomizeAng = Vector(21.361, 35.674, 25.371)

SWEP.SafePos = Vector(0.259, 0, 0.3)
SWEP.SafeAng = Vector(-14.957, 17.073, -21.845)

SWEP.LaserPosAdjust = Vector(0, 0, 0)
SWEP.LaserAngAdjust = Angle(0, 0, 0)

--Movement Values
SWEP.WalkingMovePosX = 0 --Left/Right
SWEP.WalkingMovePosY = 0 --Front/Back (Default 1)
SWEP.WalkingMovePosZ = 0 --Up/Down

SWEP.WalkingMoveAngX = 2 --Pitch Up/Down
SWEP.WalkingMoveAngY = 2 --Angle Left/Right (Default 1)
SWEP.WalkingMoveAngZ = 0 --Rolling Left/Right

SWEP.SprintMovePosX = 0 --Left/Right
SWEP.SprintMovePosY = 0 --Front/Back (Default 1)
SWEP.SprintMovePosZ = 0 --Up/Down

SWEP.SprintMoveAngX = 0 --Pitch Up/Down
SWEP.SprintMoveAngY = 0 --Angle Left/Right (Default 5)
SWEP.SprintMoveAngZ = 0 --Rolling Left/Right

--Sight Positions

	SWEP.HoloPos = Vector(-2.9032, -1.6174, 0.3978)
	SWEP.HoloAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-2.8984, -2.1675, 1.0774)
	SWEP.IronsightAng = Vector(0, 0.091, 0)

	SWEP.ReflexPos = Vector(-2.9061, -3.7476, 0.7236)
	SWEP.ReflexAng = Vector(0, 0, 0)

	SWEP.ACOGPos = Vector(-2.9101, 2.1157, 0.5918)
	SWEP.ACOGAng = Vector(0, 0, 0)

	SWEP.HAMRPos = Vector(-2.9148, 0.9921, 0.6862)
	SWEP.HAMRAng = Vector(0, 0, 0)

	SWEP.AltHAMRPos = Vector(-2.9077, -3.8558, -0.4615)
	SWEP.AltHAMRAng = Vector(0.3697, 0, 0)
	
	SWEP.ThermalPos = SWEP.ReflexPos
	SWEP.ThermalAng = Vector(0, 0, 0)

--Select and kill icon (Temporary)
SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw2_mw3_mp5")
killicon.Add("cw2_mw3_mp5", "mw3_icons/hud/hud_mp5", Color(255, 255, 255, 0))

--Worldmodel Information
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/ma85_mw3/mp5/worldmodel.mdl"
SWEP.WMPos = Vector( -14, -0.5, 3.25)
SWEP.WMAng = Vector(-5, 88, 180)

-- LUA Recoil
SWEP.LuaViewmodelRecoil = false
SWEP.FullAimViewmodelRecoil = true
SWEP.DisableSprintViewSimulation = true
SWEP.LuaViewmodelRecoilOverride = true

SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 5, roll = 0, forward = -4, pitch = 1}

--Shell
SWEP.ShellScale = 0.4
SWEP.Shell = "smallshell"
SWEP.ShellOffsetMul = 1
SWEP.ShellPosOffset = {x = 0, y = 0, z = -1}

--Bolt movement
--SWEP.BoltBone = "j_bolt2"
SWEP.BoltShootOffset = Vector(-1.5, 0, 0)
SWEP.HoldBoltWhileEmpty = false
SWEP.DontHoldWhenReloading = true
SWEP.BoltBonePositionRecoverySpeed = 15

SWEP.ForegripOverride = true
SWEP.ForegripOverridePos = {
["null"] = {},

["customize"] = {
	["j_shoulder_le"] = { scale = Vector(1.1, 1.1, 1.1), pos = Vector(-0.038, 2.628, -6.242), angle = Angle(-35.389, 0, 0) },
} 
}

SWEP.AttachmentModelsVM = {
--Mods--
["mw3_att_silencer"] = { type = "Model", model = "models/ma85_mw3/atts/silencer.mdl", bone = "tag_silencer", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_silencer2"] = { type = "Model", model = "models/ma85_mw3/atts/silencer.mdl", bone = "tag_silencer", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

--Scopes--
["mw3_att_reflex"] = { type = "Model", model = "models/ma85_mw3/atts/reflex.mdl", bone = "tag_red_dot", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_holo"] = { type = "Model", model = "models/ma85_mw3/atts/holo.mdl", bone = "tag_eotech", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_acog"] = { type = "Model", model = "models/ma85_mw3/atts/acog.mdl", bone = "tag_acog_2", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_thermal"] = { type = "Model", model = "models/ma85_mw3/atts/thermal.mdl", bone = "tag_thermal_scope", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_hamr"] = { type = "Model", model = "models/ma85_mw3/atts/hamr.mdl", bone = "tag_hamr_hybrid", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
}

SWEP.AttachmentModelsWM = {
--Mods--
["mw3_att_silencer"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, -4.75, 0.35), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_silencer2"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, -4.75, 0.35), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

--Scopes--
["mw3_att_reflex"] = { model = "models/ma85_mw3/atts/reflex_world.mdl", bone ="Root", pos = Vector(0, 9, 2.05), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_holo"] = { model = "models/ma85_mw3/atts/holo_world.mdl", bone ="Root", pos = Vector(0, 9, 2.05), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_acog"] = { model = "models/ma85_mw3/atts/acog_world.mdl", bone ="Root", pos = Vector(0, 9, 2.05), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_thermal"] = { model = "models/ma85_mw3/atts/thermal_world.mdl", bone ="Root", pos = Vector(0, 9, 2.05), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_hamr"] = { model = "models/ma85_mw3/atts/hamr_world.mdl", bone ="Root", pos = Vector(0, 9, 2.05), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
}
end

SWEP.Animations = {
fire = "reg_fire",
ads_fire = "reg_ads_fire",
reload = "reg_reload",
reload_empty = "reg_reload_empty",
idle = "reg_idle",
draw = "reg_draw",
draw_first = "reg_draw_first",
holster = "reg_holster",
sprint_in = "reg_sprint_in",
sprint = "reg_sprint",
sprint_out = "reg_sprint_out",
hybrid_on = "hybrid_to_reg",
hybrid_off = "reg_to_hybrid",

aim_in = "reg_idle",
aim_out = "reg_idle",
customize_in = "reg_idle",
}

SWEP.Animations_Hybrid = SWEP.Animations

SWEP.Animations_Normal = SWEP.Animations

--Customization Information
SWEP.CustomizationMenuScale = 0.0115

SWEP.Attachments = {
["+attack"] = {header = loc('mw3_category_reticle'), offset = {0, -275}, atts = {
"mw3_reticle_target",
"mw3_reticle_delta",
"mw3_reticle_udot",
"mw3_reticle_mildot",
"mw3_reticle_omega",
"mw3_reticle_lambda",
}, dependencies = {
mw3_att_reflex = true,
mw3_att_acog = true,
mw3_att_holo = true,
}},

[1] = {header = loc('mw3_category_attachment'), offset = {0, -25}, atts = {
"mw3_att_reflex",
"mw3_att_silencer",
"mw3_att_rapid_fire",
"mw3_att_acog",
"mw3_att_holo",
"mw3_att_hamr",
"mw3_att_mags",
"mw3_att_thermal",
}},

[2] = {header = loc('mw3_category_proficiency'), offset = {0, 275}, atts = {
"mw3_prof_kick",
"mw3_prof_range",
"mw3_prof_atts",

--"mw3_prof_damage",
--"mw3_prof_impact",
--"mw3_prof_melee",
--"mw3_prof_speed",
}},

[3] = {header = loc('mw3_category_attachment') .. " (" .. loc('mw3_category_proficiency') .. ")", offset = {850, 275}, atts = {
"mw3_att_silencer2",
"mw3_att_rapid_fire2",
"mw3_att_mags2",
}, dependencies = {
mw3_prof_atts = true,
}},

["+attack2"] = {header = loc('mw3_category_camo'), offset = {0, 575}, atts = {
"mw3_camo_winter",
"mw3_camo_marine",
"mw3_camo_classic",
"mw3_camo_snow",
"mw3_camo_multi",
"mw3_camo_digital",
"mw3_camo_hex",
"mw3_camo_choco",
"mw3_camo_snake",
"mw3_camo_blue",
"mw3_camo_red",
"mw3_camo_autumn",
"mw3_camo_gold",
}},

}

include("cw2_mw3_all_shared.lua")

--Camo Material IDs
SWEP.CamoSurfaces = { 1 }


-- SWEP.DefaultCamo = {}
-- SWEP.DefaultCamo.name = "models/ma85_mw3/mp5/textures/detail_black_paint_c"
-- SWEP.DefaultCamo.scale = 1
-- SWEP.DefaultCamo.blendfactor = 1

SWEP.Skins = {
	-- NOTE they need to be in order of the materials
	{ 
	"models/ma85_mw3/mp5/mtl_weapon_mp5_new",
	"models/ma85_mw3/mp5/mtl_weapon_mp5_new_iron_sight",
	},
	
	marine = {
	"models/ma85_mw3/mp5/camo/marine",
	},	
	
	winter = {
	"models/ma85_mw3/mp5/camo/winter",
	},	

	classic = {
	"models/ma85_mw3/mp5/camo/classic",
	},	
	
	snow = {
	"models/ma85_mw3/mp5/camo/snow",
	},	
	
	multi = {
	"models/ma85_mw3/mp5/camo/multi",
	},	
	
	digital = {
	"models/ma85_mw3/mp5/camo/digital",
	},	
	
	hex = {
	"models/ma85_mw3/mp5/camo/hex",
	},	
	
	choco = {
	"models/ma85_mw3/mp5/camo/choco",
	},	
	
	snake = {
	"models/ma85_mw3/mp5/camo/snake",
	},	
	
	blue = {
	"models/ma85_mw3/mp5/camo/blue",
	},	
	
	red = {
	"models/ma85_mw3/mp5/camo/red",
	},	
	
	autumn = {
	"models/ma85_mw3/mp5/camo/autumn",
	},	
	
	gold = {
	"models/ma85_mw3/mp5/camo/gold",
	"models/ma85_mw3/mp5/camo/gold",
	},	

}

--Other information
SWEP.SpeedDec = 10 --Speed decrease on equip

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "mw3_wpn_base"
SWEP.Category = "CW2 MW3" .. " " .. loc('mw3_category_smg')

SWEP.ViewModelMovementScale = 1

SWEP.ZoomAmount = 10
SWEP.AimViewModelFOV = 60
SWEP.BobScale = 0
SWEP.ReticleInactivityPostFire = 0

SWEP.Author = "Moka_Akashiya85"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.Instructions = ""

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/ma85_mw3/mp5/viewmodel.mdl"
SWEP.WorldModel = "models/ma85_mw3/mp5/worldmodel.mdl"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 30
SWEP.Primary.ClipSize_Ext = 45
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 6
SWEP.Primary.Automatic = true
SWEP.Primary.Automatic_Orig = SWEP.Primary.Automatic

SWEP.Primary.Ammo = "SMG1"

SWEP.FireDelay = 60/895
SWEP.FireDelay_Orig = SWEP.FireDelay

SWEP.Recoil = 0.45
SWEP.RecoilDown = -0.05
SWEP.RecoilLeft = 0.25
SWEP.RecoilRight = 0.5
SWEP.Recoil_Orig = SWEP.Recoil

SWEP.RecoilToSpread = 2
SWEP.RecoilToSpread_Orig = SWEP.RecoilToSpread
SWEP.ShotgunReloadState = 0

SWEP.HipSpread = 0.015
SWEP.HipSpread_Orig = SWEP.HipSpread
SWEP.AimSpread = 0
SWEP.AimSpread_Orig = SWEP.AimSpread

SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.15
SWEP.SpreadPerShot = 0.075
SWEP.SpreadPerShot_Orig = SWEP.SpreadPerShot
SWEP.SpreadCooldown = 0
SWEP.FOVPerShot = 0 --How much the FOV is increased per shot
SWEP.FireAnimSpeed = 1 --Percentage speed of fire animation
SWEP.CanRestOnObjects = false
SWEP.ReloadViewBobEnabled = false
SWEP.ADSFireAnim = true
SWEP.FirstDeploy = true

SWEP.PenMod = 0.5
SWEP.PenMod_Orig = SWEP.PenMod

SWEP.SwayIntensity = 1
SWEP.AimSwayIntensity = .25

SWEP.ADSSpeed = 1
SWEP.ADSSpeed_Orig = SWEP.ADSSpeed

SWEP.ADSWalkSpeed = .9
SWEP.ADSWalkSpeed_Orig = SWEP.ADSWalkSpeed

SWEP.SprintSpeed = 1
SWEP.SprintSpeed_Orig = SWEP.SprintSpeed

--Damage
SWEP.Shots = 1
SWEP.Damage = 42
SWEP.Damage_Orig = SWEP.Damage
SWEP.PushForce = 2.5

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2 --Time when magazine is inserted/bullet is chambered
SWEP.ReloadTime_Empty = 2.7

SWEP.ReloadHalt = 2.53 --Time when reload is finished
SWEP.ReloadHalt_Empty = 3.03
SWEP.SnapToIdlePostReload = false

SWEP.Range = 750
SWEP.Range_Orig = SWEP.Range
SWEP.DamageDropOff = 0.525
SWEP.DamageDropOff_Orig = SWEP.DamageDropOff

SWEP.Chamberable = false
SWEP.SprintInSpeed = 1
SWEP.SprintLoopSpeed = 1
SWEP.SprintOutSpeed = 1

-- Bodygroups
SWEP.SightBGs = {main = 1, none = 1}
SWEP.MuzzleBGs = {main = 0, normal = 0, off = 0}
SWEP.GripBGs = {main = 0, normal = 0}
SWEP.HandBGs = {main = 0, normal = 1}

--Draw/Holster
SWEP.DrawSpeed = 1
SWEP.HolsterSpeed = 1

SWEP.FirstDeployTime = 1.2
SWEP.DeployTime = 0.5
SWEP.HolsterTime = 0.4

--Sounds
CustomizableWeaponry:addFireSound("MW3_mp5_FIRE", {
"ma85_mw3/weapons/mp5/fire.wav",
}, 0.4, 90, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addReloadSound("mw3_mp5_FIRST_DRAW", "ma85_mw3/weapons/mp5/hit.wav")

CustomizableWeaponry:addReloadSound("mw3_mp5_RELOAD_1", "ma85_mw3/weapons/mp5/lift.wav")
CustomizableWeaponry:addReloadSound("mw3_mp5_RELOAD_2", "ma85_mw3/weapons/mp5/magout.wav")
CustomizableWeaponry:addReloadSound("mw3_mp5_RELOAD_3", "ma85_mw3/weapons/mp5/magin.wav")
CustomizableWeaponry:addReloadSound("mw3_mp5_RELOAD_4", "ma85_mw3/weapons/mp5/bolt.wav")

SWEP.LoopFireSound = false
SWEP.FireSound = "MW3_mp5_FIRE"
SWEP.FireMechanicSound = "MW3_MECH_D"
SWEP.FireSoundSuppressed = "MW3_SIL_SMG"

SWEP.Sounds = {
reg_draw = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

reg_draw_first = {
[1] = {time = 0, sound = "MW3_mp5_RELOAD_1"},
[2] = {time = 0.45, sound = "MW3_mp5_FIRST_DRAW"},
},

reg_reload = {
[1] = {time = 0, sound = "MW3_mp5_RELOAD_1"},
[2] = {time = 0.4, sound = "MW3_mp5_RELOAD_2"},
[3] = {time = 1.65, sound = "MW3_mp5_RELOAD_3"},
},

reg_reload_empty = {
[1] = {time = 0, sound = "MW3_mp5_RELOAD_1"},
[2] = {time = 0.4, sound = "MW3_mp5_RELOAD_2"},
[3] = {time = 1.65, sound = "MW3_mp5_RELOAD_3"},
[4] = {time = 2.25, sound = "MW3_mp5_RELOAD_4"},
},

reg_to_hybrid = {
[1] = {time = 0, sound = "MW3_HAMR_LIFT"},
[2] = {time = 0.4, sound = "MW3_HAMR_ON"},
},

hybrid_to_reg = {
[1] = {time = 0, sound = "MW3_HAMR_LIFT"},
[2] = {time = 0.4, sound = "MW3_HAMR_OFF"},
},

}


if CLIENT then

	local function hybrid_lighton()

if CLIENT then
			wep.AttachmentModelsVM["mw3_att_hamr"].ent:SetBodygroup(0, 1)
		end
	end
	
	local function hybrid_lightoff()

if CLIENT then
			wep.AttachmentModelsVM["mw3_att_hamr"].ent:SetBodygroup(0, 0)
		end
	end
	
	SWEP.Sounds.reg_to_hybrid[2].callback = hybrid_lighton
	SWEP.Sounds.hybrid_to_reg[2].callback = hybrid_lightoff
end

function SWEP:IndividualThink()

local attachment = self.ActiveAttachments


if CLIENT then

	if self.dt.State == CW_CUSTOMIZE then
		self.ForegripParent = "customize"
	else
		self.ForegripParent = "null"
	end

end

end