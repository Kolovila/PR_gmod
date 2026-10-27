if not CustomizableWeaponry then return end

SWEP.magType = "smgMag"
SWEP.wpnSize = "small"
SWEP.wpnEmptyType = "smg"

SWEP.WpnName = loc('mw3_mp_g18')

if CLIENT then

--Basic Information
SWEP.DrawCrosshair = false
SWEP.PrintName = SWEP.WpnName
SWEP.CSMuzzleFlashes = true
SWEP.MuzzleEffect = "muzzleflash_pistol"
SWEP.MuzzleEffect_orig = SWEP.MuzzleEffect
SWEP.PosBasedMuz = false
SWEP.SnapToGrip = false

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Vector(0, 0, 0)

SWEP.CustomizePos = Vector(6.88, -6.073, 0.12)
SWEP.CustomizeAng = Vector(21.361, 35.674, 25.371)

SWEP.CustomizePos_Akimbo = Vector(0, -4.511, -7.283)
SWEP.CustomizeAng_Akimbo = Vector(37.627, 0, 0)

SWEP.CustomizePos_Orig = SWEP.CustomizePos
SWEP.CustomizeAng_Orig = SWEP.CustomizeAng

SWEP.SafePos = Vector(2.68, -9.025, -4.81)
SWEP.SafeAng = Vector(37.456, 2.292, 11.279)

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

	SWEP.HoloPos = Vector(-2.7835, -6.8236, -0.9224)
	SWEP.HoloAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-2.7876, -0.7621, 0.6)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.ReflexPos = Vector(-2.7729, -6.9498, -0.6038)
	SWEP.ReflexAng = Vector(0, 0, 0)

--Select and kill icon (Temporary)
SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw2_mw3_g18")
killicon.Add("cw2_mw3_g18", "mw3_icons/hud/hud_g18", Color(255, 255, 255, 0))

--Worldmodel Information
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/ma85_mw3/g18/worldmodel.mdl"
SWEP.WMPos = Vector( -14.5, -1, 2.6)
SWEP.WMAng = Vector(-5, 88, 175)

SWEP.WM2 = SWEP.WM
SWEP.WM2Pos = Vector( -15, -1, 2)
SWEP.WM2Ang = SWEP.WMAng

SWEP.WMDWPos = Vector( -15, 1, 2)

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
SWEP.BoltBone = "j_bolt"
SWEP.BoltBone_Orig = SWEP.BoltBone
SWEP.BoltShootOffset = Vector(-1.5, 0, 0)
SWEP.HoldBoltWhileEmpty = true
SWEP.DontHoldWhenReloading = false
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

--Scopes--
["mw3_att_reflex"] = { type = "Model", model = "models/ma85_mw3/atts/reflex.mdl", bone = "tag_red_dot", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_holo"] = { type = "Model", model = "models/ma85_mw3/atts/holo.mdl", bone = "tag_eotech", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
}

SWEP.AttachmentModelsWM = {
--Mods--
["mw3_att_silencer"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, 3.3, 0.5), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

--Scopes--
["mw3_att_reflex"] = { model = "models/ma85_mw3/atts/reflex_world.mdl", bone ="Root", pos = Vector(0, 9.5, 1.5), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_holo"] = { model = "models/ma85_mw3/atts/holo_world.mdl", bone ="Root", pos = Vector(0, 8.5, 1.5), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
}
end

SWEP.Animations = {
fire = "reg_fire",
ads_fire = "reg_ads_fire",
reload = "reg_reload",
reload_empty = "reg_reload_empty",
idle = "reg_idle",
draw = "reg_draw",
holster = "reg_holster",
sprint_in = "reg_sprint_in",
sprint = "reg_sprint",
sprint_out = "reg_sprint_out",

aim_in = "reg_idle",
aim_out = "reg_idle",
customize_in = "reg_idle",
}

SWEP.Animations_Akimbo = {
fire = "dw_left_fire",
fire_last = "dw_left_fire_last",

reload = "dw_left_reload",
reload_empty = "dw_left_reload_empty",

idle = "dw_left_idle",
draw = "dw_left_draw",
draw_first = "dw_left_draw_first",
holster = "dw_left_holster",
sprint_in = "dw_left_sprint_in",
sprint = "dw_left_sprint",
sprint_out = "dw_left_sprint_out",

idle_empty = "dw_left_idle_empty",
draw_empty = "dw_left_draw_empty",
holster_empty = "dw_left_holster_empty",
sprint_in_empty = "dw_left_sprint_in_empty",
sprint_empty = "dw_left_sprint_empty",
sprint_out_empty = "dw_left_sprint_out_empty",

fire_right = "dw_right_fire",
fire_last_right = "dw_right_fire_last",

reload_right = "dw_right_reload",
reload_empty_right = "dw_right_reload_empty",

idle_right = "dw_right_idle",
draw_right = "dw_right_draw",
holster_right = "dw_right_holster",
sprint_in_right = "dw_right_sprint_in",
sprint_right = "dw_right_sprint",
sprint_out_right = "dw_right_sprint_out",

idle_empty_right = "dw_right_idle_empty",
draw_empty_right = "dw_right_draw_empty",
holster_empty_right = "dw_right_holster_empty",
sprint_in_empty_right = "dw_right_sprint_in_empty",
sprint_empty_right = "dw_right_sprint_empty",
sprint_out_empty_right = "dw_right_sprint_out_empty",

}

SWEP.Animations_Normal = SWEP.Animations

--Customization Information
SWEP.CustomizationMenuScale = 0.0085

SWEP.AttPos = -150
SWEP.ReticlePos = SWEP.AttPos - 100

SWEP.AbilityPos = SWEP.AttPos + 150
SWEP.SkinPos = SWEP.AbilityPos + 150

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

[1] = {header = loc('mw3_category_attachment'), offset = {-0, -25}, atts = {
"mw3_att_silencer",
"mw3_att_akimbo",
"mw3_att_reflex",
"mw3_att_holo",
"mw3_att_mags",
}},

["+zoom"] = {header = loc('mw3_category_camo'), offset = {-4000, 100}, atts = {
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
	"models/ma85_mw3/g18/mtl_weapon_g18_iw5",
	},
	
	marine = {
	"models/ma85_mw3/g18/camo/marine",
	},	
	
	winter = {
	"models/ma85_mw3/g18/camo/winter",
	},	

	classic = {
	"models/ma85_mw3/g18/camo/classic",
	},	
	
	snow = {
	"models/ma85_mw3/g18/camo/snow",
	},	
	
	multi = {
	"models/ma85_mw3/g18/camo/multi",
	},	
	
	digital = {
	"models/ma85_mw3/g18/camo/digital",
	},	
	
	hex = {
	"models/ma85_mw3/g18/camo/hex",
	},	
	
	choco = {
	"models/ma85_mw3/g18/camo/choco",
	},	
	
	snake = {
	"models/ma85_mw3/g18/camo/snake",
	},	
	
	blue = {
	"models/ma85_mw3/g18/camo/blue",
	},	
	
	red = {
	"models/ma85_mw3/g18/camo/red",
	},	
	
	autumn = {
	"models/ma85_mw3/g18/camo/autumn",
	},	
	
	gold = {
	"models/ma85_mw3/g18/camo/gold",
	},	

}

--Other information
SWEP.SpeedDec = 10 --Speed decrease on equip

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto"}
SWEP.Base = "mw3_wpn_base"
SWEP.Category = "CW2 MW3" .. " " .. loc('mw3_category_mp')

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
SWEP.ViewModel = "models/ma85_mw3/g18/viewmodel.mdl"
SWEP.WorldModel = "models/ma85_mw3/g18/worldmodel.mdl"

SWEP.ViewModel_AkimboL = "models/ma85_mw3/g18/akimbo/viewmodel_left.mdl"
SWEP.ViewModel_AkimboR = "models/ma85_mw3/g18/akimbo/viewmodel_right.mdl"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 20
SWEP.Primary.ClipSize_Ext = 30
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 6
SWEP.Primary.Automatic = true
SWEP.Primary.Automatic_Orig = SWEP.Primary.Automatic

SWEP.Primary.Ammo = "Pistol"

SWEP.FireDelay = 60/1016
SWEP.FireDelay_Orig = SWEP.FireDelay

SWEP.Recoil = 0.25
SWEP.RecoilDown = -0.15
SWEP.RecoilLeft = 0.75
SWEP.RecoilRight = 0.75
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
SWEP.AimAnim = false

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
SWEP.ReloadTime = 1.6 --Time when magazine is inserted/bullet is chambered
SWEP.ReloadTime_Empty = 2.25

SWEP.ReloadHalt = 2.3 --Time when reload is finished
SWEP.ReloadHalt_Empty = 2.76

-- Akimbo
SWEP.ReloadTime_Akimbo = SWEP.ReloadTime
SWEP.ReloadTime_Empty_Akimbo = SWEP.ReloadTime_Empty

SWEP.ReloadHalt_Akimbo = SWEP.ReloadHalt
SWEP.ReloadHalt_Empty_Akimbo = SWEP.ReloadHalt_Empty

SWEP.SnapToIdlePostReload = false

SWEP.Range = 600
SWEP.Range_Orig = SWEP.Range
SWEP.DamageDropOff = 0.6
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

SWEP.DeployTime = 0.35
SWEP.HolsterTime = 0.4

--Sounds
CustomizableWeaponry:addFireSound("MW3_g18_FIRE", {
"ma85_mw3/weapons/g18/fire.wav",
}, 0.4, 90, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addReloadSound("mw3_g18_RELOAD_1", "ma85_mw3/weapons/g18/lift.wav")
CustomizableWeaponry:addReloadSound("mw3_g18_RELOAD_2", "ma85_mw3/weapons/g18/magout.wav")
CustomizableWeaponry:addReloadSound("mw3_g18_RELOAD_3", "ma85_mw3/weapons/g18/magin.wav")
CustomizableWeaponry:addReloadSound("mw3_g18_RELOAD_4", "ma85_mw3/weapons/g18/bolt.wav")

SWEP.LoopFireSound = false
SWEP.FireSound = "MW3_g18_FIRE"
--SWEP.FireMechanicSound = "MW3_MECH_D"
SWEP.FireSoundSuppressed = "MW3_SIL_SMG_MP5"

SWEP.Sounds = {
reg_draw = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

reg_reload = {
[1] = {time = 0, sound = "MW3_g18_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_g18_RELOAD_2"},
[3] = {time = 1.65, sound = "MW3_g18_RELOAD_3"},
},

reg_reload_empty = {
[1] = {time = 0, sound = "MW3_g18_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_g18_RELOAD_2"},
[3] = {time = 1.65, sound = "MW3_g18_RELOAD_3"},
[4] = {time = 2.2, sound = "MW3_g18_RELOAD_4"},
},

dw_left_draw = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

dw_left_draw_empty = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

dw_left_reload = {
[1] = {time = 0, sound = "MW3_g18_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_g18_RELOAD_2"},
[3] = {time = 1.45, sound = "MW3_g18_RELOAD_3"},
},

dw_left_reload_empty = {
[1] = {time = 0, sound = "MW3_g18_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_g18_RELOAD_2"},
[3] = {time = 1.45, sound = "MW3_g18_RELOAD_3"},
[4] = {time = 2.2, sound = "MW3_g18_RELOAD_4"},
},

dw_right_reload = {
[1] = {time = 0, sound = "MW3_g18_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_g18_RELOAD_2"},
[3] = {time = 1.45, sound = "MW3_g18_RELOAD_3"},
},

dw_right_reload_empty = {
[1] = {time = 0, sound = "MW3_g18_RELOAD_1"},
[2] = {time = 0.3, sound = "MW3_g18_RELOAD_2"},
[3] = {time = 1.45, sound = "MW3_g18_RELOAD_3"},
[4] = {time = 2.2, sound = "MW3_g18_RELOAD_4"},
},

}

function SWEP:IndividualThink()

local attachment = self.ActiveAttachments


if CLIENT then

	if self.dt.State == CW_CUSTOMIZE and not self.isDualwield then
		self.ForegripParent = "customize"
	else
		self.ForegripParent = "null"
	end

end

end