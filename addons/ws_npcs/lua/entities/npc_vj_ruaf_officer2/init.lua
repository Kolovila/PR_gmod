AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/RUAF/RUAF_Officer_Custom.mdl"}
ENT.StartHealth = 120
ENT.HullType = HULL_HUMAN

ENT.VJ_NPC_Class = {"CLASS_RUAF"}
ENT.BloodColor = "Red"

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_seq_meleeattack01"

ENT.UsePoseParameterMovement = true

ENT.JumpParams = {
	Enabled = false, -- Can it do movement jumps?
}

ENT.HasGrenadeAttack = false
ENT.GrenadeAttackEntity = "obj_vj_he_rgd5"
ENT.GrenadeAttackThrowTime = 0.85
ENT.AnimTbl_GrenadeAttack = "vjges_gesture_item_throw"

ENT.AnimTbl_Medic_GiveHealth = "vjges_gesture_item_drop"
ENT.AnimTbl_CallForHelp = {"vjges_gesture_signal_group", "vjges_gesture_signal_forward"}
ENT.AnimTbl_DamageAllyResponse = "vjges_gesture_signal_halt"
ENT.Weapon_OcclusionDelay = false

ENT.FootstepSoundTimerRun = 0.3
ENT.FootstepSoundTimerWalk = 0.5

ENT.CanFlinch = true
ENT.FlinchCooldown = 1
ENT.AnimTbl_Flinch = {"vjges_flinch_01", "vjges_flinch_02"}
ENT.FlinchHitGroupMap = {
	{HitGroup = HITGROUP_HEAD, Animation = {"vjges_flinch_head_01", "vjges_flinch_head_02"}},
	{HitGroup = HITGROUP_CHEST, Animation = {"vjges_flinch_phys_01", "vjges_flinch_phys_02", "vjges_flinch_back_01"}},
	{HitGroup = HITGROUP_STOMACH, Animation = {"vjges_flinch_stomach_01", "vjges_flinch_stomach_02"}},
	{HitGroup = HITGROUP_LEFTARM, Animation = "vjges_flinch_shoulder_l"},
	{HitGroup = HITGROUP_RIGHTARM, Animation = "vjges_flinch_shoulder_r"}
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Alert = {"ruaf/2/alert/vsrf_02_on_repeated_contact_14_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_13_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_12_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_11_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_10_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_09_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_08_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_07_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_06_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_05_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_04_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_03_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_02_l.wav","ruaf/2/alert/vsrf_02_on_repeated_contact_01_l.wav","ruaf/2/alert/vsrf_02_in_the_front_01_l.wav"}
ENT.SoundTbl_Suppressing = {"ruaf/2/supressing/vsrf_02_suppress_04_l.wav","ruaf/2/supressing/vsrf_02_suppress_03_l.wav","ruaf/2/supressing/vsrf_02_suppress_02_l.wav","ruaf/2/supressing/vsrf_02_suppress_01_l.wav"}
ENT.SoundTbl_LostEnemy = {"ruaf/2/lostvisual/vsrf_02_lost_visual_24_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_23_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_22_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_21_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_20_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_19_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_18_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_17_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_16_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_15_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_14_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_13_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_12_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_11_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_10_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_09_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_08_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_07_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_06_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_05_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_04_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_03_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_02_l.wav","ruaf/2/lostvisual/vsrf_02_lost_visual_01_l.wav"}
ENT.SoundTbl_CombatIdle = {"ruaf/2/combatidle/vsrf_02_fight_27_l.wav","ruaf/2/combatidle/vsrf_02_fight_26_l.wav","ruaf/2/combatidle/vsrf_02_fight_25_l.wav","ruaf/2/combatidle/vsrf_02_fight_24_l.wav","ruaf/2/combatidle/vsrf_02_fight_23_l.wav","ruaf/2/combatidle/vsrf_02_fight_22_l.wav","ruaf/2/combatidle/vsrf_02_fight_21_l.wav","ruaf/2/combatidle/vsrf_02_fight_20_l.wav","ruaf/2/combatidle/vsrf_02_fight_19_l.wav","ruaf/2/combatidle/vsrf_02_fight_18_l.wav","ruaf/2/combatidle/vsrf_02_fight_17_l.wav","ruaf/2/combatidle/vsrf_02_fight_16_l.wav","ruaf/2/combatidle/vsrf_02_fight_15_l.wav","ruaf/2/combatidle/vsrf_02_fight_14_l.wav","ruaf/2/combatidle/vsrf_02_fight_13_l.wav","ruaf/2/combatidle/vsrf_02_fight_12_l.wav","ruaf/2/combatidle/vsrf_02_fight_11_l.wav","ruaf/2/combatidle/vsrf_02_fight_10_l.wav","ruaf/2/combatidle/vsrf_02_fight_09_l.wav","ruaf/2/combatidle/vsrf_02_fight_08_l.wav","ruaf/2/combatidle/vsrf_02_fight_07_l.wav","ruaf/2/combatidle/vsrf_02_fight_06_l.wav","ruaf/2/combatidle/vsrf_02_fight_05_l.wav","ruaf/2/combatidle/vsrf_02_fight_04_l.wav","ruaf/2/combatidle/vsrf_02_fight_03_l.wav","ruaf/2/combatidle/vsrf_02_fight_02_l.wav","ruaf/2/combatidle/vsrf_02_fight_01_l.wav","ruaf/2/combatidle/vsrf_02_covering_07_l.wav","ruaf/2/combatidle/vsrf_02_covering_06_l.wav","ruaf/2/combatidle/vsrf_02_covering_05_l.wav","ruaf/2/combatidle/vsrf_02_covering_04_l.wav","ruaf/2/combatidle/vsrf_02_covering_03_l.wav","ruaf/2/combatidle/vsrf_02_covering_02_l.wav","ruaf/2/combatidle/vsrf_02_covering_01_l.wav"}
ENT.SoundTbl_WeaponReload = {"ruaf/2/reload/vsrf_02_on_weapon_reload_09_l.wav","ruaf/2/reload/vsrf_02_on_weapon_reload_08_l.wav","ruaf/2/reload/vsrf_02_on_weapon_reload_07_l.wav","ruaf/2/reload/vsrf_02_on_weapon_reload_06_l.wav","ruaf/2/reload/vsrf_02_on_weapon_reload_05_l.wav","ruaf/2/reload/vsrf_02_on_weapon_reload_04_l.wav","ruaf/2/reload/vsrf_02_on_weapon_reload_03_l.wav","ruaf/2/reload/vsrf_02_on_weapon_reload_02_l.wav","ruaf/2/reload/vsrf_02_on_weapon_reload_01_l.wav"}
ENT.SoundTbl_OnGrenadeSight = {"ruaf/2/enemygrenade/vsrf_02_spreadout_08_l.wav","ruaf/2/enemygrenade/vsrf_02_spreadout_07_l.wav","ruaf/2/enemygrenade/vsrf_02_spreadout_06_l.wav","ruaf/2/enemygrenade/vsrf_02_spreadout_05_l.wav","ruaf/2/enemygrenade/vsrf_02_spreadout_04_l.wav","ruaf/2/enemygrenade/vsrf_02_spreadout_03_l.wav","ruaf/2/enemygrenade/vsrf_02_spreadout_02_l.wav","ruaf/2/enemygrenade/vsrf_02_spreadout_01_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_13_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_12_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_11_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_10_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_09_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_08_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_07_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_06_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_05_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_04_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_03_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_02_l.wav","ruaf/2/enemygrenade/vsrf_02_on_enemy_grenade_01_l.wav"}
ENT.SoundTbl_OnKilledEnemy = {"ruaf/2/enemydown/vsrf_02_enemy_down_15_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_14_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_13_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_12_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_11_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_10_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_09_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_08_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_07_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_06_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_05_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_04_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_03_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_02_l.wav","ruaf/2/enemydown/vsrf_02_enemy_down_01_l.wav"}
ENT.SoundTbl_Pain = {"ruaf/2/pain/vsrf_02_on_being_hurt_06_l.wav","ruaf/2/pain/vsrf_02_on_being_hurt_05_l.wav","ruaf/2/pain/vsrf_02_on_being_hurt_04_l.wav","ruaf/2/pain/vsrf_02_on_being_hurt_03_l.wav","ruaf/2/pain/vsrf_02_on_being_hurt_02_l.wav","ruaf/2/pain/vsrf_02_on_being_hurt_01_l.wav"}
ENT.SoundTbl_AllyDeath = {"ruaf/2/friendlydeath/vsrf_02_on_friendly_down_30_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_29_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_28_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_27_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_26_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_25_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_24_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_23_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_22_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_21_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_20_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_19_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_18_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_17_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_16_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_15_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_14_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_13_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_12_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_11_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_10_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_09_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_08_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_07_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_06_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_05_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_04_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_03_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_02_l.wav","ruaf/2/friendlydeath/vsrf_02_on_friendly_down_01_l.wav"}
ENT.SoundTbl_CallForHelp = {"ruaf/2/coverme/vsrf_02_cover_me_05_l.wav","ruaf/2/coverme/vsrf_02_cover_me_04_l.wav","ruaf/2/coverme/vsrf_02_cover_me_03_l.wav","ruaf/2/coverme/vsrf_02_cover_me_02_l.wav"}
ENT.SoundTbl_Death = {"ruaf/2/death/vsrf_02_on_death_06_l.wav","ruaf/2/death/vsrf_02_on_death_05_l.wav","ruaf/2/death/vsrf_02_on_death_04_l.wav","ruaf/2/death/vsrf_02_on_death_03_l.wav","ruaf/2/death/vsrf_02_on_death_02_l.wav","ruaf/2/death/vsrf_02_on_death_01_l.wav","ruaf/2/death/vsrf_02_on_agony_07_l.wav","ruaf/2/death/vsrf_02_on_agony_06_l.wav","ruaf/2/death/vsrf_02_on_agony_05_l.wav","ruaf/2/death/vsrf_02_on_agony_04_l.wav","ruaf/2/death/vsrf_02_on_agony_03_l.wav","ruaf/2/death/vsrf_02_on_agony_02_l.wav","ruaf/2/death/vsrf_02_on_agony_01_l.wav"}
ENT.SoundTbl_FootStep = {"footsteps/run_concrete6.wav","footsteps/run_concrete5.wav","footsteps/run_concrete4.wav","footsteps/run_concrete3.wav","footsteps/run_concrete2.wav","footsteps/run_concrete1.wav"}
----------------------------------------------------------------------------------------------------
ENT.HasGrenadeAttack = false
ENT.TimeUntilGrenadeIsReleased = 0.85 -- Time until the grenade is released
ENT.GrenadeAttackModel = "models/Weapons/Grenades/w_grenade_f1.mdl"	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()			
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetBodygroup( 0 ) else
	if randomarmour == 1 then self:SetBodygroup( 0,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 0,2 ) end	
	if randomarmour == 3 then self:SetBodygroup( 0,3 ) end		
    end	
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetBodygroup( 3 ) else
	if randomarmour == 1 then self:SetBodygroup( 3,1 ) end			
    end	
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetBodygroup( 5 ) else
	if randomarmour == 1 then self:SetBodygroup( 5,1 ) end			
    end	
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 6 ) else
	if randomarmour == 1 then self:SetBodygroup( 6,1 ) end			
    end			
 local randomarmour = math.random(3)
	if randomarmour == 0 then self:SetBodygroup( 7 ) else
	if randomarmour == 1 then self:SetBodygroup( 7,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 7,2 ) end		
    end		
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetSkin ( 3 ) else
	if randomarmour == 1 then self:SetSkin ( 1 ) end		
	if randomarmour == 2 then self:SetSkin ( 2 ) end		
	if randomarmour == 3 then self:SetSkin ( 3 ) end	
    end					
end
----------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup) 
	if dmginfo:IsBulletDamage() then 
		if hitgroup == HITGROUP_HEAD then 
			dmginfo:SetDamage(dmginfo:GetDamage() * 2)
		end
	end
end
----------------------------------------------------------------------------------------------------