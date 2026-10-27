if not CustomizableWeaponry then return end

SWEP.magType = "pistolMag"
SWEP.wpnSize = "small"
SWEP.wpnEmptyType = "pistol"

SWEP.WpnName = loc('mw3_pis_usp')

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

SWEP.CustomizePos = Vector(6.88, -2.073, 1.12)
SWEP.CustomizeAng = Vector(21.361, 35.674, 25.371)

SWEP.CustomizePos_Akimbo = Vector(0, -4.511, -7.283)
SWEP.CustomizeAng_Akimbo = Vector(37.627, 0, 0)

SWEP.CustomizePos_Knife = Vector(6.88, -5.5, 0.12)
SWEP.CustomizeAng_Knife = SWEP.CustomizeAng

SWEP.CustomizePos_Orig = SWEP.CustomizePos
SWEP.CustomizeAng_Orig = SWEP.CustomizeAng

SWEP.SafePos = Vector(2.719, -7.637, -4.935)
SWEP.SafeAng = Vector(37.456, 2.292, 9.592)

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

	SWEP.IronsightPos = Vector(-1.7818, 0.2943, 1.3657)
	SWEP.IronsightAng = Vector(-1.1664, -0.0691, 0)

	SWEP.KnifePos = Vector(-1.6755, -1.4459, 0.1715)
	SWEP.KnifeAng = Vector(0.2447, 0.0955, 0)

--Select and kill icon (Temporary)
SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw2_mw3_usp45")
killicon.Add("cw2_mw3_usp45", "mw3_icons/hud/hud_usp_45", Color(255, 255, 255, 0))

--Worldmodel Information
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/ma85_mw3/usp45/worldmodel.mdl"
SWEP.WMPos = Vector( -14, -1, 2.25)
SWEP.WMAng = Vector(-5, 88, 177.5)

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
	["tag_knife"] = { scale = Vector(0, 0, 0), pos = Vector(-0.038, 2.628, -16.242), angle = Angle(-35.389, 0, 0) },
} 
}

SWEP.AttachmentModelsVM = {
--Mods--
["mw3_att_silencer"] = { type = "Model", model = "models/ma85_mw3/atts/silencer.mdl", bone = "tag_silencer", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.65, .65, .65) },
["mw3_att_knife"] = { type = "Model", model = "models/ma85_mw3/atts/knife.mdl", bone = "tag_knife", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(.875, .875, .875) },

}

SWEP.AttachmentModelsWM = {
--Mods--
["mw3_att_silencer"] = { model = "models/ma85_mw3/atts/silencer_world.mdl", bone ="Root", pos = Vector(0, 4.25, 0.35), angle = Vector(0,0,0), size = Vector(1, 1, 1) },

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

}

SWEP.Animations_Knife = {
fire = "tac_fire",
ads_fire = "tac_ads_fire",
reload = "tac_reload",
reload_empty = "tac_reload_empty",
idle = "tac_idle",
draw = "tac_draw",
holster = "tac_holster",
sprint_in = "tac_sprint_in",
sprint = "tac_sprint",
sprint_out = "tac_sprint_out",

melee = "tac_melee",
postmelee = "tac_melee_post",

}

SWEP.Animations_Akimbo = {
fire = "dw_left_fire",
fire_last = "dw_left_fire_last",

reload = "dw_left_reload",
reload_empty = "dw_left_reload_empty",

idle = "dw_left_idle",
draw = "dw_left_draw",
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
SWEP.CustomizationMenuScale = 0.0075

SWEP.Attachments = {
[1] = {header = loc('mw3_category_attachment'), offset = {0, 100}, atts = {
"mw3_att_silencer",
"mw3_att_akimbo",
"mw3_att_knife",
"mw3_att_mags",
}},

}

--Other information
SWEP.SpeedDec = 10 --Speed decrease on equip

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "mw3_wpn_base"
SWEP.Category = "CW2 MW3" .. " " .. loc('mw3_category_pis')

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
SWEP.ViewModel = "models/ma85_mw3/usp45/viewmodel.mdl"
SWEP.WorldModel = "models/ma85_mw3/usp45/worldmodel.mdl"

SWEP.ViewModel_AkimboL = "models/ma85_mw3/usp45/akimbo/viewmodel_left.mdl"
SWEP.ViewModel_AkimboR = "models/ma85_mw3/usp45/akimbo/viewmodel_right.mdl"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 12
SWEP.Primary.ClipSize_Ext = 18
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 6
SWEP.Primary.Automatic = false
SWEP.Primary.Automatic_Orig = SWEP.Primary.Automatic

SWEP.Primary.Ammo = "Pistol"

SWEP.FireDelay = 60/759
SWEP.FireDelay_Orig = SWEP.FireDelay

SWEP.Recoil = 0.3
SWEP.RecoilLeft = 1
SWEP.RecoilRight = 0.75
SWEP.Recoil_Orig = SWEP.Recoil

SWEP.RecoilToSpread = 2
SWEP.RecoilToSpread_Orig = SWEP.RecoilToSpread
SWEP.ShotgunReloadState = 0

SWEP.HipSpread = 0.005
SWEP.HipSpread_Orig = SWEP.HipSpread
SWEP.AimSpread = 0
SWEP.AimSpread_Orig = SWEP.AimSpread

SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.15
SWEP.SpreadPerShot = 0.15
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

SWEP.ADSWalkSpeed = 1
SWEP.ADSWalkSpeed_Orig = SWEP.ADSWalkSpeed

SWEP.SprintSpeed = 1
SWEP.SprintSpeed_Orig = SWEP.SprintSpeed

--Damage
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.Damage_Orig = SWEP.Damage
SWEP.PushForce = 2.5

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.2 --Time when magazine is inserted/bullet is chambered
SWEP.ReloadTime_Empty = 1.6

SWEP.ReloadHalt = 1.62 --Time when reload is finished
SWEP.ReloadHalt_Empty = 1.91

-- Akimbo
SWEP.ReloadTime_Akimbo = SWEP.ReloadTime
SWEP.ReloadTime_Empty_Akimbo = SWEP.ReloadTime_Empty

SWEP.ReloadHalt_Akimbo = SWEP.ReloadHalt
SWEP.ReloadHalt_Empty_Akimbo = SWEP.ReloadHalt_Empty

SWEP.SnapToIdlePostReload = false

SWEP.Range = 800
SWEP.Range_Orig = SWEP.Range
SWEP.DamageDropOff = 0.575
SWEP.DamageDropOff_Orig = SWEP.DamageDropOff

SWEP.Chamberable = false
SWEP.SprintInSpeed = 1
SWEP.SprintLoopSpeed = 1
SWEP.SprintOutSpeed = 1

-- Bodygroups
SWEP.SightBGs = {main = 0, none = 1}
SWEP.MuzzleBGs = {main = 0, normal = 0, off = 0}
SWEP.GripBGs = {main = 0, normal = 0}

--Draw/Holster
SWEP.DrawSpeed = 1
SWEP.HolsterSpeed = 1

SWEP.FirstDeployTime = 1.2
SWEP.DeployTime = 0.25
SWEP.HolsterTime = 0.4

--Sounds
CustomizableWeaponry:addFireSound("MW3_usp45_FIRE", {
"ma85_mw3/weapons/usp45/fire.wav",
}, 0.4, 90, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addReloadSound("mw3_usp45_RELOAD_1", "ma85_mw3/weapons/usp45/lift.wav")
CustomizableWeaponry:addReloadSound("mw3_usp45_RELOAD_2", "ma85_mw3/weapons/usp45/magout.wav")
CustomizableWeaponry:addReloadSound("mw3_usp45_RELOAD_3", "ma85_mw3/weapons/usp45/magin.wav")
CustomizableWeaponry:addReloadSound("mw3_usp45_RELOAD_4", "ma85_mw3/weapons/usp45/bolt.wav")

SWEP.LoopFireSound = false
SWEP.FireSound = "MW3_usp45_FIRE"
SWEP.FireMechanicSound = "MW3_MECH_D"
SWEP.FireSoundSuppressed = "MW3_SIL_PISTOL"

SWEP.Sounds = {
reg_draw = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

reg_reload = {
[1] = {time = 0, sound = "MW3_usp45_RELOAD_1"},
[2] = {time = 0.4, sound = "MW3_usp45_RELOAD_2"},
[3] = {time = 1.15, sound = "MW3_usp45_RELOAD_3"},
},

reg_reload_empty = {
[1] = {time = 0, sound = "MW3_usp45_RELOAD_1"},
[2] = {time = 0.4, sound = "MW3_usp45_RELOAD_2"},
[3] = {time = 1.15, sound = "MW3_usp45_RELOAD_3"},
[4] = {time = 1.4, sound = "MW3_usp45_RELOAD_4"},
},

tac_draw = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

tac_melee = {
[1] = {time = 0, sound = "MW3_KNIFE_SWING"},
},

tac_reload = {
[1] = {time = 0, sound = "MW3_usp45_RELOAD_1"},
[2] = {time = 0.2, sound = "MW3_usp45_RELOAD_2"},
[3] = {time = 1.05, sound = "MW3_usp45_RELOAD_3"},
},

tac_reload_empty = {
[1] = {time = 0, sound = "MW3_usp45_RELOAD_1"},
[2] = {time = 0.2, sound = "MW3_usp45_RELOAD_2"},
[3] = {time = 1.05, sound = "MW3_usp45_RELOAD_3"},
[4] = {time = 1.45, sound = "MW3_usp45_RELOAD_4"},
},

dw_left_draw = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

dw_left_draw_empty = {
[1] = {time = 0, sound = "MW3_RAISE"},
},

dw_left_reload = {
[1] = {time = 0, sound = "MW3_usp45_RELOAD_1"},
[2] = {time = 0.25, sound = "MW3_usp45_RELOAD_2"},
[3] = {time = 1, sound = "MW3_usp45_RELOAD_3"},
},

dw_left_reload_empty = {
[1] = {time = 0, sound = "MW3_usp45_RELOAD_1"},
[2] = {time = 0.25, sound = "MW3_usp45_RELOAD_2"},
[3] = {time = 1, sound = "MW3_usp45_RELOAD_3"},
[4] = {time = 1.6, sound = "MW3_usp45_RELOAD_4"},
},

dw_right_reload = {
[1] = {time = 0, sound = "MW3_usp45_RELOAD_1"},
[2] = {time = 0.25, sound = "MW3_usp45_RELOAD_2"},
[3] = {time = 1, sound = "MW3_usp45_RELOAD_3"},
},

dw_right_reload_empty = {
[1] = {time = 0, sound = "MW3_usp45_RELOAD_1"},
[2] = {time = 0.25, sound = "MW3_usp45_RELOAD_2"},
[3] = {time = 1, sound = "MW3_usp45_RELOAD_3"},
[4] = {time = 1.6, sound = "MW3_usp45_RELOAD_4"},
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