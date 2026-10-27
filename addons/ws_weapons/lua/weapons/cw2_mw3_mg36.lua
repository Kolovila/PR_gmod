if not CustomizableWeaponry then return end

SWEP.magType = "lmgMag"
SWEP.wpnSize = "heavy"
SWEP.wpnEmptyType = "rifle"

SWEP.WpnName = loc('mw3_lmg_mg36')

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

	SWEP.HoloPos = Vector(-3.4448, -5.5461, 0.1996)
	SWEP.HoloAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-3.4408, -3.5462, -0.0663)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.ReflexPos = Vector(-3.4436, -5.8152, 0.6398)
	SWEP.ReflexAng = Vector(0, 0, 0)

	SWEP.ACOGPos = Vector(-3.4434, 1.6328, 0.514)
	SWEP.ACOGAng = Vector(0, 0, 0)

	SWEP.ThermalPos = SWEP.ReflexPos
	SWEP.ThermalAng = Vector(0, 0, 0)

--Select and kill icon (Temporary)
SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw2_mw3_mg36")
killicon.Add("cw2_mw3_mg36", "mw3_icons/hud/hud_mg36", Color(255, 255, 255, 0))

--Worldmodel Information
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/ma85_mw3/mg36/worldmodel.mdl"
SWEP.WMPos = Vector( -15, -.1, 3)
SWEP.WMAng = Vector(-5, 88, 182.5)

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
["mw3_att_silencer2"] = { type = "Model", model = "models/ma85_mw3/atts/silencer.mdl", bone = "tag_silencer", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

["mw3_att_hbs"] = { type = "Model", model = "models/ma85_mw3/atts/hbs.mdl", bone = "tag_heartbeat", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_hbs2"] = { type = "Model", model = "models/ma85_mw3/atts/hbs.mdl", bone = "tag_heartbeat", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

["mw3_att_grip"] = { type = "Model", model = "models/ma85_mw3/atts/grip.mdl", bone = "tag_foregrip", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_grip2"] = { type = "Model", model = "models/ma85_mw3/atts/grip.mdl", bone = "tag_foregrip", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

--Scopes--
["mw3_att_reflex"] = { type = "Model", model = "models/ma85_mw3/atts/reflex.mdl", bone = "tag_red_dot", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_holo"] = { type = "Model", model = "models/ma85_mw3/atts/holo.mdl", bone = "tag_eotech", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_acog"] = { type = "Model", model = "models/ma85_mw3/atts/acog.mdl", bone = "tag_acog_2", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_thermal"] = { type = "Model", model = "models/ma85_mw3/atts/thermal.mdl", bone = "tag_thermal_scope", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

}

SWEP.AttachmentModelsWM = {
--Mods--
["mw3_att_silencer"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, -18.5, -0.45), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_silencer2"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, -18.5, -0.45), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

["mw3_att_hbs"] = { model = "models/ma85_mw3/atts/hbs_world.mdl", bone ="Root", pos = Vector(-1, 10, -0.25), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_hbs2"] = { model = "models/ma85_mw3/atts/hbs_world.mdl", bone ="Root", pos = Vector(-1, 10, -0.25), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

["mw3_att_grip"] = { model = "models/ma85_mw3/atts/grip_world.mdl", bone ="Root", pos = Vector(0, -1, -1.25), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_grip2"] = { model = "models/ma85_mw3/atts/grip_world.mdl", bone ="Root", pos = Vector(0, 1, -1.25), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

--Scopes--
["mw3_att_reflex"] = { model = "models/ma85_mw3/atts/reflex_world.mdl", bone ="Root", pos = Vector(0, 7, 2.2), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_holo"] = { model = "models/ma85_mw3/atts/holo_world.mdl", bone ="Root", pos = Vector(0, 7, 2.2), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_acog"] = { model = "models/ma85_mw3/atts/acog_world.mdl", bone ="Root", pos = Vector(0, 7, 2.2), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_thermal"] = { model = "models/ma85_mw3/atts/thermal_world.mdl", bone ="Root", pos = Vector(0, 7, 2.2), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

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
toggle = "reg_to_hybrid",

aim_in = "reg_idle",
aim_out = "reg_idle",
customize_in = "reg_idle",
}

SWEP.Animations_Grip = {
fire = "grip_fire",
ads_fire = "grip_ads_fire",
reload = "grip_reload",
reload_empty = "grip_reload_empty",
idle = "grip_idle",
draw = "grip_draw",
draw_first = "grip_draw_first",
holster = "grip_holster",
sprint_in = "grip_sprint_in",
sprint = "grip_sprint",
sprint_out = "grip_sprint_out",
toggle = "grip_to_hybrid",

aim_in = "grip_idle",
aim_out = "grip_idle",
customize_in = "grip_idle",
}

SWEP.Animations_Normal = SWEP.Animations

--Customization Information
SWEP.CustomizationMenuScale = 0.0165

SWEP.Attachments = {
["+attack"] = {header = loc('mw3_category_reticle'), offset = {100, -200}, atts = {
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

[1] = {header = loc('mw3_category_attachment'), offset = {100, 50}, atts = {
"mw3_att_reflex",
"mw3_att_silencer",
"mw3_att_grip",
"mw3_att_acog",
"mw3_att_rapid_fire",
"mw3_att_hbs",
"mw3_att_holo",
"mw3_att_mags",
"mw3_att_thermal",
}},

[2] = {header = loc('mw3_category_proficiency'), offset = {100, 350}, atts = {
"mw3_prof_kick",
"mw3_prof_impact",
"mw3_prof_atts",
"mw3_prof_speed",

--"mw3_prof_melee",
--"mw3_prof_damage",
}},

[3] = {header = loc('mw3_category_attachment') .. " (" .. loc('mw3_category_proficiency') .. ")", offset = {1000, 350}, atts = {
"mw3_att_silencer2",
"mw3_att_grip2",
"mw3_att_hbs2",
"mw3_att_rapid_fire2",
"mw3_att_mags2",
}, dependencies = {
mw3_prof_atts = true,
}},

["+attack2"] = {header = loc('mw3_category_camo'), offset = {100, 650}, atts = {
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

SWEP.Skins = {
	-- NOTE they need to be in order of the materials
	{ 
	"models/ma85_mw3/mg36/mtl_weapon_mg36",
	"models/ma85_mw3/sa80/mtl_weapon_sa80_iw5_drum",
	"models/ma85_mw3/mg36/mtl_weapon_m60_iw5_bipod",
	"models/ma85_mw3/mg36/mtl_weapon_mg36_iron_sight",
	},
	
	marine = {
	"models/ma85_mw3/mg36/camo/marine",
	},	
	
	winter = {
	"models/ma85_mw3/mg36/camo/winter",
	},	

	classic = {
	"models/ma85_mw3/mg36/camo/classic",
	},	
	
	snow = {
	"models/ma85_mw3/mg36/camo/snow",
	},	
	
	multi = {
	"models/ma85_mw3/mg36/camo/multi",
	},	
	
	digital = {
	"models/ma85_mw3/mg36/camo/digital",
	},	
	
	hex = {
	"models/ma85_mw3/mg36/camo/hex",
	},	
	
	choco = {
	"models/ma85_mw3/mg36/camo/choco",
	},	
	
	snake = {
	"models/ma85_mw3/mg36/camo/snake",
	},	
	
	blue = {
	"models/ma85_mw3/mg36/camo/blue",
	},	

	red = {
	"models/ma85_mw3/mg36/camo/red",
	},	
	
	autumn = {
	"models/ma85_mw3/mg36/camo/autumn",
	},	
	
	
	gold = 
	{ 
	"models/ma85_mw3/mg36/camo/gold",
	"models/ma85_mw3/sa80/camo/gold_mag",
	"models/ma85_mw3/m60e4/camo/gold_bipod",
	"models/ma85_mw3/mg36/camo/gold",
	},
	
}

--Other information
SWEP.SpeedDec = 10 --Speed decrease on equip

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "mw3_wpn_base"
SWEP.Category = "CW2 MW3" .. " " .. loc('mw3_category_lmg')

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
SWEP.ViewModel = "models/ma85_mw3/mg36/viewmodel.mdl"
SWEP.WorldModel = "models/ma85_mw3/mg36/worldmodel.mdl"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 100
SWEP.Primary.ClipSize_Ext = 150
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 3
SWEP.Primary.Automatic = true
SWEP.Primary.Automatic_Orig = SWEP.Primary.Automatic

SWEP.Primary.Ammo = "AR2"

SWEP.FireDelay = 60/800
SWEP.FireDelay_Orig = SWEP.FireDelay

SWEP.Recoil = 0.125
SWEP.RecoilDown = -0.1
SWEP.RecoilLeft = 0.7
SWEP.RecoilRight = 0.5
SWEP.Recoil_Orig = SWEP.Recoil

SWEP.RecoilToSpread = 4
SWEP.RecoilToSpread_Orig = SWEP.RecoilToSpread
SWEP.ShotgunReloadState = 0

SWEP.HipSpread = 0.04
SWEP.HipSpread_Orig = SWEP.HipSpread
SWEP.AimSpread = -0.125
SWEP.AimSpread_Orig = SWEP.AimSpread

SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.2
SWEP.SpreadPerShot = 0.1
SWEP.SpreadPerShot_Orig = SWEP.SpreadPerShot
SWEP.SpreadCooldown = 0
SWEP.FOVPerShot = 0 --How much the FOV is increased per shot
SWEP.FireAnimSpeed = 1 --Percentage speed of fire animation
SWEP.CanRestOnObjects = false
SWEP.ReloadViewBobEnabled = false
SWEP.ADSFireAnim = true
SWEP.FirstDeploy = false

SWEP.PenMod = 1
SWEP.PenMod_Orig = SWEP.PenMod

SWEP.SwayIntensity = 1
SWEP.AimSwayIntensity = .25

SWEP.ADSSpeed = 0.85
SWEP.ADSSpeed_Orig = SWEP.ADSSpeed

SWEP.ADSWalkSpeed = 0.65
SWEP.ADSWalkSpeed_Orig = SWEP.ADSWalkSpeed

SWEP.SprintSpeed = 0.8
SWEP.SprintSpeed_Orig = SWEP.SprintSpeed

SWEP.ScopeTime = 0.3

--Damage
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.Damage_Orig = SWEP.Damage
SWEP.PushForce = 5

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 3 --Time when magazine is inserted/bullet is chambered
SWEP.ReloadTime_Empty = 4

SWEP.ReloadHalt = 3.73 --Time when reload is finished
SWEP.ReloadHalt_Empty = 4.53
SWEP.SnapToIdlePostReload = false

SWEP.Range = 10000
SWEP.Range_Orig = SWEP.Range
SWEP.DamageDropOff = 0
SWEP.DamageDropOff_Orig = SWEP.DamageDropOff

SWEP.Chamberable = false
SWEP.SprintInSpeed = 0.8
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
SWEP.DeployTime = 0.8
SWEP.HolsterTime = 0.4

--Sounds
CustomizableWeaponry:addFireSound("MW3_mg36_FIRE", {
"ma85_mw3/weapons/mg36/fire.wav",
}, 0.4, 100, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addReloadSound("mw3_mg36_RELOAD_1", "ma85_mw3/weapons/mg36/lift.wav")
CustomizableWeaponry:addReloadSound("mw3_mg36_RELOAD_2", "ma85_mw3/weapons/mg36/magout.wav")
CustomizableWeaponry:addReloadSound("mw3_mg36_RELOAD_3", "ma85_mw3/weapons/mg36/magin.wav")
CustomizableWeaponry:addReloadSound("mw3_mg36_RELOAD_4", "ma85_mw3/weapons/mg36/bolt.wav")

SWEP.LoopFireSound = false
SWEP.FireSound = "MW3_mg36_FIRE"
SWEP.FireMechanicSound = "MW3_MECH_C"
SWEP.FireSoundSuppressed = "MW3_SIL_LMG"

SWEP.Sounds = {
reg_draw = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

reg_reload = {
[1] = {time = 0, sound = "MW3_mg36_RELOAD_1"},
[2] = {time = 1, sound = "MW3_mg36_RELOAD_2"},
[3] = {time = 2.8, sound = "MW3_mg36_RELOAD_3"},
},

reg_reload_empty = {
[1] = {time = 0, sound = "MW3_mg36_RELOAD_1"},
[2] = {time = 1, sound = "MW3_mg36_RELOAD_2"},
[3] = {time = 2.8, sound = "MW3_mg36_RELOAD_3"},
[4] = {time = 3.7, sound = "MW3_mg36_RELOAD_4"},
},

grip_draw = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

grip_reload = {
[1] = {time = 0, sound = "MW3_mg36_RELOAD_1"},
[2] = {time = 1, sound = "MW3_mg36_RELOAD_2"},
[3] = {time = 2.8, sound = "MW3_mg36_RELOAD_3"},
},

grip_reload_empty = {
[1] = {time = 0, sound = "MW3_mg36_RELOAD_1"},
[2] = {time = 1, sound = "MW3_mg36_RELOAD_2"},
[3] = {time = 2.8, sound = "MW3_mg36_RELOAD_3"},
[4] = {time = 3.7, sound = "MW3_mg36_RELOAD_4"},
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