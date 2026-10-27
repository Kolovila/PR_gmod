-- Related to the customization screen. Uncomment to modify for this base specifically.
--Gradients
if CLIENT then
	local headergradient = surface.GetTextureID("mw3_icons/gradient/header")
	local descgradient = surface.GetTextureID("mw3_icons/gradient/desc")
	local triviagradient = surface.GetTextureID("mw3_icons/gradient/desc")

	SWEP.CusMenuHeaderGradient = headergradient
	SWEP.CusMenuDescGradient = descgradient
	SWEP.CusMenuGradientTrivia = triviagradient
end

--Attachment Name Text
SWEP.CusMenuAttNameFont = "CW_HUD36"
SWEP.CusMenuAttNamePos = {X = -1, Y = -20}
SWEP.CusMenuAttNameCol = CustomizableWeaponry.textColors.REGULAR
SWEP.CusMenuAttNameAlignment = {X = TEXT_ALIGN_LEFT, Y = TEXT_ALIGN_CENTER}

SWEP.CusMenuAttNameShortPos = {X = 0, Y = 0}
SWEP.CusMenuAttNameShortAlignment = {X = TEXT_ALIGN_LEFT, Y = TEXT_ALIGN_CENTER}

--Attachment Category
SWEP.CusMenuAttCategoryFont = "CW_HUD48"
SWEP.CusMenuAttCategoryPos = {X = 0, Y = 20}
SWEP.CusMenuAttCategoryAlignment = {X = TEXT_ALIGN_LEFT, Y = TEXT_ALIGN_CENTER}

SWEP.CusMenuAttNameSeperateFromBind = false

SWEP.CusMenuAttCategoryNameFont = "CW_HUD48"
SWEP.CusMenuAttCategoryNamePos = {X = 400, Y = 20}
SWEP.CusMenuAttCategoryNameAlignment = {X = TEXT_ALIGN_LEFT, Y = TEXT_ALIGN_CENTER}

--Header
SWEP.CusMenuHeaderPos = {X = -8, Y = -3}
SWEP.CusMenuHeaderSize = {X = 975, Y = 175}
SWEP.CusMenuHeaderCol = {R = 0, G = 0, B = 0, Alpha = 200}

--Description
SWEP.CusMenuDescPos = {X = -5, Y = 175}
SWEP.CusMenuDescSize = {X = 50, Y = 975}
SWEP.CusMenuDescCol = {R = 100, G = 255, B = 100, Alpha = 255}
SWEP.CusMenuDescFont = "CW_HUD38"
SWEP.CusMenuDescTextPos = {X = 1, Y = 185}

--Attachment Icons
SWEP.CusMenuAttIconAlignment = 125

SWEP.CusMenuAttIconColAct = {R = 100, G = 255, B = 100, Alpha = 150}
SWEP.CusMenuAttIconOutlineCol = {R = 255, G = 255, B = 255, Alpha = 100}

SWEP.CusMenuAttIconBG = {R = 0, G = 0, B = 0, Alpha = 0}
SWEP.CusMenuAttIconBGLocked = {R = 255, G = 175, B = 175, Alpha = 150}

SWEP.CusMenuAttIconOutline = false
SWEP.CusMenuAttIconOutlineThick = false
-- ↑If the outline of the attachment should be coloured instead of the usual in-border colour. Also if it should be thick or not.

--Trivia-related
SWEP.TriviaTextX = 0
SWEP.TriviaTextY = 0
SWEP.TriviaFont = "CW_HUD48"

SWEP.UseAltStats = true

--[[ You'll see a mish-mash of CamelCase and camelBack in here, since I used my SWB as the base for this and built on top of it
This is since when I coded SWB I was using CamelCase, over time I got used to camelBack, which is the reason for this inconsistency
But hey, as long as it's OOP, it shouldn't be that big of a problem
]]--

CW_IDLE = 0
CW_RUNNING = 1
CW_AIMING = 2
CW_ACTION = 3
CW_CUSTOMIZE = 4
CW_HOLSTER_START = 5
CW_HOLSTER_END = 6
CW_PRONE_BUSY = 7 -- entering/leaving prone state
CW_PRONE_MOVING = 8 -- crawling while prone
CW_AIMDOWN = 9		-- leaving ads

-- rather than a lot of 'or' statements, just make a table containing numeric indexes as keys that dictate when the weapon cannot be used
SWEP.InactiveWeaponStates = {
	[CW_RUNNING] = true,
	[CW_ACTION] = true,
	[CW_CUSTOMIZE] = true,
	[CW_HOLSTER_START] = true,
	[CW_HOLSTER_END] = true,
	[CW_PRONE_BUSY] = true,
	[CW_PRONE_MOVING] = true}


SWEP.InactiveWeaponStatesCrosshair = {
	[CW_RUNNING] = false,
	[CW_ACTION] = true,
	[CW_CUSTOMIZE] = true,
	[CW_HOLSTER_START] = true,
	[CW_HOLSTER_END] = true,
	[CW_PRONE_BUSY] = true,
	[CW_PRONE_MOVING] = true}

-- conditions in which the player can't customize his weapon
SWEP.NoCustomizeStates = {[CW_RUNNING] = false,
	[CW_ACTION] = true,
	[CW_HOLSTER_START] = true,
	[CW_HOLSTER_END] = true,
	[CW_PRONE_BUSY] = true,
	[CW_PRONE_MOVING] = true}

-- states in which you can switch to the altmode
SWEP.AltmodeToggleStates = {
	[CW_IDLE] = true,
	[CW_RUNNING] = true
}

SWEP.ToggleM203States = {[CW_IDLE] = true,
	[CW_RUNNING] = true}

SWEP.M203ReloadSounds = {[1] = {time = 0.3, sound = "CW_M203_OPEN"},
	[2] = {time = 0.4, sound = "CW_M203_REMOVE"},
	[3] = {time = 1.4, sound = "CW_M203_INSERT"},
	[4] = {time = 1.9, sound = "CW_M203_CLOSE"}}

SWEP.UGLReloadSounds = {[1] = {time = 0, sound = "WF_WPN_UGL_RELOAD"}}

SWEP.AttachmentEligibilityEnum = {
	ACTIVE_ATTACHMENT_EXCLUSION = -1,
	NEED_ATTACHMENTS = -2
}

SWEP.UnavailableAttachmentEnum = {
	NEED_ATTACHMENTS = -1,
	INCOMPATIBILITY = -2,
	INCOMPATIBLE_ATTACHMENT_PRESENT = -3,
	DEPENDENT_ATTACHMENT_NOT_PRESENT = -4,
	INCOMPATIBLE_CATEGORY_PRESENT = -5,
	DEPENDENT_CATEGORY_NOT_PRESENT = -6,
	PLAYER_DOES_NOT_HAVE_ATTACHMENT = -7,
	MISC_FAILURE = -8
}

SWEP.M203Anims = {idle_to_ready = "Idle2Fire",
ready_to_idle = "Fire2Idle",
reload = "reload"}

if SERVER then
	include("sv_filestodownload.lua")
end

AddCSLuaFile()
AddCSLuaFile("sh_bullets.lua")
AddCSLuaFile("cl_model.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("cl_hooks.lua")
AddCSLuaFile("cl_calcview.lua")
AddCSLuaFile("sh_ammotypes.lua")
AddCSLuaFile("sh_move.lua")
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_anims.lua")
AddCSLuaFile("cl_playerbindpress.lua")
AddCSLuaFile("sh_attachments.lua")
AddCSLuaFile("sh_general.lua")
AddCSLuaFile("cl_umsgs.lua")
AddCSLuaFile("cl_cvars.lua")
AddCSLuaFile("sh_mixins.lua")
AddCSLuaFile("sh_stats.lua")
AddCSLuaFile("sh_plugininit.lua")
AddCSLuaFile("sh_hooks.lua")
AddCSLuaFile("sh_attachmentstats.lua")
AddCSLuaFile("sh_gamepadbuttons.lua")

include("sh_bullets.lua")
include("sh_ammotypes.lua")
include("sh_move.lua")
include("sh_sounds.lua")
include("sh_anims.lua")
include("sh_attachments.lua")
include("sh_general.lua")
include("sh_mixins.lua")
include("sh_stats.lua")
include("sh_plugininit.lua")
include("sh_hooks.lua")
include("sh_attachmentstats.lua")
include("sh_gamepadbuttons.lua")

if CLIENT then
	include("cl_calcview.lua")
	include("cl_playerbindpress.lua")
	include("cl_model.lua")
	include("cl_hud.lua")
	include("cl_hooks.lua")
	include("cl_umsgs.lua")
	include("cl_cvars.lua")



	SWEP.CustomizePos = Vector(5.488, -1.627, -1.821)
	SWEP.CustomizeAng = Vector(17.009, 29.971, 16.669)

	SWEP.SprintPos = Vector(1.786, 0, 0)
	SWEP.SprintAng = Vector(-10.778, 27.573, 0)

	SWEP.SwimPos = Vector(1.2, 1.5, -1)
	SWEP.SwimAng = Vector(-14, 17.4, -26.3)

	SWEP.JumpPos = Vector(1.786, 0, 0)
	SWEP.JumpAng = Vector(-10.778, 27.573, 0)

	SWEP.PronePos = Vector(6.717, -6.273, -6.577)
	SWEP.ProneAng = Vector(5.618, 49.055, -15.311)

	SWEP.JumpPos = Vector(0.349, 0, -0.532)
	SWEP.JumpAng = Vector(-3.494, -0.496, -22.06)

	SWEP.IronsightPos = Vector(-3.6521, -1.6502, 1.3769)
	SWEP.IronsightAng = Vector(0.0994, 0, 0)

	--Movement Values
	-- TODO condense these into Vectors if possible
	SWEP.WalkingMovePosX = 0 --Left/Right
	SWEP.WalkingMovePosY = -0.5 --Front/Back (Default 1)
	SWEP.WalkingMovePosZ = -1 --Up/Down

	SWEP.WalkingMoveAngX = 1 --Pitch Up/Down
	SWEP.WalkingMoveAngY = 1 --Angle Left/Right (Default 1)
	SWEP.WalkingMoveAngZ = 1 --Rolling Left/Right

	SWEP.SprintMovePosX = 1 --Left/Right
	SWEP.SprintMovePosY = 1 --Front/Back (Default 1)
	SWEP.SprintMovePosZ = 1 --Up/Down

	SWEP.SprintMoveAngX = 5 --Pitch Up/Down
	SWEP.SprintMoveAngY = 5 --Angle Left/Right (Default 5)
	SWEP.SprintMoveAngZ = 5 --Rolling Left/Right

	SWEP.MovingPosBack = 2

	SWEP.DrawCrosshair = false
	SWEP.BounceWeaponIcon = false
	SWEP.DrawWeaponInfoBox = false
	SWEP.CurFOVMod = 0
	SWEP.BobScale = 0
	SWEP.SwayScale = 0
	SWEP.ZoomAmount = 15
	SWEP.FadeCrosshairOnAim = true
	SWEP.DrawAmmo = true
	SWEP.DrawTraditionalWorldModel = true
	SWEP.CrosshairEnabled = true
	SWEP.CrosshairEnabled_Orig = SWEP.CrosshairEnabled
	SWEP.ViewbobEnabled = true
	SWEP.ViewbobIntensity = 1
	SWEP.ReloadViewBobEnabled = true
	SWEP.RVBPitchMod = 0
	SWEP.RVBYawMod = 0
	SWEP.RVBRollMod = 0
	SWEP.BulletDisplay = 0

	SWEP.Shell = "mainshell"
	SWEP.ShellScale = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}

	SWEP.CSMuzzleFlashes  = true
	SWEP.ZoomWait = 0
	SWEP.CrosshairParts = {left = true, right = true, upper = true, lower = true}
	SWEP.CrosshairParts_Orig = SWEP.CrosshairParts
	SWEP.FireModeDisplayPos = "none"
	SWEP.SelectFont = "CW_SelectIcons"
	killicon.Add("mw3_gl", "mw3_icons/hud/hud_40mmgrenade", Color(255, 0, 255, 191))
	killicon.Add("mw3_grenade_m203", "mw3_icons/hud/hud_40mmgrenade", Color(255, 0, 255, 191))
	killicon.Add("mw3_grenade_m320", "mw3_icons/hud/hud_40mmgrenade", Color(255, 0, 255, 191))
	killicon.Add("mw3_grenade_gp25", "mw3_icons/hud/hud_40mmgrenade", Color(255, 0, 255, 191))

	SWEP.ShellOffsetMul = 1
	SWEP.MuzzleAttachment = 1
	SWEP.CustomizeMenuAlpha = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.6
	SWEP.ForeGripOffsetCycle_Reload = 0.6
	SWEP.ForeGripOffsetCycle_Draw = 0.5
	SWEP.MuzzleEffectSupp = "muzzleflash_suppressed"
	SWEP.BipodAngleLimitYaw = 30
	SWEP.BipodAngleLimitPitch = 10
	SWEP.BipodSensitivity = {x = -0.3, z = -0.3, p = 0.1, r = 0.1}
	SWEP.LuaVMRecoilIntensity = 0
	SWEP.LuaVMRecoilLowerSpeed = 0
	SWEP.LuaVMRecoilMod = 1 -- modifier of overall intensity for the code based recoil

	SWEP.LuaVMRecoilAxisMod = {
	vert = 0,
	hor = 0,
	roll = 0,
	forward = 0,
	pitch = 0} -- modifier for intensity of the recoil on varying axes

	SWEP.LuaVMRecoilAxisMod_Orig = SWEP.LuaVMRecoilAxisMod

	SWEP.OffsetBoltOnBipodShoot = true
	SWEP.AimViewModelFOV = 60
	SWEP.CustomizationTab = 1
	SWEP.PresetPosition = 1
	SWEP.CustomizationMenuScale = 0.015
	SWEP.CanRestOnObjects = true
	SWEP.FireMoveMod = 1
	SWEP.M203Time = 0
	SWEP.FOVPerShot = 1
	SWEP.WorldMuzzleAttachmentID = 1
	SWEP.WorldShellEjectionAttachmentID = 2
	SWEP.HipFireFOVIncrease = false

	SWEP.HipSpread = 0
	SWEP.HipSpread_Orig = SWEP.HipSpread
	SWEP.AimSpread = 0
	SWEP.AimSpread_Orig = SWEP.AimSpread

	SWEP.MuzzleAttachmentName = "1"

	SWEP.LUAFireAnimAim = {
	vert = 0,
	hor = 0,
	roll = 1,
	forward = -3.5,
	pitch = 0}

	SWEP.LUAFireAnimRDS = {
	vert = 0,
	hor = 0,
	roll = 1,
	forward = -3.5,
	pitch = 0}

	SWEP.LUAFireAnimScope = {
	vert = 0,
	hor = 0,
	roll = 0,
	forward = -1,
	pitch = 0}

	SWEP.LUAFireAnimSniper = {
	vert = 0,
	hor = 0,
	roll = 0,
	forward = -1,
	pitch = 0}

	SWEP.AimBreathingIntensity = 1
	SWEP.CurBreatheIntensity = 1
	SWEP.MaxBreath = 1
	SWEP.MaxBreath_Orig = SWEP.MaxBreath
	SWEP.BreathLeft = SWEP.MaxBreath
	SWEP.BreathRegenRate = 0.15
	SWEP.BreathDrainRate = 0.1
	SWEP.BreathDrainRate_Orig = SWEP.BreathDrainRate
	SWEP.BreathIntensityDrainRate = 1
	SWEP.BreathIntensityRegenRate = 2
	SWEP.BreathHoldVelocityMinimum = 30 -- if our velocity surpasses this, we can't hold our breath
	SWEP.BreathDelay = 0.8
	SWEP.BreathRegenDelay = 0.5
	SWEP.MinimumBreathPercentage = 0.5 -- we can only hold our breath if our breath meter surpasses this
	SWEP.BreathIntensityOnRest = 0.5
	SWEP.BreathIntensityOnBipod = 0.2
	SWEP.BreathIntensitySwitchRate = 2 -- speed at which it switches from regular state to resting-weapon-on-something state (resting weapon/deployed bipod)
	SWEP.ReloadBoltBonePositionRecoverySpeed = 1
	SWEP.ReloadBoltBonePositionMoveSpeed = 25
	SWEP.BoltShootOffset = Vector(0, 0, 0)

	SWEP.SprintViewNormals = {x = 1, y = 1, z = 1}

	SWEP.breathWait = 0
	SWEP.breathRegenWait = 0
	SWEP.breathReleaseWait = 0

	SWEP.SwayIntensity_Orig = (SWEP.SwayIntensity or 1)
	SWEP.AimSwayIntensity = 0.6
	SWEP.HUD_3D2DScale = 0.015
	SWEP.CalcViewCamera = "Camera"
	SWEP.CalcViewCameraIntensity = 1

	SWEP.PresetResults = {}
	SWEP.elementRender = {}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
end

SWEP.FadeCrosshairOnAim = true
SWEP.CUSTOMIZATION_MENU_TOGGLE_WAIT = 0.2 -- the time to delay every action by when opening/closing the customization menu
SWEP.LoseAimVelocity = 1.35
SWEP.RunStateVelocity = 1.2
SWEP.ActiveAttachments = {}
SWEP._activeSequences = {}
SWEP.GlobalDelay = 0
SWEP.PresetLoadDelay = 0
SWEP.ForcedStateTime = 0
SWEP.BoltBonePositionRecoverySpeed = 40 -- how fast does the bolt bone move back into it's initial position after the weapon has fired

-- default values are 9x19MM, because we don't know what the user wants
SWEP.CaseLength = 19
SWEP.BulletDiameter = 9

SWEP.M203Chamber = true
SWEP.Grenade40MM = 0

SWEP.QuickScopeSpreadIncrease = 1

if SERVER then
	include("sv_hooks.lua")
	include("sv_attachments.lua")
end

SWEP.OverallMouseSens = 1
SWEP.AimMobilitySpreadMod = 1
SWEP.PenMod = 1
SWEP.AmmoPerShot = 1
SWEP.CW20Weapon = true
SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 50
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= ""
SWEP.WorldModel		= ""
SWEP.AnimPrefix		= "fist"

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.ClipSize		= -1				-- Size of a clip
SWEP.Primary.DefaultClip	= -1				-- Default number of bullets in a clip
SWEP.Primary.Automatic		= false				-- Automatic/Semi Auto
SWEP.Primary.Automatic_Orig		= SWEP.Primary.Automatic				-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1				-- Size of a clip
SWEP.Secondary.DefaultClip	= -1				-- Default number of bullets in a clip
SWEP.Secondary.Automatic	= true				-- Automatic/Semi Auto
SWEP.Secondary.Ammo			= "none"

SWEP.AddSpread = 0
SWEP.SpreadWait = 0
SWEP.AddSpreadSpeed = 1
SWEP.ReloadWait = 0
SWEP.ReloadSpeed = 1
SWEP.ReloadSpeed_Orig = SWEP.ReloadSpeed
SWEP.DrawSpeed = 1

SWEP.Chamberable = true

SWEP.UseHands = true

SWEP.CanPenetrate = true
SWEP.CanRicochet = true
SWEP.AddSafeMode = true
SWEP.SprintingEnabled = true
SWEP.NearWallEnabled = false
SWEP.AimingEnabled = true
SWEP.AccuracyEnabled = true
SWEP.HolsterUnderwater = true
SWEP.HolsterOnLadder = true
SWEP.HoldToAim = true
SWEP.FiremodesEnabled = true
SWEP.SuppressedOnEquip = false
SWEP.CanCustomize = true

SWEP.Recoil = 1
SWEP.Recoil_Orig = SWEP.Recoil
SWEP.RecoilDown_Orig = SWEP.RecoilDown
SWEP.RecoilLeft_Orig = SWEP.RecoilLeft
SWEP.RecoilRight_Orig = SWEP.RecoilRight
SWEP.Recoil_Bayonet = 5
SWEP.RecoilReturnToOrig = true

SWEP.ClumpSpread = 0
SWEP.ClumpSpread_Orig = SWEP.ClumpSpread

-- bipod-related
SWEP.BipodRecoilModifier = 0.3
SWEP.RestWeaponRecoilMult = 0.85
SWEP.BipodInstalled = false

-- SWEP.BurstCooldownMul = 1.75
SWEP.BurstSpreadIncMul = 0.5
SWEP.BurstRecoilMul = 0.85
SWEP.DeployTime = 1
-- SWEP.FirstDeployTime = 1
SWEP.Shots = 1
SWEP.FromActionToNormalWait = 0
SWEP.ShotgunReloadState = 0
SWEP.AltShotgunReloadState = 0
SWEP.ReloadSpeed = 1
SWEP.ReloadSpeed_Suppressed = 1
SWEP.FireAnimSpeed = 1
SWEP.FOVHoldTime = 0
SWEP.FOVTarget = 0
SWEP.BipodDeployTime = 0.25
SWEP.BipodUndeployTime = 0.25
SWEP.HolsterTime = 0.4
SWEP.HolsterTime_Orig = 0.4
SWEP.BipodDelay = 0
SWEP.HolsterWait = 0
SWEP.recoilRestoreWait = 0
SWEP.ForcedHipWaitTime = 0.25 -- this is how much time the player will have to wait before being able to aim again after shooting with SWEP.ForceBackToHipAfterAimedShot set to true

SWEP.ADSTime = 0.025
SWEP.ADSSpeed = 1
SWEP.ADSSpeed_Orig = SWEP.ADSSpeed

SWEP.ScopeSpeed = 0.15
SWEP.ScopeSpeed_Orig = SWEP.ScopeSpeed

SWEP.ZoomSpeed = 15
SWEP.ZoomSpeed_Orig = SWEP.ZoomSpeed

SWEP.ShowReloadPrompt = GetConVar("mw3_ammo_show_reload"):GetBool()
SWEP.ShowLowAmmoPrompt = GetConVar("mw3_ammo_show_lowammo"):GetBool()
SWEP.ShowEmptyPrompt = GetConVar("mw3_ammo_show_noammo"):GetBool()

-- height necessary to be able to deploy a bipod/rest a weapon on something
-- negative values to trace downwards
SWEP.BipodDeployHeightRequirement = -1.25
SWEP.WeaponRestHeightRequirement = -1

SWEP.RecoilToSpread = 0
SWEP.RecoilToSpread_Orig = SWEP.RecoilToSpread
SWEP.BusyProneVelocity = 30 -- max velocity after which we're considering the player to be crawling while prone
SWEP.ViewmodelProneVelocityMultiplier = 1

SWEP.SpreadPerShot = 0
SWEP.SpreadPerShot_Orig = SWEP.SpreadPerShot

SWEP.Menu_Non_Flash = 0
SWEP.SprintAnim = false
SWEP.FirstDeploy = false
SWEP.reloadSplitAnims = false
SWEP.AimAnim = true

SWEP.CustomVMArms = true
SWEP.CustomVMArmsPM = true
SWEP.CustomVMArmsCSSRig = false
SWEP.CustomVMArmsRig = "models/weapons/c_arms.mdl"
SWEP.CustomVMArmsCSSRig = "models/weapons/c_arms_cstrike.mdl"

-- Melee variables
SWEP.CanMelee = false
SWEP.drawAfterMelee = true -- Play the 'draw' animation after melee is complete

SWEP.Melee = {}

SWEP.Melee.Speed = 1		-- speed mod of the melee animation
SWEP.Melee.Speed_Bayonet = 1

SWEP.Melee.Delay = 0.5		-- length of the melee attack, before being able to do anything else
SWEP.Melee.Delay_Bayonet = 1

SWEP.Melee.Range = 75		-- range of a melee hit
SWEP.Melee.Damage = 100		-- damage of a melee hit

SWEP.Melee.AttackTime = 0.15	-- time before damage starts
SWEP.Melee.AttackTime_Bayonet = 0.3

SWEP.Melee.DamageTime = 0.1	-- time to trace for objects

SWEP.Melee.Force = 100	-- force of a melee hit
SWEP.Melee.PushVelocity = 100	-- velocity to push dyn objects

SWEP.Melee.Speed_Orig = SWEP.Melee.Speed
SWEP.Melee.Delay_Orig = SWEP.Melee.Delay
SWEP.Melee.Range_Orig = SWEP.Melee.Range
SWEP.Melee.Damage_Orig = SWEP.Melee.Damage
SWEP.Melee.AttackTime_Orig = SWEP.Melee.AttackTime

SWEP.Melee.HitAABB = {		-- vector to define the melee check trace
	Vector(-10, -5, -5),
	Vector(-10, 5, 5)
}

SWEP.Melee.ImpactDecal = "ManhackCut"
SWEP.Melee.PlayerHitSounds = {"MW3_KNIFE_HIT"}
SWEP.Melee.NPCHitSounds = {} -- key is npc class, value is table containing the sounds, if npc class key is not found within this table it will fall back to the sounds in PlayerHitSounds
SWEP.Melee.MiscHitSounds = {"MW3_KNIFE_HIT_WALL"}

SWEP.Melee.PlayerHitSounds_Orig = SWEP.Melee.PlayerHitSounds
SWEP.Melee.MiscHitSounds_Orig = SWEP.Melee.MiscHitSounds

-- Alt firemode variables
SWEP.Altmode = {}

SWEP.Altmode.ClipSize		= 1				-- Size of a clip
SWEP.Altmode.DefaultClip	= 1				-- Default number of bullets in a clip
SWEP.Altmode.Ammo			= "40MM"		-- 40Mm makes this a grenade launcher, all other ammos use normal damage values

SWEP.Altmode.FireSound		= "CW_GL_FIRE"

SWEP.Altmode.Damage			= 80			-- damage and spread for default guns, e.g. underbarrel shotgun
SWEP.Altmode.ClumpSpread	= 0.1
SWEP.Altmode.Shots			= 8

SWEP.Altmode.ReloadTime			= 1.7
SWEP.Altmode.ReloadHalt			= 2.4
SWEP.Altmode.ReloadTime_Empty	= SWEP.Altmode.ReloadTime
SWEP.Altmode.ReloadHalt_Empty	= SWEP.Altmode.ReloadHalt
SWEP.Altmode.ReloadSpeed		= 1
SWEP.Altmode.ReloadSpeed_Orig		= SWEP.Altmode.ReloadSpeed

SWEP.HasBeenGiven40MM = false
SWEP.HasBeenGivenBuckshot = false
local math = math

function SWEP:CalculateEffectiveRange()
	self.EffectiveRange = 1 -- setup realistic base effective range
	self.EffectiveRange = self.EffectiveRange * (self.Range or 100) * 39.37 / 40 * (self.RangeBoost or 1) -- convert meters to units
	-- for the sake of authenticity and realism I decided to keep the quarter/half decrease of the effective range off
	--self.EffectiveRange = self.EffectiveRange * 0.5
	self.DamageFallOff = (self.DamageDropOff or 0.5)
	self.PenStr = (self.BulletDiameter * 0.5 + self.CaseLength * 0.35) * (self.PenAdd and self.PenAdd or 1)
	self.PenetrativeRange = self.EffectiveRange * 0.75

	-- we need to save it once
	if not self.EffectiveRange_Orig then
		self.EffectiveRange_Orig = self.EffectiveRange
		self.DamageFallOff_Orig = self.DamageFallOff
		self.PenetrativeRange_Orig = self.PenetrativeRange
	end
end

function SWEP:getEffectiveRange()
	local EffectiveRange = 1 -- setup realistic base effective range
	EffectiveRange = EffectiveRange * (self.Range or 100) * 39.37 / 40 * (self.RangeBoost or 1) -- convert meters to units

	local DamageFallOff = (self.DamageDropOff or 0.5)
	local PenStr = (self.BulletDiameter * 0.5 + self.CaseLength * 0.35) * (self.PenAdd and self.PenAdd or 1)
	local PenetrativeRange = EffectiveRange * 0.5

	return EffectiveRange, DamageFallOff, PenStr, PenetrativeRange
end

local SP = game.SinglePlayer()
local tbl, tbl2

local validPlayerProneFunction = function(self)
	return self.Owner:IsProne()
end

local invalidPlayerProneFunction = function(self)
	return false
end

local validPlayerBusyProneFunction = function(self)
	return self.Owner:ProneIsGettingUp() or self.Owner:ProneIsGettingDown()
end

local invalidPlayerBusyProneFunction = function(self)
	return false
end

function SWEP:RenderTargetFunc() -- start of rendertargetfunc

end -- end of rendertargetfunc

function SWEP:Initialize()
	self:SetHoldType( self.NormalHoldType )
	self:setupBallisticsInformation()
	self:CalculateEffectiveRange()
	self.CHoldType = self.NormalHoldType

	if CLIENT then
		if not self.ScopeRT then
			local base = weapons.GetStored("cw_base") -- we only need to init the render target on the base
			base:initRenderTarget(CustomizableWeaponry:getRenderTargetSize(GetConVarNumber("cw_rt_scope_quality")))
			self.ScopeRT = base.ScopeRT
		end
	end

	-- a global that will surely never be misnamed
	if PRONE_GETTINGDOWN then -- we check whether prone mod exists this way, and then assign a valid prone check function to avoid a ton of ifs
		self.isPlayerProne = validPlayerProneFunction
		self.isPlayerEnteringProne = validPlayerBusyProneFunction
	else
		self.isPlayerProne = invalidPlayerProneFunction
		self.isPlayerEnteringProne = invalidPlayerBusyProneFunction
	end

	if not self.HoldToAim then
		self.Secondary.Automatic = false
	end
	self.Secondary.Automatic_Orig = self.Secondary.Automatic

	if self.AddSafeMode then
		table.insert(self.FireModes, #self.FireModes + 1, "safe")
	end

	t = self.FireModes[1]
	self.FireMode = t
	t = CustomizableWeaponry.firemodes.registeredByID[t]

	self.Primary.Auto = t.auto
	self.BurstAmount = t.burstamt

	self.CurCone = self.HipSpread

	-- set up original weapon stats
	CustomizableWeaponry.originalValue.assign(self)

	self.Primary.ClipSize_Orig = self.Primary.ClipSize
	self.Primary.ClipSize_ORIG_REAL = self.Primary.ClipSize -- this is the 'real' real original mag size, it is necessary for mag-size changing attachments

	if self.MuzzleVelocity then -- ENTER ONLY IN METER/S
		self.MuzzleVelocityConverted = self.MuzzleVelocity * 39.37
	end

	if self.FireSound then
		self.FireSound = Sound(CustomizableWeaponry:findFireSound(self.FireSound))
		self.FireSound_Orig = self.FireSound
	end

	if self.FireSoundSuppressed then
		self.FireSoundSuppressed = Sound(CustomizableWeaponry:findFireSound(self.FireSoundSuppressed))
		self.FireSoundSuppressed_Orig = self.FireSoundSuppressed
	end

	if CLIENT then
		self.RunTime = 0
		self.shouldUpdateAngles = true
		self.lastEyeAngle = EyeAngles()
		self.CurVMFOV = self.ViewModelFOV
		self.ViewModelFOV_Orig = self.ViewModelFOV
		self.ZoomAmount_Orig = self.ZoomAmount
		self.AimViewModelFOV = self.AimViewModelFOV and self.AimViewModelFOV or self.ViewModelFOV
		self.AimViewModelFOV_Orig = self.AimViewModelFOV
		self.BulletDisplay = t.buldis
		self.FireModeDisplay = t.display
		self.OverallMouseSens_Orig = self.OverallMouseSens
		self.AimBreathingEnabled_Orig = self.AimBreathingEnabled

		self.AimPos = self.IronsightPos
		self.AimAng = self.IronsightAng

		self.AimPos_Orig = self.AimPos
		self.AimAng_Orig = self.AimAng

		if self.WM then
			self.WMEnt = self:createManagedCModel(self.WM, RENDERGROUP_BOTH)
			self.WMEnt:SetNoDraw(true)
		end

		if self.Owner and IsValid(self.Owner) then
			self.HUD_LastHealth = self.Owner:Health()
			self.HUD_LastArmor = self.Owner:Armor()
		else
			self.HUD_LastHealth = 0
			self.HUD_LastArmor = 0
		end

		for k, v in pairs(self.Attachments) do
			v.keyText = type(k) == "number" and "(" .. k .. ") - " or self:getKeyBind(k) .. " - "
		end

		self._shellTable = CustomizableWeaponry.shells:getShell(self.Shell)
		self:createCustomVM(self.ViewModel)
		self:createGrenadeModel()
		self:setupAttachmentModels()
		self:setupBoneTable()
		self:setupReticleColors()

		-- this is not the right place to call this but...
		self:drawAnimFunc()

		self:setupCurrentIronsights(self.IronsightPos, self.IronsightAng)

		CustomizableWeaponry.cmodels:validate()

		CustomizableWeaponry.sightAdjustment:loadDefaultOffsets(self)

		self.ActualSightPos = self.IronsightPos
		self.ActualSightAng = self.IronsightAng
	end

	-- apply the default skin if needed
	if self.defaultSkin then
		self:applySkin( self.defaultSkin )
	end

	if self.DefaultCamo then
		self:applyCamo()
	end

	-- apply default attachments
	if self.DefaultAttachments then
		for cat, att in pairs(self.DefaultAttachments) do
			self:_attach( cat, att )
			self:checkAttachmentDependency()
		end
	end

	-- apply required attachments that are empty
	if self.AttachmentsRequired then
		for cat in pairs(self.AttachmentsRequired) do
			if not self.Attachments[cat].last then
				self:_attach( cat, 1 )
				self:checkAttachmentDependency()
			end
		end
	end
	CustomizableWeaponry.callbacks.processCategory(self, "initialize")

	self.holsterSound = true
	self.dt.Suppressed = self.SuppressedOnEquip

	self:IndividualInitialize()
end

function SWEP:Equip()
	if self.equipFunc then
		self:equipFunc()
	end
end

-- remove all ammo from mag and transfer to reserve
function SWEP:unloadWeapon()
	-- get the ammo in the mag
	local amt = self:Clip1()

	-- add it to the reserve and remove it from the mag
	self.Owner:SetAmmo(self.Owner:GetAmmoCount(self.Primary.Ammo) + amt, self.Primary.Ammo)
	self:SetClip1(0)
end

-- remove all ammo from mag and transfer to reserve
function SWEP:unloadWeaponPartially()
	-- get the ammo in the mag
	local amt = self:Clip1()

	-- add it to the reserve and remove it from the mag
	-- but only if the current magazine size is above the original, such as when extended magazines are equipped
	if amt >= (self.Primary.ClipSize_Orig +1) then
		self.Owner:SetAmmo(self.Owner:GetAmmoCount(self.Primary.Ammo) + (amt - self.Primary.ClipSize_Orig), self.Primary.Ammo)
		self:SetClip1(self.Primary.ClipSize_Orig)
	end
end

function SWEP:setBodygroup(main, sub)
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetBodygroup(main, sub)
	end

	if self.WMEnt then
		self.WMEnt:SetBodygroup(main, sub)
	end
end

function SWEP:SetupDataTables()
	self:DTVar("Int", 0, "State")
	self:DTVar("Int", 1, "Shots")
	self:DTVar("Float", 0, "HolsterDelay")
	self:DTVar("Bool", 0, "Suppressed")
	self:DTVar("Bool", 1, "Safe")
	self:DTVar("Bool", 2, "BipodDeployed")
	self:DTVar("Bool", 3, "AltActive")
	self:DTVar("Angle", 0, "ViewOffset")
	self:DTVar("String", 0, "CurrentSkin")
end

-- we have to do THIS fucking garbage because there is no distinction between DTVars and NWVars (look above) and therefore upon duplication of a spawned weapon object
-- it errors the fuck out because it ASSUMES that the weapon uses ONLY NWVars and calls non-existent Set<varName> functions
-- THANKS TO WHOEVER DECIDED THAT THERE SHOULD BE NO DISTINCTION BETWEEN DT AND NW VARS, IT REALLY IS SOME GOOD CODE PRACTICE RIGHT THERE
function SWEP:SetState(val)
	self.dt.State = val
end

function SWEP:SetShots(val)
	self.dt.Shots = val
end

function SWEP:SetHolsterDelay(val)
	self.dt.HolsterDelay = val
end

function SWEP:SetSuppressed(val)
	self.dt.Suppressed = val
end

function SWEP:SetSafe(val)
	self.dt.Safe = val
end

function SWEP:SetBipodDeployed(val)
	self.dt.BipodDeployed = val
end

function SWEP:SetM203Active(val)
	self.dt.M203Active = val
end

function SWEP:SetAltActive(val)
	self.dt.AltActive = val
end

function SWEP:SetViewOffset(val)
	self.dt.ViewOffset = val
end

local vm, CT, aim, cone, vel, CT, tr
local td = {}

function SWEP:OnDrop()
	self.FirstDeploy = true
	self.isFirstMagUsed = true
	self.dt.State = CW_IDLE
	self.dt.AltActive = false
	self.dt.HolsterDelay = 0
	self.Primary.Automatic = self.Primary.Automatic_Orig
	self.Altmode.Auto_Orig = nil
end

function SWEP:GetDeployTime()
	if self.FirstDeploy and self.Animations["draw_first"] then
		return self.FirstDeployTime
	else
		return self.DeployTime
	end
end

function SWEP:drawAnimationFunc()
	-- default first draw
	local anim = "draw"

	if self.dt.AltActive and self.Animations["alt_draw"] then
		anim = "alt_draw"
	end

	if self.FirstDeploy and self.Animations[anim .. "_first"] then
		anim = anim .. "_first"
	end

	if self.Animations[anim .. "_scope"] then
		for att,en in pairs(self.ActiveAttachments) do
			if en then
				local adata = CustomizableWeaponry:findAttachment( att )
				if adata.isSight then
					anim = anim .. "_scope"
					break
				end
			end
		end
	end
	
	if self.Animations[anim .. "_hb"] then
		for att,en in pairs(self.ActiveAttachments) do
			if en then
				local adata = CustomizableWeaponry:findAttachment( att )
				if adata.isHBS then
					anim = anim .. "_hb"
					break
				end
			end
		end
	end
	
	if self:Clip1() == 0 and self.Animations[anim .. "_empty"] then
		anim = anim .. "_empty"
	end
	
	-- print( anim )

	return anim
end

function SWEP:drawAnimation2Func()
	-- default first draw
	local anim = "draw"

	if self.FirstDeploy and self.Animations[anim .. "_first"] then
		anim = anim .. "_first"
	end

	if self:Clip2() == 0 and self.Animations[anim .. "_empty"] then
		anim = anim .. "_empty"
	end

	return anim
end

function SWEP:drawAnimFunc()
	self:sendWeaponAnim(self:drawAnimationFunc(), self.DrawSpeed, 0, true, -1)
	self:sendWeaponAnim(self:drawAnimation2Func(), self.DrawSpeed, 0, true, 1)
end

function SWEP:Deploy()
	self.holsterSound = true
	self.dt.State = CW_IDLE
	self.dt.HolsterDelay = 0
	CT = CurTime()

	local deployTime = CT + self:GetDeployTime() / self.DrawSpeed

	self:SetNextSecondaryFire(deployTime)
	self:SetNextPrimaryFire(deployTime)
	self.ReloadWait = deployTime
	self.HolsterWait = deployTime

	if IsFirstTimePredicted() then
		if CLIENT then
			self.CurSoundTable = nil
			self.CurSoundEntry = nil
			self.SoundTime = nil
			self.SoundSpeed = 1
		end

		-- first draw
		self:drawAnimFunc()
	end

	self.FirstDeploy = false

	if SP and SERVER then
		SendUserMessage("CW20_DEPLOY", self.Owner)
	end

	if CLIENT then
		self.lastEyeAngle = self.Owner:EyeAngles()
	end

	CustomizableWeaponry.callbacks.processCategory(self, "deployWeapon")

	self.SwitchWep = nil
	return true
end

function SWEP:HolsterAnim()
	anim = "holster"
	
	if self.dt.AltActive and self.Animations["alt_holster"] then
		anim = "alt_holster"
	end

	if self:Clip1() == 0 and self.Animations[anim .. "_empty"] then
		anim = anim .. "_empty"
	end

	return anim
end

function SWEP:Holster2Anim()
	anim = "holster"

	if self:Clip2() == 0 and self.Animations[anim .. "_empty"] then
		anim = anim .. "_empty"
	end

	return anim
end

function SWEP:Holster(wep)
	ent = ent or self.CW_VM
	-- can't switch if neither the weapon we want to switch to or the wep we're trying to switch to are not valid
	if not IsValid(wep) and not IsValid(self.SwitchWep) then
		self.SwitchWep = nil
		return false
	end

	local CT = CurTime()

	-- can't holster if we have a global delay on the weapon
	if CT < self.GlobalDelay or CT < self.HolsterWait then
		return false
	end

	if self.dt.HolsterDelay ~= 0 and CT < self.dt.HolsterDelay then
		return false
	end

	-- can't holster if there are sequenced actions
	if #self._activeSequences > 0 then
		return false
	end

	if self.ReloadDelay then
		return false
	end

	if self.dt.State ~= CW_HOLSTER_START then
		self.dt.HolsterDelay = CurTime() + self.HolsterTime
		self.GlobalDelay = CurTime() + self.HolsterTime
	end

	self.dt.State = CW_HOLSTER_START

	-- if holster sequence is over, let us select the desired weapon
	if self.SwitchWep and self.dt.State == CW_HOLSTER_START and CurTime() > self.dt.HolsterDelay then
		self.dt.State = CW_IDLE
		self.dt.HolsterDelay = 0

		return true
	end

	-- if it isn't, make preparations for it
	self.ShotgunReloadState = 0
	self.ReloadDelay = nil

	mag = self:Clip1()

	if self:filterPrediction() then
		if self.holsterSound then -- quick'n'dirty prediction fix
			self:EmitSound("CW_HOLSTER", 70, 100)
			self.holsterSound = false

			if IsFirstTimePredicted() then
				if self.holsterAnimFunc then
					self:holsterAnimFunc()
				else
					self:sendWeaponAnim(self:HolsterAnim(), self.HolsterSpeed, 0, false, -1)			
					self:sendWeaponAnim(self:Holster2Anim(), self.HolsterSpeed, 0, false, 1)
				end
			end
		end
	end

	self.SwitchWep = wep
	self.SuppressTime = nil

	if self.dt.M203Active then
		if SERVER and SP then
			SendUserMessage("CW20_M203OFF", self.Owner)
		end

		if CLIENT then
			self:resetM203Anim()
		end
	end

	self.dt.M203Active = false
end

local mag, ammo, mag2

function SWEP:Reload()
	CT = CurTime()

	if self.ReloadDelay or self.AltReloadDelay or CT < self.ReloadWait or self.dt.State == CW_ACTION or self.dt.State == CW_CUSTOMIZE or self.ShotgunReloadState != 0 then
		return
	end

	if CT < self.GlobalDelay then
		return
	end

	if self.FiremodesEnabled and self.Owner:KeyDown(IN_USE) and self.dt.State != CW_RUNNING then
		self:CycleFiremodes()
		return
	end

	if self.dt.Safe then
		return
	end
	
	if self:isAiming() then
		return
	end

	mag = self:Clip1()
	mag2 = self:Clip2()
	local cantReload, overrideMagCheck, overrideAmmoCheck = CustomizableWeaponry.callbacks.processCategory(self, "canReload", mag == 0)

	-- altmode reload logic
	if self.dt.AltActive then
		local mag = self:Clip2()

		-- nothing todo if the magazine is full
		if not overrideMagCheck then
			if mag == self.Secondary.ClipSize then
				return
			end
		end

		-- make sure we have required ammo
		if not overrideAmmoCheck then
			if self.Owner:GetAmmoCount(self.Secondary.Ammo) == 0 then
				return
			end
		end

		-- send lower aim so we reverse any model swaps
		if self.dt.State == CW_AIMING and SERVER then
			SendUserMessage( "CW_LOWERAIM", self.Owner )
		end

		self.dt.State = CW_IDLE

		if self.Owner:KeyPressed(IN_RELOAD) then
			self:beginAltReload()
		end

		return
	end		-- altmode reload logic end

	-- dualwield reload logic
	if self.isDualwield then
		-- nothing todo if the magazine is full
		if not self.RightReloadDelay then
			if overrideMagCheck or mag2 < self.Secondary.ClipSize then
				-- make sure we have required ammo
				if overrideAmmoCheck or self.Owner:GetAmmoCount(self.Secondary.Ammo) > 0 then
					-- send lower aim so we reverse any model swaps
					if self.dt.State == CW_AIMING and SERVER then
						SendUserMessage( "CW_LOWERAIM", self.Owner )
					end

					self.dt.State = CW_IDLE
					
					local ammo = self.Owner:GetAmmoCount(self.Primary.Ammo)
					local clips = self.Primary.ClipSize
					local clip = self:Clip1()
					
					if self.Owner:KeyPressed(IN_RELOAD) then
						if (ammo > clips - clip) then
							self:beginRightReload()
						end
					end
				end
			end
		end
	end		-- dualwield reload logic end
	if cantReload then
		return
	end

	if not overrideMagCheck then
		if (self.Chamberable and mag >= self.Primary.ClipSize_Orig + 1) then
			return
		end
	end

	if not overrideAmmoCheck then
		if self.Owner:GetAmmoCount(self.Primary.Ammo) == 0 then
			return
		end
	end

	if not self.Chamberable and mag >= self.Primary.ClipSize then
		return
	end

	-- send lower aim so we reverse any model swaps
	if self.dt.State == CW_AIMING and SERVER then
		SendUserMessage("CW_LOWERAIM", self.Owner)
	end

	self.dt.State = CW_IDLE
	self.dt.M203Active = false

	if self.Owner:KeyPressed(IN_RELOAD) then
		self:beginReload()
	end
end

function SWEP:ReloadAnimation()
	local anim = "reload"

	if mag == 0 then
		if self.Animations[anim .. "_empty"] then
			anim = anim .. "_empty"
		end
	end

	if self.Animations[anim .. "_scope"] then
		for att,en in pairs(self.ActiveAttachments) do
			if en then
				local adata = CustomizableWeaponry:findAttachment( att )
				if adata.isSight then
					anim = anim .. "_scope"
					break
				end
			end
		end
	end
	
	if self.Animations[anim .. "_hb"] then
		for att,en in pairs(self.ActiveAttachments) do
			if en then
				local adata = CustomizableWeaponry:findAttachment( att )
				if adata.isHBS then
					anim = anim .. "_hb"
					break
				end
			end
		end
	end
	
	if self.dt.AltActive then
		if self.Animations["alt_reload"] then
			anim = "alt_reload"
		end
	end

return anim

end

function SWEP:Reload2Animation()
	local anim = "reload"

	if self:Clip2() == 0 then
		if self.Animations[anim .. "_empty"] then
			anim = anim .. "_empty"
		end
	end

return anim

end

function SWEP:ReloadBeginAnimation()
local anim = "reload_start"

	if mag == 0 then
		if self.Animations[anim .. "_empty"] then
			anim = anim .. "_empty"
		end
	end

	if self.Animations[anim .. "_scope"] then
		-- go through ActiveAttachments table
		for att,en in pairs(self.ActiveAttachments) do
			-- check if really active
			if en then
				local adata = CustomizableWeaponry:findAttachment( att )
				-- override anim if applicable for attachment
				if adata.isScope then
					anim = anim .. "_scope"
					break
				end
			end
		end
	end
	
	return anim
end

function SWEP:ReloadEndAnimation()
local anim = "reload_end"

	if self.Animations[anim .. "_scope"] then
		-- go through ActiveAttachments table
		for att,en in pairs(self.ActiveAttachments) do
			-- check if really active
			if en then
				local adata = CustomizableWeaponry:findAttachment( att )
				-- override anim if applicable for attachment
				if adata.isScope then
					anim = anim .. "_scope"
					break
				end
			end
		end
	end

	return anim
end

function SWEP:beginReload()
	mag = self:Clip1()

	if CLIENT then
		self:adjustVisibleRounds(0)
	end

	if self.ShotgunReload then
		local time = CT + self.ReloadStartTime / self.ReloadSpeed
		local time_empty = CT + (self.ReloadStartEmptyTime or self.ReloadStartTime) / self.ReloadSpeed

		self.WasEmpty = mag == 0
		self.ShotgunReloadState = 1
		self.ForcedReloadStop = false
		self:sendWeaponAnim(self:ReloadBeginAnimation(), self.ReloadSpeed)
		if self.Animations["reload_start_empty"] and self.WasEmpty then			  
			self.ReloadDelay = time_empty
			self:SetNextPrimaryFire(time_empty)
			self:SetNextSecondaryFire(time_empty)
			self.GlobalDelay = time_empty
		else
			self.ReloadDelay = time
			self:SetNextPrimaryFire(time)
			self:SetNextSecondaryFire(time)
			self.GlobalDelay = time
		end

		mag, ammo = self:Clip1(), self.Owner:GetAmmoCount(self.Primary.Ammo)

		if SERVER then
			self:SetClip1(mag + 1)
			self.Owner:SetAmmo(ammo - 1, self.Primary.Ammo)
		end

		-- if we've filled up the weapon (or we have no ammo left), we go to the "end reload" state
		if mag + 1 == self.Primary.ClipSize or ammo - 1 == 0 then
			self.ShotgunReloadState = 2
		end
	else
		local reloadTime = nil
		local reloadHalt = nil

		if mag == 0 then
			if self.Chamberable then
				self.Primary.ClipSize = self.Primary.ClipSize_Orig
			end

			if self.isDualwield and (self.ReloadTime_Empty_Akimbo and self.ReloadHalt_Empty_Akimbo) then
				reloadTime = self.ReloadTime_Empty_Akimbo
				reloadHalt = self.ReloadHalt_Empty_Akimbo
			else
				reloadTime = self.ReloadTime_Empty
				reloadHalt = self.ReloadHalt_Empty
			end
		else
			if self.isDualwield and (self.ReloadTime_Akimbo and self.ReloadHalt_Akimbo) then
				reloadTime = self.ReloadTime_Akimbo
				reloadHalt = self.ReloadHalt_Akimbo
			else
				reloadTime = self.ReloadTime
				reloadHalt = self.ReloadHalt
			end

			if self.Chamberable then
				self.Primary.ClipSize = self.Primary.ClipSize_Orig + 1
			end
		end

		reloadTime = reloadTime / self.ReloadSpeed
		reloadHalt = reloadHalt / self.ReloadSpeed

		self.ReloadDelay = CT + reloadTime
		self:SetNextPrimaryFire(CT + reloadHalt)
	--	self:SetNextSecondaryFire(CT + reloadHalt)
		self.GlobalDelay = CT + reloadHalt

		if self.reloadAnimFunc then
			self:reloadAnimFunc(mag)					  
		else
			if self.ReloadSplitAnims then
				self:sendWeaponAnim(self:ReloadAnimation(), self.ReloadSpeed, 0, false, 0)
			else
				self:sendWeaponAnim(self:ReloadAnimation(), self.ReloadSpeed, 0, true, 0)
			end
		end
	end

	CustomizableWeaponry.callbacks.processCategory(self, "beginReload", mag == 0)

	self.Owner:SetAnimation(PLAYER_RELOAD)
end

function SWEP:beginRightReload()
	local mag, ammo = self:Clip2(), self.Owner:GetAmmoCount(self.Secondary.Ammo)

	if self.ShotgunReload then
		local reloadHalt = CT + self.ReloadStartTime / self.ReloadSpeed

	--	self.GlobalDelay = reloadHalt
		self.RightReloadDelay = reloadHalt
		self:SetNextSecondaryFire( reloadHalt )

		self.RightShotgunReloadState = 1
		self.RightForcedReloadStop = false

		self:sendWeaponAnim( "reload_start", self.Altmode.ReloadSpeed, 0, false, 1 )

		if SERVER then
			self:SetClip2( mag + 1 )
			--self.Owner:SetAmmo( ammo - 1, self.Secondary.Ammo )
		end

		-- if we've filled up the weapon (or we have no ammo left), we go to the "end reload" state
		if mag + 1 == self.Secondary.ClipSize or ammo - 1 == 0 then
			self.RightShotgunReloadState = 2
		end
	else
		local reloadTime = nil
		local reloadHalt = nil

		if mag == 0 then
			if self.isDualwield and (self.ReloadTime_Empty_Akimbo and self.ReloadHalt_Empty_Akimbo) then
				reloadTime = self.ReloadTime_Empty_Akimbo
				reloadHalt = self.ReloadHalt_Empty_Akimbo
			else
				reloadTime = self.ReloadTime_Empty
				reloadHalt = self.ReloadHalt_Empty
			end
		else
			if self.isDualwield and (self.ReloadTime_Akimbo and self.ReloadHalt_Akimbo) then
				reloadTime = self.ReloadTime_Akimbo
				reloadHalt = self.ReloadHalt_Akimbo
			else
				reloadTime = self.ReloadTime
				reloadHalt = self.ReloadHalt
			end
		end

		reloadTime = reloadTime / self.ReloadSpeed
		reloadHalt = reloadHalt / self.ReloadSpeed

		self.GlobalDelay = CT + reloadHalt
		self.RightReloadDelay = CT + reloadTime
		self:SetNextSecondaryFire( CT + reloadHalt )

		self:sendWeaponAnim( self:Reload2Animation(), self.ReloadSpeed, 0, true, 1 )

	end

	self.Owner:SetAnimation( PLAYER_RELOAD )
end

function SWEP:beginAltReload()
	local mag, ammo = self:Clip2(), self.Owner:GetAmmoCount(self.Secondary.Ammo)

	if self.Altmode.ShotgunReload then
		local reloadHalt = CT + self.Altmode.ReloadStartTime / self.Altmode.ReloadSpeed

		self.GlobalDelay = reloadHalt
		self.AltReloadDelay = reloadHalt
		self:SetNextPrimaryFire( reloadHalt )
		self:SetNextSecondaryFire( reloadHalt )

		self.AltShotgunReloadState = 1
		self.AltForcedReloadStop = false

		self:sendWeaponAnim( "alt_reload_start", self.Altmode.ReloadSpeed )

		if SERVER then
			self:SetClip2( mag + 1 )
			--self.Owner:SetAmmo( ammo - 1, self.Secondary.Ammo )
		end

		-- if we've filled up the weapon (or we have no ammo left), we go to the "end reload" state
		if mag + 1 == self.Secondary.ClipSize or ammo - 1 == 0 then
			self.AltShotgunReloadState = 2
		end
	else
		local reloadTime = self.Altmode.ReloadTime
		local reloadHalt = self.Altmode.ReloadHalt

		if mag == 0 then
			reloadTime = self.Altmode.ReloadTime_Empty
			reloadHalt = self.Altmode.ReloadHalt_Empty
		end

		reloadTime = reloadTime / self.Altmode.ReloadSpeed
		reloadHalt = reloadHalt / self.Altmode.ReloadSpeed

		self.GlobalDelay = CT + reloadHalt
		self.AltReloadDelay = CT + reloadTime
		self:SetNextPrimaryFire( CT + reloadHalt )
		self:SetNextSecondaryFire( CT + reloadHalt )

		self:sendWeaponAnim( self:ReloadAnimation(), self.Altmode.ReloadSpeed, 0, true )
	end

	self.Owner:SetAnimation( PLAYER_RELOAD )
end

function SWEP:finishReload()
	mag, ammo = self:Clip1(), self.Owner:GetAmmoCount(self.Primary.Ammo)

	if self.reloadSplitAnims then
		if mag > 0 then
			self:sendWeaponAnim("reload_end", self.ReloadSpeed, 0, true)
		else
			self:sendWeaponAnim("reload_end_empty", self.ReloadSpeed, 0, true)
		end
	end

	local suppressReloadLogic = CustomizableWeaponry.callbacks.processCategory(self, "defaultReloadLogic", mag == 0)

	if not suppressReloadLogic then
		if self.ReloadAmount then
			if SERVER then
				self:SetClip1(math.Clamp(mag + self.ReloadAmount, 0, self.Primary.ClipSize))
				self.Owner:RemoveAmmo(self.ReloadAmount, self.Primary.Ammo)
			end
		else
			if mag > 0 then
				if ammo >= self.Primary.ClipSize - mag then
					if SERVER then
						self:SetClip1(math.Clamp(self.Primary.ClipSize, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(self.Primary.ClipSize - mag, self.Primary.Ammo)
					end
				else
					if SERVER then
						self:SetClip1(math.Clamp(mag + ammo, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(ammo, self.Primary.Ammo)
					end
				end
			else
				if ammo >= self.Primary.ClipSize then
					if SERVER then
						self:SetClip1(math.Clamp(self.Primary.ClipSize, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(self.Primary.ClipSize, self.Primary.Ammo)
					end
				else
					if SERVER then
						self:SetClip1(math.Clamp(ammo, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(ammo, self.Primary.Ammo)
					end
				end
			end
		end
	end

	CustomizableWeaponry.callbacks.processCategory(self, "finishReload")

	self.ReloadDelay = nil
end

function SWEP:finishRightReload()
	local mag, ammo = self:Clip2(), self.Owner:GetAmmoCount(self.Secondary.Ammo)

	if mag > 0 then
		if ammo >= self.Secondary.ClipSize - mag then
			if SERVER then
				self:SetClip2( math.Clamp(self.Secondary.ClipSize, 0, self.Secondary.ClipSize) )
				self.Owner:RemoveAmmo( self.Secondary.ClipSize - mag, self.Secondary.Ammo )
			end
		else
			if SERVER then
				self:SetClip2( math.Clamp(mag + ammo, 0, self.Secondary.ClipSize) )
				self.Owner:RemoveAmmo(ammo, self.Primary.Ammo)
			end
		end
	else
		if ammo >= self.Secondary.ClipSize then
			if SERVER then
				self:SetClip2( math.Clamp(self.Secondary.ClipSize, 0, self.Secondary.ClipSize) )
				self.Owner:RemoveAmmo(self.Secondary.ClipSize, self.Secondary.Ammo)
			end
		else
			if SERVER then
				self:SetClip2( math.Clamp(ammo, 0, self.Secondary.ClipSize) )
				self.Owner:RemoveAmmo(ammo, self.Secondary.Ammo)
			end
		end
	end

	self.RightReloadDelay = nil
end
function SWEP:finishAltReload()
	local mag, ammo = self:Clip2(), self.Owner:GetAmmoCount(self.Secondary.Ammo)

	if mag > 0 then
		if ammo >= self.Secondary.ClipSize - mag then
			if SERVER then
				self:SetClip2( math.Clamp(self.Secondary.ClipSize, 0, self.Secondary.ClipSize) )
				--self.Owner:RemoveAmmo( self.Secondary.ClipSize - mag, self.Secondary.Ammo )
			end
		else
			if SERVER then
				self:SetClip2( math.Clamp(mag + ammo, 0, self.Secondary.ClipSize) )
				-- self.Owner:RemoveAmmo(ammo, self.Primary.Ammo)
			end
		end
	else
		if ammo >= self.Secondary.ClipSize then
			if SERVER then
				self:SetClip2( math.Clamp(self.Secondary.ClipSize, 0, self.Secondary.ClipSize) )
				--self.Owner:RemoveAmmo(self.Secondary.ClipSize, self.Secondary.Ammo)
			end
		else
			if SERVER then
				self:SetClip2( math.Clamp(ammo, 0, self.Secondary.ClipSize) )
				--self.Owner:RemoveAmmo(ammo, self.Secondary.Ammo)
			end
		end
	end

	self.AltReloadDelay = nil
end

function SWEP:CycleFiremodes()
	t = self.FireModes

	if not t.last then
		t.last = 2
	else
		if not t[t.last + 1] then
			t.last = 1
		else
			t.last = t.last + 1
		end
	end

	if self.dt.State == CW_AIMING or self:isBipodDeployed() then
		if self.FireModes[t.last] == "safe" then
			t.last = 1
		end
	end

	if self.FireMode != self.FireModes[t.last] and self.FireModes[t.last] then
		CT = CurTime()

		if IsFirstTimePredicted() then
			self:SelectFiremode(self.FireModes[t.last])
		end

		self:SetNextPrimaryFire(CT + 0.25)
		self:SetNextSecondaryFire(CT + 0.25)
		self.ReloadWait = CT + 0.25
	end

end

-- utility funcs

function SWEP:isAiming()
	return self.dt.State == CW_AIMING
end

function SWEP:isRunning()
	return self.dt.State == CW_RUNNING
end

function SWEP:SelectFiremode(n)
	if CLIENT then
		return
	end

	t = CustomizableWeaponry.firemodes.registeredByID[n]
	self.Primary.Automatic = t.auto
	self.FireMode = n
	self.BurstAmount = t.burstamt

	if self.FireMode == "safe" then
		self.dt.Safe = true -- more reliable than umsgs
	else
		self.dt.Safe = false
	end

	--[[if self.FireMode == "ugl" then
		self.dt.State = CW_IDLE
		self:SetUGLActive( true )
	else
		self:SetUGLActive( false )
	end]]--

	if SERVER then
		umsg.Start("CW_FIREMODE")
			umsg.Entity(self.Owner)
			umsg.String(n)
		umsg.End()
	end
end

local reg = debug.getregistry()
local GetVelocity = reg.Entity.GetVelocity
local Length = reg.Vector.Length
local GetAimVector = reg.Player.GetAimVector

local calculateAccuracy = "calculateAccuracy"

function SWEP:getBipodHipSpread()
	return self.AimSpread * 1.2
end

function SWEP:getBaseCone()
	-- call callbacks for the aim/hip spread calculation
	local aimSpreadMod, hipSpreadMod, maxSpreadMod = CustomizableWeaponry.callbacks.processCategory(self, calculateAccuracy)
	maxSpreadMod = maxSpreadMod or 1
	local finalSpread = nil
	FT, CT, UCT = FrameTime(), CurTime(), UnPredictedCurTime()

	if self.dt.State == CW_AIMING then
		if self.ScopeSpeed and (self.AimOverlay or self.isSniper) then
			if UCT > self.AimTime then
				finalSpread = self.AimSpread * (aimSpreadMod or 1)
			else
				finalSpread = self.HipSpread * (hipSpreadMod or 1)
			end
		else
			finalSpread = self.AimSpread * (aimSpreadMod or 1)
		end
	else
		if self.dt.BipodDeployed then
			finalSpread = self:getBipodHipSpread() * (aimSpreadMod or 1)
		else
			finalSpread = self.HipSpread * (hipSpreadMod or 1)
		end
	end

	return finalSpread, maxSpreadMod
end

function SWEP:getMaxSpreadIncrease(maxSpreadMod)
	return self.MaxSpreadInc * maxSpreadMod
end

function SWEP:getCrouchSpreadModifier()
	return self.dt.State == CW_AIMING and 0.9 or 0.75
end

function SWEP:CalculateSpread(vel, dt)
	if not self.AccuracyEnabled then
		return
	end

	aim = GetAimVector(self.Owner)
	CT = CurTime()

	if not self.Owner.LastView then
		-- self.Owner.LastView = aim
		-- self.Owner.ViewAff = 0
	-- else
		-- self.Owner.ViewAff = LerpCW20(dt * 10, self.Owner.ViewAff, (aim - self.Owner.LastView):Length() * 0.5)
		-- self.Owner.LastView = aim
	end

	local baseCone, maxSpreadMod = self:getBaseCone()
	self.BaseCone = baseCone

	if self.Owner:Crouching() then
		self.BaseCone = self.BaseCone * self:getCrouchSpreadModifier()
	end

	self.CurCone = self:getFinalSpread(vel, maxSpreadMod)

	if CT > self.SpreadWait then
		self.AddSpread = math.Clamp(self.AddSpread - 0.5 * self.AddSpreadSpeed * dt, 0, self:getMaxSpreadIncrease(maxSpreadMod))
		self.AddSpreadSpeed = math.Clamp(self.AddSpreadSpeed + 5 * dt, 0, 1)
	end
end

local mag, ammo

local IFTP
local wl, ws

-- melee stuff
local noNormal = Vector(1, 1, 1)
local traceData = {}
local meleeBullet = {}
meleeBullet.Damage = 0
meleeBullet.Force = 0
meleeBullet.Tracer = 0
meleeBullet.Num = 1
meleeBullet.Spread = Vector(0, 0, 0)

function SWEP:Think()
	-- take care of looping fire sounds
	if self.LoopSound and self.LoopSoundTime <= CurTime() then
		if self.FireSoundSuppressedEnd and self.dt.Suppressed then
			self:EmitSound( self.FireSoundSuppressedEnd )
		elseif self.FireSoundEnd then
			self:EmitSound( self.FireSoundEnd )
		end

		if self.dt.Suppressed then
			self:StopSound( self.FireSoundSuppressed )
		else
			self:StopSound( self.FireSound )
		end
		self.LoopSound = false
	end

	if not self:isReloading() then
		if self.dt.State == CW_RUNNING then
			self.ViewbobIntensity = 1.5
		else
			self.ViewbobIntensity = 0
		end
	end

	-- disable sway during customization
	if self.dt.State == CW_CUSTOMIZE then
		self.Customizing = true
		self.SwayIntensity = 0
	else
		self.SwayIntensity = self.SwayIntensity_Orig
	end

	-- play customize_out anim, when falling
	if self.Customizing and self.dt.State ~= CW_CUSTOMIZE and not self.wasRunning and self:isRunning() then
		self:sendWeaponAnim( "customize_out", (self.CustomizeOutSpeed or self.IdleAnimSpeed or 1), 0, true, -1 )
		self.Customizing = nil
	elseif self.Customizing and self.dt.State ~= CW_CUSTOMIZE then
		self:sendWeaponAnim( "customize_out", (self.CustomizeOutSpeed or self.IdleAnimSpeed or 1), 0, true, -1 )
		self.Customizing = nil
	end

	-- in vehicle? can't do anything, also prevent needless calculations of stuff
	if self.Owner:InVehicle() and not self.Owner:GetAllowWeaponsInVehicle() then
		self.dt.State = CW_ACTION
		return
	end

	CustomizableWeaponry.actionSequence.process(self)

	if self.dt.State == CW_HOLSTER_START then
		return
	end

	CT = CurTime()

	-- calculate melee attacks
	if self.meleeDamageTime and self.meleeDamageTime <= CT and (self.meleeDamageTime + self.Melee.DamageTime) > CT then
		self.Owner:LagCompensation(true)
			local eyeAngles = self.Owner:EyeAngles()
			local forward = eyeAngles:Forward()
			traceData.start = self.Owner:GetShootPos()
			traceData.endpos = traceData.start + forward * self.Melee.Range

			traceData.mins = self.Melee.HitAABB[1]:Rotate(eyeAngles)
			traceData.maxs = self.Melee.HitAABB[2]:Rotate(eyeAngles)

			traceData.filter = self.Owner

			local trace = util.TraceHull(traceData)
		self.Owner:LagCompensation(false)

		if trace.Hit then
			local ent = trace.Entity
			local sounds = nil

			if IsValid(ent) then
				if ent:IsPlayer() then
					sounds = self.Melee.PlayerHitSounds
					self:createBloodEffect(ent, trace)
				elseif ent:IsNPC() then
					sounds = self.Melee.NPCHitSounds[ent:GetClass()] or self.Melee.PlayerHitSounds
					self:createBloodEffect(ent, trace)
				else
					meleeBullet.Src = traceData.start
					meleeBullet.Dir = forward

					self.Owner:FireBullets(meleeBullet)

					if SERVER then
						local phys = ent:GetPhysicsObject()

						if phys and phys:IsValid() then
							phys:AddVelocity(forward * self.Melee.PushVelocity)
						end
					end
				end

				if SERVER then
					local forceDir = noNormal
					local forceMultiplier = 0

					if not ent:IsPlayer() and not ent:IsNPC() then
						forceDir = trace.HitNormal
					end

					local damageInfo = DamageInfo()
					damageInfo:SetDamage(self.Melee.Damage)
					damageInfo:SetAttacker(self.Owner)
					damageInfo:SetInflictor(self)
					damageInfo:SetDamageForce(forward * self.Melee.Force * forceDir)
					damageInfo:SetDamagePosition(trace.HitPos)

					ent:TakeDamageInfo(damageInfo)
				end

				sounds = sounds or self.Melee.MiscHitSounds
			else
				sounds = self.Melee.MiscHitSounds

				if (SP and SERVER) or CLIENT then
					util.Decal(self.Melee.ImpactDecal, trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal)
				end
			end

			self:emitSoundFromList(sounds)

			self.meleeDamageTime = nil
		end
	end

	if CLIENT then
		if self.SubCustomizationCycleTime then
			if UnPredictedCurTime() > self.SubCustomizationCycleTime then
				CustomizableWeaponry.cycleSubCustomization(self)
			end
		end
	end

	if self.HoldToAim then
		if (SP and SERVER) or not SP then
			if self.dt.State == CW_AIMING then
				if not self.Owner:OnGround() or Length(GetVelocity(self.Owner)) >= self.Owner:GetWalkSpeed() * self.LoseAimVelocity or not self.Owner:KeyDown(IN_ATTACK2) then
					self.dt.State = CW_AIMDOWN
					if self.AimAnim and self:Clip1() == 0 and self.Animations["aim_out_empty"] then
						self:sendWeaponAnim( "aim_out_empty", (self.ADSSpeed or 1) * (self.ADSOutSpeedMult or 1), 0, true )
					elseif self.AimAnim then
						self:sendWeaponAnim( "aim_out", (self.ADSSpeed or 1) * (self.ADSOutSpeedMult or 1), 0, true )
					end
					if not self.AimDelay then
						self.AimDelay = CT + self.ADSTime
					end

					if SERVER then
						SendUserMessage( "CW_LOWERAIM", self.Owner )
					end

					self:SetNextSecondaryFire( CT + 0.25 )
					if self:filterPrediction() then
						--self:EmitSound(CW_LOWERAIM)
		end
				end
			end
		end
	end

	if self.AimDelay and CT > self.AimDelay then
		if self.dtState == CW_AIMDOWN then
			self.dt.State = CW_IDLE
		end

		self.AimDelay = nil
	end

	if self.IndividualThink then
		self:IndividualThink()

		if not IsValid(self) or not IsValid(self.Owner) then
			return
		end
	end

	if self.MW3Attachments then
		self:MW3Attachments()
	end

	vel = Length(GetVelocity(self.Owner))
	IFTP = IsFirstTimePredicted()

	if (not SP and IFTP) or SP then
		self:CalculateSpread(vel, FrameTime())
	end

	if CT > self.GlobalDelay then
		wl = self.Owner:WaterLevel()

		if self.Owner:OnGround() then
			-- prone mod compatibility starts
			if self:isPlayerEnteringProne() then
				self.dt.State = CW_PRONE_BUSY
			elseif self:isPlayerProne() and vel >= self.BusyProneVelocity and not self.ShootWhileProne then
				self.dt.State = CW_PRONE_MOVING
			else
				-- prone mod compatibility ends
				if wl >= 3 and self.HolsterUnderwater then
					if self.ShotgunReloadState == 1 then
						self.ShotgunReloadState = 2
					end

					self.dt.State = CW_ACTION
					self.FromActionToNormalWait = CT + 0.3
				else
					ws = self.Owner:GetWalkSpeed()

					if ((vel > ws * self.RunStateVelocity and self.Owner:KeyDown(IN_SPEED)) or vel > ws * 3 or (self.ForceRunStateVelocity and vel > self.ForceRunStateVelocity)) and self.SprintingEnabled then
						if IFTP and not self.SprintAnim and not (self:isReloading() or self.IsReloadShotgun) and self.HolsterWait < CT and self.GlobalDelay < CT then
							if self.dt.AltActive and self.Animations["alt_sprint_in"] then
								self:sendWeaponAnim("alt_sprint_in", (self.SprintInSpeed or 1), 0, true)
							else
								if self:Clip1() == 0 and self.Animations["sprint_in_empty"] then
									self:sendWeaponAnim( "sprint_in_empty", (self.SprintInSpeed or 1), 0, true )
								else
									self:sendWeaponAnim( "sprint_in", (self.SprintInSpeed or 1), 0, true )
								end
								
								if self.isDualwield then
									if self:Clip2() == 0 and self.Animations["sprint_in_empty"] then
										self:sendWeaponAnim( "sprint_in_empty", (self.SprintInSpeed or 1), 0, true, 1 )
									else
										self:sendWeaponAnim( "sprint_in", (self.SprintInSpeed or 1), 0, true, 1 )
									end
								end
							end
							self.SprintAnim = true
						end

						self.dt.State = CW_RUNNING
					else
						if self.dt.State != CW_AIMING and self.dt.State != CW_CUSTOMIZE then
							if CT > self.FromActionToNormalWait then
								if self.dt.State != CW_IDLE then
									self.dt.State = CW_IDLE

								if not self.ReloadDelay then
										self:setGlobalDelay( self.ADSTime / self.ADSSpeed)
										-- self:SetNextPrimaryFire(CT + 0.2 / self.ADSSpeed + (self.FireDelay * 0.5))
										self:SetNextSecondaryFire(CT + 0.1 / self.ADSSpeed)
										self.ReloadWait = CT + 0.1
									end
								end
							end
						end
					end
				end
			end
		else
			if (wl > 1 and self.HolsterUnderwater) or (self.Owner:GetMoveType() == MOVETYPE_LADDER and self.HolsterOnLadder) then
				if self.ShotgunReloadState == 1 then
					self.ShotgunReloadState = 2
				end

				self.dt.State = CW_ACTION
				self.FromActionToNormalWait = CT + 0.3
			else
				if CT > self.FromActionToNormalWait then
					if self.dt.State != CW_IDLE then
						self.dt.State = CW_IDLE
						self:SetNextPrimaryFire(CT + 0.3)
						self:SetNextSecondaryFire(CT + 0.3)
						self.ReloadWait = CT + 0.3
					end
				end
			end
		end
	end

	if SERVER then
		if self.CurSoundTable then
			local t = self.CurSoundTable[self.CurSoundEntry]

			--[[if CLIENT then
				if CT >= self.SoundTime + t.time / self.SoundSpeed then
					self:EmitSound(t.sound, 70, 100)
					if self.CurSoundTable[self.CurSoundEntry + 1] then
						self.CurSoundEntry = self.CurSoundEntry + 1
					else
						self.CurSoundTable = nil
						self.CurSoundEntry = nil
						self.SoundTime = nil
					end
				end
			else]]--
			if CT >= self.SoundTime + t.time / self.SoundSpeed then
				if t.sound and t.sound ~= "" then
					self:EmitSound(t.sound, 70, 100)
				end

				if t.callback then
					t.callback(self)
				end

				if self.CurSoundTable[self.CurSoundEntry + 1] then
					self.CurSoundEntry = self.CurSoundEntry + 1
				else
					self.CurSoundTable = nil
					self.CurSoundEntry = nil
					self.SoundTime = nil
				end
			end
			--end
		end

		if self.CurSoundTable2 then
			local t = self.CurSoundTable2[self.CurSoundEntry2]

			if CT >= self.SoundTime2 + t.time / self.SoundSpeed2 then
				if t.sound and t.sound ~= "" then
					self:EmitSound(t.sound, 70, 100)
				end

				if t.callback then
					t.callback(self)
				end

				if self.CurSoundTable2[self.CurSoundEntry2 + 1] then
					self.CurSoundEntry2 = self.CurSoundEntry2 + 1
				else
					self.CurSoundTable2 = nil
					self.CurSoundEntry2 = nil
					self.SoundTime2 = nil
				end
			end
		end
	end
	if self.dt.Shots > 0 then
		if not self.Owner:KeyDown(IN_ATTACK) then
			if self.BurstAmount and self.BurstAmount > 0 then
				self.dt.Shots = 0
				self:SetNextPrimaryFire(CT + self.FireDelay * self.BurstCooldownMul)
				self.ReloadWait = CT + self.FireDelay * self.BurstCooldownMul
			end
		end
	end

	if not self.ShotgunReload then
		if self.ReloadDelay and CT >= self.ReloadDelay then
			self:finishReload() -- more like finnishReload ;0
		end

		if self.RightReloadDelay and CT >= self.RightReloadDelay then
			self:finishRightReload()
		end
	end
	
	if not self.Altmode.ShotgunReload then
		if self.AltReloadDelay and CT >= self.AltReloadDelay then
			self:finishAltReload()
		end
	end

	if IFTP then
	--[[SWEP.AimBreathingIntensity = 1
	SWEP.CurBreatheIntensity = 1
	SWEP.BreathLeft = 1
	SWEP.BreathRegenRate = 10
	SWEP.BreathDrainRate = 5
	SWEP.BreathIntensityDrainRate = 10
	SWEP.BreathIntensityRegenRate = 10]]--

		if self.ShotgunReloadState == 1 then
			if self.Owner:KeyPressed(IN_ATTACK) and self:Clip1() ~= 0 then
				self.ShotgunReloadState = 2
				self.ForcedReloadStop = true
			end

			if CT > self.ReloadDelay then
				self:sendWeaponAnim("insert", self.ReloadSpeed)

				if SERVER and not SP then
					self.Owner:SetAnimation(PLAYER_RELOAD)
				end

				mag, ammo = self:Clip1(), self.Owner:GetAmmoCount(self.Primary.Ammo)

				self.ReloadDelay = CT + self.InsertShellTime / self.ReloadSpeed
				
				if SERVER then
					self:SetClip1(mag + 1)
					self.Owner:SetAmmo(ammo - 1, self.Primary.Ammo)
				end

				local maxReloadAmount = self.Primary.ClipSize

				if self.Chamberable and not self.WasEmpty then  -- if the weapon is chamberable + we've cocked it - we can add another shell in there
					maxReloadAmount = self.Primary.ClipSize + 1
				end

				-- if we've filled up the weapon (or we have no ammo left), we go to the "end reload" state
				if mag + 1 == maxReloadAmount or ammo - 1 == 0 then
					self.ShotgunReloadState = 2
				end
			end
		elseif self.ShotgunReloadState == 2 then
			if self.Owner:KeyPressed(IN_ATTACK) then
				self.ShotgunReloadState = 2
				self.ForcedReloadStop = true
			end

			if CT > self.ReloadDelay then
				if not self.WasEmpty then
					self:sendWeaponAnim(self:ReloadEndAnimation(), self.ReloadSpeed, 0, true)
					self.ShotgunReloadState = 0

					local time = self.ReloadFinishWait / self.ReloadSpeed
					self:SetNextPrimaryFire(time)
					self:SetNextSecondaryFire(time)
					self.ReloadWait = time
					self.ReloadDelay = nil
					self.GlobalDelay = CT + time
				else
					local canInsertMore = false
					local waitTime = self.ReloadFinishWait

					if not self.ForcedReloadStop and self.Chamberable and self:Clip1() < self.Primary.ClipSize + 1 and self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
						waitTime = self.PumpMidReloadWait or waitTime
						canInsertMore = true
					end
					self:sendWeaponAnim(self:ReloadEndAnimation(), self.ReloadSpeed, 0, true)
					self.ShotgunReloadState = 0

					local time = CT + waitTime / self.ReloadSpeed
					self:SetNextPrimaryFire(time)
					self:SetNextSecondaryFire(time)
					self.ReloadWait = time

					if not canInsertMore then
						self.ReloadDelay = nil
					else
						self.ReloadDelay = time
					end

					if canInsertMore then -- if we can chamber and we haven't chambered up fully + we have some ammo to spare
						self.ShotgunReloadState = 1 -- we add another shell in there
						self.WasEmpty = false

					end
				end
			end
		end

		-- altmode shotgun reload logic
		if self.AltShotgunReloadState == 1 then
			if (self.Owner:KeyPressed(IN_ATTACK) and self:Clip2() ~= 0) or not self.dt.AltActive then
				self.AltShotgunReloadState = 2
				self.AltForcedReloadStop = true
			end

			if CT > self.AltReloadDelay then
				self:sendWeaponAnim( "alt_reload_loop", self.Altmode.ReloadSpeed )

				if SERVER and not SP then
					self.Owner:SetAnimation(PLAYER_RELOAD)
				end

				local mag, ammo = self:Clip2(), self.Owner:GetAmmoCount(self.Secondary.Ammo)

				if SERVER then
					self:SetClip2( mag + 1 )
					--self.Owner:SetAmmo( ammo - 1, self.Secondary.Ammo )
				end

				self.AltReloadDelay = CT + self.Altmode.InsertShellTime / self.Altmode.ReloadSpeed

				-- if we've filled up the weapon (or we have no ammo left), we go to the "end reload" state
				if mag + 1 == self.Secondary.ClipSize or ammo - mag == 1 then
					self.AltShotgunReloadState = 2
				end
			end
		elseif self.AltShotgunReloadState == 2 then
			if self.Owner:KeyPressed(IN_ATTACK) or not self.dt.AltActive then
				self.AltForcedReloadStop = true
			end

			if CT > self.AltReloadDelay then
				self:sendWeaponAnim( "alt_reload_end", self.Altmode.ReloadSpeed, 0, true )
				self.AltShotgunReloadState = 0

				local time = self.Altmode.ReloadFinishWait / self.Altmode.ReloadSpeed
				self:SetNextPrimaryFire( time )
				self:SetNextSecondaryFire( time )
				self.ReloadWait = time
				self.AltReloadDelay = nil
				self.GlobalDelay = CT + (self.Altmode.ReloadFinishWait or 0)
			end
		end		-- altmode shotgun reload logic end
	end

	if SERVER then
		if self.dt.Safe then
			if self.CHoldType != self.RunHoldType then
				self:SetHoldType(self.RunHoldType)
				self.CHoldType = self.RunHoldType
			end
		else
			if self.dt.State == CW_RUNNING or self.dt.State == CW_ACTION then
				if self.CHoldType != self.RunHoldType then
					self:SetHoldType(self.RunHoldType)
					self.CHoldType = self.RunHoldType
				end
			else
				if self.CHoldType != self.NormalHoldType then
					self:SetHoldType(self.NormalHoldType)
					self.CHoldType = self.NormalHoldType
				end
			end
		end
	end

	if (SP and SERVER) or not SP then -- if it's SP, then we run it only on the server (otherwise shit gets fucked); if it's MP we predict it
		-- if the bipod DT var is true, or if we have a bipod deploy angle
		if self.dt.BipodDeployed or self.DeployAngle then
			-- check whether the bipod can be placed on the current surface (so we don't end up placing on nothing)

			if not self:CanRestWeapon(self.BipodDeployHeightRequirement) then
				self.dt.BipodDeployed = false
				self.DeployAngle = nil

				if not self.ReloadDelay then
					if CT > self.BipodDelay then
						self:performBipodDelay(self.BipodUndeployTime)
					else
						self.BipodUnDeployPost = true
					end
				else
					self.BipodUnDeployPost = true
				end
			end
		end

		if not self.ReloadDelay then
			if self.BipodUnDeployPost then
				if CT > self.BipodDelay then
					if not self:CanRestWeapon(self.BipodDeployHeightRequirement) then
						self:performBipodDelay(self.BipodUndeployTime)
						self.BipodUnDeployPost = false
					else
						self.dt.BipodDeployed = true

						self:setupBipodVars()
						self.BipodUnDeployPost = false
					end
				end
			end

			if self.Owner:KeyPressed(IN_USE) then
				if CT > self.BipodDelay and CT > self.ReloadWait then
					if self.BipodInstalled then
						if self.dt.BipodDeployed then
							self.dt.BipodDeployed = false
							self.DeployAngle = nil

							self:performBipodDelay(self.BipodUndeployTime)
						else
							self.dt.BipodDeployed = self:CanRestWeapon(self.BipodDeployHeightRequirement)

							if self.dt.BipodDeployed then
								self:performBipodDelay(self.BipodDeployTime)
								self:setupBipodVars()
							end
						end
					end
				end
			end
		end
	end

	if self.dt.State ~= CW_RUNNING and self.SprintAnim then
		if not self:isReloading() then
			if self.dt.AltActive and self.Animations["alt_sprint_out"] then
				self:sendWeaponAnim("alt_sprint_out", (self.SprintOutSpeed or 1), 0, true)
			else
				if self:Clip1() == 0 and self.Animations["sprint_out_empty"] then
					self:sendWeaponAnim( "sprint_out_empty", (self.SprintOutSpeed or 1), 0, true )
				else
					self:sendWeaponAnim( "sprint_out", (self.SprintOutSpeed or 1), 0, true )
				end
				
				if self.isDualwield then
					if self:Clip2() == 0 and self.Animations["sprint_out_empty"] then
						self:sendWeaponAnim( "sprint_out_empty", (self.SprintOutSpeed or 1), 0, true, 1 )
					else
						self:sendWeaponAnim( "sprint_out", (self.SprintOutSpeed or 1), 0, true, 1 )
					end
				end
			end
		end
		self.SprintAnim = nil
	end

	if self.forcedState then
		if CT < self.ForcedStateTime then
			self.dt.State = self.forcedState
		else
			self.forcedState = nil
		end
	end
end

function SWEP:simulateRecoil()
	if self.dt.State == CW_AIMING or self.dt.BipodDeployed then
		self.FireMove = math.Clamp(self.Recoil * self.FireMoveMod, 1, 3)
	else
		self.FireMove = 0.4
	end

	if self.dt.State ~= CW_AIMING and not self.freeAimOn then
		self.FOVHoldTime = UnPredictedCurTime() + self.FireDelay * 2

		-- if self.HipFireFOVIncrease then
			-- self.FOVTarget = math.Clamp(self.FOVTarget + 8 / (self.Primary.ClipSize_Orig * 0.75) * self.FOVPerShot, 0, 7)
		-- end
	end

	if self.freeAimOn and not self.dt.BipodDeployed then -- we only want to add the 'roll' view shake when we're not using a bipod in free-aim mode
		self.lastViewRoll = math.Clamp(self.lastViewRoll + self.Recoil * 0.5, 0, 15)
		self.lastViewRollTime = UnPredictedCurTime() + FrameTime() * 3
	end

	self.lastShotTime = CurTime() + math.Clamp(self.FireDelay * 3, 0, 0.3) -- save the last time we shot

	if self.BoltBone then
		self:offsetBoltBone()
	end

	if self.LuaViewmodelRecoil then
		if (self.dt.State ~= CW_AIMING and not self.FullAimViewmodelRecoil) or self.FullAimViewmodelRecoil then
			-- increase intensity of the viewmodel recoil with each shot
			self.LuaVMRecoilIntensity = math.Approach(self.LuaVMRecoilIntensity, 1, self.Recoil * 0.15)
			self.LuaVMRecoilLowerSpeed = 0

			if not self.dt.BipodDeployed then
				self:makeVMRecoil()
			end
		end
	end

	if self.ReticleInactivityPostFire then
		self.reticleInactivity = UnPredictedCurTime() + self.ReticleInactivityPostFire
	end
end

function SWEP:addFireSpread(CT)
	self.SpreadWait = CT + self.SpreadCooldown
	local mul, mulMax = self:getSpreadModifiers()

	if self.BurstAmount > 0 then
		self.AddSpread = math.Clamp(self.AddSpread + self.SpreadPerShot * self.BurstSpreadIncMul * mul, 0, self.MaxSpreadInc * mulMax)
	else
		self.AddSpread = math.Clamp(self.AddSpread + self.SpreadPerShot * mul, 0, self.MaxSpreadInc * mulMax)
	end

	-- decrease spread restore speed per each shot
	self.AddSpreadSpeed = math.Clamp(self.AddSpreadSpeed - 0.2, 0, 1)
end

function SWEP:playFireAnim()
	if (self.dt.State == CW_AIMING and not self.ADSFireAnim) or (self.dt.BipodDeployed and not self.BipodFireAnim) then
		return
	end

	if self.dt.State ~= CW_AIMING and (not self.LuaViewmodelRecoilOverride and self.LuaViewmodelRecoil) then
		return
	end

	if self:Clip1() - self.AmmoPerShot <= 0 and self.Animations.fire_dry then
		self:sendWeaponAnim("fire_dry", 1, 0, true)
	elseif self.Animations["fire_last"] then
		if self:Clip1() == 1 then
			if self.dt.State == CW_AIMING and self.Animations["ads_fire_last"] then
				self:sendWeaponAnim( "ads_fire_last", (self.FireAnimSpeed or 1), 0, true)
			else
				self:sendWeaponAnim("fire_last", (self.FireAnimSpeed or 1), 0, true)
			end
		else
			if self.dt.State == CW_AIMING and self:FireAnimAiming() then
				self:sendWeaponAnim( self:FireAnimAiming(), (self.FireAnimSpeed or 1), 0, true)
			else
			self:sendWeaponAnim("fire", (self.FireAnimSpeed or 1), 0, true)
		end
	end
	else
		if self.dt.State == CW_AIMING then
			if self.isLauncher then
				self:sendWeaponAnim( self:FireAnimAiming(), (self.FireAnimSpeed or 1), 0, false)
			else
				self:sendWeaponAnim( self:FireAnimAiming(), (self.FireAnimSpeed or 1), 0, true)
			end
		else
			self:sendWeaponAnim("fire", self.FireAnimSpeed, 0, true)
		end
	end
end

function SWEP:getFireSound()
	return self.dt.Suppressed and self.FireSoundSuppressed or self.FireSound
end

function SWEP:getFireParticles()
	return self.dt.Suppressed and self.MuzzleEffectSupp or self.MuzzleEffect
end

local mul

function SWEP:canFireWeapon(checkType)
	if checkType == 1 then
		if self.ShotgunReloadState != 0 or self.AltShotgunReloadState != 0 then
			return
		end

		if self.ReloadDelay then
			return
		end

		local preFireResult = CustomizableWeaponry.callbacks.processCategory(self, "preFire")

		if preFireResult then
			return
		end
	elseif checkType == 2 then
		if CurTime() < self.GlobalDelay then
			return false
		end
	elseif checkType == 3 then
		if self:isNearWall() then
			return
		end

		if self.InactiveWeaponStates[self.dt.State] then
			return
		end

	end

	return true
end

--[[
- MELEE
]]
function SWEP:canMelee()
	-- check if melee properties are set up
	if not self.Melee or not self.Animations["melee"] then
		return false
	end

	return true -- self.CanMelee
end

function SWEP:meleeAttack( isFTP )
	CT = CurTime()
	
	if (SP and SERVER) or isFTP then
		-- animate viewmodel
		self:sendWeaponAnim( self:meleeAnimation(), (self.Melee.Speed or 1), 0, true, -1 )

		-- set damage time
		self.meleeDamageTime = CurTime() + self.Melee.AttackTime

		if self.drawAfterMelee then
			if timer.Exists("CW2_MELEEDRAW") then
				timer.Remove("CW2_MELEEDRAW")
			end

			timer.Create( "CW2_MELEEDRAW", self.Melee.Delay, 1, function()
				if IsValid(self) then
					if self.Animations["postmelee"] then
						self:sendWeaponAnim("postmelee", (self.PostMeleeSpeed or 1.5), 0, true, -1)
					else
						self:sendWeaponAnim("draw", (self.PostMeleeSpeed or 1.5), 0, true, -1)
					end
					self.GlobalDelay = CT + (self.Melee.AfterDrawTime or 0.25)
				end
			end )
		end
	end
end

function SWEP:meleeAnimation()
	-- default melee anim
	local anim = "melee"

	-- check for bayonet if we have animations
	if self.Animations["melee_bayonet"] then
		-- go through ActiveAttachments table
		for att,en in pairs(self.ActiveAttachments) do
			-- check if really active
			if en then
				local adata = CustomizableWeaponry:findAttachment( att )
				-- override anim if applicable for attachment
				if adata.isBayonet then
					anim = "melee_bayonet"
					break
				end
			end
		end
	end

	return anim
end

function SWEP:Rechamber()
	CT = CurTime()

	if self.ReloadDelay or CT < self.ReloadWait or self.dt.State == CW_ACTION or self.ShotgunReloadState != 0 then
		return
	end

	if CT < self.GlobalDelay then
		return
	end

	self.isRechambered = true
	-- it is now based on self.FireDelay
	if self.dt.AltActive and self.Altmode.RechamberTime then
		_time = (self.Altmode.RechamberTime or self.RechamberTime)
	else
		_time = (self.RechamberTime or 0)
	end

	local time = _time / self.ReloadSpeed

	self.BipodDelay = CT + time
	self:SetNextPrimaryFire(CT + time)
	self.ReloadWait = CT + time
	self.HolsterWait = CT + time
	self.GlobalDelay = CT + time

	if self.dt.AltActive and self.Animations["alt_rechamber"] then
		self:sendWeaponAnim("alt_rechamber", (self.RechamberSpeed or 1), 0, true)
	elseif self.dt.State == CW_AIMING and self.Animations["rechamber_ads"] then
		self:sendWeaponAnim("rechamber_ads", (self.RechamberSpeed or 1), 0, true, -1)
	else
		self:sendWeaponAnim("rechamber", (self.RechamberSpeed or 1), 0, true, -1)
	end
end

function SWEP:createBloodEffect(ent, trace)
	local effectData = EffectData()
	effectData:SetOrigin(trace.HitPos)
	effectData:SetEntity(ent)

	util.Effect("BloodImpact", effectData)
end

function SWEP:emitSoundFromList(list)
	self:EmitSound(list[math.random(1, #list)], 75, 100)
end

function SWEP:postPrimaryAttack()
	if CLIENT then
		if self.roundBeltBones then
			self:adjustVisibleRounds()
		end
	end
end

function SWEP:FireAnimAiming()
	-- default melee anim
	local anim = "ads_fire"

	-- check what scope it is
	if self.Animations["ads_fire_rds"] then
		-- go through ActiveAttachments table
		for att,en in pairs(self.ActiveAttachments) do
			-- check if really active
			if en then
				local adata = CustomizableWeaponry:findAttachment( att )
				-- override anim if applicable for attachment
				if adata.isRDS then
					anim = "ads_fire_rds"
					break
				end
			end
		end
	end

	if self.Animations["ads_fire_scope"] then
		-- go through ActiveAttachments table
		for att,en in pairs(self.ActiveAttachments) do
			-- check if really active
			if en then
				local adata = CustomizableWeaponry:findAttachment( att )
				-- override anim if applicable for attachment
				if adata.isScope then
					anim = "ads_fire_scope"
					break
				end
			end
		end
	end

	return anim
end

function SWEP:PrimaryAttack()

	if not self:canFireWeapon(1) then
		return
	end

	if self.BoltActionLogic and not self.isRechambered then
		self:Rechamber()
		return
	elseif self.Altmode.BoltActionLogic and not self.isRechambered then
		self:Rechamber()
		return
	end

--[[ not used in favor of melee
	if self.Owner:KeyDown(IN_USE) then
		if CustomizableWeaponry.quickGrenade.canThrow(self) then
			CustomizableWeaponry.quickGrenade.throw(self)
			return
		end
	end
]]
	if not self.isDualwield then
		if not self:canFireWeapon(2) then
			return
		end
	end

	if self.dt.Safe then
		self:CycleFiremodes()
		return
	end

	if self.MustAimToFire then
		if not self:isAiming() then
			return
		end
	end

	if not self:canFireWeapon(3) then
		return
	end

	-- melee attack
	if not self:isAiming() and self.Owner:KeyDown(IN_USE) and self:canMelee() then
		self:meleeAttack( IsFirstTimePredicted() )

		-- set a weapon timeout
		self:SetNextPrimaryFire( CurTime() + self.Melee.Delay )
		self:SetNextSecondaryFire( CurTime() + self.Melee.Delay )
		self.GlobalDelay = ( CurTime() + self.Melee.Delay )

		return
	end

	CT = CurTime()

	-- altmode fire logic
	if self.dt.AltActive then
		local mag, ammo = self:Clip2(), self.Owner:GetAmmoCount(self.Secondary.Ammo)
		if mag == 0 then
			if self.wpnEmptyType == "pistol" then
				self:EmitSound( "MW3_DRYFIRE_PISTOL", 100, 100 )
			elseif self.wpnEmptyType == "smg" then
				self:EmitSound( "MW3_DRYFIRE_SMG", 100, 100 )
			elseif self.wpnEmptyType == "rifle" then
				self:EmitSound( "MW3_DRYFIRE_RIFLE", 100, 100 )
			else
				self:EmitSound( "CW_EMPTY", 100, 100 )
			end
			self:SetNextPrimaryFire( CT + 1 )
			return
		end
		
		if mag == 0 and ammo == 0 then
			self:disableAltmode( IFTP )
		end
		
		-- thirdperson animation
		self.Owner:SetAnimation( PLAYER_ATTACK1 )

		if IsFirstTimePredicted() then
			local muzzleData = EffectData()
			muzzleData:SetEntity( self )
			util.Effect( "cw_muzzleflash", muzzleData )

			self:EmitSound( self.Altmode.FireSound or self.FireSound, 105, 100 )

			self:sendWeaponAnim( "alt_fire", self.Altmode.FireAnimSpeed or 1, 0, true )

			if self.Secondary.Ammo == "40MM" then
				if SERVER then
					if self.ActiveAttachments.mw3_att_gl_gp25 then
						CustomizableWeaponry.grenadeTypes.createGrenadeEntity(self, "mw3_grenade_gp25")
					elseif self.ActiveAttachments.mw3_att_gl_m320 then
						CustomizableWeaponry.grenadeTypes.createGrenadeEntity(self, "mw3_grenade_m320")
					else
						CustomizableWeaponry.grenadeTypes.createGrenadeEntity(self, "mw3_grenade_m203")
					end
				end
			else
				self:FireBullet( self.Altmode.Damage, self.CurCone, self.Altmode.ClumpSpread, self.Altmode.Shots )
			end

			self:makeFireEffects()
			self:addFireSpread( CT )

			-- apply a global delay after shooting, if there is one
			if self.GlobalDelayOnShoot then
				self.GlobalDelay = CT + self.GlobalDelayOnShoot
			end
		end

		self:MakeRecoil()

		local suppressAmmoUsage = CustomizableWeaponry.callbacks.processCategory(self, "shouldSuppressAmmoUsage")
		if not suppressAmmoUsage or self.Secondary.Ammo == "40MM" then
			local num = self.Altmode.AmmoPerShot or 1
			if self:Clip2() > 0 then
				self:SetClip2( self:Clip2() - num )
			end

			if self.Owner:GetAmmoCount(self.Secondary.Ammo) > 0 then
				self.Owner:RemoveAmmo( num, self.Secondary.Ammo )
			end
		end

		self:SetNextPrimaryFire( CT + (self.Altmode.FireDelay or 0.05) )

		if self.Altmode.BoltActionLogic and self:Clip2() > 0 then
			self.isRechambered = false
		end

		-- either force the weapon back to hip after firing, or don't
		if self.ForceBackToHipAfterAimedShot then
			self.dt.State = CW_IDLE
			self:SetNextSecondaryFire(CT + self.ForcedHipWaitTime)
		else
			self:SetNextSecondaryFire(CT + (self.Altmode.FireDelay or 0.05))
		end

		self.ReloadWait = CT + (self.Altmode.FireDelay or 0.05)

		return
	end		-- altmode fire logic end

	mag = self:Clip1()
	if mag == 0 or (self.BoltActionLogic and not self.isRechambered) then
		if self.wpnEmptyType == "pistol" then
			self:EmitSound( "MW3_DRYFIRE_PISTOL", 100, 100 )
		elseif self.wpnEmptyType == "smg" then
			self:EmitSound( "MW3_DRYFIRE_SMG", 100, 100 )
		elseif self.wpnEmptyType == "rifle" then
			self:EmitSound( "MW3_DRYFIRE_RIFLE", 100, 100 )
		else
			self:EmitSound( "CW_EMPTY", 100, 100 )
		end
		self:SetNextPrimaryFire( CT + 0.35 )
		return
	end

	if self.BurstAmount and self.BurstAmount > 0 then
		if self.dt.Shots >= self.BurstAmount then
			return
		end

		self.dt.Shots = self.dt.Shots + 1
	end

	self.Owner:SetAnimation( PLAYER_ATTACK1 )

	if IsFirstTimePredicted() then
		local muzzleData = EffectData()
		muzzleData:SetEntity( self )
		util.Effect( "cw_muzzleflash", muzzleData )

		-- take care of looping fire sounds
		if self.LoopFireSound then
			-- start the sound if necessary
			if not self.LoopSound then
				if self.dt.Suppressed then
					self:EmitSound(self.FireSoundSuppressed, 105)
				else
					self:EmitSound(self.FireSound, 105)
				end
				self.LoopSound = true
			end

			self.LoopSoundTime = CT + self.FireDelay + 0.02
		else
			if self.dt.Suppressed then
				self:EmitSound(self.FireSoundSuppressed, 105, 100)
				if self.FireMechanicSoundSuppressed then
					self:EmitSound(self.FireMechanicSoundSuppressed, 105, 100)
				end
			else
				self:EmitSound(self.FireSound, 105, 100)
				if self.FireMechanicSound then
					self:EmitSound(self.FireMechanicSound, 105, 100)
				end
			end
		end

		if self.fireAnimFunc then
			self:fireAnimFunc()
		else
			if self.dt.State == CW_AIMING then
				if self.ADSFireAnim then
					self:playFireAnim()
				end
			else
				self:playFireAnim()
			end
		end

		if self.Primary.Ammo == "40MM" or self.Primary.Ammo == "40mm" then
			if SERVER then
				CustomizableWeaponry.grenadeTypes.createGrenadeEntity(self, "mw3_grenade_m320_gl")
			end
		elseif self.Primary.Ammo == "25MM" then
			if SERVER then
				CustomizableWeaponry.grenadeTypes.createGrenadeEntity(self, "mw3_grenade_xm25")
			end
		elseif self.Primary.Ammo == "RPG_Round" then
			if SERVER then
				if self.isSMAW then
					CustomizableWeaponry.grenadeTypes.createGrenadeEntity(self, "mw3_rocket_smaw")
				else
					CustomizableWeaponry.grenadeTypes.createGrenadeEntity(self, "mw3_rocket_rpg")
				end
			end
		else
			self:FireBullet( self.Damage, self.CurCone, self.ClumpSpread, self.Shots )
		end

		self:makeFireEffects()

		if CLIENT then
			self:simulateRecoil()
		end

		self:addFireSpread(CT)

		if SP and SERVER then
			SendUserMessage("CW_Recoil", self.Owner)
		end

		-- apply a global delay after shooting, if there is one
		if self.GlobalDelayOnShoot then
			self.GlobalDelay = CT + self.GlobalDelayOnShoot
		end
	end

	self:MakeRecoil()

	CustomizableWeaponry.callbacks.processCategory(self, "postFire")

	local suppressAmmoUsage = CustomizableWeaponry.callbacks.processCategory(self, "shouldSuppressAmmoUsage")
	if not suppressAmmoUsage then
		self:TakePrimaryAmmo(self.AmmoPerShot)
	end

	self:SetNextPrimaryFire(CT + self.FireDelay)

	if self.BoltActionLogic then
		self.isRechambered = false
	end

	-- either force the weapon back to hip after firing, or don't
	if self.ForceBackToHipAfterAimedShot then
		self.dt.State = CW_IDLE
		self:SetNextSecondaryFire(CT + self.ForcedHipWaitTime)
	else
		if not self.isDualwield then
			self:SetNextSecondaryFire(CT + self.FireDelay)
		end
	end

	self.ReloadWait = CT + (self.WaitForReloadAfterFiring and self.WaitForReloadAfterFiring or self.FireDelay)

	self:postPrimaryAttack()
	CustomizableWeaponry.callbacks.processCategory(self, "postConsumeAmmo")

	if SP and SERVER then
		SendUserMessage("CW_PostFire", self.Owner)
	end
end

function SWEP:fireM203(firstTimePrediction)
	if SERVER and SP then
		SendUserMessage("CW20_FIREM203", self.Owner)
	end

	CustomizableWeaponry.grenadeTypes.selectFireFunc(self, IsFirstTimePredicted())
	self.Owner:ViewPunch(Angle(math.Rand(-5, -4), math.Rand(-2, 2), math.Rand(-1, 1)))

	self.M203Chamber = false

	if CLIENT then
		self:makeVMRecoil(5)

		--local vm = self.AttachmentModelsVM.md_m203.ent
		--ParticleEffectAttach("muzzleflash_m79", PATTACH_POINT_FOLLOW, vm, vm:LookupAttachment("1"))
	end

	self:delayEverything(0.4)
	self:setGlobalDelay(0.4)
end

function SWEP:reloadM203()
	if SERVER and SP then
		SendUserMessage("CW20_RELOADM203", self.Owner)
	end

	if self:filterPrediction() then
		self:setCurSoundTable(self.M203ReloadSounds, 1, 0)
	end

	if CLIENT then
		self:setM203Anim(self.M203Anims.reload)
	end

	self:setGlobalDelay(2.6)

	CustomizableWeaponry.actionSequence.new(self, 2, nil, function()
		if SERVER then
			self.Owner:RemoveAmmo(1, "40MM")
		end


		self.M203Chamber = true
	end)
end

function SWEP:makeFireEffects( fmode )
	if SP and SERVER then
		-- god damn prediction disabled in SP
		SendUserMessage("CW20_EFFECTS2", LocalPlayer, fmode)
		return
	end

	if CLIENT then
		if self.MuzzleEffect then
			self:CreateMuzzle( fmode )
		end

		if self.Shell then
			if not self.dt.AltActive then
				if not self.NoShell then
					self:CreateShell( nil, fmode )
				end
			end
		end
	end
end

local ang

function SWEP:GetRecoilModifier(mod)
	mod = mod and mod or 1

	if self.Owner:Crouching() then
		mod = mod * 0.85
	end

	if self.dt.State == CW_AIMING then
		mod = mod * 0.85
	end

	if self.dt.Suppressed then
		mod = mod * 0.85
	end

	if self:isPlayerProne() then
		mod = mod * 0.65
	end

	-- increase recoil by 20% if we're in M203 mode
	if self.dt.M203Active then
		mod = mod * 1.2
	end

	if self.dt.BipodDeployed then
		mod = mod * self.BipodRecoilModifier
	else
		-- if we don't have a bipod deployed, but we can rest our weapon on a surface, reduce recoil by a bit
		if self.dt.State == CW_AIMING then
			if self.CanRestOnObjects then
				if self:CanRestWeapon(self.WeaponRestHeightRequirement) then
					mod = mod * self.RestWeaponRecoilMult
				end
			end
		end

		if self.freeAimOn then -- compensate for the lack of ViewPunch by increasing the recoil modifier by 50%
			mod = mod * 1.5
		end
	end

	-- multiply recoil in case we have a burst fire firemode enabled
	if self.BurstAmount > 0 then
		mod = mod * self.BurstRecoilMul
	end

	-- pass the recoil to possible callbacks
	local finalMod = CustomizableWeaponry.callbacks.processCategory(self, "calculateRecoil", mod)

	mod = finalMod or mod

	-- increase recoil as weapon spread increases
	mod = mod * 1 + (self.AddSpread / self.MaxSpreadInc) * self.RecoilToSpread

	return mod
end

function SWEP:isFreeAimOn()
	if self.NoFreeAim then
		return false
	end

	local result = CustomizableWeaponry.callbacks.processCategory(self, "forceFreeAim")

	if result or self.Owner:GetInfoNum("cw_freeaim", 0) > 0 then
		return true
	end

	return false
end

function SWEP:MakeRecoil(mod)
	local mod = self:GetRecoilModifier(mod)
	local IFTP = IsFirstTimePredicted()
	local freeAimOn = self:isFreeAimOn()

	if (SP and SERVER) or (not SP and CLIENT and IFTP) then
		ang = self.Owner:EyeAngles()
		if self.RecoilReturnToOrig then
			if freeAimOn or (freeAimOn and self.dt.BipodDeployed) then 
				ang.p = ang.p - self.Recoil * 0.5 * mod
				ang.y = ang.y + math.Rand(-1, 1) * self.Recoil * 0.5 * mod
			else
				ang.p = ang.p - self.Recoil * 0 * mod
				ang.y = ang.y + math.Rand(-1, 1) * self.Recoil * 0 * mod
			end
		else
			ang.p = ang.p - self.Recoil * 0.5 * mod
			ang.y = ang.y + math.Rand(-1, 1) * self.Recoil * 0.5 * mod
		end
		
		self.Owner:SetEyeAngles(ang)
	end

	if not freeAimOn or (freeAimOn and self.dt.BipodDeployed) then
		if self.RecoilDown then
			if self.RecoilLeft and self.RecoilRight then
				self.Owner:ViewPunch(Angle(math.Rand(-self.Recoil * (self.RecoilMult or 1.25) * mod, self.RecoilDown * (self.RecoilMult or 1.25) * mod), (self.Recoil * math.Rand(self.RecoilLeft * (self.RecoilMult or 1.25) * mod, -self.RecoilRight * (self.RecoilMult or 1.25) * mod)), 0))
			elseif self.RecoilLeft then
				self.Owner:ViewPunch(Angle(math.Rand(-self.Recoil * (self.RecoilMult or 1.25) * mod, self.RecoilDown * (self.RecoilMult or 1.25) * mod), (self.RecoilLeft or 0) * (self.RecoilMult or 1.25) * mod, 0))
			elseif self.RecoilRight then
				self.Owner:ViewPunch(Angle(math.Rand(-self.Recoil * (self.RecoilMult or 1.25) * mod, self.RecoilDown * (self.RecoilMult or 1.25) * mod), (-self.RecoilRight or 0) * (self.RecoilMult or 1.25) * mod, 0))
			end
		else
			if self.RecoilLeft and self.RecoilRight then
				self.Owner:ViewPunch(Angle(-self.Recoil * (self.RecoilMult or 1.25) * mod, (self.Recoil * math.Rand(self.RecoilLeft * (self.RecoilMult or 1.25) * mod, -self.RecoilRight * (self.RecoilMult or 1.25) * mod)), 0))
			elseif self.RecoilLeft then
				self.Owner:ViewPunch(Angle(-self.Recoil * (self.RecoilMult or 1.25) * mod, (self.RecoilLeft or 0) * (self.RecoilMult or 1.25) * mod, 0))
			elseif self.RecoilRight then
				self.Owner:ViewPunch(Angle(-self.Recoil * (self.RecoilMult or 1.25) * mod, (-self.RecoilRight or 0) * (self.RecoilMult or 1.25) * mod, 0))
			else
				self.Owner:ViewPunch(Angle(-self.Recoil * (self.RecoilMult or 1.25) * mod, 0, 0))
			end
		end
	end

	if CLIENT and IFTP then
		if self.AimBreathingEnabled then
			if self.holdingBreath then
				self:reduceBreathAmount(mod)
			else
				self:reduceBreathAmount(0)
			end
		end
	end
end

function SWEP:SecondaryAttack()
	local IFTP, CT = IsFirstTimePredicted(), CurTime()
	local mag2, ammo2 = self:Clip2(), self.Owner:GetAmmoCount(self.Secondary.Ammo)

	if self.ShotgunReloadState != 0 then
		return
	end

	if self:isNearWall() then
		return
	end

									 
			  
	

	if self.dt.Safe then
		--self:CycleFiremodes()
		return
	end

	-- dualwield fire logic
	if self.isDualwield then
		if CustomizableWeaponry.callbacks.processCategory(self, "preFire") then
			return
		end

		if self.InactiveWeaponStates[self.dt.State] then
			return
		end

		if self.RightReloadDelay then
			return
		end

		if mag2 == 0 then
			if self.wpnEmptyType == "pistol" then
				self:EmitSound( "MW3_DRYFIRE_PISTOL", 100, 100 )
			elseif self.wpnEmptyType == "smg" then
				self:EmitSound( "MW3_DRYFIRE_SMG", 100, 100 )
			elseif self.wpnEmptyType == "rifle" then
				self:EmitSound( "MW3_DRYFIRE_RIFLE", 100, 100 )
			else
				self:EmitSound( "CW_EMPTY", 100, 100 )
			end

			self:SetNextSecondaryFire( CT + 1 )
			return
		end
		
		-- thirdperson animation
		self.Owner:SetAnimation( PLAYER_ATTACK1 )

		if IsFirstTimePredicted() then
			local muzzleData = EffectData()
			muzzleData:SetEntity( self )
			util.Effect( "ma85_muzzleflash_dw", muzzleData )
			
			-- take care of looping fire sounds
			if self.LoopFireSound then
				-- start the sound if necessary
				if not self.LoopSound then
					if self.dt.Suppressed then
						self:EmitSound(self.FireSoundSuppressed, 105)
					else
						self:EmitSound(self.FireSound, 105)
					end
					self.LoopSound = true
				end

				self.LoopSoundTime = CT + self.FireDelay + 0.02
			else
				if self.dt.Suppressed then
					self:EmitSound(self.FireSoundSuppressed, 105, 100)
					if self.FireMechanicSoundSuppressed then
						self:EmitSound(self.FireMechanicSoundSuppressed, 105, 100)
					end
					if self.FireTailSoundSuppressed then
						self:EmitSound(self.FireTailSoundSuppressed, 105, 100)
					end
				else
					self:EmitSound(self.FireSound, 105, 100)
					if self.FireMechanicSound then
						self:EmitSound(self.FireMechanicSound, 105, 100)
					end
					if self.FireTailSound then
						self:EmitSound(self.FireTailSound, 105, 100)
					end
				end
			end

			if self:Clip2() == 1 and self.Animations["fire_last_right"] then
				self:sendWeaponAnim( "fire_last", self.FireAnimSpeed or 1, 0, true, 1 )
			else
				self:sendWeaponAnim( "fire", self.FireAnimSpeed or 1, 0, true, 1 )
			end

			if self.Primary.Ammo == "40MM" or self.Primary.Ammo == "40mm" then
				if SERVER then
					CustomizableWeaponry.grenadeTypes.createGrenadeEntity(self, "bo_grenade_chinalake")
				end
			else
				self:FireBullet( self.Damage, self.CurCone, self.ClumpSpread, self.Shots )
			end

			self:makeFireEffects( 1 )

			if CLIENT then
				self:simulateRecoil()
			end

			self:addFireSpread(CT)

			if SP and SERVER then
				SendUserMessage("CW_Recoil", self.Owner)
			end

			-- apply a global delay after shooting, if there is one
			if self.GlobalDelayOnShoot then
				self.GlobalDelay = CT + self.GlobalDelayOnShoot
			end
		end

		self:MakeRecoil()

		local suppressAmmoUsage = CustomizableWeaponry.callbacks.processCategory(self, "shouldSuppressAmmoUsage")
		if not suppressAmmoUsage then
			local num = self.AmmoPerShot or 1
			if self:Clip2() > 0 then
				self:SetClip2( self:Clip2() - num )
			end
		end

		self:SetNextSecondaryFire( CT + (self.FireDelay or 0.05) )
		self.ReloadWait = CT + (self.FireDelay or 0.05)

		return
	end		-- dualwield fire logic end

	if CurTime() < self.GlobalDelay then
		return false
	end

	if self.ReloadDelay or self.AltReloadDelay then
		return
	end

	if self.InactiveWeaponStates[self.dt.State] or (self.dt.State == CW_AIMING and self.HoldToAim) then
		return
	end

	if self.Owner:KeyDown(IN_USE) then
		if self.hasAltmode and self.AltmodeToggleStates[self.dt.State] then
			if self.dt.AltActive then
				self:disableAltmode( IFTP )

				if SERVER and SP then
					SendUserMessage( "CW20_ALTMODEOFF", self.Owner )
				end
			else
				if not (mag2 == 0 and ammo2 == 0) then
					self:enableAltmode( IFTP )

					if SERVER and SP then
						SendUserMessage( "CW20_ALTMODEON", self.Owner )
					end
				end
			end

			self:delayEverything( 0.4 )
			return
		elseif self.hasHybrid then
			if self.HybridOn then
				if SERVER and SP then
					SendUserMessage( "CW20_HYBRIDOFF", self.Owner )
				end

				self:disableHybridsight( IFTP )
			else
				if SERVER and SP then
					SendUserMessage( "CW20_HYBRIDON", self.Owner )
				end

				self:enableHybridsight( IFTP )
			end

			self:SetNextSecondaryFire(CT + 0.2)
			return
		end
	end

	if self.dt.AltActive and self.Altmode.NoADS then
		return
	end

	if not self.Owner:OnGround() or Length(GetVelocity(self.Owner)) >= self.Owner:GetWalkSpeed() * self.RunStateVelocity then
		return
	end

	CT = CurTime()

	if self.dt.State ~= CW_AIMING then
		self.dt.State = CW_AIMING
		if self.AimAnim and self:Clip1() == 0 and not self:isReloading() and self.Animations["aim_in_empty"] then
			self:sendWeaponAnim( "aim_in_empty", (self.ADSSpeed or 1) * (self.ADSInSpeedMult or 1), 0, false )
		elseif self.AimAnim then
			self:sendWeaponAnim( "aim_in", (self.ADSSpeed or 1) * (self.ADSInSpeedMult or 1), 0, false )
		end

		if not self.AimDelay then
			self.AimDelay = CT + self.ADSTime
			self.GlobalDelay = CT + self.ADSTime
		end

		if SERVER then
			SendUserMessage("CW_TAKEAIM", self.Owner)
		end

		if self:filterPrediction() then
			--self:EmitSound("CW_TAKEAIM")
		end

	else
		self.dt.State = CW_AIMDOWN
		if self:Clip1() == 0 and self.Animations["aim_out_empty"] then
			self:sendWeaponAnim( "aim_out_empty", (self.ADSSpeed or 1), 0, true )
			self.GlobalDelay = CT + self.ADSTime
		else
			if self.Animations["aim_out"] then
				self:sendWeaponAnim( "aim_out", (self.ADSSpeed or 1), 0, true )
			end
			self.GlobalDelay = CT + self.ADSTime
		end

		if not self.AimDelay then
			self.AimDelay = CT + self.ADSTime
		end

		if SERVER then
			SendUserMessage("CW_LOWERAIM", self.Owner)
		end

		if self:filterPrediction() then
			self:EmitSound("CW_LOWERAIM")
		end

	end

	if IFTP then
		self.AimTime = UnPredictedCurTime() + (self.ScopeSpeed or 0)

		if self.PreventQuickScoping then
			self.AddSpread = math.Clamp(self.AddSpread + self.QuickScopeSpreadIncrease, 0, self.MaxSpreadInc)
			self.SpreadWait = CT + 0.3
		end
	end

	if SERVER then
		SendUserMessage("CW_AimTime", self.Owner)
	end

	self:SetNextSecondaryFire(CT + 0.1)
end

function SWEP:enableHybridsight( IFTP )
local adata = CustomizableWeaponry:findAttachment( att )

	if self.Animations_Hybrid then
		if self.Animations["hybrid_on_hb"] then
			if self.isHBSAttached then
				self:sendWeaponAnim( "hybrid_on_hb", 1, 0, true )
			else
				self:sendWeaponAnim( "hybrid_on", 1, 0, true )
			end
		else
			self:sendWeaponAnim( "hybrid_on", 1, 0, true )
		end
		self.Animations = self.Animations_Normal
	end

	self.AimPos = self[self.aimPosHybridUp[1]] or self.AimPos
	self.AimAng = self[self.aimPosHybridUp[2]] or self.AimAng
	self.ZoomAmount = self.FOVModifierHybridUp or 30
	self.GlobalDelay = CT + (self.ToggleInTime or 1)

	self.HybridOn = true
end

function SWEP:disableHybridsight( IFTP )
	if self.Animations_Hybrid then
		if self.Animations["hybrid_off_hb"] then
			if self.isHBSAttached then
				self:sendWeaponAnim( "hybrid_off_hb", 1, 0, true )
			else
				self:sendWeaponAnim( "hybrid_off", 1, 0, true )
			end
		else
			self:sendWeaponAnim( "hybrid_off", 1, 0, true )
		end
		self.Animations = self.Animations_Hybrid
	end

	self.AimPos = self[self.aimPosHybridDown[1]] or self.AimPos
	self.AimAng = self[self.aimPosHybridDown[2]] or self.AimAng
	self.ZoomAmount = self.FOVModifierHybridDown or 30
	self.GlobalDelay = CT + (self.ToggleOutTime or 1)

	self.HybridOn = false
end

function SWEP:enableAltmode( IFTP )
	CT = CurTime()

	self:SetAltActive( true )

	self.CrosshairParts = {left = false, right = false, upper = false, lower = false}
	self.Altmode.Auto_Orig = self.Primary.Automatic
	self.Primary.Automatic = (self.Altmode.Automatic or false)
	self.MuzzleEffect = (self.Altmode.MuzzleEffect or (self.MuzzleEffect_Orig or self.MuzzleEffect_orig))
	self.GlobalDelay = CT + (self.ToggleInTime or 1)

	if CLIENT and IFTP then
		self:sendWeaponAnim( "toggle", 1, 0, true)
	end
end

function SWEP:disableAltmode( IFTP )
	CT = CurTime()
	self:SetAltActive( false )

	self.CrosshairParts = self.CrosshairParts_Orig
	self.Primary.Automatic = self.Primary.Automatic_Orig
	self.Altmode.Auto_Orig = nil
	self.MuzzleEffect = (self.MuzzleEffect_Orig or self.MuzzleEffect_orig)
	self.GlobalDelay = CT + (self.ToggleOutTime or 1)

	if CLIENT and IFTP then
		self:sendWeaponAnim( "alt_toggle", 1, 0, true)
	end
end

function SWEP:enableM203()
	self:resetM203Anim()
	self:setM203Anim(self.M203Anims.idle_to_ready, 0.1)
	self:offsetM203ArmBone(false) -- move the arm bone away
end

function SWEP:disableM203(firstTimePrediction)
	self:resetM203Anim()
	self:offsetM203ArmBone(true) -- restore it

	if firstTimePrediction then
		self.M203Time = UnPredictedCurTime() + 0.25
	end
end

function SWEP:DoImpactEffect(traceData, damageType)
	local shouldSuppress, realm = CustomizableWeaponry.callbacks.processCategory(self, "suppressDefaultImpactEffect")

	if shouldSuppress then
		if CLIENT and realm == CLIENT then
			return true
		elseif SERVER and realm == SERVER then
			return true
		end
	end
end

if CLIENT then
	local EP, EA2, FT

	function SWEP:ViewModelDrawn()
		EP, EA2, FT = EyePos(), EyeAngles(), FrameTime()

		if IsValid(self.Hands) then
			self.Hands:SetRenderOrigin(EP)
			self.Hands:SetRenderAngles(EA2)
			self.Hands:FrameAdvance(FT)
			self.Hands:SetupBones()
			self.Hands:SetParent(self.Owner:GetViewModel())
			self.Hands:DrawModel()
		end
	end

	local wm, pos, ang
	local GetBonePosition = debug.getregistry().Entity.GetBonePosition

	local ply, wep

	local function GetRecoil()
		ply = LocalPlayer()

		if not ply:Alive() then
			return
		end

		wep = ply:GetActiveWeapon()

		if IsValid(wep) and wep.CW20Weapon then
			CT = CurTime()
			wep.SpreadWait = CT + wep.SpreadCooldown

			wep:MakeRecoil()
			wep:simulateRecoil()
			wep:addFireSpread(CT)
		end
	end

	usermessage.Hook("CW_Recoil", GetRecoil)

	local function PostFire()
		ply = LocalPlayer()

		if not ply:Alive() then
			return
		end

		wep = ply:GetActiveWeapon()

		if IsValid(wep) and wep.CW20Weapon then
			wep:postPrimaryAttack()
		end

		if wep.ForceBackToHipAfterAimedShot and wep.AimModel and wep.AttachmentModelsVM then
			wep.AttachmentModelsVM[wep.AimModel.name].ent:SetBodygroup( wep.AimModel.group, wep.AimModel.lowered )
			wep.CW_VM.hideModel = false
		end

	end

	usermessage.Hook("CW_PostFire", PostFire)

	local function AimTime()
		ply = LocalPlayer()

		if not ply:Alive() then
			return
		end

		wep = ply:GetActiveWeapon()

		if IsValid(wep) and wep.CW20Weapon then
			wep.AimTime = UnPredictedCurTime() + (wep.ScopeSpeed or 0)

			if wep.PreventQuickScoping then
				wep.AddSpread = math.Clamp(wep.AddSpread + wep.QuickScopeSpreadIncrease, 0, wep.MaxSpreadInc)
				wep.SpreadWait = CurTime() + 0.3
			end
		end
	end

	usermessage.Hook("CW_AimTime", AimTime)

	local function TakeAim()
		ply = LocalPlayer()

		if not ply:Alive() then
			return
		end

		wep = ply:GetActiveWeapon()

		if wep.AimModel and wep.AttachmentModelsVM then
			if timer.Exists("CW2_AIMMODELOV") then
				timer.Remove("CW2_AIMMODELOV")
			end

			timer.Create( "CW2_AIMMODELOV", wep.AimModel.raiseTime, 1, function()
				if wep and IsValid(wep) then
					wep.AttachmentModelsVM[wep.AimModel.name].ent:SetBodygroup( wep.AimModel.group, wep.AimModel.raised )
					if wep.AimModel.hide then
						wep.CW_VM.hideModel = true
					end
				end
			end )
		end
	end
	usermessage.Hook("CW_TAKEAIM", TakeAim )

	local function LowerAim()
		ply = LocalPlayer()

		if not ply:Alive() then
			return
		end

		wep = ply:GetActiveWeapon()

		if timer.Exists("CW2_AIMMODELOV") then
			timer.Remove("CW2_AIMMODELOV")
		end

		if wep.AimModel and wep.AttachmentModelsVM then
			wep.AttachmentModelsVM[wep.AimModel.name].ent:SetBodygroup( wep.AimModel.group, wep.AimModel.lowered )
			wep.CW_VM.hideModel = false
		end
	end
	usermessage.Hook("CW_LOWERAIM", LowerAim )

	local function CW_ReceiveFireMode(um)
		ply = um:ReadEntity()
		Mode = um:ReadString()

		if IsValid(ply) then
			wep = ply:GetActiveWeapon()
			wep.FireMode = Mode

			if IsValid(ply) and IsValid(wep) and wep.CW20Weapon then
				if CustomizableWeaponry.firemodes.registeredByID[Mode] then
					t = CustomizableWeaponry.firemodes.registeredByID[Mode]

					wep.Primary.Automatic = t.auto
					wep.BurstAmount = t.burstamt
					wep.FireModeDisplay = t.display
					wep.BulletDisplay = t.buldis
					wep.CheckTime = CurTime() + 2

					if ply == LocalPlayer() then
						ply:EmitSound("weapons/smg1/switch_single.wav", 70, math.random(92, 112))
					end
				end
			end
		end
	end

	usermessage.Hook("CW_FIREMODE", CW_ReceiveFireMode)
end

function SWEP:IndividualInitialize()
	if CLIENT then
		self:initBeltBones()
	end

	if self.BoltActionLogic then
		self.isRechambered = true
	end

	if self.Altmode.BoltActionLogic then
		self.isRechambered = true
	end

end

function SWEP:initBeltBones()
	local vm = self.CW_VM
	self.roundBeltBones = {}

	if self.RoundBeltBoneNames then
		for key, boneName in ipairs(self.RoundBeltBoneNames) do
			local bone = vm:LookupBone(boneName)
			self.roundBeltBones[key] = bone
		end
	end
end

local fullSize = Vector(1, 1, 1)
local invisible = Vector(0, 0, 0)

function SWEP:adjustVisibleRounds(curMag)
	if not self.roundBeltBones then
		self:initBeltBones()
	end

	local curMag = curMag or self:Clip1()
	local boneCount = #self.roundBeltBones
	local vm = self.CW_VM

	for i = 1, boneCount do
		local roundID = boneCount - (i - 1)
		local element = self.roundBeltBones[roundID]

		local scale = curMag >= roundID and fullSize or invisible
		vm:ManipulateBoneScale(element, scale)
	end
end

function SWEP:IndividualThink()

end

function SWEP:ActivateDualwield()
    -- toggle attachmentequipped flag
    self.AttachmentEquipped = true

    -- change animations
    self.Animations = self.Animations_Akimbo
    self.NormalHoldType_Orig = self.NormalHoldType
    self.NormalHoldType = "duel"
	
    -- enable secondary firemode
    self.Secondary.ClipSize		= self.Primary.ClipSize
	self.Secondary.DefaultClip	= self.Primary.DefaultClip
	self.Secondary.Ammo			= self.Primary.Ammo
    self.Secondary.Automatic    = self.Primary.Automatic

	self.isDualwield = true

    if CLIENT then
        -- change the model to the akimbo viewmodel
        self.CW_VM:SetModel( self.ViewModel_AkimboL )

        -- create a second viewmodel for the right hand gun...
        self.CW_VM2 = self:createManagedCModel(self.ViewModel_AkimboR, RENDERGROUP_BOTH)
        self.CW_VM2:SetNoDraw(true)
        self.CW_VM2:SetupBones()

        -- ...a second set of hands for that second gun...
        local arms = self.Owner:GetHands()
        self.CW_CSTM_ARMS2 = self:createManagedCModel(arms:GetModel(), RENDERGROUP_BOTH)
        self.CW_CSTM_ARMS2:SetNoDraw(true)
        self.CW_CSTM_ARMS2:SetupBones()
        self.CW_CSTM_ARMS2:SetParent(self.CW_VM2)
        self.CW_CSTM_ARMS2:AddEffects(EF_BONEMERGE)
        self.CW_CSTM_ARMS2:AddEffects(EF_BONEMERGE_FASTCULL)

        -- and a second worldmodel
        if self.WM then
			if self.WM2 then
				self.WMEnt2 = self:createManagedCModel(self.WM2, RENDERGROUP_BOTH)
			else
				self.WMEnt2 = self:createManagedCModel(self.WM, RENDERGROUP_BOTH)
			end
			if self.WMDW then
				self.WMEnt:Remove()
				self.WMEnt = self:createManagedCModel(self.WMDW, RENDERGROUP_BOTH)
				self.WMEnt:SetNoDraw(true)
			end
			self.WMEnt2:SetNoDraw(true)
        end
		
        if self.dt.CurrentSkin and self.dt.CurrentSkin != "" then
            self:applySkin( self.dt.CurrentSkin )
        end

    end

    if SERVER then
	    local ammo = self.Owner:GetAmmoCount(self.Secondary.Ammo)
	    self:SetClip2( math.Clamp(self:Clip1(), 0, ammo) )
        self.Owner:RemoveAmmo(math.Clamp(self:Clip1(), 0, ammo), self.Secondary.Ammo)
    end
	
	if not self.FirstDeploy then
		if self:Clip1() == 0 and self.Animations["idle_empty"] then
			self:sendWeaponAnim("idle_empty", 1, 0, true )
		else
			self:sendWeaponAnim("idle", 1, 0, true )
		end
		if self.CW_VM2 then
			if self:Clip2() == 0 and self.Animations["idle_empty_right"] then
				self:sendWeaponAnim("idle_empty", 1, 0, true, 1)
			else
				self:sendWeaponAnim("idle", 1, 0, true, 1)
			end
		end
	end
	
	if self.ShotgunReload and self.ShotgunReload_Orig then
		self.ShotgunReload = nil
	end
	
	self.CustomizePos = self.CustomizePos_Akimbo
	self.CustomizeAng = self.CustomizeAng_Akimbo
	
	if self.BoltBone and self.BoltBone_Orig then
		self.BoltBone = nil
		self.HoldBoltWhileEmpty = false
	end
	
	self.CalcViewCamera = nil
	
end

function SWEP:DisableDualwield()
    -- reset attachment flag
	self.AttachmentEquipped = nil

    -- reset animation
    self.Animations = self.Animations_Normal
    self.NormalHoldType = self.NormalHoldType_Orig

    -- put ammo back into the reserve
    if SERVER then
        self.Owner:GiveAmmo(self:Clip2(), self.Secondary.Ammo, true)
    end

    -- disable secondary fire mode
    self.isDualwield = nil
    self.Secondary.ClipSize 	= -1
	self.Secondary.DefaultClip	= -1
	self.Secondary.Ammo			= "none"
    self.Secondary.Automatic    = self.Secondary.Automatic_Orig

    if CLIENT then
        -- reset viewmodel
        self.CW_VM:SetModel( self.ViewModel )
		
		self:sendWeaponAnim("idle", 1, 0, false, 1)
		
        -- remove second viewmodel...
        if self.CW_VM2 then
            self.CW_VM2:Remove()
            self.CW_VM2 = nil
        end

        -- ... and hands ...
        if self.CW_CSTM_ARMS2 then
            self.CW_CSTM_ARMS2:Remove()
            self.CW_CSTM_ARMS2 = nil
        end

        -- ... and worldmodel
        if self.WMEnt2 then
            self.WMEnt2:Remove()
            self.WMEnt2 = nil
        end
		
		if self.WMDW then
			self.WMEnt:Remove()
			self.WMEnt = self:createManagedCModel(self.WM, RENDERGROUP_BOTH)
			self.WMEnt:SetNoDraw(true)
		end
				
        if self.dt.CurrentSkin and self.dt.CurrentSkin != "" then
            self:applySkin( self.dt.CurrentSkin )
        end

    end

	if self:Clip1() == 0 then
		self:sendWeaponAnim("idle_empty", 1, 0, true, -1)
	else
		self:sendWeaponAnim("idle", 1, 0, true, -1)
	end
		
	if self.ShotgunReload_Orig then
		self.ShotgunReload = self.ShotgunReload_Orig
	end
	
	self.CustomizePos = self.CustomizePos_Orig
	self.CustomizeAng = self.CustomizeAng_Orig
	
	if self.BoltBone_Orig then
		self.BoltBone = self.BoltBone_Orig
		self.HoldBoltWhileEmpty = true
	end
	
	self.CalcViewCamera = "Camera"
	
end

function SWEP:GiveSecondaryAmmoGL()
  local res = self.Altmode.Ammo
  if res ~= "40MM" or self.HasBeenGiven40MM then
    return
  end

  local mag = self.Owner:GetAmmoCount(self.Secondary.Ammo)
  if mag == 0 then
    self.Owner:SetAmmo(mag + 2, res)
    self.HasBeenGiven40MM = true
  end
end

function SWEP:GiveSecondaryAmmoSHG()
  local res = self.Altmode.Ammo
  if res ~= "buckshot" or self.HasBeenGivenBuckshot then
    return
  end

  local mag = self.Owner:GetAmmoCount(self.Secondary.Ammo)
  if mag == 0 then
    self.Owner:SetAmmo(mag + 8, res)
    self.HasBeenGivenBuckshot = true
  end
end
