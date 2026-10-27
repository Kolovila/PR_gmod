if not CustomizableWeaponry then return end

SWEP.magType = "shoMag"
SWEP.wpnSize = "medium"
SWEP.wpnEmptyType = "smg"

SWEP.WpnName = loc('mw3_sho_spas12')

if CLIENT then

--Basic Information
SWEP.DrawCrosshair = false
SWEP.PrintName = SWEP.WpnName
SWEP.CSMuzzleFlashes = true
SWEP.MuzzleEffect = "muzzleflash_shotgun"
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

	SWEP.HoloPos = Vector(-3.4395, -2.4331, 0.6125)
	SWEP.HoloAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-3.452, -2.1675, 1.3621)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.ReflexPos = Vector(-3.4364, -3.3171, 1.057)
	SWEP.ReflexAng = Vector(0, 0, 0)

--Select and kill icon (Temporary)
SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw2_mw3_spas12")
killicon.Add("cw2_mw3_spas12", "mw3_icons/hud/hud_spas12", Color(255, 255, 255, 0))

--Worldmodel Information
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/ma85_mw3/spas12/worldmodel.mdl"
SWEP.WMPos = Vector( -14.5, -0.5, 3)
SWEP.WMAng = Vector(-5, 88, 180)

-- LUA Recoil
SWEP.LuaViewmodelRecoil = false
SWEP.FullAimViewmodelRecoil = true
SWEP.DisableSprintViewSimulation = true
SWEP.LuaViewmodelRecoilOverride = true

SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 5, roll = 0, forward = -4, pitch = 1}

--Shell
SWEP.ShellScale = 0.6
SWEP.Shell = "shotshell"
SWEP.ShellOffsetMul = 1
SWEP.ShellDelay = 0.45
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
["mw3_att_silencer"] = { type = "Model", model = "models/ma85_mw3/atts/silencer3.mdl", bone = "tag_silencer", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_silencer2"] = { type = "Model", model = "models/ma85_mw3/atts/silencer3.mdl", bone = "tag_silencer", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

["mw3_att_grip"] = { type = "Model", model = "models/ma85_mw3/atts/grip.mdl", bone = "tag_foregrip", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_grip2"] = { type = "Model", model = "models/ma85_mw3/atts/grip.mdl", bone = "tag_foregrip", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

--Scopes--
["mw3_att_reflex"] = { type = "Model", model = "models/ma85_mw3/atts/reflex.mdl", bone = "tag_red_dot", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_holo"] = { type = "Model", model = "models/ma85_mw3/atts/holo.mdl", bone = "tag_eotech", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
}

SWEP.AttachmentModelsWM = {
--Mods--
["mw3_att_silencer"] = { model = "models/ma85_mw3/atts/silencer3_world.mdl", bone ="Root", pos = Vector(0, -15.25, -0.4), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_silencer2"] = { model = "models/ma85_mw3/atts/silencer3_world.mdl", bone ="Root", pos = Vector(0, -15.25, -0.4), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_grip"] = { model = "models/ma85_mw3/atts/grip_world.mdl", bone ="Root", pos = Vector(0, -2, -2), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_grip2"] = { model = "models/ma85_mw3/atts/grip_world.mdl", bone ="Root", pos = Vector(0, -2, -2), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

--Scopes--
["mw3_att_reflex"] = { model = "models/ma85_mw3/atts/reflex_world.mdl", bone ="Root", pos = Vector(0, 7, 0.1), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_holo"] = { model = "models/ma85_mw3/atts/holo_world.mdl", bone ="Root", pos = Vector(0, 7, 0.1), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
}

end

SWEP.Animations = {
fire = "reg_fire",
ads_fire = "reg_ads_fire",
rechamber = "reg_rechamber",
rechamber_ads = "reg_ads_rechamber",
reload_start = "reg_reload_start",
insert = "reg_reload_loop",
reload_end = "reg_reload_end",
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

SWEP.Animations_Grip = {
fire = "grip_fire",
ads_fire = "grip_ads_fire",
rechamber = "grip_rechamber",
rechamber_ads = "grip_ads_rechamber",
reload_start = "grip_reload_start",
insert = "grip_reload_loop",
reload_end = "grip_reload_end",
idle = "grip_idle",
draw = "grip_draw",
holster = "grip_holster",
sprint_in = "grip_sprint_in",
sprint = "grip_sprint",
sprint_out = "grip_sprint_out",

aim_in = "grip_idle",
aim_out = "grip_idle",
customize_in = "grip_idle",
}

SWEP.Animations_Normal = SWEP.Animations

--Customization Information
SWEP.CustomizationMenuScale = 0.01

SWEP.Attachments = {
["+attack"] = {header = loc('mw3_category_reticle'), offset = {-100, -425}, atts = {
"mw3_reticle_target",
"mw3_reticle_delta",
"mw3_reticle_udot",
"mw3_reticle_mildot",
"mw3_reticle_omega",
"mw3_reticle_lambda",
}, dependencies = {
mw3_att_reflex = true,
mw3_att_holo = true,
}},

[1] = {header = loc('mw3_category_attachment'), offset = {-100, -150}, atts = {
"mw3_att_grip",
"mw3_att_silencer",
"mw3_att_reflex",
"mw3_att_holo",
"mw3_att_mags",
}},

[2] = {header = loc('mw3_category_proficiency'), offset = {-100, 150}, atts = {
"mw3_prof_kick",
"mw3_prof_atts",
"mw3_prof_range",
"mw3_prof_damage",

--"mw3_prof_impact",
--"mw3_prof_melee",
--"mw3_prof_speed",
}},

[3] = {header = loc('mw3_category_attachment') .. " (" .. loc('mw3_category_proficiency') .. ")", offset = {850, 150}, atts = {
"mw3_att_grip2",
"mw3_att_silencer2",
"mw3_att_mags2",
}, dependencies = {
mw3_prof_atts = true,
}},

["+attack2"] = {header = loc('mw3_category_camo'), offset = {-100, 450}, atts = {
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
	"models/ma85_mw3/spas12/mtl_weapon_spas_12_iw5",
	},
	
	marine = {
	"models/ma85_mw3/spas12/camo/marine",
	},	
	
	winter = {
	"models/ma85_mw3/spas12/camo/winter",
	},	

	classic = {
	"models/ma85_mw3/spas12/camo/classic",
	},	
	
	snow = {
	"models/ma85_mw3/spas12/camo/snow",
	},	
	
	multi = {
	"models/ma85_mw3/spas12/camo/multi",
	},	
	
	digital = {
	"models/ma85_mw3/spas12/camo/digital",
	},	
	
	hex = {
	"models/ma85_mw3/spas12/camo/hex",
	},	
	
	choco = {
	"models/ma85_mw3/spas12/camo/choco",
	},	
	
	snake = {
	"models/ma85_mw3/spas12/camo/snake",
	},	
	
	blue = {
	"models/ma85_mw3/spas12/camo/blue",
	},	
	
	red = {
	"models/ma85_mw3/spas12/camo/red",
	},	
	
	autumn = {
	"models/ma85_mw3/spas12/camo/autumn",
	},	
	
	gold = {
	"models/ma85_mw3/spas12/camo/gold",
	},	

}

--Other information
SWEP.SpeedDec = 10 --Speed decrease on equip

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"pump"}
SWEP.Base = "mw3_wpn_base"
SWEP.Category = "CW2 MW3" .. " " .. loc('mw3_category_sho')

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
SWEP.ViewModel = "models/ma85_mw3/spas12/viewmodel.mdl"
SWEP.WorldModel = "models/ma85_mw3/spas12/worldmodel.mdl"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 8
SWEP.Primary.ClipSize_Ext = 12
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 6
SWEP.Primary.Automatic = false
SWEP.Primary.Automatic_Orig = SWEP.Primary.Automatic
SWEP.Primary.Ammo = "buckshot"

SWEP.FireDelay = 60/190
SWEP.FireDelay_Orig = SWEP.FireDelay

SWEP.Recoil = 1
SWEP.RecoilLeft = 1
SWEP.RecoilRight = 1
SWEP.Recoil_Orig = SWEP.Recoil

SWEP.RecoilToSpread = 2
SWEP.RecoilToSpread_Orig = SWEP.RecoilToSpread
SWEP.ShotgunReloadState = 0

SWEP.HipSpread = 0.01
SWEP.HipSpread_Orig = SWEP.HipSpread
SWEP.AimSpread = 0
SWEP.AimSpread_Orig = SWEP.AimSpread

SWEP.ClumpSpread = 0.065
SWEP.ClumpSpread_Orig = SWEP.ClumpSpread

SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.001
SWEP.SpreadPerShot = 0.1
SWEP.SpreadPerShot_Orig = SWEP.SpreadPerShot
SWEP.SpreadCooldown = 0
SWEP.CrosshairParts = {left = false, right = false, upper = false, lower = false}
SWEP.FOVPerShot = 0 --How much the FOV is increased per shot
SWEP.FireAnimSpeed = 1 --Percentage speed of fire animation
SWEP.CanRestOnObjects = false
SWEP.ReloadViewBobEnabled = false
SWEP.ADSFireAnim = true
SWEP.FirstDeploy = false
SWEP.BoltActionLogic = true
SWEP.AimAnim = false

SWEP.PenMod = 0.5
SWEP.PenMod_Orig = SWEP.PenMod

SWEP.SwayIntensity = 1
SWEP.AimSwayIntensity = .25

SWEP.ADSSpeed = .9
SWEP.ADSSpeed_Orig = SWEP.ADSSpeed

SWEP.ADSWalkSpeed = .75
SWEP.ADSWalkSpeed_Orig = SWEP.ADSWalkSpeed

SWEP.SprintSpeed = .9
SWEP.SprintSpeed_Orig = SWEP.SprintSpeed

--Damage
SWEP.Shots = 8
SWEP.Damage = 30
SWEP.Damage_Orig = SWEP.Damage
SWEP.PushForce = 2.5

--Shotgun Stuff
SWEP.ShotgunReload = 1

SWEP.ReloadSpeed = 1
SWEP.ReloadStartTime = 1.25
SWEP.InsertShellTime = 0.66
SWEP.ReloadFinishWait = 0.9

SWEP.Range = 700
SWEP.Range_Orig = SWEP.Range
SWEP.DamageDropOff = 0.55
SWEP.DamageDropOff_Orig = SWEP.DamageDropOff

SWEP.Chamberable = false
SWEP.SprintInSpeed = 1
SWEP.SprintLoopSpeed = 1
SWEP.SprintOutSpeed = 1

SWEP.RechamberTime = .7
SWEP.RechamberTime_Orig = SWEP.RechamberTime

SWEP.RechamberSpeed = 1
SWEP.RechamberSpeed_Orig = SWEP.RechamberSpeed

-- Bodygroups
SWEP.SightBGs = {main = 1, none = 1}
SWEP.MuzzleBGs = {main = 0, normal = 0, off = 0}
SWEP.GripBGs = {main = 0, normal = 0}
SWEP.HandBGs = {main = 0, normal = 1}

--Draw/Holster
SWEP.DrawSpeed = 1
SWEP.HolsterSpeed = 1

SWEP.FirstDeployTime = 2
SWEP.DeployTime = 0.75
SWEP.HolsterTime = 0.8

--Sounds
CustomizableWeaponry:addFireSound("MW3_spas12_FIRE", {
"ma85_mw3/weapons/spas12/fire.wav",
}, .4, 90, CHAN_WEAPON, 100, 100)

CustomizableWeaponry:addReloadSound("mw3_spas12_LIFT", "ma85_mw3/weapons/spas12/lift.wav")
CustomizableWeaponry:addReloadSound("mw3_spas12_SHELL", "ma85_mw3/weapons/spas12/shell.wav")

CustomizableWeaponry:addReloadSound("mw3_spas12_OPEN", "ma85_mw3/weapons/spas12/open.wav")
CustomizableWeaponry:addReloadSound("mw3_spas12_CLOSE", "ma85_mw3/weapons/spas12/close.wav")

SWEP.LoopFireSound = false
SWEP.FireSound = "MW3_spas12_FIRE"
SWEP.FireSoundSuppressed = "MW3_SIL_SHOTGUN"

SWEP.Sounds = {
reg_draw = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

reg_rechamber = {
[1] = {time = 0, sound = "MW3_spas12_OPEN"},
[2] = {time = 0.2, sound = "MW3_spas12_CLOSE"},
},

reg_ads_rechamber = {
[1] = {time = 0, sound = "MW3_spas12_OPEN"},
[2] = {time = 0.2, sound = "MW3_spas12_CLOSE"},
},

reg_reload_start = {
[1] = {time = 0, sound = "MW3_spas12_LIFT"},
[2] = {time = 0.75, sound = "MW3_spas12_SHELL"},
},

reg_reload_loop = {
[1] = {time = 0.3, sound = "MW3_spas12_SHELL"},
},

reg_reload_end = {
[1] = {time = 0, sound = "MW3_spas12_LIFT"},
[2] = {time = 0.15, sound = "MW3_spas12_OPEN"},
[3] = {time = 0.35, sound = "MW3_spas12_CLOSE"},
},

grip_draw = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

grip_rechamber = {
[1] = {time = 0, sound = "MW3_spas12_OPEN"},
[2] = {time = 0.2, sound = "MW3_spas12_CLOSE"},
},

grip_ads_rechamber = {
[1] = {time = 0, sound = "MW3_spas12_OPEN"},
[2] = {time = 0.2, sound = "MW3_spas12_CLOSE"},
},

grip_reload_start = {
[1] = {time = 0, sound = "MW3_spas12_LIFT"},
[2] = {time = 0.75, sound = "MW3_spas12_SHELL"},
},

grip_reload_loop = {
[1] = {time = 0.3, sound = "MW3_spas12_SHELL"},
},

grip_reload_end = {
[1] = {time = 0, sound = "MW3_spas12_LIFT"},
[2] = {time = 0.15, sound = "MW3_spas12_OPEN"},
[3] = {time = 0.35, sound = "MW3_spas12_CLOSE"},
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