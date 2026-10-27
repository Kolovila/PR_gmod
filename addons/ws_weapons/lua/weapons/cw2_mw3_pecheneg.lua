if not CustomizableWeaponry then return end

SWEP.magType = "lmgMag"
SWEP.wpnSize = "heavy"
SWEP.wpnEmptyType = "rifle"

SWEP.WpnName = loc('mw3_lmg_pecheneg')

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

	SWEP.IronsightPos = Vector(-3.4356, -8.095, 0.2363)
	SWEP.IronsightAng = Vector(0.16, 0, 0)

	SWEP.HoloPos = Vector(-3.4293, -6.7837, -0.6162)
	SWEP.HoloAng = Vector(0, 0, 0)

	SWEP.ReflexPos = Vector(-3.4114, -7.7735, -0.2387)
	SWEP.ReflexAng = Vector(0, 0, 0)

	SWEP.ACOGPos = Vector(-3.424, -0.5269, -0.401)
	SWEP.ACOGAng = Vector(0, 0, 0)

	SWEP.ThermalPos = SWEP.ReflexPos
	SWEP.ThermalAng = Vector(0, 0, 0)
	
--Select and kill icon (Temporary)
SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw2_mw3_pecheneg")
killicon.Add("cw2_mw3_pecheneg", "mw3_icons/hud/hud_pecheneg", Color(255, 255, 255, 0))

--Worldmodel Information
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/ma85_mw3/pecheneg/worldmodel.mdl"
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
["mw3_att_silencer"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, -18.25, 0.1), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_silencer2"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, -18.25, 0.1), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

["mw3_att_hbs"] = { model = "models/ma85_mw3/atts/hbs_world.mdl", bone ="Root", pos = Vector(-0.75, 10, -0.25), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_hbs2"] = { model = "models/ma85_mw3/atts/hbs_world.mdl", bone ="Root", pos = Vector(-0.75, 10, -0.25), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

["mw3_att_grip"] = { model = "models/ma85_mw3/atts/grip_world.mdl", bone ="Root", pos = Vector(0, 1, -1.75), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_grip2"] = { model = "models/ma85_mw3/atts/grip_world.mdl", bone ="Root", pos = Vector(0, 1, -1.75), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

--Scopes--
["mw3_att_reflex"] = { model = "models/ma85_mw3/atts/reflex_world.mdl", bone ="Root", pos = Vector(0, 6, 2.15), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_holo"] = { model = "models/ma85_mw3/atts/holo_world.mdl", bone ="Root", pos = Vector(0, 6, 2.15), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_acog"] = { model = "models/ma85_mw3/atts/acog_world.mdl", bone ="Root", pos = Vector(0, 6, 2.15), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_thermal"] = { model = "models/ma85_mw3/atts/thermal_world.mdl", bone ="Root", pos = Vector(0, 6, 2.15), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

}

SWEP.RoundBeltBoneNames = {
	"j_ammo_01",
	"j_ammo_02",
	"j_ammo_03",
	"j_ammo_04",
	"j_ammo_05",
	"j_ammo_06",
	"j_ammo_07",
	"j_ammo_08",
	"j_ammo_09",
	"j_ammo_010",
	"j_ammo_011",
	"j_ammo_012",
	"j_ammo_013",
	"j_ammo_014",
	"j_ammo_015",
	"j_ammo_016",
	"j_ammo_017",
	"j_ammo_018",
	"j_ammo_019",
	"j_ammo_020",
}

end

SWEP.Animations = {
fire = "reg_fire",
ads_fire = "reg_ads_fire",
reload = "reg_reload",
reload_empty = reload,
idle = "reg_idle",
draw = "reg_draw",
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
reload_empty = reload,
idle = "grip_idle",
draw = "grip_draw",
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
SWEP.CustomizationMenuScale = 0.02

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
"mw3_att_grip",
"mw3_att_acog",
"mw3_att_rapid_fire",
"mw3_att_hbs",
"mw3_att_holo",
"mw3_att_mags",
"mw3_att_thermal",
}},

[2] = {header = loc('mw3_category_proficiency'), offset = {0, 400}, atts = {
"mw3_prof_kick",
"mw3_prof_impact",
"mw3_prof_atts",
"mw3_prof_speed",

--"mw3_prof_melee",
--"mw3_prof_damage",
}},

[3] = {header = loc('mw3_category_attachment') .. " (" .. loc('mw3_category_proficiency') .. ")", offset = {850, 400}, atts = {
"mw3_att_silencer2",
"mw3_att_grip2",
"mw3_att_hbs2",
"mw3_att_rapid_fire2",
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
-- SWEP.DefaultCamo.name = "models/ma85_mw3/pecheneg/textures/detail_black_paint_c"
-- SWEP.DefaultCamo.scale = 1
-- SWEP.DefaultCamo.blendfactor = 1

SWEP.Skins = {
	-- NOTE they need to be in order of the materials
	{ 
	"models/ma85_mw3/pecheneg/mtl_weapon_pecheneg",
	},
	
	marine = {
	"models/ma85_mw3/pecheneg/camo/marine",
	},	
	
	winter = {
	"models/ma85_mw3/pecheneg/camo/winter",
	},	

	classic = {
	"models/ma85_mw3/pecheneg/camo/classic",
	},	
	
	snow = {
	"models/ma85_mw3/pecheneg/camo/snow",
	},	
	
	multi = {
	"models/ma85_mw3/pecheneg/camo/multi",
	},	
	
	digital = {
	"models/ma85_mw3/pecheneg/camo/digital",
	},	
	
	hex = {
	"models/ma85_mw3/pecheneg/camo/hex",
	},	
	
	choco = {
	"models/ma85_mw3/pecheneg/camo/choco",
	},	
	
	snake = {
	"models/ma85_mw3/pecheneg/camo/snake",
	},	
	
	blue = {
	"models/ma85_mw3/pecheneg/camo/blue",
	},	
	
	red = {
	"models/ma85_mw3/pecheneg/camo/red",
	},	
	
	autumn = {
	"models/ma85_mw3/pecheneg/camo/autumn",
	},	
	
	gold = {
	"models/ma85_mw3/pecheneg/camo/gold",
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
SWEP.ViewModel = "models/ma85_mw3/pecheneg/viewmodel.mdl"
SWEP.WorldModel = "models/ma85_mw3/pecheneg/worldmodel.mdl"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 100
SWEP.Primary.ClipSize_Ext = 150
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 3
SWEP.Primary.Automatic = true
SWEP.Primary.Automatic_Orig = SWEP.Primary.Automatic

SWEP.Primary.Ammo = "AR2"

SWEP.FireDelay = 60/705
SWEP.FireDelay_Orig = SWEP.FireDelay

SWEP.Recoil = 0.4
SWEP.RecoilDown = -0.3
SWEP.RecoilLeft = 0.75
SWEP.RecoilRight = 0.75
SWEP.Recoil_Orig = SWEP.Recoil

SWEP.RecoilToSpread = 1
SWEP.RecoilToSpread_Orig = SWEP.RecoilToSpread
SWEP.ShotgunReloadState = 0

SWEP.HipSpread = 0.02
SWEP.HipSpread_Orig = SWEP.HipSpread
SWEP.AimSpread = -0.1
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
SWEP.FirstDeploy = true

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

SWEP.ScopeTime = 0.35

--Damage
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.Damage_Orig = SWEP.Damage
SWEP.PushForce = 7.5

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 7 --Time when magazine is inserted/bullet is chambered
SWEP.ReloadTime_Empty = SWEP.ReloadTime

SWEP.ReloadHalt = 8.66 --Time when reload is finished
SWEP.ReloadHalt_Empty = SWEP.ReloadHalt
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
SWEP.DeployTime = 1
SWEP.HolsterTime = 0.4

--Sounds
CustomizableWeaponry:addFireSound("MW3_pecheneg_FIRE", {
"ma85_mw3/weapons/pecheneg/fire.wav",
}, 0.35, 100, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addReloadSound("mw3_pecheneg_RELOAD_1", "ma85_mw3/weapons/pecheneg/lift.wav")
CustomizableWeaponry:addReloadSound("mw3_pecheneg_RELOAD_2", "ma85_mw3/weapons/pecheneg/open.wav")
CustomizableWeaponry:addReloadSound("mw3_pecheneg_RELOAD_3", "ma85_mw3/weapons/pecheneg/magout.wav")
CustomizableWeaponry:addReloadSound("mw3_pecheneg_RELOAD_4", "ma85_mw3/weapons/pecheneg/magin.wav")
CustomizableWeaponry:addReloadSound("mw3_pecheneg_RELOAD_5", "ma85_mw3/weapons/pecheneg/close.wav")
CustomizableWeaponry:addReloadSound("mw3_pecheneg_RELOAD_6", "ma85_mw3/weapons/pecheneg/bolt.wav")

SWEP.LoopFireSound = false
SWEP.FireSound = "MW3_pecheneg_FIRE"
SWEP.FireMechanicSound = "MW3_MECH_C"
SWEP.FireSoundSuppressed = "MW3_SIL_LMG"

SWEP.Sounds = {
reg_draw = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

reg_reload = {
[1] = {time = 0, sound = "MW3_pecheneg_RELOAD_1"},
[2] = {time = 1.2, sound = "MW3_pecheneg_RELOAD_2"},
[3] = {time = 2.25, sound = "MW3_pecheneg_RELOAD_3"},
[4] = {time = 4.4, sound = "MW3_pecheneg_RELOAD_4"},
[5] = {time = 6.25, sound = "MW3_pecheneg_RELOAD_5"},
[6] = {time = 6.8, sound = "MW3_pecheneg_RELOAD_6"},
},

grip_draw = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

grip_reload = {
[1] = {time = 0, sound = "MW3_pecheneg_RELOAD_1"},
[2] = {time = 1.2, sound = "MW3_pecheneg_RELOAD_2"},
[3] = {time = 2.25, sound = "MW3_pecheneg_RELOAD_3"},
[4] = {time = 4.4, sound = "MW3_pecheneg_RELOAD_4"},
[5] = {time = 6.25, sound = "MW3_pecheneg_RELOAD_5"},
[6] = {time = 6.8, sound = "MW3_pecheneg_RELOAD_6"},
},

}


if CLIENT then
	local function removeRoundMeshes(wep) -- we hide all rounds left in the belt on a non-empty reload because if we don't we're left with ghost meshes moving around (bullets with no link to the mag get moved back to it)
		wep:adjustVisibleRounds(0)
	end
	
	local function adjustMeshByMaxAmmo(wep)
		wep:adjustVisibleRounds(wep.Owner:GetAmmoCount(wep.Primary.Ammo) + wep:Clip1())
	end

	SWEP.Sounds.reg_reload[3].callback = adjustMeshByMaxAmmo
	SWEP.Sounds.grip_reload[3].callback = adjustMeshByMaxAmmo
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