if not CustomizableWeaponry then return end

SWEP.magType = "smgMag"
SWEP.wpnSize = "small"
SWEP.wpnEmptyType = "smg"

SWEP.WpnName = loc('mw3_smg_ak74u')

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

	SWEP.HoloPos = Vector(-2.3323, -0.1941, -0.5245)
	SWEP.HoloAng = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-2.3189, -6.5183, 0.3016)
	SWEP.IronsightAng = Vector(0, 0.091, 0)

	SWEP.ReflexPos = Vector(-2.3388, -2.0655, -0.0664)
	SWEP.ReflexAng = Vector(0, 0, 0)

	SWEP.ACOGPos = Vector(-2.3401, 3.6908, -0.2114)
	SWEP.ACOGAng = Vector(0, 0, 0)

	SWEP.ThermalPos = SWEP.ReflexPos
	SWEP.ThermalAng = Vector(0, 0, 0)

--Select and kill icon (Temporary)
SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw2_mw3_ak74u")
killicon.Add("cw2_mw3_ak74u", "mw3_icons/hud/hud_aks74u", Color(255, 255, 255, 0))

--Worldmodel Information
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/ma85_mw3/ak74u/worldmodel.mdl"
SWEP.WMPos = Vector( -15.5, -0, 3)
SWEP.WMAng = Vector(-5, 88, 185)

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

--Scopes--
["mw3_att_reflex"] = { type = "Model", model = "models/ma85_mw3/atts/reflex.mdl", bone = "tag_red_dot", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_holo"] = { type = "Model", model = "models/ma85_mw3/atts/holo.mdl", bone = "tag_eotech", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_acog"] = { type = "Model", model = "models/ma85_mw3/atts/acog.mdl", bone = "tag_acog_2", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
["mw3_att_thermal"] = { type = "Model", model = "models/ma85_mw3/atts/thermal.mdl", bone = "tag_thermal_scope", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },
}

SWEP.AttachmentModelsWM = {
--Mods--
["mw3_att_silencer"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, -3, -0.4), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_silencer2"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, -3, -0.4), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

--Scopes--
["mw3_att_reflex"] = { model = "models/ma85_mw3/atts/reflex_world.mdl", bone ="Root", pos = Vector(0, 10, 1.75), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_holo"] = { model = "models/ma85_mw3/atts/holo_world.mdl", bone ="Root", pos = Vector(0, 10, 1.75), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_acog"] = { model = "models/ma85_mw3/atts/acog_world.mdl", bone ="Root", pos = Vector(0, 10, 1.75), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
["mw3_att_thermal"] = { model = "models/ma85_mw3/atts/thermal_world.mdl", bone ="Root", pos = Vector(0, 10, 1.75), angle = Vector(0,0,0), size = Vector(1, 1, 1) },
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
SWEP.CustomizationMenuScale = 0.01

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

[1] = {header = loc('mw3_category_attachment'), offset = {0, -25}, atts = {
"mw3_att_reflex",
"mw3_att_silencer",
"mw3_att_rapid_fire",
"mw3_att_acog",
"mw3_att_holo",
--"mw3_att_hamr",
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

}

include("cw2_mw3_all_shared.lua")

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
SWEP.ViewModel = "models/ma85_mw3/ak74u/viewmodel.mdl"
SWEP.WorldModel = "models/ma85_mw3/ak74u/worldmodel.mdl"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 30
SWEP.Primary.ClipSize_Ext = 45
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 6
SWEP.Primary.Automatic = true
SWEP.Primary.Automatic_Orig = SWEP.Primary.Automatic

SWEP.Primary.Ammo = "SMG1"

SWEP.FireDelay = 60/800
SWEP.FireDelay_Orig = SWEP.FireDelay

SWEP.Recoil = 0.4
SWEP.RecoilDown = -0.1
SWEP.RecoilLeft = 0.15
SWEP.RecoilRight = 0.45
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
SWEP.Damage = 30
SWEP.Damage_Orig = SWEP.Damage
SWEP.PushForce = 2.5

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.9 --Time when magazine is inserted/bullet is chambered
SWEP.ReloadTime_Empty = 2.9

SWEP.ReloadHalt = 2.6 --Time when reload is finished
SWEP.ReloadHalt_Empty = 3.4
SWEP.SnapToIdlePostReload = false

SWEP.Range = 1000
SWEP.Range_Orig = SWEP.Range
SWEP.DamageDropOff = 0.33
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
SWEP.HolsterSpeed = 1.5

SWEP.FirstDeployTime = 1.5
SWEP.DeployTime = 0.8
SWEP.HolsterTime = 0.4

--Sounds
CustomizableWeaponry:addFireSound("MW3_ak74u_FIRE", {
"ma85_mw3/weapons/ak74u/fire.wav",
}, 0.4, 90, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addReloadSound("mw3_ak74u_RELOAD_1", "ma85_mw3/weapons/ak74u/lift.wav")
CustomizableWeaponry:addReloadSound("mw3_ak74u_RELOAD_2", "ma85_mw3/weapons/ak74u/magout.wav")
CustomizableWeaponry:addReloadSound("mw3_ak74u_RELOAD_3", "ma85_mw3/weapons/ak74u/magin.wav")
CustomizableWeaponry:addReloadSound("mw3_ak74u_RELOAD_4", "ma85_mw3/weapons/ak74u/bolt.wav")

SWEP.LoopFireSound = false
SWEP.FireSound = "MW3_ak74u_FIRE"
SWEP.FireMechanicSound = "MW3_MECH_D"
SWEP.FireSoundSuppressed = "MW3_SIL_SMG"

SWEP.Sounds = {
reg_draw = {
[1] = {time = 0, sound = "MW3_RAISE_ALT"},
},

reg_draw_first = {
[1] = {time = 0, sound = "MW3_ak74u_RELOAD_1"},
[2] = {time = 0.45, sound = "MW3_ak74u_RELOAD_4"},
},

reg_reload = {
[1] = {time = 0, sound = "MW3_ak74u_RELOAD_1"},
[2] = {time = 0.6, sound = "MW3_ak74u_RELOAD_2"},
[3] = {time = 1.8, sound = "MW3_ak74u_RELOAD_3"},
},

reg_reload_empty = {
[1] = {time = 0, sound = "MW3_ak74u_RELOAD_1"},
[2] = {time = 0.6, sound = "MW3_ak74u_RELOAD_2"},
[3] = {time = 1.8, sound = "MW3_ak74u_RELOAD_3"},
[4] = {time = 2.5, sound = "MW3_ak74u_RELOAD_4"},
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