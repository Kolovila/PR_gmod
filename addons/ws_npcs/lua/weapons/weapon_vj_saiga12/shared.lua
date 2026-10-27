if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "SAIGA-12"
SWEP.Author 					= "KostDRS"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Base"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_AllowCustomSpread		= true -- Should the weapon be able to change the NPC's spread?
SWEP.NPC_CustomSpread           = 0.4 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_NextPrimaryFire 		= 0.8 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire	 		= 0.1 -- How much time until the bullet/projectile is fired?
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= true -- Is tihs weapon meant to be for NPCs only?
SWEP.WorldModel					= "models/Weapons/w_saiga12.mdl"
SWEP.HoldType 					= "ar2"
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(-7,2,-183)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1,-1,0.9)
-- Sound Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Sound				= "weapons/saiga12/saiga12_shot_close1.wav","weapons/saiga12/saiga12_shot_close2.wav"
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= "weapons/saiga12/saiga12_shot_distant1.wav","weapons/saiga12/saiga12_shot_distant2.wav"
SWEP.NPC_ExtraFireSoundTime		= 0.5 -- How much time until it plays the sound (After Firing)?
SWEP.NPC_ExtraFireSoundLevel	= 65 -- How far does the sound go?
SWEP.NPC_FiringDistanceScale    = 0.5
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 12 -- Damage
SWEP.Primary.Delay				= 1.5 -- Next time it can use primary fire
SWEP.Primary.Force				= 1 -- Force applied on the object the bullet hits
SWEP.Primary.NumberOfShots		= 5 -- How many shots per attack?
SWEP.Primary.ClipSize			= 6 -- Max amount of bullets per clip
SWEP.Primary.Automatic			= false -- Is it automatic?
SWEP.Primary.Ammo               = "Buckshot" -- Ammo type
-- Muzzle & Shell Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.PrimaryEffects_MuzzleAttachment 	= 1
SWEP.PrimaryEffects_SpawnShells = false
-- Deployment Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DelayOnDeploy 				= 1.5 -- Time until it can shoot again after deploying the weapon
SWEP.HasDeploySound				= false -- Does the weapon have a deploy sound?
-- Reload Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Reload_TimeUntilAmmoIsSet	= 2.5 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 2.5 -- How much time until the player can play idle animation, shoot, etc.
SWEP.NPC_ReloadSound			= {"weapons/saiga12/saiga12_reload.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.NPC_ReloadSoundLevel		= 65 -- How far does the sound go?
-- Idle Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HasIdleAnimation			= true -- Does it have a idle animation?
SWEP.AnimTbl_Idle				= {ACT_VM_IDLE}
SWEP.NextIdle_Deploy			= 5 -- How much time until it plays the idle animation after the weapon gets deployed
SWEP.NextIdle_PrimaryAttack		= 5 -- How much time until it plays the idle animation after attacking(Primary)
function SWEP:CustomOnInitialize() 
	self.Owner.Weapon_FiringDistanceFar = 1500 -- How far away it can shoot
end


