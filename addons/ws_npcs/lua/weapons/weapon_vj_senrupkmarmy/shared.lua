if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "CAGARMY Russian Army PKM"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Sentry"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= false
SWEP.WorldModel					= "models/sentry/sentrycag/weapons/w_mach_russ_pkm.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.ViewModel					= "models/sentry/sentrycag/weapons/v_mach_russ_pkm.mdl"
SWEP.HoldType 					= "smg"
SWEP.ViewModelFlip				= false -- Flip the model? Usally used for CS:S models
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= false
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 0.11 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire	 		= 0.11 -- How much time until the bullet/projectile is fired?
SWEP.NPC_ReloadSound			= {"senpkm/reload.mp3"} -- Sounds it plays when the base detects the SNPC playing a reload animation
--SWEP.NPC_CustomSpread	 		= 2
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 10 -- Damage
SWEP.Primary.Force				= 5 -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 100 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "SMG1" -- Ammo type
SWEP.Primary.Sound				= {"senpkm/shot.wav"}
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= {"senpkm/shot.wav"}
SWEP.Primary.DistantSoundVolume	= 0.25 -- Distant sound volume
SWEP.PrimaryEffects_MuzzleAttachment = 1
SWEP.PrimaryEffects_ShellAttachment = 2
SWEP.PrimaryEffects_ShellType = "VJ_Weapon_RifleShell1"
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Reload_TimeUntilAmmoIsSet	= 4 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 6 -- How much time until the player can play idle animation, shoot, etc.

function SWEP:CustomOnInitialize()

	if GetConVarNumber("vj_senwepaccuracy_custom") == 0 then
	self.NPC_CustomSpread = 0.1
	elseif GetConVarNumber("vj_senwepaccuracy_custom") == 1 then
	self.NPC_CustomSpread = 1
	elseif GetConVarNumber("vj_senwepaccuracy_custom") == 2 then
	self.NPC_CustomSpread = 2
	elseif GetConVarNumber("vj_senwepaccuracy_custom") == 3 then
	self.NPC_CustomSpread = 3
	elseif GetConVarNumber("vj_senwepaccuracy_custom") == 4 then
	self.NPC_CustomSpread = 4
	end

 end