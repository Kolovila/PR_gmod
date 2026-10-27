if not CustomizableWeaponry then return end

SWEP.magType = "rocket"
SWEP.wpnSize = "heavy"
SWEP.wpnEmptyType = "pistol"

SWEP.WpnName = loc('mw3_lau_rpg')

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

SWEP.SafePos = Vector(-0.201, -0.784, -2.35)
SWEP.SafeAng = Vector(-7.31, 28.156, -35.432)

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

	SWEP.IronsightPos = Vector(0, 0, 0)
	SWEP.IronsightAng = Vector(0, 0, 0)

--Select and kill icon (Temporary)
SWEP.SelectIcon = surface.GetTextureID("vgui/entities/cw2_mw3_rpg7")
killicon.Add("mw3_rocket_rpg", "mw3_icons/hud/hud_rpg7", Color(255, 255, 255, 0))

--Worldmodel Information
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/ma85_mw3/rpg/worldmodel.mdl"
SWEP.WMPos = Vector( -14, -0.5, 3.5)
SWEP.WMAng = Vector(-5, 88, 180)

-- LUA Recoil
SWEP.LuaViewmodelRecoil = false
SWEP.FullAimViewmodelRecoil = true
SWEP.DisableSprintViewSimulation = true
SWEP.LuaViewmodelRecoilOverride = true

SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 5, roll = 0, forward = -4, pitch = 1}

--Shell
SWEP.ShellScale = 0
--SWEP.Shell = "smallshell"
SWEP.ShellOffsetMul = 1
SWEP.ShellPosOffset = {x = 0, y = 0, z = -1}

-- SWEP.ForegripOverride = true
-- SWEP.ForegripOverridePos = {
-- ["null"] = {},

-- ["customize"] = {
	-- ["j_shoulder_le"] = { scale = Vector(1.1, 1.1, 1.1), pos = Vector(-0.038, 2.628, -6.242), angle = Angle(-35.389, 0, 0) },
-- } 
-- }

SWEP.AttachmentModelsVM = {}

SWEP.AttachmentModelsWM = {}

SWEP.RoundBeltBoneNames = {
	"tag_clip",
}

end

SWEP.Animations = {
fire = "reg_fire",
ads_fire = "reg_fire",
reload_empty = "reg_reload",
idle = "reg_idle",
draw = "reg_draw",
holster = "reg_holster",
sprint_in = "reg_sprint_in",
sprint = "reg_sprint",
sprint_out = "reg_sprint_out",

aim_in = "reg_ads_in",
aim_out = "reg_ads_out",

}

SWEP.Animations_Normal = SWEP.Animations

--Customization Information
SWEP.CustomizationMenuScale = 0.0075

SWEP.Attachments = {
["+zoom"] = {header = loc('mw3_category_attachment'), offset = {10000, 100}, atts = {}},

}

--Other information
SWEP.SpeedDec = 10 --Speed decrease on equip

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "mw3_wpn_base"
SWEP.Category = "CW2 MW3" .. " " .. loc('mw3_category_lau')

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
SWEP.ViewModel = "models/ma85_mw3/rpg/viewmodel.mdl"
SWEP.WorldModel = "models/ma85_mw3/rpg/worldmodel.mdl"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * 3
SWEP.Primary.Automatic = false
SWEP.Primary.Automatic_Orig = SWEP.Primary.Automatic
SWEP.Primary.Ammo = "RPG_Round"

SWEP.FireDelay = 60/1000
SWEP.FireDelay_Orig = SWEP.FireDelay

SWEP.Recoil = 1
SWEP.RecoilLeft = 0.25
SWEP.RecoilRight = 0.25
SWEP.Recoil_Orig = SWEP.Recoil

SWEP.RecoilToSpread = 1
SWEP.RecoilToSpread_Orig = SWEP.RecoilToSpread
SWEP.ShotgunReloadState = 0

SWEP.HipSpread = 0.001
SWEP.HipSpread_Orig = SWEP.HipSpread
SWEP.AimSpread = 0
SWEP.AimSpread_Orig = SWEP.AimSpread

SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.01
SWEP.SpreadPerShot = 0.01
SWEP.SpreadPerShot_Orig = SWEP.SpreadPerShot
SWEP.SpreadCooldown = 0
SWEP.FOVPerShot = 0 --How much the FOV is increased per shot
SWEP.FireAnimSpeed = 1 --Percentage speed of fire animation
SWEP.CanRestOnObjects = false
SWEP.ReloadViewBobEnabled = false
SWEP.ADSFireAnim = true
SWEP.AimAnim = true
SWEP.FirstDeploy = false
SWEP.MustAimToFire = true
SWEP.isLauncher = true

SWEP.PenMod = 0
SWEP.PenMod_Orig = SWEP.PenMod

SWEP.SwayIntensity_Orig = 0.25
SWEP.SwayIntensity = SWEP.SwayIntensity_Orig
SWEP.AimSwayIntensity = .25

SWEP.ADSSpeed = 1
SWEP.ADSSpeed_Orig = SWEP.ADSSpeed
SWEP.ADSTime = 0.35

SWEP.ADSWalkSpeed = .65
SWEP.ADSWalkSpeed_Orig = SWEP.ADSWalkSpeed

SWEP.SprintSpeed = .75
SWEP.SprintSpeed_Orig = SWEP.SprintSpeed

--Damage
SWEP.Shots = 1
SWEP.Damage = 200
SWEP.Damage_Orig = SWEP.Damage
SWEP.PushForce = 2.5

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.6 --Time when magazine is inserted/bullet is chambered
SWEP.ReloadTime_Empty = SWEP.ReloadTime

SWEP.ReloadHalt = 3.29 --Time when reload is finished
SWEP.ReloadHalt_Empty = SWEP.ReloadHalt
SWEP.SnapToIdlePostReload = false

SWEP.Range = 10000
SWEP.Range_Orig = SWEP.Range

SWEP.DamageDropOff = 0
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

SWEP.DeployTime = 0.8
SWEP.HolsterTime = 0.67

--Sounds
CustomizableWeaponry:addFireSound("MW3_rpg7_FIRE", {
"ma85_mw3/weapons/rpg7/fire.wav",
}, 1, 90, CHAN_WEAPON, 95, 110)

CustomizableWeaponry:addReloadSound("mw3_rpg7_RELOAD_1", "ma85_mw3/weapons/rpg7/lift.wav")
CustomizableWeaponry:addReloadSound("mw3_rpg7_RELOAD_2", "ma85_mw3/weapons/rpg7/insert.wav")
CustomizableWeaponry:addReloadSound("mw3_rpg7_RELOAD_3", "ma85_mw3/weapons/rpg7/twist.wav")

SWEP.LoopFireSound = false
SWEP.FireSound = "MW3_rpg7_FIRE"
SWEP.FireSoundSuppressed = "MW3_SIL_PISTOL"

SWEP.Sounds = {
reg_draw = {
[1] = {time = 0, sound = "MW3_RAISE_ALT2"},
},

reg_reload = {
[1] = {time = 0, sound = "MW3_rpg7_RELOAD_1"},
[2] = {time = 0.8, sound = "MW3_rpg7_RELOAD_2"},
[3] = {time = 1.35, sound = "MW3_rpg7_RELOAD_3"},
},

}


if CLIENT then
	local function removeRoundMeshes(wep)
		wep:adjustVisibleRounds(0)
	end
	
	local function adjustMeshByMaxAmmo(wep)
		wep:adjustVisibleRounds(wep.Owner:GetAmmoCount(wep.Primary.Ammo) + wep:Clip1())
	end

	SWEP.Sounds.reg_reload[1].callback = adjustMeshByMaxAmmo
end

function SWEP:IndividualThink()

local attachment = self.ActiveAttachments


if CLIENT then

	-- if self.dt.State == CW_CUSTOMIZE then
		-- self.ForegripParent = "customize"
	-- else
		-- self.ForegripParent = "null"
	-- end

end

end