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
ENT.GrenadeAttackEntity = "obj_vj_he_chattabka"
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
ENT.SoundTbl_Alert = {"bear/3/alert/bear3_enemy_usec6_bl.wav","bear/3/alert/bear3_enemy_usec5_bl.wav","bear/3/alert/bear3_enemy_usec4.wav","bear/3/alert/bear3_enemy_usec2.wav","bear/3/alert/bear3_enemy_usec1.wav","bear/3/alert/bear3_enemy_contact7_l.wav","bear/3/alert/bear3_enemy_contact6_l.wav","bear/3/alert/bear3_enemy_contact5_l.wav","bear/3/alert/bear3_enemy_contact4_l.wav","bear/3/alert/bear3_enemy_contact3_l.wav","bear/3/alert/bear3_enemy_contact2_l.wav","bear/3/alert/bear3_enemy_contact1_l.wav","bear/3/alert/bear3_enemy_contact16_bl.wav","bear/3/alert/bear3_enemy_contact15_bl.wav","bear/3/alert/bear3_enemy_contact14_bl.wav"}
ENT.SoundTbl_Suppressing = {"bear/3/supressing/bear3_supressingfire_06_bl.wav","bear/3/supressing/bear3_supressingfire_05_bl.wav","bear/3/supressing/bear3_supressingfire_04.wav","bear/3/supressing/bear3_supressingfire_03.wav","bear/3/supressing/bear3_supressingfire_02.wav","bear/3/supressing/bear3_supressingfire_01.wav"}
ENT.SoundTbl_LostEnemy = {"bear/3/lostvisual/bear3_lostvisual_12_bl.wav","bear/3/lostvisual/bear3_lostvisual_11_bl.wav","bear/3/lostvisual/bear3_lostvisual_10_bl.wav","bear/3/lostvisual/bear3_lostvisual_09_bl.wav","bear/3/lostvisual/bear3_lostvisual_08_l.wav","bear/3/lostvisual/bear3_lostvisual_07_l.wav","bear/3/lostvisual/bear3_lostvisual_06_l.wav","bear/3/lostvisual/bear3_lostvisual_05_l.wav","bear/3/lostvisual/bear3_lostvisual_04_l.wav","bear/3/lostvisual/bear3_lostvisual_03_l.wav","bear/3/lostvisual/bear3_lostvisual_02_l.wav","bear/3/lostvisual/bear3_lostvisual_01_l.wav"}
ENT.SoundTbl_CombatIdle = {"bear/3/combatidle/bear3_fight9.wav","bear/3/combatidle/bear3_fight8.wav","bear/3/combatidle/bear3_fight7.wav","bear/3/combatidle/bear3_fight6.wav","bear/3/combatidle/bear3_fight5.wav","bear/3/combatidle/bear3_fight49_bl.wav","bear/3/combatidle/bear3_fight48_bl.wav","bear/3/combatidle/bear3_fight47_bl.wav","bear/3/combatidle/bear3_fight46_bl.wav","bear/3/combatidle/bear3_fight45_bl.wav","bear/3/combatidle/bear3_fight44_bl.wav","bear/3/combatidle/bear3_fight43_bl.wav","bear/3/combatidle/bear3_fight42_bl.wav","bear/3/combatidle/bear3_fight41_bl.wav","bear/3/combatidle/bear3_fight40_bl.wav","bear/3/combatidle/bear3_fight4.wav","bear/3/combatidle/bear3_fight39_bl.wav","bear/3/combatidle/bear3_fight38_bl.wav","bear/3/combatidle/bear3_fight37_bl.wav","bear/3/combatidle/bear3_fight36_bl.wav","bear/3/combatidle/bear3_fight35_bl.wav","bear/3/combatidle/bear3_fight34_bl.wav","bear/3/combatidle/bear3_fight33_bl.wav","bear/3/combatidle/bear3_fight3.wav","bear/3/combatidle/bear3_fight29_l.wav","bear/3/combatidle/bear3_fight28_l.wav","bear/3/combatidle/bear3_fight27_l.wav","bear/3/combatidle/bear3_fight26_l.wav","bear/3/combatidle/bear3_fight25.wav","bear/3/combatidle/bear3_fight24.wav","bear/3/combatidle/bear3_fight23.wav","bear/3/combatidle/bear3_fight22.wav","bear/3/combatidle/bear3_fight21.wav","bear/3/combatidle/bear3_fight20.wav","bear/3/combatidle/bear3_fight2.wav","bear/3/combatidle/bear3_fight19.wav","bear/3/combatidle/bear3_fight18.wav","bear/3/combatidle/bear3_fight17.wav","bear/3/combatidle/bear3_fight16.wav","bear/3/combatidle/bear3_fight15.wav","bear/3/combatidle/bear3_fight14.wav","bear/3/combatidle/bear3_fight13.wav","bear/3/combatidle/bear3_fight12.wav","bear/3/combatidle/bear3_fight11.wav","bear/3/combatidle/bear3_fight10.wav","bear/3/combatidle/bear3_fight1.wav"}
ENT.SoundTbl_WeaponReload = {"bear/3/reload/bear3_weap_reload8_bl.wav","bear/3/reload/bear3_weap_reload6_bl.wav","bear/3/reload/bear3_weap_reload5_l.wav","bear/3/reload/bear3_weap_reload4_l.wav","bear/3/reload/bear3_weap_reload3_l.wav","bear/3/reload/bear3_weap_reload2_l.wav","bear/3/reload/bear3_weap_reload1_l.wav"}
ENT.SoundTbl_OnGrenadeSight = {"bear/3/enemygrenade/bear3_enemy_grenade5_bl.wav","bear/3/enemygrenade/bear3_enemy_grenade4_bl.wav","bear/3/enemygrenade/bear3_enemy_grenade3.wav","bear/3/enemygrenade/bear3_enemy_grenade2.wav","bear/3/enemygrenade/bear3_enemy_grenade1.wav"}
ENT.SoundTbl_OnKilledEnemy = {"bear/3/enemydown/bear3_enemy_down_usec2_l.wav","bear/3/enemydown/bear3_enemy_down_usec1_l.wav","bear/3/enemydown/bear3_enemy_down9_bl.wav","bear/3/enemydown/bear3_enemy_down8_bl.wav","bear/3/enemydown/bear3_enemy_down7_l.wav","bear/3/enemydown/bear3_enemy_down6_l.wav","bear/3/enemydown/bear3_enemy_down5_l.wav","bear/3/enemydown/bear3_enemy_down4_l.wav","bear/3/enemydown/bear3_enemy_down3_l.wav","bear/3/enemydown/bear3_enemy_down2_l.wav","bear/3/enemydown/bear3_enemy_down1_l.wav","bear/3/enemydown/bear3_enemy_down10_bl.wav"}
ENT.SoundTbl_Pain = {"bear/3/pain/bear3_hit9.wav","bear/3/pain/bear3_hit8.wav","bear/3/pain/bear3_hit7.wav","bear/3/pain/bear3_hit6.wav","bear/3/pain/bear3_hit5.wav","bear/3/pain/bear3_hit4.wav","bear/3/pain/bear3_hit3.wav","bear/3/pain/bear3_hit2.wav","bear/3/pain/bear3_hit13.wav","bear/3/pain/bear3_hit12.wav","bear/3/pain/bear3_hit11.wav","bear/3/pain/bear3_hit10.wav","bear/3/pain/bear3_hit1.wav"}
ENT.SoundTbl_AllyDeath = {"bear/3/friendlydeath/bear3_friendly_hit2.wav","bear/3/friendlydeath/bear3_friendly_hit1.wav","bear/3/friendlydeath/bear3_friendly_down3_bl.wav","bear/3/friendlydeath/bear3_friendly_down2.wav","bear/3/friendlydeath/bear3_friendly_down1.wav"}
ENT.SoundTbl_CallForHelp = {"bear/3/coverme/bear3_needhelp_06_bl.wav","bear/3/coverme/bear3_needhelp_05_bl.wav","bear/3/coverme/bear3_needhelp_04.wav","bear/3/coverme/bear3_needhelp_03.wav","bear/3/coverme/bear3_needhelp_02.wav","bear/3/coverme/bear3_needhelp_01.wav","bear/3/coverme/bear3_coverme_07_bl.wav","bear/3/coverme/bear3_coverme_06_bl.wav","bear/3/coverme/bear3_coverme_05_bl.wav","bear/3/coverme/bear3_coverme_04.wav","bear/3/coverme/bear3_coverme_03.wav","bear/3/coverme/bear3_coverme_02.wav","bear/3/coverme/bear3_coverme_01.wav"}
ENT.SoundTbl_GrenadeAttack = {"bear/3/grenade/bear3_grenade9_bl.wav","bear/3/grenade/bear3_grenade8_bl.wav","bear/3/grenade/bear3_grenade7_bl.wav","bear/3/grenade/bear3_grenade6.wav","bear/3/grenade/bear3_grenade5.wav","bear/3/grenade/bear3_grenade4.wav","bear/3/grenade/bear3_grenade3.wav","bear/3/grenade/bear3_grenade2.wav","bear/3/grenade/bear3_grenade1.wav"}
ENT.SoundTbl_Death = {"bear/3/death/bear3_death7.wav","bear/3/death/bear3_death6.wav","bear/3/death/bear3_death5.wav","bear/3/death/bear3_death4.wav","bear/3/death/bear3_death3.wav","bear/3/death/bear3_death2.wav","bear/3/death/bear3_death1.wav","bear/3/death/bear3_agony4.wav","bear/3/death/bear3_agony3.wav","bear/3/death/bear3_agony2.wav","bear/3/death/bear3_agony1.wav"}
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