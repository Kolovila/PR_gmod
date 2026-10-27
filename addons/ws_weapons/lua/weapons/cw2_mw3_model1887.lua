if not CustomizableWeaponry then return end

SWEP.magType = "shoMag"
SWEP.wpnSize = "medium"
SWEP.wpnEmptyType = "smg"

SWEP.WpnName = loc('mw3_sho_model1887')

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

SWEP.SafePos = Vector(0.33, -3.273, -1.16)
SWEP.SafeAng = Vector(-14.487, 29.179, -32.1)

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

	SWEP.IronsightPos = Vector(-3.095, -3.2477, 1.3817)
	SWEP.IronsightAng = Vector(0, 0, 0)

--Select and kill icon (Temporary)
SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw2_mw3_model1887")
killicon.Add("cw2_mw3_model1887", "mw3_icons/hud/hud_model1887", Color(255, 255, 255, 0))

--Worldmodel Information
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/ma85_mw3/m1887/worldmodel.mdl"
SWEP.WMPos = Vector( -15, -0.5, 4.5)
SWEP.WMAng = Vector(-5, 88, 175)

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
SWEP.ShellDelay = 0.7
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

SWEP.AttachmentModelsVM = {}

SWEP.AttachmentModelsWM = {}

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
draw_first = "reg_draw_first",
holster = "reg_holster",
sprint_in = "reg_sprint_in",
sprint = "reg_sprint",
sprint_out = "reg_sprint_out",

aim_in = "reg_idle",
aim_out = "reg_idle",
customize_in = "reg_idle",
}

SWEP.Animations_Normal = SWEP.Animations

--Customization Information
SWEP.CustomizationMenuScale = 0.014

SWEP.Attachments = {
[1] = {header = loc('mw3_category_proficiency'), offset = {-100, 0}, atts = {
"mw3_prof_kick",
"mw3_prof_range",
"mw3_prof_damage",

--"mw3_prof_impact",
--"mw3_prof_melee",
--"mw3_prof_speed",
}},

["+attack2"] = {header = loc('mw3_category_camo'), offset = {-100, 300}, atts = {
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
	"models/ma85_mw3/m1887/mtl_weapon_model_1887_iw5",
	},
	
	marine = {
	"models/ma85_mw3/m1887/camo/marine",
	},	
	
	winter = {
	"models/ma85_mw3/m1887/camo/winter",
	},	

	classic = {
	"models/ma85_mw3/m1887/camo/classic",
	},	
	
	snow = {
	"models/ma85_mw3/m1887/camo/snow",
	},	
	
	multi = {
	"models/ma85_mw3/m1887/camo/multi",
	},	
	
	digital = {
	"models/ma85_mw3/m1887/camo/digital",
	},	
	
	hex = {
	"models/ma85_mw3/m1887/camo/hex",
	},	
	
	choco = {
	"models/ma85_mw3/m1887/camo/choco",
	},	
	
	snake = {
	"models/ma85_mw3/m1887/camo/snake",
	},	
	
	blue = {
	"models/ma85_mw3/m1887/camo/blue",
	},	
	
	red = {
	"models/ma85_mw3/m1887/camo/red",
	},	
	
	autumn = {
	"models/ma85_mw3/m1887/camo/autumn",
	},	
	
	gold = {
	"models/ma85_mw3/m1887/camo/gold",
	},	

}

--Other information
SWEP.SpeedDec = 10 --Speed decrease on equip

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
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
SWEP.ViewModel = "models/ma85_mw3/m1887/viewmodel.mdl"
SWEP.WorldModel = "models/ma85_mw3/m1887/worldmodel.mdl"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 7
SWEP.Primary.ClipSize_Ext = 14
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 6
SWEP.Primary.Automatic = false
SWEP.Primary.Automatic_Orig = SWEP.Primary.Automatic
SWEP.Primary.Ammo = "buckshot"

SWEP.FireDelay = 60/165
SWEP.FireDelay_Orig = SWEP.FireDelay

SWEP.Recoil = 1
SWEP.RecoilLeft = -0.25
SWEP.RecoilRight = 1
SWEP.Recoil_Orig = SWEP.Recoil

SWEP.RecoilToSpread = 2
SWEP.RecoilToSpread_Orig = SWEP.RecoilToSpread
SWEP.ShotgunReloadState = 0

SWEP.HipSpread = 0.01
SWEP.HipSpread_Orig = SWEP.HipSpread
SWEP.AimSpread = 0
SWEP.AimSpread_Orig = SWEP.AimSpread

SWEP.ClumpSpread = 0.055
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
SWEP.FirstDeploy = true
SWEP.BoltActionLogic = true
SWEP.AimAnim = false
SWEP.NoShell = true
SWEP.StartReloadNoShellOnTacReload = true

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
SWEP.ReloadStartTime = 1.45
SWEP.InsertShellTime = 0.625
SWEP.ReloadFinishWait = 1.1

SWEP.Range = 700
SWEP.Range_Orig = SWEP.Range
SWEP.DamageDropOff = 0.33
SWEP.DamageDropOff_Orig = SWEP.DamageDropOff

SWEP.Chamberable = false
SWEP.SprintInSpeed = 1
SWEP.SprintLoopSpeed = 1
SWEP.SprintOutSpeed = 1

SWEP.RechamberTime = 0.75
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

SWEP.FirstDeployTime = 1
SWEP.DeployTime = 0.5
SWEP.HolsterTime = 0.5

--Sounds
CustomizableWeaponry:addFireSound("MW3_model1887_FIRE", {
"ma85_mw3/weapons/model1887/fire.wav",
}, .4, 90, CHAN_WEAPON, 100, 100)

CustomizableWeaponry:addReloadSound("mw3_model1887_LIFT", "ma85_mw3/weapons/model1887/lift.wav")
CustomizableWeaponry:addReloadSound("mw3_model1887_SHELL", "ma85_mw3/weapons/model1887/shell.wav")

CustomizableWeaponry:addReloadSound("mw3_model1887_OPEN", "ma85_mw3/weapons/model1887/open.wav")
CustomizableWeaponry:addReloadSound("mw3_model1887_CLOSE", "ma85_mw3/weapons/model1887/close.wav")

SWEP.LoopFireSound = false
SWEP.FireSound = "MW3_model1887_FIRE"
SWEP.FireSoundSuppressed = "MW3_SIL_SHOTGUN"

SWEP.Sounds = {
reg_draw = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

reg_draw_first = {
[1] = {time = 0, sound = "MW3_model1887_LIFT"},
[2] = {time = 0.2, sound = "MW3_model1887_OPEN"},
[3] = {time = 0.5, sound = "MW3_model1887_CLOSE"},
},

reg_rechamber = {
[1] = {time = 0.1, sound = "MW3_model1887_OPEN"},
[2] = {time = 0.35, sound = "MW3_model1887_CLOSE"},
},

reg_ads_rechamber = {
[1] = {time = 0.1, sound = "MW3_model1887_OPEN"},
[2] = {time = 0.35, sound = "MW3_model1887_CLOSE"},
},

reg_reload_start = {
[1] = {time = 0, sound = "MW3_model1887_LIFT"},
[2] = {time = 0.2, sound = "MW3_model1887_OPEN"},
[3] = {time = 1.15, sound = "MW3_model1887_SHELL"},
},

reg_reload_loop = {
[1] = {time = 0.35, sound = "MW3_model1887_SHELL"},
},

reg_reload_end = {
[1] = {time = 0, sound = "MW3_model1887_LIFT"},
[2] = {time = 0.4, sound = "MW3_model1887_CLOSE"},
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