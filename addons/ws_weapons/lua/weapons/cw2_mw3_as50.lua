if not CustomizableWeaponry then return end

SWEP.magType = "srMag"
SWEP.wpnSize = "large"
SWEP.wpnEmptyType = "rifle"
SWEP.isSniper = true

SWEP.WpnName = loc('mw3_sni_as50')

if CLIENT then

--Basic Information
SWEP.DrawCrosshair = false
SWEP.PrintName = SWEP.WpnName
SWEP.CSMuzzleFlashes = true
SWEP.MuzzleEffect = "muzzle_center_m82"
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

SWEP.ScopeReticle = surface.GetTextureID("mw3_reticles/scope")

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

	SWEP.IronsightPos = Vector(-3.7734, -5.4645, 0.7689)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.ACOGPos = Vector(-3.7693, 0.9281, 0.963)
	SWEP.ACOGAng = Vector(0, 0, 0)

	SWEP.ThermalPos = Vector(-3.7693, -9.1157, 1.1624)
	SWEP.ThermalAng = Vector(0, 0, 0)

--Select and kill icon (Temporary)
SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw2_mw3_as50")
killicon.Add("cw2_mw3_as50", "mw3_icons/hud/hud_as50", Color(255, 255, 255, 0))

--Worldmodel Information
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/ma85_mw3/as50/worldmodel.mdl"
SWEP.WMPos = Vector( -14, -0.5, 3.25)
SWEP.WMAng = Vector(-5, 88, 180)

-- LUA Recoil
SWEP.LuaViewmodelRecoil = false
SWEP.FullAimViewmodelRecoil = true
SWEP.DisableSprintViewSimulation = true
SWEP.LuaViewmodelRecoilOverride = true

SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 5, roll = 0, forward = -4, pitch = 1}

--Shell
SWEP.ShellScale = 0.75
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
["mw3_att_silencer"] = { type = "Model", model = "models/ma85_mw3/atts/silencer3.mdl", bone = "tag_silencer", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_silencer2"] = { type = "Model", model = "models/ma85_mw3/atts/silencer3.mdl", bone = "tag_silencer", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

["mw3_att_hbs"] = { type = "Model", model = "models/ma85_mw3/atts/hbs.mdl", bone = "tag_heartbeat", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_hbs2"] = { type = "Model", model = "models/ma85_mw3/atts/hbs.mdl", bone = "tag_heartbeat", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

--Scopes--
["mw3_att_acog"] = { type = "Model", model = "models/ma85_mw3/atts/acog.mdl", bone = "tag_acog_2", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_thermal"] = { type = "Model", model = "models/ma85_mw3/atts/thermal.mdl", bone = "tag_thermal_scope", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
--Proficiencies--
}

SWEP.AttachmentModelsWM = {
--Mods--
["mw3_att_silencer"] = { model = "models/ma85_mw3/atts/silencer3_world.mdl", bone ="Root", pos = Vector(0, -20, 0.35), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_silencer2"] = { model = "models/ma85_mw3/atts/silencer3_world.mdl", bone ="Root", pos = Vector(0, -20, 0.35), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

["mw3_att_hbs"] = { model = "models/ma85_mw3/atts/hbs_world.mdl", bone ="Root", pos = Vector(-0.8, 5, -0.3), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_hbs2"] = { model = "models/ma85_mw3/atts/hbs_world.mdl", bone ="Root", pos = Vector(-0.8, 5, -0.3), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

--Scopes--
["mw3_att_acog"] = { model = "models/ma85_mw3/atts/acog_world.mdl", bone ="Root", pos = Vector(0, 6.5, 2.2), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_thermal"] = { model = "models/ma85_mw3/atts/thermal_world.mdl", bone ="Root", pos = Vector(0, 6.5, 2.35), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

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

SWEP.Animations_Normal = SWEP.Animations

--Customization Information
SWEP.CustomizationMenuScale = 0.0175

SWEP.AttPos = -150
SWEP.ReticlePos = SWEP.AttPos - 100

SWEP.AbilityPos = SWEP.AttPos + 150
SWEP.SkinPos = SWEP.AbilityPos + 150

SWEP.Attachments = {
["+attack"] = {header = loc('mw3_category_reticle'), offset = {300, -150}, atts = {
"mw3_reticle_target",
"mw3_reticle_delta",
"mw3_reticle_udot",
"mw3_reticle_mildot",
"mw3_reticle_omega",
"mw3_reticle_lambda",
}, dependencies = {
mw3_att_acog = true,
}},

[1] = {header = loc('mw3_category_attachment'), offset = {300, 100}, atts = {
"mw3_att_acog",
"mw3_att_silencer",
"mw3_att_hbs",
"mw3_att_mags",
"mw3_att_thermal",
"mw3_att_variable",
}},

[2] = {header = loc('mw3_category_proficiency'), offset = {300, 400}, atts = {
"mw3_prof_kick",
"mw3_prof_impact",
"mw3_prof_atts",
"mw3_prof_speed",
}},

[3] = {header = loc('mw3_category_attachment') .. " (" .. loc('mw3_category_proficiency') .. ")", offset = {1150, 400}, atts = {
"mw3_att_silencer2",
"mw3_att_hbs2",
"mw3_att_mags2",
}, dependencies = {
mw3_prof_atts = true,
}},

["+attack2"] = {header = loc('mw3_category_camo'), offset = {300, 700}, atts = {
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
	"models/ma85_mw3/as50/mtl_weapon_as50",
	},
	
	marine = {
	"models/ma85_mw3/as50/camo/marine",
	},	
	
	winter = {
	"models/ma85_mw3/as50/camo/winter",
	},	

	classic = {
	"models/ma85_mw3/as50/camo/classic",
	},	
	
	snow = {
	"models/ma85_mw3/as50/camo/snow",
	},	
	
	multi = {
	"models/ma85_mw3/as50/camo/multi",
	},	
	
	digital = {
	"models/ma85_mw3/as50/camo/digital",
	},	
	
	hex = {
	"models/ma85_mw3/as50/camo/hex",
	},	
	
	choco = {
	"models/ma85_mw3/as50/camo/choco",
	},	
	
	snake = {
	"models/ma85_mw3/as50/camo/snake",
	},	
	
	blue = {
	"models/ma85_mw3/as50/camo/blue",
	},	
	
	red = {
	"models/ma85_mw3/as50/camo/red",
	},	
	
	autumn = {
	"models/ma85_mw3/as50/camo/autumn",
	},	
	
	gold = {
	"models/ma85_mw3/as50/camo/gold",
	},	

}

--Other information
SWEP.SpeedDec = 10 --Speed decrease on equip

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "mw3_wpn_base"
SWEP.Category = "CW2 MW3" .. " " .. loc('mw3_category_sni')

SWEP.ViewModelMovementScale = 1

SWEP.ZoomAmount = 65
SWEP.ZoomAmount_Orig = SWEP.ZoomAmount
SWEP.AimViewModelFOV = 60
SWEP.BobScale = 0
SWEP.ReticleInactivityPostFire = 0

SWEP.Author = "Moka_Akashiya85"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.Instructions = ""

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/ma85_mw3/as50/viewmodel.mdl"
SWEP.WorldModel = "models/ma85_mw3/as50/worldmodel.mdl"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 5
SWEP.Primary.ClipSize_Ext = 7
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 6
SWEP.Primary.Automatic = false
SWEP.Primary.Automatic_Orig = SWEP.Primary.Automatic

SWEP.Primary.Ammo = "SniperRound"

SWEP.FireDelay = 60/200
SWEP.FireDelay_Orig = SWEP.FireDelay

SWEP.Recoil = 0.75
SWEP.RecoilLeft = 0.15
SWEP.RecoilRight = 0.75
SWEP.Recoil_Orig = SWEP.Recoil

SWEP.RecoilToSpread = 1
SWEP.RecoilToSpread_Orig = SWEP.RecoilToSpread
SWEP.ShotgunReloadState = 0

SWEP.HipSpread = 0.15
SWEP.HipSpread_Orig = SWEP.HipSpread
SWEP.AimSpread = -1
SWEP.AimSpread_Orig = SWEP.AimSpread

SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.3
SWEP.SpreadPerShot = 0.3
SWEP.SpreadPerShot_Orig = SWEP.SpreadPerShot
SWEP.SpreadCooldown = 0
SWEP.FOVPerShot = 0 --How much the FOV is increased per shot
SWEP.FireAnimSpeed = 1 --Percentage speed of fire animation
SWEP.CanRestOnObjects = false
SWEP.ReloadViewBobEnabled = false
SWEP.ADSFireAnim = true
SWEP.isSniper = true

SWEP.PenMod = 2
SWEP.PenMod_Orig = SWEP.PenMod

SWEP.SwayIntensity = 1
SWEP.AimSwayIntensity = .25

SWEP.ADSSpeed = .85
SWEP.ADSSpeed_Orig = SWEP.ADSSpeed

SWEP.ScopeSpeed = .25
SWEP.ScopeSpeed_Thermal = .35
SWEP.ScopeSpeed_Orig = SWEP.ScopeSpeed

SWEP.ADSWalkSpeed = 0.75
SWEP.ADSWalkSpeed_Orig = SWEP.ADSWalkSpeed

SWEP.SprintSpeed = 0.8
SWEP.SprintSpeed_Orig = SWEP.SprintSpeed

--Damage
SWEP.Shots = 1
SWEP.Damage = 98
SWEP.Damage_Orig = SWEP.Damage
SWEP.PushForce = 10

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.4 --Time when magazine is inserted/bullet is chambered
SWEP.ReloadTime_Empty = 3.4

SWEP.ReloadHalt = 3.56 --Time when reload is finished
SWEP.ReloadHalt_Empty = 4.46
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
SWEP.MuzzleBGs = {main = 2, normal = 0, off = 1}
SWEP.GripBGs = {main = 0, normal = 0}

--Draw/Holster
SWEP.DrawSpeed = 1
SWEP.HolsterSpeed = 1.25

SWEP.DeployTime = 0.9
SWEP.HolsterTime = 0.7

--Sounds
CustomizableWeaponry:addFireSound("MW3_as50_FIRE", {
"ma85_mw3/weapons/as50/fire.wav",
}, 0.75, 110, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addReloadSound("mw3_as50_RELOAD_1", "ma85_mw3/weapons/as50/lift.wav")
CustomizableWeaponry:addReloadSound("mw3_as50_RELOAD_2", "ma85_mw3/weapons/as50/magout.wav")
CustomizableWeaponry:addReloadSound("mw3_as50_RELOAD_3", "ma85_mw3/weapons/as50/magin.wav")
CustomizableWeaponry:addReloadSound("mw3_as50_RELOAD_4", "ma85_mw3/weapons/as50/open.wav")
CustomizableWeaponry:addReloadSound("mw3_as50_RELOAD_5", "ma85_mw3/weapons/as50/close.wav")

SWEP.LoopFireSound = false
SWEP.FireSound = "MW3_as50_FIRE"
SWEP.FireMechanicSound = "MW3_MECH_SNIPER"
SWEP.FireSoundSuppressed = "MW3_SIL_SNIPER"

SWEP.Sounds = {
reg_draw = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

reg_reload = {
[1] = {time = 0, sound = "MW3_as50_RELOAD_1"},
[2] = {time = 0.9, sound = "MW3_as50_RELOAD_2"},
[3] = {time = 2.25, sound = "MW3_as50_RELOAD_3"},
},

reg_reload_empty = {
[1] = {time = 0, sound = "MW3_as50_RELOAD_1"},
[2] = {time = 0.85, sound = "MW3_as50_RELOAD_2"},
[3] = {time = 2.25, sound = "MW3_as50_RELOAD_3"},
[4] = {time = 3, sound = "MW3_as50_RELOAD_4"},
[5] = {time = 3.2, sound = "MW3_as50_RELOAD_5"},
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