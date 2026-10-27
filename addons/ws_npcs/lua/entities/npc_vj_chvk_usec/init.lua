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
ENT.SoundTbl_Alert = {"usec/1/alert/usec1_enemy_contact_08_l.wav","usec/1/alert/usec1_enemy_contact_07_l.wav","usec/1/alert/usec1_enemy_contact_06_l.wav","usec/1/alert/usec1_enemy_contact_05_l.wav","usec/1/alert/usec1_enemy_contact_04_l.wav","usec/1/alert/usec1_enemy_contact_03_l.wav","usec/1/alert/usec1_enemy_contact_02_l.wav","usec/1/alert/usec1_enemy_contact_01_l.wav","usec/1/alert/usec1_enemy_bear_04_l.wav","usec/1/alert/usec1_enemy_bear_02_l.wav","usec/1/alert/usec1_enemy_bear_01_l.wav"}
ENT.SoundTbl_Suppressing = {"usec/1/supressing/usec1_supressingfire_03_l.wav","usec/1/supressing/usec1_supressingfire_02_l.wav","usec/1/supressing/usec1_supressingfire_01_l.wav"}
ENT.SoundTbl_LostEnemy = {"usec/1/lostvisual/usec1_lostvisual_09_l.wav","usec/1/lostvisual/usec1_lostvisual_08_l.wav","usec/1/lostvisual/usec1_lostvisual_07_l.wav","usec/1/lostvisual/usec1_lostvisual_06_l.wav","usec/1/lostvisual/usec1_lostvisual_05_l.wav","usec/1/lostvisual/usec1_lostvisual_04_l.wav"}
ENT.SoundTbl_CombatIdle = {"usec/1/combatidle/usec1_fight_31_l.wav","usec/1/combatidle/usec1_fight_30_l.wav","usec/1/combatidle/usec1_fight_29_l.wav","usec/1/combatidle/usec1_fight_28_l.wav","usec/1/combatidle/usec1_fight_27_l.wav","usec/1/combatidle/usec1_fight_26_l.wav","usec/1/combatidle/usec1_fight_25_l.wav","usec/1/combatidle/usec1_fight_24_l.wav","usec/1/combatidle/usec1_fight_23_l.wav","usec/1/combatidle/usec1_fight_22_l.wav","usec/1/combatidle/usec1_fight_21_l.wav","usec/1/combatidle/usec1_fight_20_l.wav","usec/1/combatidle/usec1_fight_19_l.wav","usec/1/combatidle/usec1_fight_18_l.wav","usec/1/combatidle/usec1_fight_17_l.wav","usec/1/combatidle/usec1_fight_16_l.wav","usec/1/combatidle/usec1_fight_15_l.wav","usec/1/combatidle/usec1_fight_14_l.wav","usec/1/combatidle/usec1_fight_13_l.wav","usec/1/combatidle/usec1_fight_12_l.wav","usec/1/combatidle/usec1_fight_11_l.wav","usec/1/combatidle/usec1_fight_10_l.wav","usec/1/combatidle/usec1_fight_09_l.wav","usec/1/combatidle/usec1_fight_08_l.wav","usec/1/combatidle/usec1_fight_07_l.wav","usec/1/combatidle/usec1_fight_06_l.wav","usec/1/combatidle/usec1_fight_05_l.wav","usec/1/combatidle/usec1_fight_04_l.wav","usec/1/combatidle/usec1_fight_03_l.wav","usec/1/combatidle/usec1_fight_02_l.wav","usec/1/combatidle/usec1_fight_01_l.wav"}
ENT.SoundTbl_WeaponReload = {"usec/1/reload/usec1_weap_reload_08_l.wav","usec/1/reload/usec1_weap_reload_07_l.wav","usec/1/reload/usec1_weap_reload_06_l.wav","usec/1/reload/usec1_weap_reload_05_l.wav","usec/1/reload/usec1_weap_reload_04_l.wav","usec/1/reload/usec1_weap_reload_03_l.wav","usec/1/reload/usec1_weap_reload_02_l.wav","usec/1/reload/usec1_weap_reload_01_l.wav"}
ENT.SoundTbl_OnGrenadeSight = {"usec/1/enemygrenade/usec1_enemy_grenade_03_l.wav","usec/1/enemygrenade/usec1_enemy_grenade_02_l.wav","usec/1/enemygrenade/usec1_enemy_grenade_01_l.wav"}
ENT.SoundTbl_OnKilledEnemy = {"usec/1/enemydown/usec1_enemy_down_07_l.wav","usec/1/enemydown/usec1_enemy_down_06_l.wav","usec/1/enemydown/usec1_enemy_down_05_l.wav","usec/1/enemydown/usec1_enemy_down_04_l.wav","usec/1/enemydown/usec1_enemy_down_03_l.wav","usec/1/enemydown/usec1_enemy_down_02_l.wav","usec/1/enemydown/usec1_enemy_down_01_l.wav"}
ENT.SoundTbl_Pain = {"usec/1/pain/usec1_hit_16.wav","usec/1/pain/usec1_hit_15.wav","usec/1/pain/usec1_hit_14.wav","usec/1/pain/usec1_hit_13.wav","usec/1/pain/usec1_hit_12.wav","usec/1/pain/usec1_hit_11.wav","usec/1/pain/usec1_hit_10.wav","usec/1/pain/usec1_hit_09.wav","usec/1/pain/usec1_hit_08.wav","usec/1/pain/usec1_hit_07.wav","usec/1/pain/usec1_hit_06.wav","usec/1/pain/usec1_hit_05.wav","usec/1/pain/usec1_hit_04.wav","usec/1/pain/usec1_hit_03.wav","usec/1/pain/usec1_hit_02.wav","usec/1/pain/usec1_hit_01.wav"}
ENT.SoundTbl_AllyDeath = {"usec/1/friendlydeath/usec1_friendly_hit_04_l.wav","usec/1/friendlydeath/usec1_friendly_hit_03_l.wav","usec/1/friendlydeath/usec1_friendly_hit_02_l.wav","usec/1/friendlydeath/usec1_friendly_hit_01_l.wav"}
ENT.SoundTbl_CallForHelp = {"usec/1/coverme/usec1_needhelp_05_l.wav","usec/1/coverme/usec1_needhelp_04_l.wav","usec/1/coverme/usec1_needhelp_03_l.wav","usec/1/coverme/usec1_needhelp_02_l.wav","usec/1/coverme/usec1_needhelp_01_l.wav","usec/1/coverme/usec1_coverme_03_l.wav","usec/1/coverme/usec1_coverme_02_l.wav","usec/1/coverme/usec1_coverme_01_l.wav"}
ENT.SoundTbl_GrenadeAttack = {"usec/1/grenade/usec1_grenade_05_l.wav","usec/1/grenade/usec1_grenade_04_l.wav","usec/1/grenade/usec1_grenade_03_l.wav","usec/1/grenade/usec1_grenade_02_l.wav","usec/1/grenade/usec1_grenade_01_l.wav"}
ENT.SoundTbl_Death = {"usec/1/death/usec1_death_08.wav","usec/1/death/usec1_death_07.wav","usec/1/death/usec1_death_06.wav","usec/1/death/usec1_death_05.wav","usec/1/death/usec1_death_04.wav","usec/1/death/usec1_death_03.wav","usec/1/death/usec1_death_02.wav","usec/1/death/usec1_death_01.wav","usec/1/death/usec1_agony_04.wav","usec/1/death/usec1_agony_03.wav","usec/1/death/usec1_agony_02.wav","usec/1/death/usec1_agony_01.wav"}
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