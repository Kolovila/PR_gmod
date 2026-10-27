AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/RUAF/RUAF_Soldier_Private_Custom_Masked.mdl","models/RUAF/RUAF_Soldier_Sergeant_Custom_Masked.mdl"}
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

ENT.HasGrenadeAttack = true
ENT.GrenadeAttackEntity = "obj_vj_he_f1"
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
ENT.SoundTbl_Idle = {"ruaf/1/mutter/vsrf_01_mutter_45_n.wav","ruaf/1/mutter/vsrf_01_mutter_44_n.wav","ruaf/1/mutter/vsrf_01_mutter_43_n.wav","ruaf/1/mutter/vsrf_01_mutter_42_n.wav","ruaf/1/mutter/vsrf_01_mutter_41_n.wav","","ruaf/1/mutter/vsrf_01_mutter_40_n.wav","ruaf/1/mutter/vsrf_01_mutter_39_n.wav","ruaf/1/mutter/vsrf_01_mutter_38_n.wav","ruaf/1/mutter/vsrf_01_mutter_37_n.wav","ruaf/1/mutter/vsrf_01_mutter_36_n.wav","ruaf/1/mutter/vsrf_01_mutter_35_n.wav","ruaf/1/mutter/vsrf_01_mutter_34_n.wav","ruaf/1/mutter/vsrf_01_mutter_33_n.wav","ruaf/1/mutter/vsrf_01_mutter_32_n.wav","ruaf/1/mutter/vsrf_01_mutter_31_n.wav","ruaf/1/mutter/vsrf_01_mutter_30_n.wav","ruaf/1/mutter/vsrf_01_mutter_29_n.wav","ruaf/1/mutter/vsrf_01_mutter_28_n.wav","ruaf/1/mutter/vsrf_01_mutter_27_n.wav","ruaf/1/mutter/vsrf_01_mutter_26_n.wav","ruaf/1/mutter/vsrf_01_mutter_25_n.wav","ruaf/1/mutter/vsrf_01_mutter_24_n.wav","ruaf/1/mutter/vsrf_01_mutter_23_n.wav","ruaf/1/mutter/vsrf_01_mutter_22_n.wav","ruaf/1/mutter/vsrf_01_mutter_21_n.wav","ruaf/1/mutter/vsrf_01_mutter_20_n.wav","ruaf/1/mutter/vsrf_01_mutter_19_n.wav","ruaf/1/mutter/vsrf_01_mutter_18_n.wav","ruaf/1/mutter/vsrf_01_mutter_17_n.wav","ruaf/1/mutter/vsrf_01_mutter_16_n.wav","ruaf/1/mutter/vsrf_01_mutter_15_n.wav","ruaf/1/mutter/vsrf_01_mutter_14_n.wav","ruaf/1/mutter/vsrf_01_mutter_13_n.wav","ruaf/1/mutter/vsrf_01_mutter_12_n.wav","ruaf/1/mutter/vsrf_01_mutter_11_n.wav","ruaf/1/mutter/vsrf_01_mutter_10_n.wav","ruaf/1/mutter/vsrf_01_mutter_09_n.wav","ruaf/1/mutter/vsrf_01_mutter_08_n.wav","ruaf/1/mutter/vsrf_01_mutter_07_n.wav","ruaf/1/mutter/vsrf_01_mutter_06_n.wav","ruaf/1/mutter/vsrf_01_mutter_05_n.wav","ruaf/1/mutter/vsrf_01_mutter_04_n.wav","ruaf/1/mutter/vsrf_01_mutter_03_n.wav","ruaf/1/mutter/vsrf_01_mutter_02_n.wav","ruaf/1/mutter/vsrf_01_mutter_01_n.wav"}
ENT.SoundTbl_Alert = {"ruaf/1/alert/vsrf_01_on_repeated_contact_12_l.wav","ruaf/1/alert/vsrf_01_on_repeated_contact_11_l.wav","ruaf/1/alert/vsrf_01_on_repeated_contact_10_l.wav","ruaf/1/alert/vsrf_01_on_repeated_contact_09_l.wav","ruaf/1/alert/vsrf_01_on_repeated_contact_08_l.wav","ruaf/1/alert/vsrf_01_on_repeated_contact_07_l.wav","ruaf/1/alert/vsrf_01_on_repeated_contact_06_l.wav","ruaf/1/alert/vsrf_01_on_repeated_contact_05_l.wav","ruaf/1/alert/vsrf_01_on_repeated_contact_04_l.wav","ruaf/1/alert/vsrf_01_on_repeated_contact_03_l.wav","ruaf/1/alert/vsrf_01_on_repeated_contact_02_l.wav","ruaf/1/alert/vsrf_01_on_repeated_contact_01_l.wav","ruaf/1/alert/vsrf_01_in_the_front_08_l.wav"}
ENT.SoundTbl_LostEnemy = {"ruaf/1/lostvisual/vsrf_01_on_lost_visual_23_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_22_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_21_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_20_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_19_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_18_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_17_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_16_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_15_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_14_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_13_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_12_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_11_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_10_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_09_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_08_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_07_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_06_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_05_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_04_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_03_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_02_l.wav","ruaf/1/lostvisual/vsrf_01_on_lost_visual_01_l.wav"}
ENT.SoundTbl_CombatIdle = {"ruaf/1/combatidle/vsrf_01_fight_35_l.wav","ruaf/1/combatidle/vsrf_01_fight_34_l.wav","ruaf/1/combatidle/vsrf_01_fight_33_l.wav","ruaf/1/combatidle/vsrf_01_fight_32_l.wav","ruaf/1/combatidle/vsrf_01_fight_31_l.wav","ruaf/1/combatidle/vsrf_01_fight_30_l.wav","ruaf/1/combatidle/vsrf_01_fight_29_l.wav","ruaf/1/combatidle/vsrf_01_fight_28_l.wav","ruaf/1/combatidle/vsrf_01_fight_27_l.wav","ruaf/1/combatidle/vsrf_01_fight_26_l.wav","ruaf/1/combatidle/vsrf_01_fight_25_l.wav","ruaf/1/combatidle/vsrf_01_fight_24_l.wav","ruaf/1/combatidle/vsrf_01_fight_23_l.wav","ruaf/1/combatidle/vsrf_01_fight_22_l.wav","ruaf/1/combatidle/vsrf_01_fight_21_l.wav","ruaf/1/combatidle/vsrf_01_fight_20_l.wav","ruaf/1/combatidle/vsrf_01_fight_19_l.wav","ruaf/1/combatidle/vsrf_01_fight_18_l.wav","ruaf/1/combatidle/vsrf_01_fight_17_l.wav","ruaf/1/combatidle/vsrf_01_fight_16_l.wav","ruaf/1/combatidle/vsrf_01_fight_15_l.wav","ruaf/1/combatidle/vsrf_01_fight_14_l.wav","ruaf/1/combatidle/vsrf_01_fight_13_l.wav","ruaf/1/combatidle/vsrf_01_fight_12_l.wav","ruaf/1/combatidle/vsrf_01_fight_11_l.wav","ruaf/1/combatidle/vsrf_01_fight_10_l.wav","ruaf/1/combatidle/vsrf_01_fight_09_l.wav","ruaf/1/combatidle/vsrf_01_fight_08_l.wav","ruaf/1/combatidle/vsrf_01_fight_07_l.wav","ruaf/1/combatidle/vsrf_01_fight_06_l.wav","ruaf/1/combatidle/vsrf_01_fight_05_l.wav","ruaf/1/combatidle/vsrf_01_fight_04_l.wav","ruaf/1/combatidle/vsrf_01_fight_03_l.wav","ruaf/1/combatidle/vsrf_01_fight_02_l.wav","ruaf/1/combatidle/vsrf_01_fight_01_l.wav","ruaf/1/combatidle/vsrf_01_covering_08_l.wav","ruaf/1/combatidle/vsrf_01_covering_07_l.wav","ruaf/1/combatidle/vsrf_01_covering_06_l.wav","ruaf/1/combatidle/vsrf_01_covering_05_l.wav","ruaf/1/combatidle/vsrf_01_covering_04_l.wav","ruaf/1/combatidle/vsrf_01_covering_03_l.wav","ruaf/1/combatidle/vsrf_01_covering_02_l.wav","ruaf/1/combatidle/vsrf_01_covering_01_l.wav"}
ENT.SoundTbl_WeaponReload = {"ruaf/1/reload/vsrf_01_on_weapon_reload_08_l.wav","ruaf/1/reload/vsrf_01_on_weapon_reload_07_l.wav","ruaf/1/reload/vsrf_01_on_weapon_reload_06_l.wav","ruaf/1/reload/vsrf_01_on_weapon_reload_05_l.wav","ruaf/1/reload/vsrf_01_on_weapon_reload_04_l.wav","ruaf/1/reload/vsrf_01_on_weapon_reload_03_l.wav","ruaf/1/reload/vsrf_01_on_weapon_reload_02_l.wav","ruaf/1/reload/vsrf_01_on_weapon_reload_01_l.wav"}
ENT.SoundTbl_OnGrenadeSight = {"ruaf/1/enemygrenade/vsrf_01_spreadout_04_l.wav","ruaf/1/enemygrenade/vsrf_01_spreadoutr_03_l.wav","ruaf/1/enemygrenade/vsrf_01_spreadout_02_l.wav","ruaf/1/enemygrenade/vsrf_01_spreadout_01_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_12_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_11_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_10_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_09_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_08_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_07_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_06_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_05_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_04_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_03_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_02_l.wav","ruaf/1/enemygrenade/vsrf_01_on_enemy_grenade_01_l.wav"}
ENT.SoundTbl_OnKilledEnemy = {"ruaf/1/enemydown/vsrf_01_enemy_down_12_l.wav","ruaf/1/enemydown/vsrf_01_enemy_down_11_l.wav","ruaf/1/enemydown/vsrf_01_enemy_down_10_l.wav","ruaf/1/enemydown/vsrf_01_enemy_down_09_l.wav","ruaf/1/enemydown/vsrf_01_enemy_down_08_l.wav","ruaf/1/enemydown/vsrf_01_enemy_down_07_l.wav","ruaf/1/enemydown/vsrf_01_enemy_down_06_l.wav","ruaf/1/enemydown/vsrf_01_enemy_down_05_l.wav","ruaf/1/enemydown/vsrf_01_enemy_down_04_l.wav","ruaf/1/enemydown/vsrf_01_enemy_down_03_l.wav","ruaf/1/enemydown/vsrf_01_enemy_down_02_l.wav","ruaf/1/enemydown/vsrf_01_enemy_down_01_l.wav"}
ENT.SoundTbl_Pain = {"ruaf/1/pain/vsrf_01_on_being_hurt_22_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_21_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_20_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_19_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_18_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_17_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_16_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_15_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_14_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_13_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_12_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_11_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_10_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_09_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_08_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_07_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_06_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_05_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_04_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_03_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_02_l.wav","ruaf/1/pain/vsrf_01_on_being_hurt_01_l.wav"}
ENT.SoundTbl_AllyDeath = {"ruaf/1/friendlydeath/vsrf_01_on_friendly_down_30_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_29_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_28_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_27_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_26_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_25_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_24_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_23_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_22_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_21_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_20_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_19_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_18_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_17_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_16_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_15_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_14_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_13_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_12_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_11_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_10_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_09_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_08_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_07_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_06_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_05_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_04_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_03_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_02_l.wav","ruaf/1/friendlydeath/vsrf_01_on_friendly_down_01_l.wav"}
ENT.SoundTbl_CallForHelp = {"ruaf/1/coverme/vsrf_01_cover_me_06_l.wav","ruaf/1/coverme/vsrf_01_cover_me_05_l.wav","ruaf/1/coverme/vsrf_01_cover_me_04_l.wav","ruaf/1/coverme/vsrf_01_cover_me_03_l.wav","ruaf/1/coverme/vsrf_01_cover_me_02_l.wav","ruaf/1/coverme/vsrf_01_cover_me_01_l.wav"}
ENT.SoundTbl_GrenadeAttack = {"ruaf/1/grenade/vsrf_01_on_grenade_08_l.wav","ruaf/1/grenade/vsrf_01_on_grenade_07_l.wav","ruaf/1/grenade/vsrf_01_on_grenade_06_l.wav","ruaf/1/grenade/vsrf_01_on_grenade_05_l.wav","ruaf/1/grenade/vsrf_01_on_grenade_04_l.wav","ruaf/1/grenade/vsrf_01_on_grenade_03_l.wav","ruaf/1/grenade/vsrf_01_on_grenade_02_l.wav","ruaf/1/grenade/vsrf_01_on_grenade_01_l.wav"}
ENT.SoundTbl_Death = {"ruaf/1/death/vsrf_01_on_death_04_l.wav","ruaf/1/death/vsrf_01_on_death_03_l.wav","ruaf/1/death/vsrf_01_on_death_02_l.wav","ruaf/1/death/vsrf_01_on_death_01_l.wav","ruaf/1/death/vsrf_01_on_agony_12_l.wav","ruaf/1/death/vsrf_01_on_agony_11_l.wav","ruaf/1/death/vsrf_01_on_agony_10_l.wav","ruaf/1/death/vsrf_01_on_agony_09_l.wav","ruaf/1/death/vsrf_01_on_agony_08_l.wav","ruaf/1/death/vsrf_01_on_agony_07_l.wav","ruaf/1/death/vsrf_01_on_agony_06_l.wav","ruaf/1/death/vsrf_01_on_agony_05_l.wav","ruaf/1/death/vsrf_01_on_agony_04_l.wav","ruaf/1/death/vsrf_01_on_agony_03_l.wav","ruaf/1/death/vsrf_01_on_agony_02_l.wav","ruaf/1/death/vsrf_01_on_agony_01_l.wav"}
ENT.SoundTbl_FootStep = {"footsteps/run_concrete6.wav","footsteps/run_concrete5.wav","footsteps/run_concrete4.wav","footsteps/run_concrete3.wav","footsteps/run_concrete2.wav","footsteps/run_concrete1.wav"}
----------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()			
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 1 ) else
	if randomarmour == 1 then self:SetBodygroup( 1,1 ) end			
    end	
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 2 ) else
	if randomarmour == 1 then self:SetBodygroup( 2,1 ) end			
    end		
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 3 ) else
	if randomarmour == 1 then self:SetBodygroup( 3,1 ) end			
    end	
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetBodygroup( 4 ) else
	if randomarmour == 1 then self:SetBodygroup( 4,1 ) end			
    end	
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 5 ) else
	if randomarmour == 1 then self:SetBodygroup( 5,1 ) end				
    end	
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetBodygroup( 6 ) else
	if randomarmour == 1 then self:SetBodygroup( 6,1 ) end			
    end	
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 7 ) else
	if randomarmour == 1 then self:SetBodygroup( 7,1 ) end			
    end	
 local randomarmour = math.random(3)
	if randomarmour == 0 then self:SetBodygroup( 8 ) else
	if randomarmour == 1 then self:SetBodygroup( 8,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 8,2 ) end		
    end			
 local randomarmour = math.random(3)
	if randomarmour == 0 then self:SetBodygroup( 9 ) else
	if randomarmour == 1 then self:SetBodygroup( 9,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 9,2 ) end		
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