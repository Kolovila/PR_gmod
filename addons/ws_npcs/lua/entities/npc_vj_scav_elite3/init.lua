AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Raiders/Elite_Raider_Masked_Custom5.mdl","models/Raiders/Elite_Raider_Masked_Custom6.mdl","models/Raiders/Elite_Raider_Custom1.mdl","models/Raiders/Elite_Raider_Custom2.mdl","models/Raiders/Elite_Raider_Custom3.mdl","models/Raiders/Elite_Raider_Custom4.mdl","models/Raiders/Elite_Raider_Masked_Custom1.mdl","models/Raiders/Elite_Raider_Masked_Custom2.mdl","models/Raiders/Elite_Raider_Masked_Custom3.mdl","models/Raiders/Elite_Raider_Masked_Custom4.mdl"}
ENT.StartHealth = 130
ENT.HullType = HULL_HUMAN

ENT.VJ_NPC_Class = {"CLASS_RAIDER"}
ENT.BloodColor = "Red"

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_seq_meleeattack01"

ENT.UsePoseParameterMovement = true

ENT.JumpParams = {
	Enabled = true, -- Can it do movement jumps?
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
ENT.SoundTbl_Alert = {"scav/1/alert/scav1_enemy_contact_27_bl.wav","scav/1/alert/scav1_enemy_contact_26_bl.wav","scav/1/alert/scav1_enemy_contact_25_bl.wav","scav/1/alert/scav1_enemy_contact_24_l.wav","scav/1/alert/scav1_enemy_contact_23_l.wav","scav/1/alert/scav1_enemy_contact_22_l.wav","scav/1/alert/scav1_enemy_contact_20_l.wav","scav/1/alert/scav1_enemy_contact_19_l.wav","scav/1/alert/scav1_enemy_contact_18_l.wav","scav/1/alert/scav1_enemy_contact_17_l.wav","scav/1/alert/scav1_enemy_contact_15_l.wav","scav/1/alert/scav1_enemy_contact_14_l.wav","scav/1/alert/scav1_enemy_contact_13_l.wav","scav/1/alert/scav1_enemy_contact_12_l.wav","scav/1/alert/scav1_enemy_contact_11_l.wav","scav/1/alert/scav1_enemy_contact_09_l.wav","scav/1/alert/scav1_enemy_contact_08_l.wav","scav/1/alert/scav1_enemy_contact_07_l.wav","scav/1/alert/scav1_enemy_contact_06_l.wav","scav/1/alert/scav1_enemy_contact_05_l.wav","scav/1/alert/scav1_enemy_contact_03_l.wav","scav/1/alert/scav1_enemy_contact_02_l.wav","scav/1/alert/scav1_enemy_contact_01_l.wav"}
ENT.SoundTbl_LostEnemy = {"scav/1/lostvisual/scav1_lostvisual_04_bl.wav","scav/1/lostvisual/scav1_lostvisual_03_bl.wav","scav/1/lostvisual/scav1_lostvisual_02.wav","scav/1/lostvisual/scav1_lostvisual_01.wav"}
ENT.SoundTbl_CombatIdle = {"scav/1/combatidle/scav1_fight_17_bl.wav","scav/1/combatidle/scav1_fight_16_bl.wav","scav/1/combatidle/scav1_fight_15_bl.wav","scav/1/combatidle/scav1_fight_14_bl.wav","scav/1/combatidle/scav1_fight_13_bl.wav","scav/1/combatidle/scav1_fight_12_bl.wav","scav/1/combatidle/scav1_fight_11_bl.wav","scav/1/combatidle/scav1_fight_10_bl.wav","scav/1/combatidle/scav1_fight_09_bl.wav","scav/1/combatidle/scav1_fight_08_l.wav","scav/1/combatidle/scav1_fight_07_l.wav","scav/1/combatidle/scav1_fight_06_l.wav","scav/1/combatidle/scav1_fight_05_l.wav","scav/1/combatidle/scav1_fight_04_l.wav","scav/1/combatidle/scav1_fight_03.wav","scav/1/combatidle/scav1_fight_01.wav"}
ENT.SoundTbl_WeaponReload = {"scav/1/reload/scav1_weap_reload_04_bl.wav","scav/1/reload/scav1_weap_reload_03_n.wav","scav/1/reload/scav1_weap_reload_02_n.wav","scav/1/reload/scav1_weap_reload_01_n.wav"}
ENT.SoundTbl_OnGrenadeSight = {"scav/1/enemygrenade/scav1_spreadout_05_bl.wav","scav/1/enemygrenade/scav1_spreadout_04_bl.wav","scav/1/enemygrenade/scav1_spreadout_03.wav","scav/1/enemygrenade/scav1_spreadout_02.wav","scav/1/enemygrenade/scav1_spreadout_01.wav","scav/1/enemygrenade/scav1_enemy_grenade_02.wav","scav/1/enemygrenade/scav1_enemy_grenade_01.wav"}
ENT.SoundTbl_OnKilledEnemy = {"scav/1/enemydown/scav1_enemy_down_19_bl.wav","scav/1/enemydown/scav1_enemy_down_18_bl.wav","scav/1/enemydown/scav1_enemy_down_17_bl.wav","scav/1/enemydown/scav1_enemy_down_16_bl.wav","scav/1/enemydown/scav1_enemy_down_15_bl.wav","scav/1/enemydown/scav1_enemy_down_14_bl.wav","scav/1/enemydown/scav1_enemy_down_13_bl.wav","scav/1/enemydown/scav1_enemy_down_12_bl.wav","scav/1/enemydown/scav1_enemy_down_11_bl.wav","scav/1/enemydown/scav1_enemy_down_10.wav","scav/1/enemydown/scav1_enemy_down_09.wav","scav/1/enemydown/scav1_enemy_down_08.wav","scav/1/enemydown/scav1_enemy_down_07.wav","scav/1/enemydown/scav1_enemy_down_06.wav","scav/1/enemydown/scav1_enemy_down_05.wav","scav/1/enemydown/scav1_enemy_down_04.wav","scav/1/enemydown/scav1_enemy_down_03.wav","scav/1/enemydown/scav1_enemy_down_02.wav","scav/1/enemydown/scav1_enemy_down_01.wav"}
ENT.SoundTbl_Pain = {"scav/1/pain/scav1_hit_24.wav","scav/1/pain/scav1_hit_23.wav","scav/1/pain/scav1_hit_22.wav","scav/1/pain/scav1_hit_21.wav","scav/1/pain/scav1_hit_20.wav","scav/1/pain/scav1_hit_19.wav","scav/1/pain/scav1_hit_18.wav","scav/1/pain/scav1_hit_17.wav","scav/1/pain/scav1_hit_16.wav","scav/1/pain/scav1_hit_15.wav","scav/1/pain/scav1_hit_14.wav","scav/1/pain/scav1_hit_13.wav","scav/1/pain/scav1_hit_12.wav","scav/1/pain/scav1_hit_11.wav","scav/1/pain/scav1_hit_10.wav","scav/1/pain/scav1_hit_09.wav","scav/1/pain/scav1_hit_08.wav","scav/1/pain/scav1_hit_07.wav","scav/1/pain/scav1_hit_06.wav","scav/1/pain/scav1_hit_05.wav","scav/1/pain/scav1_hit_04.wav","scav/1/pain/scav1_hit_03.wav","scav/1/pain/scav1_hit_02.wav","scav/1/pain/scav1_hit_01.wav"}
ENT.SoundTbl_AllyDeath = {"scav/1/friendlydeath/scav1_friendly_down_04_bl.wav","scav/1/friendlydeath/scav1_friendly_down_03_bl.wav","scav/1/friendlydeath/scav1_friendly_down_02.wav","scav/1/friendlydeath/scav1_friendly_down_01.wav"}
ENT.SoundTbl_CallForHelp = {"scav/1/coverme/scav1_coverme_04_bl.wav","scav/1/coverme/scav1_coverme_03_bl.wav","scav/1/coverme/scav1_coverme_02_n.wav","scav/1/coverme/scav1_coverme_02_l.wav","scav/1/coverme/scav1_coverme_01_n.wav","scav/1/coverme/scav1_coverme_01_l.wav"}
ENT.SoundTbl_GrenadeAttack = {"scav/1/grenade/scav1_grenade_02.wav","scav/1/grenade/scav1_grenade_01.wav"}
ENT.SoundTbl_Death = {"scav/1/death/scav1_death_14.wav","scav/1/death/scav1_death_13.wav","scav/1/death/scav1_death_12.wav","scav/1/death/scav1_death_11.wav","scav/1/death/scav1_death_10.wav","scav/1/death/scav1_death_09.wav","scav/1/death/scav1_death_08.wav","scav/1/death/scav1_death_07.wav","scav/1/death/scav1_death_06.wav","scav/1/death/scav1_death_05.wav","scav/1/death/scav1_death_04.wav","scav/1/death/scav1_death_03.wav","scav/1/death/scav1_death_02.wav","scav/1/death/scav1_death_01.wav","scav/1/death/scav1_agony_04.wav","scav/1/death/scav1_agony_03.wav","scav/1/death/scav1_agony_02.wav","scav/1/death/scav1_agony_01.wav"}
ENT.SoundTbl_FootStep = {"footsteps/run_concrete6.wav","footsteps/run_concrete5.wav","footsteps/run_concrete4.wav","footsteps/run_concrete3.wav","footsteps/run_concrete2.wav","footsteps/run_concrete1.wav"}
----------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()			
 local randomarmour = math.random(4)
	if randomarmour == 0 then self:SetBodygroup( 2 ) else
	if randomarmour == 1 then self:SetBodygroup( 2,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 2,2 ) end	
	if randomarmour == 3 then self:SetBodygroup( 2,3 ) end		
    end	
 local randomarmour = math.random(7)
	if randomarmour == 0 then self:SetBodygroup( 3 ) else
	if randomarmour == 1 then self:SetBodygroup( 3,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 3,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 3,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 3,4 ) end		
	if randomarmour == 5 then self:SetBodygroup( 3,5 ) end		
	if randomarmour == 6 then self:SetBodygroup( 3,6 ) end		
    end	
 local randomarmour = math.random(6)
	if randomarmour == 0 then self:SetBodygroup( 4 ) else
	if randomarmour == 1 then self:SetBodygroup( 4,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 4,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 4,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 4,4 ) end			
	if randomarmour == 5 then self:SetBodygroup( 4,5 ) end			
    end
 local randomarmour = math.random(6)
	if randomarmour == 0 then self:SetBodygroup( 5 ) else
	if randomarmour == 1 then self:SetBodygroup( 5,1 ) end
	if randomarmour == 2 then self:SetBodygroup( 5,2 ) end	
	if randomarmour == 3 then self:SetBodygroup( 5,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 5,4 ) end		
    end		
 local randomarmour = math.random(6)
	if randomarmour == 0 then self:SetBodygroup( 6 ) else
	if randomarmour == 1 then self:SetBodygroup( 6,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 6,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 6,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 6,4 ) end		
	if randomarmour == 5 then self:SetBodygroup( 6,5 ) end		
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
 local randomarmour = math.random(7)
	if randomarmour == 0 then self:SetBodygroup( 8 ) else
	if randomarmour == 1 then self:SetBodygroup( 8,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 8,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 8,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 8,4 ) end		
	if randomarmour == 5 then self:SetBodygroup( 8,5 ) end		
	if randomarmour == 6 then self:SetBodygroup( 8,6 ) end		
    end		
 local randomarmour = math.random(10)
	if randomarmour == 0 then self:SetBodygroup( 9 ) else
	if randomarmour == 1 then self:SetBodygroup( 9,1 ) end			
	if randomarmour == 2 then self:SetBodygroup( 9,2 ) end		
	if randomarmour == 3 then self:SetBodygroup( 9,3 ) end		
	if randomarmour == 4 then self:SetBodygroup( 9,4 ) end		
	if randomarmour == 5 then self:SetBodygroup( 9,5 ) end		
	if randomarmour == 6 then self:SetBodygroup( 9,6 ) end		
	if randomarmour == 7 then self:SetBodygroup( 9,7 ) end		
    end			
 local randomarmour = math.random(8)
	if randomarmour == 0 then self:SetSkin ( 3 ) else
	if randomarmour == 1 then self:SetSkin ( 1 ) end		
	if randomarmour == 2 then self:SetSkin ( 2 ) end		
	if randomarmour == 3 then self:SetSkin ( 3 ) end	
	if randomarmour == 4 then self:SetSkin ( 4 ) end		
	if randomarmour == 5 then self:SetSkin ( 5 ) end		
	if randomarmour == 6 then self:SetSkin ( 6 ) end		
	if randomarmour == 7 then self:SetSkin ( 7 ) end		
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