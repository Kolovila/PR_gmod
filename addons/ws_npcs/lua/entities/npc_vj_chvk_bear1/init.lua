AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Bear/Pmc_Bear_Custom1.mdl","models/Bear/Pmc_Bear_Custom2.mdl","models/Bear/Pmc_Bear_Custom_Masked1.mdl","models/Bear/Pmc_Bear_Custom_Masked2.mdl","models/Bear/Pmc_Bear_Custom3.mdl","models/Bear/Pmc_Bear_Custom_Masked3.mdl"}
ENT.StartHealth = 120
ENT.HullType = HULL_HUMAN

ENT.VJ_NPC_Class = {"CLASS_BEAR"}
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
ENT.SoundTbl_Alert = {"bear/2/alert/bear2_enemy_usec6_bl_l.wav","bear/2/alert/bear2_enemy_usec5_bl_l.wav","bear/2/alert/bear2_enemy_usec4_bl_l.wav","bear/2/alert/bear2_enemy_usec3_l.wav","bear/2/alert/bear2_enemy_usec2_l.wav","bear/2/alert/bear2_enemy_usec1_l.wav","bear/2/alert/bear2_enemy_contact7_l.wav","bear/2/alert/bear2_enemy_contact6_l.wav","bear/2/alert/bear2_enemy_contact5_l.wav","bear/2/alert/bear2_enemy_contact4_l.wav","bear/2/alert/bear2_enemy_contact3_l.wav","bear/2/alert/bear2_enemy_contact2_l.wav","bear/2/alert/bear2_enemy_contact1_l.wav"}
ENT.SoundTbl_Suppressing = {"bear/2/supressing/bear2_supressingfire_01_l.wav","bear/2/supressing/bear2_supressingfire_02_l.wav","bear/2/supressing/bear2_supressingfire_03_bl_l.wav","bear/2/supressing/bear2_supressingfire_04_bl_l.wav"}
ENT.SoundTbl_LostEnemy = {"bear/2/lostvisual/bear2_lostvisual_12_bl.wav","bear/2/lostvisual/bear2_lostvisual_11_bl.wav","bear/2/lostvisual/bear2_lostvisual_10_bl.wav","bear/2/lostvisual/bear2_lostvisual_09_bl.wav","bear/2/lostvisual/bear2_lostvisual_08_l.wav","bear/2/lostvisual/bear2_lostvisual_07_l.wav","bear/2/lostvisual/bear2_lostvisual_06_l.wav","bear/2/lostvisual/bear2_lostvisual_05_l.wav","bear/2/lostvisual/bear2_lostvisual_04_l.wav","bear/2/lostvisual/bear2_lostvisual_03_l.wav","bear/2/lostvisual/bear2_lostvisual_02_l.wav","bear/2/lostvisual/bear2_lostvisual_01_l.wav"}
ENT.SoundTbl_CombatIdle = {"bear/2/combatidle/bear2_fight9_l.wav","bear/2/combatidle/bear2_fight8_l.wav","bear/2/combatidle/bear2_fight7_l.wav","bear/2/combatidle/bear2_fight6_l.wav","bear/2/combatidle/bear2_fight5_l.wav","bear/2/combatidle/bear2_fight4_l.wav","bear/2/combatidle/bear2_fight45_l.wav","bear/2/combatidle/bear2_fight45_bl_l.wav","bear/2/combatidle/bear2_fight44_bl_l.wav","bear/2/combatidle/bear2_fight43_bl_l.wav","bear/2/combatidle/bear2_fight42_bl_l.wav","bear/2/combatidle/bear2_fight41_bl_l.wav","bear/2/combatidle/bear2_fight40_bl_l.wav","bear/2/combatidle/bear2_fight3_l.wav","bear/2/combatidle/bear2_fight39_bl_l.wav","bear/2/combatidle/bear2_fight38_bl_l.wav","bear/2/combatidle/bear2_fight37_bl_l.wav","bear/2/combatidle/bear2_fight36_bl_l.wav","bear/2/combatidle/bear2_fight35_bl_l.wav","bear/2/combatidle/bear2_fight34_bl_l.wav","bear/2/combatidle/bear2_fight33_bl_l.wav","bear/2/combatidle/bear2_fight32_bl_l.wav","bear/2/combatidle/bear2_fight30_bl_l.wav","bear/2/combatidle/bear2_fight2_l.wav","bear/2/combatidle/bear2_fight29_bl_l.wav","bear/2/combatidle/bear2_fight28_l.wav","bear/2/combatidle/bear2_fight27_l.wav","bear/2/combatidle/bear2_fight26_l.wav","bear/2/combatidle/bear2_fight25_l.wav","bear/2/combatidle/bear2_fight24_l.wav","bear/2/combatidle/bear2_fight23_l.wav","bear/2/combatidle/bear2_fight22_l.wav","bear/2/combatidle/bear2_fight21_l.wav","bear/2/combatidle/bear2_fight20_l.wav","bear/2/combatidle/bear2_fight1_l.wav","bear/2/combatidle/bear2_fight19_l.wav","bear/2/combatidle/bear2_fight18_l.wav","bear/2/combatidle/bear2_fight18_bl_l.wav","bear/2/combatidle/bear2_fight17_l.wav","bear/2/combatidle/bear2_fight16_l.wav","bear/2/combatidle/bear2_fight14_l.wav","bear/2/combatidle/bear2_fight13_l.wav","bear/2/combatidle/bear2_fight12_l.wav","bear/2/combatidle/bear2_fight11_l.wav","bear/2/combatidle/bear2_fight11_bl_l.wav","bear/2/combatidle/bear2_fight10_l.wav"}
ENT.SoundTbl_WeaponReload = {"bear/2/reload/bear2_weap_reload7_bl_l.wav","bear/2/reload/bear2_weap_reload6_bl_l.wav","bear/2/reload/bear2_weap_reload5_l.wav","bear/2/reload/bear2_weap_reload4_l.wav","bear/2/reload/bear2_weap_reload3_l.wav","bear/2/reload/bear2_weap_reload2_l.wav","bear/2/reload/bear2_weap_reload1_l.wavs"}
ENT.SoundTbl_OnGrenadeSight = {"bear/2/enemygrenade/bear2_enemy_grenade4_bl_l.wav","bear/2/enemygrenade/bear2_enemy_grenade3_l.wav","bear/2/enemygrenade/bear2_enemy_grenade2_l.wav","bear/2/enemygrenade/bear2_enemy_grenade2_bl_l.wav","bear/2/enemygrenade/bear2_enemy_grenade1_l.wav","bear/2/enemygrenade/bear2_enemy_grenade1_bl_l.wav"}
ENT.SoundTbl_OnKilledEnemy = {"bear/2/enemydown/bear2_enemy_down_usec2_l.wav","bear/2/enemydown/bear2_enemy_down_usec1_l.wav","bear/2/enemydown/bear2_enemy_down7_l.wav","bear/2/enemydown/bear2_enemy_down6_l.wav","bear/2/enemydown/bear2_enemy_down6_bl_l.wav","bear/2/enemydown/bear2_enemy_down5_l.wav","bear/2/enemydown/bear2_enemy_down4_l.wav","bear/2/enemydown/bear2_enemy_down4_bl_l.wav","bear/2/enemydown/bear2_enemy_down3_l.wav","bear/2/enemydown/bear2_enemy_down3_bl_l.wav","bear/2/enemydown/bear2_enemy_down2_l.wav","bear/2/enemydown/bear2_enemy_down2_bl_l.wav","bear/2/enemydown/bear2_enemy_down1_l.wav","bear/2/enemydown/bear2_enemy_down1_bl_l.wav"}
ENT.SoundTbl_Pain = {"bear/2/pain/bear2_hit9.wav","bear/2/pain/bear2_hit8.wav","bear/2/pain/bear2_hit7.wav","bear/2/pain/bear2_hit6.wav","bear/2/pain/bear2_hit5.wav","bear/2/pain/bear2_hit4.wav","bear/2/pain/bear2_hit3.wav","bear/2/pain/bear2_hit2.wav","bear/2/pain/bear2_hit13.wav","bear/2/pain/bear2_hit12.wav","bear/2/pain/bear2_hit11.wav","bear/2/pain/bear2_hit10.wav","bear/2/pain/bear2_hit1.wav"}
ENT.SoundTbl_AllyDeath = {"bear/2/friendlydeath/bear2_friendly_hit2_l.wav","bear/2/friendlydeath/bear2_friendly_hit1_l.wav","bear/2/friendlydeath/bear2_friendly_down2_l.wav","bear/2/friendlydeath/bear2_friendly_down1_l.wav","bear/2/friendlydeath/bear2_friendly_down1_bl_l.wav"}
ENT.SoundTbl_CallForHelp = {"bear/2/coverme/bear2_needhelp_06_bl_l.wav","bear/2/coverme/bear2_needhelp_05_bl_l.wav","bear/2/coverme/bear2_needhelp_04_l.wav","bear/2/coverme/bear2_needhelp_03_l.wav","bear/2/coverme/bear2_needhelp_02_l.wav","bear/2/coverme/bear2_needhelp_01_l.wav","bear/2/coverme/bear2_coverme_06_bl_l.wav","bear/2/coverme/bear2_coverme_05_bl_l.wav","bear/2/coverme/bear2_coverme_04_n.wav","bear/2/coverme/bear2_coverme_03_n.wav","bear/2/coverme/bear2_coverme_02_n.wav","bear/2/coverme/bear2_coverme_01_n.wav"}
ENT.SoundTbl_GrenadeAttack = {"bear/2/grenade/bear2_grenade9_bl_l.wav","bear/2/grenade/bear2_grenade8_bl_l.wav","bear/2/grenade/bear2_grenade7_bl_l.wav","bear/2/grenade/bear2_grenade6_l.wav","bear/2/grenade/bear2_grenade5_l.wav","bear/2/grenade/bear2_grenade4_l.wav","bear/2/grenade/bear2_grenade3_l.wav","bear/2/grenade/bear2_grenade2_l.wav","bear/2/grenade/bear2_grenade1_l.wav"}
ENT.SoundTbl_Death = {"bear/2/death/bear2_death8.wav","bear/2/death/bear2_death7.wav","bear/2/death/bear2_death6.wav","bear/2/death/bear2_death5.wav","bear/2/death/bear2_death4.wav","bear/2/death/bear2_death3.wav","bear/2/death/bear2_death2.wav","bear/2/death/bear2_death1.wav","bear/2/death/bear2_agony4.wav","bear/2/death/bear2_agony3.wav","bear/2/death/bear2_agony2.wav","bear/2/death/bear2_agony1.wav"}
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