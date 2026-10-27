if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "REMINGTON M700"
SWEP.Author 					= "KostDRS"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Base"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_EnableDontUseRegulate 	= false -- Used for VJ n Base SNPCs, if enabled the SNPC will remove use regulate
SWEP.NPC_NextPrimaryFire 		= 2 -- Next time it can use primary fire
SWEP.NPC_CustomSpread	 		= 0.2 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_ExtraFireSound			= {"weapons/m700/rem700_boltout.wav"} -- Plays an extra sound after it fires (Example: Bolt action sound)
SWEP.NPC_StandingOnly = true -- If true, the weapon can only be fired if the NPC is standing still
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= true -- Is tihs weapon meant to be for NPCs only?
SWEP.WorldModel					= "models/Weapons/w_m700_Stealth.mdl"
SWEP.HoldType 					= "ar2"
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(-6.5,2,-183)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1,8,1)
-- Sound Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Sound				= "weapons/m700/rem700_shot_close.wav"
SWEP.Primary.HasDistantSound	= false -- Does it have a distant sound when the gun is shot?
SWEP.NPC_ExtraFireSoundTime		= 0.5 -- How much time until it plays the sound (After Firing)?
SWEP.NPC_ExtraFireSoundLevel	= 65 -- How far does the sound go?
SWEP.NPC_FiringDistanceScale    = 1.8
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 60 -- Damage
SWEP.Primary.Force				= 1 -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 5 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "ar2" -- Ammo type
-- Muzzle & Shell Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.PrimaryEffects_MuzzleAttachment 	= 1
SWEP.PrimaryEffects_ShellAttachment 	= 2
SWEP.PrimaryEffects_SpawnShells = false
-- Deployment Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DelayOnDeploy 				= 1.5 -- Time until it can shoot again after deploying the weapon
SWEP.HasDeploySound				= false -- Does the weapon have a deploy sound?
-- Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Reload_TimeUntilAmmoIsSet	= 2.5 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 2.5 -- How much time until the player can play idle animation, shoot, etc.
SWEP.NPC_ReloadSound			= {"weapons/m700/rem700_reload.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.NPC_ReloadSoundLevel		= 65 -- How far does the sound go?
-- Idle Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasIdleAnimation			= true -- Does it have a idle animation?
SWEP.AnimTbl_Idle				= {ACT_VM_IDLE}
SWEP.NextIdle_Deploy			= 5 -- How much time until it plays the idle animation after the weapon gets deployed
SWEP.NextIdle_PrimaryAttack		= 5 -- How much time until it plays the idle animation after attacking(Primary)