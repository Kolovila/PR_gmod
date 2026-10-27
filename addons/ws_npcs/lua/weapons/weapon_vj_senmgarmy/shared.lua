if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "CAGARMY U.S M249"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Sentry"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= false
SWEP.WorldModel					= "models/sentry/sentrycag/weapons/w_m249_machine_gun.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.ViewModel					= "models/sentry/sentrycag/weapons/v_machinegun249.mdl"
SWEP.HoldType 					= "ar2"
SWEP.ViewModelFlip				= false -- Flip the model? Usally used for CS:S models
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= false
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 0.1 -- Next time it can use primary fire
SWEP.NPC_ReloadSound			= {"senm249/reload.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
--SWEP.NPC_CustomSpread	 		= 1.5
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 11 -- Damage
SWEP.Primary.Force				= 5 -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 150 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "SMG1" -- Ammo type
SWEP.Primary.Sound				= {"senm249/shot1.wav"}
SWEP.Primary.HasDistantSound	= true -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= {"senm249/shot1.wav"}
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