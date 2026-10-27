if not CustomizableWeaponry then return end

SWEP.magType = "arMag"
SWEP.wpnSize = "medium"
SWEP.wpnEmptyType = "rifle"
SWEP.isM320 = "yes"

SWEP.WpnName = loc('mw3_ar_m16')

if CLIENT then

--Basic Information
SWEP.DrawCrosshair = false
SWEP.PrintName = SWEP.WpnName
SWEP.CSMuzzleFlashes = true
SWEP.MuzzleEffect = "muzzleflash_ak74"
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

	SWEP.IronsightPos = Vector(-2.5976, -2.0385, 0.109)
	SWEP.IronsightAng = Vector(-0.8493, 0, 0)

	SWEP.ReflexPos = Vector(-2.5976, -2.8731, 0.1975)
	SWEP.ReflexAng = Vector(0, 0, 0)

	SWEP.HoloPos = Vector(-2.5976, -1.6174, -0.2546)
	SWEP.HoloAng = Vector(0, 0, 0)

	SWEP.ACOGPos = Vector(-2.5976, 2.1157, 0.0602)
	SWEP.ACOGAng = Vector(0, 0, 0)

	SWEP.HybridPos = Vector(-2.5976, -2.0385, -0.0705)
	SWEP.HybridAng = Vector(0, 0, 0)

	SWEP.ThermalPos = SWEP.ReflexPos
	SWEP.ThermalAng = Vector(0, 0, 0)

--Select and kill icon (Temporary)
SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw2_mw3_m16")
killicon.Add("cw2_mw3_m16", "mw3_icons/hud/hud_m16a4", Color(255, 255, 255, 0))

--Worldmodel Information
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/ma85_mw3/m16/worldmodel.mdl"
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
--SWEP.Shell = "smallshell"
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
["mw3_att_hbs"] = { type = "Model", model = "models/ma85_mw3/atts/hbs.mdl", bone = "tag_heartbeat", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

--Scopes--
["mw3_att_reflex"] = { type = "Model", model = "models/ma85_mw3/atts/reflex.mdl", bone = "tag_red_dot", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_holo"] = { type = "Model", model = "models/ma85_mw3/atts/holo.mdl", bone = "tag_eotech", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_acog"] = { type = "Model", model = "models/ma85_mw3/atts/acog.mdl", bone = "tag_acog_2", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_thermal"] = { type = "Model", model = "models/ma85_mw3/atts/thermal.mdl", bone = "tag_thermal_scope", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_hybrid"] = { type = "Model", model = "models/ma85_mw3/atts/hybrid.mdl", bone = "tag_magnifier", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

--Proficiencies--
["mw3_att_silencer2"] = { type = "Model", model = "models/ma85_mw3/atts/silencer.mdl", bone = "tag_silencer", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_hbs2"] = { type = "Model", model = "models/ma85_mw3/atts/hbs.mdl", bone = "tag_heartbeat", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
}

SWEP.AttachmentModelsWM = {
--Mods--
["mw3_att_silencer"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, -15.8, 0.05), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_gl_m203"] = { model = "models/ma85_mw3/atts/m203_world.mdl", bone ="Root", pos = Vector(0, -1.5, -2), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_shotgun"] = { model = "models/ma85_mw3/atts/shotgun_world.mdl", bone ="Root", pos = Vector(0, -0, -3), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_hbs"] = { model = "models/ma85_mw3/atts/hbs_world.mdl", bone ="Root", pos = Vector(-.5, 7, 0.3), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

--Scopes--
["mw3_att_reflex"] = { model = "models/ma85_mw3/atts/reflex_world.mdl", bone ="Root", pos = Vector(0, 8, 1.4), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_holo"] = { model = "models/ma85_mw3/atts/holo_world.mdl", bone ="Root", pos = Vector(0, 8, 1.4), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_acog"] = { model = "models/ma85_mw3/atts/acog_world.mdl", bone ="Root", pos = Vector(0, 8, 1.4), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_thermal"] = { model = "models/ma85_mw3/atts/thermal_world.mdl", bone ="Root", pos = Vector(0, 8, 1.4), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_hybrid"] = { model = "models/ma85_mw3/atts/hybrid_world.mdl", bone ="Root", pos = Vector(0, 8, 1.4), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

--Proficiencies--
["mw3_att_silencer2"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, -15.8, 0.05), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_gl_m2032"] = { model = "models/ma85_mw3/atts/m203_world.mdl", bone ="Root", pos = Vector(0, -1.5, -2), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_shotgun2"] = { model = "models/ma85_mw3/atts/shotgun_world.mdl", bone ="Root", pos = Vector(0, -0, -3), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_hbs2"] = { model = "models/ma85_mw3/atts/hbs_world.mdl", bone ="Root", pos = Vector(-.5, 7, 0.3), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

}
end

SWEP.Animations = {
fire = "reg_fire",
ads_fire = "reg_ads_fire",
reload = "reg_reload",
reload_empty = "reg_reload_empty",
reload_empty_hb = "reg_reload_empty_hb",
idle = "reg_idle",
draw = "reg_draw",
draw_first = "reg_draw_first",
holster = "reg_holster",
sprint_in = "reg_sprint_in",
sprint = "reg_sprint",
sprint_out = "reg_sprint_out",
hybrid_on = "hybrid_to_reg",
hybrid_on_hb = "hybrid_to_reg_hb",
hybrid_off = "reg_to_hybrid",
hybrid_off_hb = "reg_to_hybrid_hb",

aim_in = "reg_idle",
aim_out = "reg_idle",
customize_in = "reg_idle",
}

SWEP.Animations_Hybrid = {
fire = "hybrid_fire",
ads_fire = "hybrid_ads_fire",
reload = "hybrid_reload",
reload_empty = "hybrid_reload_empty",
reload_empty_hb = "hybrid_reload_empty_hb",
idle = "hybrid_idle",
draw = "hybrid_draw",
draw_first = "hybrid_draw_first",
holster = "hybrid_holster",
sprint_in = "hybrid_sprint_in",
sprint = "hybrid_sprint",
sprint_out = "hybrid_sprint_out",
hybrid_on = "hybrid_to_reg",
hybrid_on_hb = "hybrid_to_reg_hb",
hybrid_off = "reg_to_hybrid",
hybrid_off_hb = "reg_to_hybrid_hb",

aim_in = "hybrid_idle",
aim_out = "hybrid_idle",
customize_in = "hybrid_idle",
}

SWEP.Animations_GL = {
fire = "gl_fire",
ads_fire = "gl_ads_fire",
reload = "gl_reload",
reload_empty = "gl_reload_empty",
idle = "gl_idle",
draw = "gl_draw",
draw_first = "gl_draw_first",
holster = "gl_holster",
sprint_in = "gl_sprint_in",
sprint = "gl_sprint",
sprint_out = "gl_sprint_out",
toggle = "gl_grenade_2_grenade",

aim_in = "gl_idle",
aim_out = "gl_idle",
customize_in = "gl_idle",

alt_fire = "gl_grenade_fire",
alt_reload = "gl_grenade_reload",
alt_idle = "gl_grenade_idle",
alt_draw = "gl_grenade_draw",
alt_holster = "gl_grenade_holster",
alt_sprint_in = "gl_grenade_sprint_in",
alt_sprint = "gl_grenade_sprint",
alt_sprint_out = "gl_grenade_sprint_out",
alt_toggle = "gl_grenade_2_bullet",
}

SWEP.Animations_SHG = {
fire = "shotgun_fire",
ads_fire = "shotgun_ads_fire",
reload = "shotgun_reload",
reload_empty = "shotgun_reload_empty",
idle = "shotgun_idle",
draw = "shotgun_draw",
draw_first = "shotgun_draw_first",
holster = "shotgun_holster",
sprint_in = "shotgun_sprint_in",
sprint = "shotgun_sprint",
sprint_out = "shotgun_sprint_out",
toggle = "shotgun_shotty_2_shotty",

aim_in = "shotgun_idle",
aim_out = "shotgun_idle",
customize_in = "shotgun_idle",

alt_fire = "shotgun_shotty_fire",
alt_rechamber = "shotgun_shotty_rechamber",
alt_reload_start = "shotgun_shotty_reload_in",
alt_reload_loop = "shotgun_shotty_reload_loop",
alt_reload_end = "shotgun_shotty_reload_out",
alt_idle = "shotgun_shotty_idle",
alt_draw = "shotgun_shotty_draw",
alt_holster = "shotgun_shotty_holster",
alt_sprint_in = "shotgun_shotty_sprint_in",
alt_sprint = "shotgun_shotty_sprint",
alt_sprint_out = "shotgun_shotty_sprint_out",
alt_toggle = "shotgun_shotty_2_bullet",
}

SWEP.Animations_Normal = SWEP.Animations

--Customization Information
SWEP.CustomizationMenuScale = 0.015

SWEP.Attachments = {
["+attack"] = {header = loc('mw3_category_reticle'), offset = {0, -150}, atts = {
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

[1] = {header = loc('mw3_category_attachment'), offset = {0, 100}, atts = {
"mw3_att_reflex",
"mw3_att_silencer",
"mw3_att_gl_m203",
"mw3_att_acog",
"mw3_att_rapid_fire",
"mw3_att_hbs",
"mw3_att_holo",
"mw3_att_shotgun",
"mw3_att_hybrid",
"mw3_att_mags",
"mw3_att_thermal",
}},

[2] = {header = loc('mw3_category_proficiency'), offset = {0, 400}, atts = {
"mw3_prof_kick",
"mw3_prof_impact",
"mw3_prof_atts",

--"mw3_prof_melee",
--"mw3_prof_speed",
--"mw3_prof_damage",
}},

[3] = {header = loc('mw3_category_attachment') .. " (" .. loc('mw3_category_proficiency') .. ")", offset = {850, 400}, atts = {
"mw3_att_silencer2",
"mw3_att_gl_m2032",
"mw3_att_rapid_fire2",
"mw3_att_hbs2",
"mw3_att_shotgun2",
"mw3_att_mags2",
}, dependencies = {
mw3_prof_atts = true,
}},

["+attack2"] = {header = loc('mw3_category_camo'), offset = {0, 700}, atts = {
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
-- SWEP.DefaultCamo.name = "models/ma85_mw3/m16/textures/detail_black_paint_c"
-- SWEP.DefaultCamo.scale = 1
-- SWEP.DefaultCamo.blendfactor = 1

SWEP.Skins = {
	-- NOTE they need to be in order of the materials
	{ 
	"models/ma85_mw3/m16/mtl_weapon_m16_iw5",
	"models/ma85_mw3/m16/mtl_weapon_m16_iron_sight_iw5",
	},
	
	marine = {
	"models/ma85_mw3/m16/camo/marine",
	},	
	
	winter = {
	"models/ma85_mw3/m16/camo/winter",
	},	

	classic = {
	"models/ma85_mw3/m16/camo/classic",
	},	
	
	snow = {
	"models/ma85_mw3/m16/camo/snow",
	},	
	
	multi = {
	"models/ma85_mw3/m16/camo/multi",
	},	
	
	digital = {
	"models/ma85_mw3/m16/camo/digital",
	},	
	
	hex = {
	"models/ma85_mw3/m16/camo/hex",
	},	
	
	choco = {
	"models/ma85_mw3/m16/camo/choco",
	},	
	
	snake = {
	"models/ma85_mw3/m16/camo/snake",
	},	
	
	blue = {
	"models/ma85_mw3/m16/camo/blue",
	},	
	
	red = {
	"models/ma85_mw3/m16/camo/red",
	},	
	
	autumn = {
	"models/ma85_mw3/m16/camo/autumn",
	},	
	
	gold = {
	"models/ma85_mw3/m16/camo/gold",
	"models/ma85_mw3/m16/camo/gold",
	},	

}

--Other information
SWEP.SpeedDec = 10 --Speed decrease on equip

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"3burst"}
SWEP.Base = "mw3_wpn_base"
SWEP.Category = "CW2 MW3" .. " " .. loc('mw3_category_ar')

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
SWEP.ViewModel = "models/ma85_mw3/m16/viewmodel.mdl"
SWEP.WorldModel = "models/ma85_mw3/m16/worldmodel.mdl"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 30
SWEP.Primary.ClipSize_Ext = 45
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 6
SWEP.Primary.Automatic = true
SWEP.Primary.Automatic_Orig = SWEP.Primary.Automatic

SWEP.Primary.Ammo = "AR2"

SWEP.FireDelay = 60/909
SWEP.FireDelay_Orig = SWEP.FireDelay

SWEP.Recoil = 0.2
SWEP.RecoilDown = -0.2
SWEP.RecoilLeft = 0.5
SWEP.RecoilRight = 0.5
SWEP.Recoil_Orig = SWEP.Recoil

SWEP.RecoilToSpread = 1.5
SWEP.RecoilToSpread_Orig = SWEP.RecoilToSpread
SWEP.ShotgunReloadState = 0

SWEP.HipSpread = 0.02
SWEP.HipSpread_Orig = SWEP.HipSpread
SWEP.AimSpread = 0
SWEP.AimSpread_Orig = SWEP.AimSpread
SWEP.BurstCooldownMul = 2.5

SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.2
SWEP.SpreadPerShot = 0.2
SWEP.SpreadPerShot_Orig = SWEP.SpreadPerShot
SWEP.SpreadCooldown = 0
SWEP.FOVPerShot = 0 --How much the FOV is increased per shot
SWEP.FireAnimSpeed = 1 --Percentage speed of fire animation
SWEP.CanRestOnObjects = false
SWEP.ReloadViewBobEnabled = false
SWEP.ADSFireAnim = true
SWEP.FirstDeploy = true

SWEP.PenMod = 1
SWEP.PenMod_Orig = SWEP.PenMod

SWEP.SwayIntensity = 1
SWEP.AimSwayIntensity = .25

SWEP.ADSSpeed = 1
SWEP.ADSSpeed_Orig = SWEP.ADSSpeed

SWEP.ADSWalkSpeed = .75
SWEP.ADSWalkSpeed_Orig = SWEP.ADSWalkSpeed

SWEP.SprintSpeed = .8
SWEP.SprintSpeed_Orig = SWEP.SprintSpeed

--Damage
SWEP.Shots = 1
SWEP.Damage = 50
SWEP.Damage_Orig = SWEP.Damage
SWEP.PushForce = 5

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.5 --Time when magazine is inserted/bullet is chambered
SWEP.ReloadTime_Empty = 2

SWEP.ReloadHalt = 2.03 --Time when reload is finished
SWEP.ReloadHalt_Empty = 2.36
SWEP.SnapToIdlePostReload = false

SWEP.Range = 750
SWEP.Range_Orig = SWEP.Range
SWEP.DamageDropOff = 0.5
SWEP.DamageDropOff_Orig = SWEP.DamageDropOff

SWEP.Chamberable = false
SWEP.SprintInSpeed = 1
SWEP.SprintLoopSpeed = 1
SWEP.SprintOutSpeed = 1

-- Bodygroups
SWEP.SightBGs = {main = 1, none = 1}
SWEP.ScopeBGs = {main = 2, none = 0, hybrid = 1}
SWEP.MuzzleBGs = {main = 0, normal = 0, off = 0}
SWEP.GripBGs = {main = 3, gl = 1, shg = 2, normal = 0}
SWEP.HandBGs = {main = 0, normal = 1}

--Draw/Holster
SWEP.DrawSpeed = 1
SWEP.HolsterSpeed = 1

SWEP.FirstDeployTime = 1.2
SWEP.DeployTime = 0.5
SWEP.HolsterTime = 0.4

--Sounds
CustomizableWeaponry:addFireSound("MW3_m16_FIRE", {
"ma85_mw3/weapons/m16/fire.wav",
}, 0.4, 100, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addReloadSound("mw3_m16_FIRST_DRAW", "ma85_mw3/weapons/ak47/bolt.wav")

CustomizableWeaponry:addReloadSound("mw3_m16_RELOAD_1", "ma85_mw3/weapons/m4a1/lift.wav")
CustomizableWeaponry:addReloadSound("mw3_m16_RELOAD_2", "ma85_mw3/weapons/m4a1/magout.wav")
CustomizableWeaponry:addReloadSound("mw3_m16_RELOAD_3", "ma85_mw3/weapons/m4a1/magin.wav")
CustomizableWeaponry:addReloadSound("mw3_m16_RELOAD_4", "ma85_mw3/weapons/m4a1/bolt.wav")

SWEP.LoopFireSound = false
SWEP.FireSound = "MW3_m16_FIRE"
SWEP.FireMechanicSound = "MW3_MECH_D"
SWEP.FireSoundSuppressed = "MW3_SIL_RIFLE"

SWEP.Sounds = {
reg_draw = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

reg_draw_first = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.25, sound = "MW3_m16_FIRST_DRAW"},
},

reg_reload = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_m16_RELOAD_2"},
[3] = {time = 1.2, sound = "MW3_m16_RELOAD_3"},
},

reg_reload_empty = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_m16_RELOAD_2"},
[3] = {time = 1.2, sound = "MW3_m16_RELOAD_3"},
[4] = {time = 1.7, sound = "MW3_m16_RELOAD_4"},
},

reg_reload_empty_hb = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_m16_RELOAD_2"},
[3] = {time = 1.2, sound = "MW3_m16_RELOAD_3"},
[4] = {time = 1.7, sound = "MW3_m16_RELOAD_4"},
},

hybrid_draw = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

hybrid_draw_first = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.25, sound = "MW3_m16_FIRST_DRAW"},
},

hybrid_reload = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_m16_RELOAD_2"},
[3] = {time = 1.2, sound = "MW3_m16_RELOAD_3"},
},

hybrid_reload_empty = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_m16_RELOAD_2"},
[3] = {time = 1.2, sound = "MW3_m16_RELOAD_3"},
[4] = {time = 1.7, sound = "MW3_m16_RELOAD_4"},
},

hybrid_reload_empty_hb = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_m16_RELOAD_2"},
[3] = {time = 1.2, sound = "MW3_m16_RELOAD_3"},
[4] = {time = 1.7, sound = "MW3_m16_RELOAD_4"},
},

reg_to_hybrid = {
[1] = {time = 0, sound = "MW3_HYBRID_LIFT"},
[2] = {time = 0.3, sound = "MW3_HYBRID_DOWN"},
},

reg_to_hybrid_hb = {
[1] = {time = 0, sound = "MW3_HYBRID_LIFT"},
[2] = {time = 0.3, sound = "MW3_HYBRID_DOWN"},
},

hybrid_to_reg = {
[1] = {time = 0, sound = "MW3_HYBRID_LIFT"},
[2] = {time = 0.6, sound = "MW3_HYBRID_UP"},
},

hybrid_to_reg_hb = {
[1] = {time = 0, sound = "MW3_HYBRID_LIFT"},
[2] = {time = 0.6, sound = "MW3_HYBRID_UP"},
},

gl_draw = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

gl_draw_first = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.25, sound = "MW3_m16_FIRST_DRAW"},
},

gl_reload = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_m16_RELOAD_2"},
[3] = {time = 1.2, sound = "MW3_m16_RELOAD_3"},
},

gl_reload_empty = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_m16_RELOAD_2"},
[3] = {time = 1.2, sound = "MW3_m16_RELOAD_3"},
[4] = {time = 1.7, sound = "MW3_m16_RELOAD_4"},
},

gl_grenade_draw = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

gl_grenade_2_grenade = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

gl_grenade_2_bullet = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

gl_grenade_reload = {
[1] = {time = 0.35, sound = "MW3_M203_OPEN"},
[2] = {time = 1.25, sound = "MW3_M203_LOAD"},
[3] = {time = 1.9, sound = "MW3_M203_CLOSE"},
},

shotgun_draw = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

shotgun_draw_first = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.25, sound = "MW3_m16_FIRST_DRAW"},
},

shotgun_reload = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_m16_RELOAD_2"},
[3] = {time = 1.2, sound = "MW3_m16_RELOAD_3"},
},

shotgun_reload_empty = {
[1] = {time = 0, sound = "MW3_m16_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_m16_RELOAD_2"},
[3] = {time = 1.2, sound = "MW3_m16_RELOAD_3"},
[4] = {time = 1.7, sound = "MW3_m16_RELOAD_4"},
},

shotgun_shotty_draw = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

shotgun_shotty_2_shotty = {
[1] = {time = 0, sound = "MW3_SHOTGUN_LIFT"},
[2] = {time = 0.45, sound = "MW3_SHOTGUN_PUMP"},
},

shotgun_shotty_2_bullet = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

shotgun_shotty_rechamber = {
[1] = {time = 0, sound = "MW3_SHOTGUN_PUMP"},
},

shotgun_shotty_reload_in = {
[1] = {time = 0, sound = "MW3_SHOTGUN_LIFT"},
[2] = {time = 0.8, sound = "MW3_SHOTGUN_SHELL"},
},

shotgun_shotty_reload_loop = {
[1] = {time = 0.7, sound = "MW3_SHOTGUN_SHELL"},
},

shotgun_shotty_reload_out = {
[1] = {time = 0.6, sound = "MW3_SHOTGUN_PUMP"},
},

}

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