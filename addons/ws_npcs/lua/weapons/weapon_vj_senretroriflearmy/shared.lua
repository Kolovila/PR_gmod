if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "CAGARMY U.S Assault Rifle"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Sentry"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= false
SWEP.WorldModel					= "models/sentry/sentrycag/weapons/w_m16kali.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.ViewModel					= "models/sentry/sentrycag/weapons/v_m16kali.mdl"
SWEP.HoldType 					= "ar2"
SWEP.ViewModelFlip				= false -- Flip the model? Usally used for CS:S models
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= false
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 1.1 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire	 		= 0.1 -- How much time until the bullet/projectile is fired?
SWEP.NPC_TimeUntilFireExtraTimers = {0.09,0.18,0.27,0.36,0.45,0.54,0.63,0.72} -- Next time it can use primary fire
--SWEP.NPC_TimeUntilFireExtraTimers = {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8} -- Next time it can use primary fire
SWEP.NPC_ReloadSound			= {"eigm16/reload.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
--SWEP.NPC_CustomSpread	 		= 2
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 11 -- Damage
SWEP.Primary.Force				= 5 -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 30 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "SMG1" -- Ammo type
SWEP.Primary.Sound				= {"eigm16/shot4.wav"}
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= {"eigm16/shot3.wav"}
SWEP.Primary.DistantSoundVolume	= 0.25 -- Distant sound volume
SWEP.PrimaryEffects_MuzzleAttachment = 1
SWEP.PrimaryEffects_ShellAttachment = 2
SWEP.PrimaryEffects_ShellType = "VJ_Weapon_RifleShell1"
SWEP.Primary.Automatic			= true -- Is it automatic?

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