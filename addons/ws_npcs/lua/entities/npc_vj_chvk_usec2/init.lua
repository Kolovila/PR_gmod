AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Usec/Pmc_Usec_Custom1.mdl","models/Usec/Pmc_Usec_Custom2.mdl","models/Usec/Pmc_Usec_Custom_Masked1.mdl","models/Usec/Pmc_Usec_Custom_Masked2.mdl","models/Usec/Pmc_Usec_Custom_Masked3.mdl","models/Usec/Pmc_Usec_Custom3.mdl"}
ENT.StartHealth = 120
ENT.HullType = HULL_HUMAN

ENT.VJ_NPC_Class = {"CLASS_USEC"}
ENT.BloodColor = "Red"

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_seq_meleeattack01"

ENT.UsePoseParameterMovement = true

ENT.JumpParams = {
	Enabled = false, -- Can it do movement jumps?
}

ENT.HasGrenadeAttack = true
ENT.GrenadeAttackEntity = "obj_vj_he_m67"
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
ENT.SoundTbl_Alert = {"usec/3/alert/usec3_enemy_contact_bear_04_l.wav","usec/3/alert/usec3_enemy_contact_bear_03_l.wav","usec/3/alert/usec3_enemy_contact_bear_02_l.wav","usec/3/alert/usec3_enemy_contact_bear_01_l.wav","usec/3/alert/usec3_enemy_contact_18_bl_l.wav","usec/3/alert/usec3_enemy_contact_17_bl_l.wav","usec/3/alert/usec3_enemy_contact_16_bl_l.wav","usec/3/alert/usec3_enemy_contact_15_bl_l.wav","usec/3/alert/usec3_enemy_contact_14_l.wav","usec/3/alert/usec3_enemy_contact_13_l.wav","usec/3/alert/usec3_enemy_contact_12_l.wav","usec/3/alert/usec3_enemy_contact_11_l.wav","usec/3/alert/usec3_enemy_contact_10_l.wav","usec/3/alert/usec3_enemy_contact_09_l.wav","usec/3/alert/usec3_enemy_contact_08_l.wav","usec/3/alert/usec3_enemy_contact_07_l.wav","usec/3/alert/usec3_enemy_contact_06_l.wav","usec/3/alert/usec3_enemy_contact_05_l.wav","usec/3/alert/usec3_enemy_contact_04_l.wav","usec/3/alert/usec3_enemy_contact_01_l.wav"}
ENT.SoundTbl_Suppressing = {"usec/3/supressing/usec3_supressingfire_06_bl_l.wav","usec/3/supressing/usec3_supressingfire_05_l.wav","usec/3/supressing/usec3_supressingfire_04_l.wav","usec/3/supressing/usec3_supressingfire_03_l.wav","usec/3/supressing/usec3_supressingfire_02_l.wav","usec/3/supressing/usec3_supressingfire_01_l.wav"}
ENT.SoundTbl_LostEnemy = {"usec/3/lostvisual/usec3_lostvisual_16_bl.wav","usec/3/lostvisual/usec3_lostvisual_15_bl.wav","usec/3/lostvisual/usec3_lostvisual_14_bl.wav","usec/3/lostvisual/usec3_lostvisual_12.wav","usec/3/lostvisual/usec3_lostvisual_10.wav","usec/3/lostvisual/usec3_lostvisual_08.wav","usec/3/lostvisual/usec3_lostvisual_04.wav"}
ENT.SoundTbl_CombatIdle = {"usec/3/combatidle/usec3_fight_53_bl_l.wav","usec/3/combatidle/usec3_fight_51_bl_l.wav","usec/3/combatidle/usec3_fight_49_bl_l.wav","usec/3/combatidle/usec3_fight_47_bl_l.wav","usec/3/combatidle/usec3_fight_45_bl_l.wav","usec/3/combatidle/usec3_fight_43_bl_l.wav","usec/3/combatidle/usec3_fight_41_bl_l.wav","usec/3/combatidle/usec3_fight_40_bl_l.wav","usec/3/combatidle/usec3_fight_39_bl_l.wav","usec/3/combatidle/usec3_fight_38_bl_l.wav","usec/3/combatidle/usec3_fight_37_bl_l.wav","usec/3/combatidle/usec3_fight_36_bl_l.wav","usec/3/combatidle/usec3_fight_35_bl_l.wav","usec/3/combatidle/usec3_fight_33_bl_l.wav","usec/3/combatidle/usec3_fight_32_bl_l.wav","usec/3/combatidle/usec3_fight_31_l.wav","usec/3/combatidle/usec3_fight_31_bl_l.wav","usec/3/combatidle/usec3_fight_27_l.wav","usec/3/combatidle/usec3_fight_25_l.wav","usec/3/combatidle/usec3_fight_23_bl_l.wav","usec/3/combatidle/usec3_fight_21_bl_l.wav","usec/3/combatidle/usec3_fight_19_l.wav","usec/3/combatidle/usec3_fight_18_l.wav","usec/3/combatidle/usec3_fight_17_l.wav","usec/3/combatidle/usec3_fight_16_bl_l.wav","usec/3/combatidle/usec3_fight_15_l.wav","usec/3/combatidle/usec3_fight_14_bear_l.wav","usec/3/combatidle/usec3_fight_13_l.wav","usec/3/combatidle/usec3_fight_12_bl_l.wav","usec/3/combatidle/usec3_fight_11_l.wav","usec/3/combatidle/usec3_fight_10_bl_l.wav","usec/3/combatidle/usec3_fight_09_l.wav","usec/3/combatidle/usec3_fight_08_l.wav","usec/3/combatidle/usec3_fight_07_l.wav","usec/3/combatidle/usec3_fight_06_l.wav","usec/3/combatidle/usec3_fight_05_l.wav","usec/3/combatidle/usec3_fight_04_l.wav","usec/3/combatidle/usec3_fight_03_l.wav","usec/3/combatidle/usec3_fight_03_bl_l.wav","usec/3/combatidle/usec3_fight_02_bl_l.wav","usec/3/combatidle/usec3_fight_01_l.wav"}
ENT.SoundTbl_WeaponReload = {"usec/3/reload/usec3_weap_reload_11_bl_l.wav","usec/3/reload/usec3_weap_reload_10_bl_l.wav","usec/3/reload/usec3_weap_reload_09_bl_l.wav","usec/3/reload/usec3_weap_reload_03_l.wav","usec/3/reload/usec3_weap_reload_02_l.wav"}
ENT.SoundTbl_OnGrenadeSight = {"usec/3/enemygrenade/usec3_enemy_grenade_05_bl_l.wav","usec/3/enemygrenade/usec3_enemy_grenade_04_l.wav","usec/3/enemygrenade/usec3_enemy_grenade_03_l.wav","usec/3/enemygrenade/usec3_enemy_grenade_02_l.wav","usec/3/enemygrenade/usec3_enemy_grenade_01_l.wav"}
ENT.SoundTbl_OnKilledEnemy = {"usec/3/enemydown/usec3_enemy_down_06_l.wav","usec/3/enemydown/usec3_enemy_down_06_bl_l.wav","usec/3/enemydown/usec3_enemy_down_05_l.wav","usec/3/enemydown/usec3_enemy_down_05_bl.wav","usec/3/enemydown/usec3_enemy_down_04_l_bl.wav","usec/3/enemydown/usec3_enemy_down_03_l.wav","usec/3/enemydown/usec3_enemy_down_02_l.wav","usec/3/enemydown/usec3_enemy_down_01_l.wav"}
ENT.SoundTbl_Pain = {"usec/3/pain/usec3_hit_15.wav","usec/3/pain/usec3_hit_14.wav","usec/3/pain/usec3_hit_13.wav","usec/3/pain/usec3_hit_12.wav","usec/3/pain/usec3_hit_11.wav","usec/3/pain/usec3_hit_10.wav","usec/3/pain/usec3_hit_09.wav","usec/3/pain/usec3_hit_08.wav","usec/3/pain/usec3_hit_07.wav","usec/3/pain/usec3_hit_06.wav","usec/3/pain/usec3_hit_05.wav","usec/3/pain/usec3_hit_04.wav","usec/3/pain/usec3_hit_03.wav","usec/3/pain/usec3_hit_02.wav","usec/3/pain/usec3_hit_01.wav"}
ENT.SoundTbl_AllyDeath = {"usec/3/friendlydeath/usec3_teammate_down_05_bl_l.wav","usec/3/friendlydeath/usec3_teammate_down_04_l.wav","usec/3/friendlydeath/usec3_teammate_down_03_l.wav","usec/3/friendlydeath/usec3_teammate_down_02_l.wav","usec/3/friendlydeath/usec3_teammate_down_01_l.wav"}
ENT.SoundTbl_CallForHelp = {"usec/3/coverme/usec3_needhelp_12_bl_l.wav","usec/3/coverme/usec3_needhelp_11_bl_l.wav","usec/3/coverme/usec3_needhelp_10_bl_l.wav","usec/3/coverme/usec3_needhelp_09_l.wav","usec/3/coverme/usec3_needhelp_07_l.wav","usec/3/coverme/usec3_needhelp_06_l.wav","usec/3/coverme/usec3_needhelp_04_l.wav","usec/3/coverme/usec3_needhelp_02_l.wav","usec/3/coverme/usec3_coverme_06_l.wav","usec/3/coverme/usec3_coverme_06_bl_l.wav","usec/3/coverme/usec3_coverme_04_l.wav","usec/3/coverme/usec3_coverme_02_l.wav"}
ENT.SoundTbl_GrenadeAttack = {"usec/3/grenade/usec3_grenade_06_bl_l.wav","usec/3/grenade/usec3_grenade_05_l.wav","usec/3/grenade/usec3_grenade_04_bl_l.wav","usec/3/grenade/usec3_grenade_03_l.wav","usec/3/grenade/usec3_grenade_02_l.wav","usec/3/grenade/usec3_grenade_01_l.wav"}
ENT.SoundTbl_Death = {"usec/3/death/usec3_death_12.wav","usec/3/death/usec3_death_11.wav","usec/3/death/usec3_death_10.wav","usec/3/death/usec3_death_09.wav","usec/3/death/usec3_death_08.wav","usec/3/death/usec3_death_07.wav","usec/3/death/usec3_death_06.wav","usec/3/death/usec3_death_05.wav","usec/3/death/usec3_death_04.wav","usec/3/death/usec3_death_03.wav","usec/3/death/usec3_death_02.wav","usec/3/death/usec3_death_01.wav","usec/3/death/usec3_agony_07.wav","usec/3/death/usec3_agony_06.wav","usec/3/death/usec3_agony_05.wav","usec/3/death/usec3_agony_04.wav","usec/3/death/usec3_agony_03.wav","usec/3/death/usec3_agony_02.wav","usec/3/death/usec3_agony_01.wav"}
ENT.SoundTbl_FootStep = {"footsteps/run_concrete6.wav","footsteps/run_concrete5.wav","footsteps/run_concrete4.wav","footsteps/run_concrete3.wav","footsteps/run_concrete2.wav","footsteps/run_concrete1.wav"}
----------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()			
 local randomarmour = math.random(5)
	if randomarmour == 0 then self:SetBodygroup( 1 ) else
	if randomarmour == 1 then self:SetBodygroup( 1,1 ) end		
	if randomarmour == 2 then self:SetBodygroup( 1,2 ) end	
	if randomarmour == 3 then self:SetBodygroup( 1,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 1,4 ) end		
    end	
 local randomarmour = math.random(5)
	if randomarmour == 0 then self:SetBodygroup( 2 ) else
	if randomarmour == 1 then self:SetBodygroup( 2,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 2,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 2,3 ) end	
	if randomarmour == 4 then self:SetBodygroup( 2,4 ) end			
    end				
 local randomarmour = math.random(5)
	if randomarmour == 0 then self:SetBodygroup( 3 ) else
	if randomarmour == 1 then self:SetBodygroup( 3,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 3,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 3,3 ) end	
	if randomarmour == 4 then self:SetBodygroup( 3,4 ) end	
	if randomarmour == 5 then self:SetBodygroup( 3,5 ) end		
    end		
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetBodygroup( 4 ) else
	if randomarmour == 1 then self:SetBodygroup( 4,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 4,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 4,3 ) end		
    end		
 local randomarmour = math.random(6)
	if randomarmour == 0 then self:SetBodygroup( 5 ) else
	if randomarmour == 1 then self:SetBodygroup( 5,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 5,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 5,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 5,4 ) end
    end	
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetBodygroup( 6 ) else
	if randomarmour == 1 then self:SetBodygroup( 6,1 ) end	
	if randomarmour == 2 then self:SetBodygroup( 6,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 6,3 ) end	
	if randomarmour == 4 then self:SetBodygroup( 6,4 ) end		
    end		
 local randomarmour = math.random(7)
	if randomarmour == 0 then self:SetBodygroup( 7 ) else
	if randomarmour == 1 then self:SetBodygroup( 7,1 ) end		
	if randomarmour == 2 then self:SetBodygroup( 7,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 7,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 7,4 ) end	
	if randomarmour == 5 then self:SetBodygroup( 7,5 ) end	
	if randomarmour == 6 then self:SetBodygroup( 7,6 ) end		
    end			
 local randomarmour = math.random(9)
	if randomarmour == 0 then self:SetBodygroup( 8 ) else
	if randomarmour == 1 then self:SetBodygroup( 8,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 8,2 ) end			
	if randomarmour == 3 then self:SetBodygroup( 8,3 ) end			
	if randomarmour == 4 then self:SetBodygroup( 8,4 ) end		
	if randomarmour == 5 then self:SetBodygroup( 8,5 ) end	
	if randomarmour == 6 then self:SetBodygroup( 8,6 ) end	
	if randomarmour == 7 then self:SetBodygroup( 8,7 ) end		
    end			
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 11 ) else
	if randomarmour == 1 then self:SetBodygroup( 11,1 ) end		
    end		
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 12 ) else
	if randomarmour == 1 then self:SetBodygroup( 12,1 ) end		
    end		
 local randomarmour = math.random(2)
	if randomarmour == 0 then self:SetBodygroup( 13 ) else
	if randomarmour == 1 then self:SetBodygroup( 13,1 ) end		
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