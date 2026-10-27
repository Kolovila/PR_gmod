/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Sentry's Terrorist SNPCs"
local AddonName = "Sentry Terrorists"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_sentryterror_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCCat = "Sentry's Criminals" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vTCat = "Sentry's Terrorist" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vRCat = "Sentry's Rebel" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vACat = "Sentry's Mafia (Asian)" -- Category, you can also set a category individually by replacing the vCat with a string value
	VJ.AddCategoryInfo(vCCat,{Icon = "vj_icons/sencrim.png"})
	VJ.AddCategoryInfo(vRCat,{Icon = "vj_icons/senreb.png"})
	VJ.AddCategoryInfo(vTCat,{Icon = "vj_icons/senter.png"})
	VJ.AddCategoryInfo(vACat,{Icon = "vj_icons/senmafia.png"})
	list.Set( "ContentCategoryIcons", vCCat, "vj_icons/sencrim.png" )
	list.Set( "ContentCategoryIcons", vRCat, "vj_icons/senreb.png" )
	list.Set( "ContentCategoryIcons", vTCat, "vj_icons/senter.png" )
	list.Set( "ContentCategoryIcons", vACat, "vj_icons/senmafia.png" )

	local vLWeapons = {"weapon_vj_senterassault","weapon_vj_sentermg"}
	local vMGWeapons = {"weapon_vj_sentermg"}
	local vRWeapons = {"weapon_vj_senterpistol","weapon_vj_senterpistol","weapon_vj_senterpumpshot"}
	local vMWeapons = {"weapon_vj_sentercarbine","weapon_vj_sentercarbine","weapon_vj_senterrifle","weapon_vj_senterassault"}
	local vSWeapons = {"weapon_vj_sentermilrifle","weapon_vj_sentermilrifle","weapon_vj_senterrifle"}
	local vTWeapons = {"weapon_vj_sentersmg","weapon_vj_senterassault","weapon_vj_senterassault"}
	local vRPWeapons = {"weapon_vj_rpg"}
	local vSNWeapons = {"weapon_vj_sentersniper"}
	local vCMWeapons = {"weapon_vj_sentercarbine","weapon_vj_senterpistol","weapon_vj_senterassault","weapon_vj_senterassault"}
	local vWEWeapons = {"weapon_vj_sentercarbine","weapon_vj_sentersmg"}


    VJ.AddNPC_HUMAN("Northern Killer (Member)","npc_vj_snkmobhench",vCMWeapons,vACat)
    VJ.AddNPC_HUMAN("Northern Killer (Leader)","npc_vj_snkmobboss",vLWeapons,vACat)
    VJ.AddNPC_HUMAN("Northern Killer (Goon)","npc_vj_snkmobgang",vCMWeapons,vACat)
    VJ.AddNPC_HUMAN("Northern Killer (Female)","npc_vj_snkmobgangwo",vRWeapons,vACat)
    VJ.AddNPC_HUMAN("Rogue Patrol Guard","npc_vj_senrogueguardle",vMWeapons,vCCat)
    VJ.AddNPC_HUMAN("Rogue Patrol Guard(Elite)","npc_vj_senrogueguardspe",vSWeapons,vCCat)
    VJ.AddNPC_HUMAN("Rogue Guard","npc_vj_senrogueguard",vCMWeapons,vCCat)
    VJ.AddNPC_HUMAN("Rogue Police Officer","npc_vj_srogcop",vSWeapons,vCCat)
    VJ.AddNPC_HUMAN("Rogue Police Officer(MG)","npc_vj_srogcopsu",vMGWeapons,vCCat)
    VJ.AddNPC_HUMAN("Smuggler","npc_vj_sensmuggler",vMWeapons,vCCat)
    VJ.AddNPC_HUMAN("Smuggler(Leader)","npc_vj_sensmugglerle",vLWeapons,vCCat)
    VJ.AddNPC_HUMAN("Smuggler(Female)","npc_vj_sensmugglerwo",vRWeapons,vCCat)
    VJ.AddNPC_HUMAN("Pirate","npc_vj_ssenpirate",vTWeapons,vCCat)
    VJ.AddNPC_HUMAN("Pirate (Leader)","npc_vj_ssenpiratele",vLWeapons,vCCat)
    VJ.AddNPC_HUMAN("Pirate (Scout)","npc_vj_ssenpiratesc",vRWeapons,vCCat)
    VJ.AddNPC_HUMAN("Drug Cartel","npc_vj_sdrucartel",vMWeapons,vCCat)
    VJ.AddNPC_HUMAN("Drug Cartel (MG)","npc_vj_sdrucartelmg",vMGWeapons,vCCat)
    VJ.AddNPC_HUMAN("Drug Cartel (Leader)","npc_vj_sdrucartelle",vWEWeapons,vCCat)
    VJ.AddNPC_HUMAN("European Terrorist","npc_vj_seuroterror",vMWeapons,vTCat)
    VJ.AddNPC_HUMAN("European Terrorist (MG)","npc_vj_seuroterrormg",vMGWeapons,vTCat)
    VJ.AddNPC_HUMAN("European Terrorist (Leader)","npc_vj_seuroterrorle",vWEWeapons,vTCat)
    VJ.AddNPC_HUMAN("Survivalist","npc_vj_snorthterror",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Survivalist(Senior)","npc_vj_snorthterrorle",vLWeapons,vTCat)
    VJ.AddNPC_HUMAN("Survivalist(Scout)","npc_vj_snorthterrorsc",vRWeapons,vTCat)
    VJ.AddNPC_HUMAN("Survivalist(Female Senior)","npc_vj_snorthterrorwole",vLWeapons,vTCat)
    VJ.AddNPC_HUMAN("Survivalist(Female)","npc_vj_snorthterrorwo",vRWeapons,vTCat)
    VJ.AddNPC_HUMAN("Oriental Revolutionist","npc_vj_ssencomunraf",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Russian Revolutionist","npc_vj_ssencomunrus",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Russian Revolutionist(Supervisor)","npc_vj_ssencomunrusle",vLWeapons,vTCat)
    VJ.AddNPC_HUMAN("Revolutionist","npc_vj_ssencomun",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Revolutionist(Supervisor)","npc_vj_ssencomunle",vLWeapons,vTCat)
--    VJ.AddNPC_HUMAN("Revolutionist(Medic)","npc_vj_ssencomunme",vRWeapons,vTCat)
    VJ.AddNPC_HUMAN("Revolutionist(Female)","npc_vj_ssencomunwo",vRWeapons,vTCat)
    VJ.AddNPC_HUMAN("Revolutionist(Female Supervisor)","npc_vj_ssencomunwole",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Arsonist","npc_vj_sarsonist",vRWeapons,vTCat)
    VJ.AddNPC_HUMAN("Anarchist","npc_vj_sterrornarchi",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Ultranationalist","npc_vj_sultranat",vMWeapons,vTCat)
    VJ.AddNPC_HUMAN("Ultranationalist (Leader)","npc_vj_sultranatle",vMGWeapons,vTCat)
    VJ.AddNPC_HUMAN("Russian Ultranationalist","npc_vj_srusultranat",vWEWeapons,vTCat)
    VJ.AddNPC_HUMAN("Western Terrorist","npc_vj_swestterror",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Western Terrorist (Leader)","npc_vj_swestterrorle",vLWeapons,vTCat)
    VJ.AddNPC_HUMAN("Regional Separatist","npc_vj_sseparatist",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Soldier","npc_vj_sparamili",vSWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Soldier (Officer)","npc_vj_sparamilile",vSWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Soldier (Support)","npc_vj_sparamilimg",vLWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Soldier (Sniper)","npc_vj_sparamilisn",vSNWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Militia","npc_vj_srogmilitia",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Militia (Leader)","npc_vj_srogmilitiale",vSWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Militia (Sniper)","npc_vj_srogmilitiasn",vSNWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Militia (MG)","npc_vj_srogmilitiamg",vMGWeapons,vRCat)
    VJ.AddNPC_HUMAN("Freedom Fighter","npc_vj_ssenira",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Freedom Fighter (Leader)","npc_vj_ssenirale",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Freedom Fighter (Support)","npc_vj_sseniramg",vLWeapons,vRCat)
    VJ.AddNPC_HUMAN("Arctic Terrorist","npc_vj_ssenarc",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Arctic Terrorist (Leader)","npc_vj_ssenarcle",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Arctic Terrorist (Support)","npc_vj_ssenarcmg",vLWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Militia","npc_vj_siraqiins",vTWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Rioter","npc_vj_srioter",vRWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Rioter (MG)","npc_vj_sriotermg",vLWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Terrorist","npc_vj_sterror",vTWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Terrorist (Leader)","npc_vj_sterrorle",vLWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Terrorist (RPG)","npc_vj_sterrorrpg",vRPWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Terrorist (Sniper)","npc_vj_sterrorsni",vSNWeapons,vRCat)
    VJ.AddNPC("Mideast Terrorist (Suicider)","npc_vj_sterrorsui",vRCat)


    VJ.AddNPC_HUMAN("Northern Killer (Member) (Hostile)","npc_vj_snkmobhenchh",vCMWeapons,vACat)
    VJ.AddNPC_HUMAN("Northern Killer (Leader) (Hostile)","npc_vj_snkmobbossh",vLWeapons,vACat)
    VJ.AddNPC_HUMAN("Northern Killer (Goon) (Hostile)","npc_vj_snkmobgangh",vCMWeapons,vACat)
    VJ.AddNPC_HUMAN("Northern Killer (Female) (Hostile)","npc_vj_snkmobgangwoh",vRWeapons,vACat)
    VJ.AddNPC_HUMAN("Rogue Patrol Guard (Hostile)","npc_vj_senrogueguardleh",vMWeapons,vCCat)
    VJ.AddNPC_HUMAN("Rogue Patrol Guard(Elite) (Hostile)","npc_vj_senrogueguardspeh",vSWeapons,vCCat)
    VJ.AddNPC_HUMAN("Rogue Guard (Hostile)","npc_vj_senrogueguardh",vCMWeapons,vCCat)
    VJ.AddNPC_HUMAN("Rogue Police Officer (Hostile)","npc_vj_srogcoph",vSWeapons,vCCat)
    VJ.AddNPC_HUMAN("Rogue Police Officer(MG) (Hostile)","npc_vj_srogcopsuh",vMGWeapons,vCCat)
    VJ.AddNPC_HUMAN("Smuggler (Hostile)","npc_vj_sensmugglerh",vMWeapons,vCCat)
    VJ.AddNPC_HUMAN("Smuggler(Leader) (Hostile)","npc_vj_sensmugglerleh",vLWeapons,vCCat)
    VJ.AddNPC_HUMAN("Smuggler(Female) (Hostile)","npc_vj_sensmugglerwoh",vRWeapons,vCCat)
    VJ.AddNPC_HUMAN("Pirate (Hostile)","npc_vj_ssenpirateh",vTWeapons,vCCat)
    VJ.AddNPC_HUMAN("Pirate (Leader) (Hostile)","npc_vj_ssenpirateleh",vLWeapons,vCCat)
    VJ.AddNPC_HUMAN("Pirate (Scout) (Hostile)","npc_vj_ssenpiratesch",vRWeapons,vCCat)
    VJ.AddNPC_HUMAN("Drug Cartel (Hostile)","npc_vj_sdrucartelh",vMWeapons,vCCat)
    VJ.AddNPC_HUMAN("Drug Cartel (MG) (Hostile)","npc_vj_sdrucartelmgh",vMGWeapons,vCCat)
    VJ.AddNPC_HUMAN("Drug Cartel (Leader) (Hostile)","npc_vj_sdrucartelleh",vWEWeapons,vCCat)
    VJ.AddNPC_HUMAN("European Terrorist (Hostile)","npc_vj_seuroterrorh",vMWeapons,vTCat)
    VJ.AddNPC_HUMAN("European Terrorist (MG) (Hostile)","npc_vj_seuroterrormgh",vMGWeapons,vTCat)
    VJ.AddNPC_HUMAN("European Terrorist (Leader) (Hostile)","npc_vj_seuroterrorleh",vWEWeapons,vTCat)
    VJ.AddNPC_HUMAN("Survivalist (Hostile)","npc_vj_snorthterrorh",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Survivalist(Senior) (Hostile)","npc_vj_snorthterrorleh",vLWeapons,vTCat)
    VJ.AddNPC_HUMAN("Survivalist(Scout) (Hostile)","npc_vj_snorthterrorsch",vRWeapons,vTCat)
    VJ.AddNPC_HUMAN("Survivalist(Female Senior) (Hostile)","npc_vj_snorthterrorwoleh",vLWeapons,vTCat)
    VJ.AddNPC_HUMAN("Survivalist(Female) (Hostile)","npc_vj_snorthterrorwoh",vRWeapons,vTCat)
    VJ.AddNPC_HUMAN("Oriental Revolutionist (Hostile)","npc_vj_ssencomunrafh",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Russian Revolutionist (Hostile)","npc_vj_ssencomunrush",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Russian Revolutionist(Supervisor) (Hostile)","npc_vj_ssencomunrusleh",vLWeapons,vTCat)
    VJ.AddNPC_HUMAN("Revolutionist (Hostile)","npc_vj_ssencomunh",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Revolutionist(Supervisor) (Hostile)","npc_vj_ssencomunleh",vLWeapons,vTCat)
--    VJ.AddNPC_HUMAN("Revolutionist(Medic) (Hostile)","npc_vj_ssencomunmeh",vRWeapons,vTCat)
    VJ.AddNPC_HUMAN("Revolutionist(Female) (Hostile)","npc_vj_ssencomunwoh",vRWeapons,vTCat)
    VJ.AddNPC_HUMAN("Revolutionist(Female Supervisor) (Hostile)","npc_vj_ssencomunwoleh",vLWeapons,vTCat)
    VJ.AddNPC_HUMAN("Arsonist (Hostile)","npc_vj_sarsonisth",vRWeapons,vTCat)
    VJ.AddNPC_HUMAN("Anarchist (Hostile)","npc_vj_sterrornarchih",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Ultranationalist (Hostile)","npc_vj_sultranath",vMWeapons,vTCat)
    VJ.AddNPC_HUMAN("Ultranationalist (Leader) (Hostile)","npc_vj_sultranatleh",vMGWeapons,vTCat)
    VJ.AddNPC_HUMAN("Russian Ultranationalist (Hostile)","npc_vj_srusultranath",vWEWeapons,vTCat)
    VJ.AddNPC_HUMAN("Western Terrorist (Hostile)","npc_vj_swestterrorh",vTWeapons,vTCat)
    VJ.AddNPC_HUMAN("Western Terrorist (Leader) (Hostile)","npc_vj_swestterrorleh",vLWeapons,vTCat)
    VJ.AddNPC_HUMAN("Regional Separatist (Hostile)","npc_vj_sseparatisth",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Soldier (Hostile)","npc_vj_sparamilih",vSWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Soldier (Officer) (Hostile)","npc_vj_sparamilileh",vSWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Soldier (Support) (Hostile)","npc_vj_sparamilimgh",vLWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Soldier (Sniper) (Hostile)","npc_vj_sparamilisnh",vSNWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Militia (Hostile)","npc_vj_srogmilitiah",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Militia (Leader) (Hostile)","npc_vj_srogmilitialeh",vSWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Militia (Sniper) (Hostile)","npc_vj_srogmilitiasnh",vSNWeapons,vRCat)
    VJ.AddNPC_HUMAN("Rogue Militia (MG) (Hostile)","npc_vj_srogmilitiamgh",vMGWeapons,vRCat)
    VJ.AddNPC_HUMAN("Freedom Fighter (Hostile)","npc_vj_ssenirah",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Freedom Fighter (Leader) (Hostile)","npc_vj_sseniraleh",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Freedom Fighter (Support) (Hostile)","npc_vj_sseniramgh",vLWeapons,vRCat)
    VJ.AddNPC_HUMAN("Arctic Terrorist (Hostile)","npc_vj_ssenarch",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Arctic Terrorist (Leader) (Hostile)","npc_vj_ssenarcleh",vMWeapons,vRCat)
    VJ.AddNPC_HUMAN("Arctic Terrorist (Support) (Hostile)","npc_vj_ssenarcmgh",vLWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Militia (Hostile)","npc_vj_siraqiinsh",vTWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Rioter (Hostile)","npc_vj_srioterh",vRWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Rioter (MG) (Hostile)","npc_vj_sriotermgh",vLWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Terrorist (Hostile)","npc_vj_sterrorh",vTWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Terrorist (Leader) (Hostile)","npc_vj_sterrorleh",vLWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Terrorist (RPG) (Hostile)","npc_vj_sterrorrpgh",vRPWeapons,vRCat)
    VJ.AddNPC_HUMAN("Mideast Terrorist (Sniper) (Hostile)","npc_vj_sterrorsnih",vSNWeapons,vRCat)
    VJ.AddNPC("Mideast Terrorist (Suicider) (Hostile)","npc_vj_sterrorsuih",vRCat)
	

	VJ.AddNPC("Northern Killers","sent_vj_snkmobgang",vACat)
	VJ.AddNPC("Northern Killers Hitmen","sent_vj_snkmobgangkill",vACat)
	VJ.AddNPC("Rogue Patrol Guards","sent_vj_senrogueguards",vCCat)
	VJ.AddNPC("Rogue Guards","sent_vj_senroguesecguards",vCCat)
	VJ.AddNPC("Rogue Police Officers","sent_vj_srogcops",vCCat)
	VJ.AddNPC("Smugglers","sent_vj_sensmugglers",vCCat)
	VJ.AddNPC("Pirates","sent_vj_ssenpirate",vCCat)
	VJ.AddNPC("Drug Cartel Squad","sent_vj_sdrucartel",vCCat)
	VJ.AddNPC("European Terrorists","sent_vj_seuroterror",vTCat)
	VJ.AddNPC("Survivalists","sent_vj_snorthterrors",vTCat)
	VJ.AddNPC("Oriental Revolutionists","sent_vj_ssencomunraf",vTCat)
	VJ.AddNPC("Russian Revolutionists","sent_vj_ssencomunrus",vTCat)
	VJ.AddNPC("Revolutionists","sent_vj_ssencomun",vTCat)
	VJ.AddNPC("Arsonists","sent_vj_sarsonists",vTCat)
	VJ.AddNPC("Anarchists","sent_vj_sterroranar",vTCat)
	VJ.AddNPC("Ultranationalists","sent_vj_sultranat",vTCat)
	VJ.AddNPC("Russian Ultranationalists","sent_vj_srusultranat",vTCat)
	VJ.AddNPC("Western Terrorists","sent_vj_swestterror",vTCat)
	VJ.AddNPC("Regional Separatists","sent_vj_sseparatists",vRCat)
	VJ.AddNPC("Rogue Soldiers","sent_vj_sparamilis",vRCat)
	VJ.AddNPC("Rogue Militia Squad","sent_vj_srogmilitias",vRCat)
	VJ.AddNPC("Freedom Fighter Squad","sent_vj_ssenira",vRCat)
	VJ.AddNPC("Arctic Terrorists","sent_vj_ssenarc",vRCat)
	VJ.AddNPC("Mideast Militia Squad","sent_vj_siraqiins",vRCat)
	VJ.AddNPC("Mideast Rioters","sent_vj_srioters",vRCat)
	VJ.AddNPC("Mideast Terrorists","sent_vj_sterrors",vRCat)
	VJ.AddNPC("Mideast Terrorists (Suiciders)","sent_vj_sterrorsui",vRCat)


	VJ.AddNPC("Northern Killers (Hostile)","sent_vj_snkmobgangh",vACat)
	VJ.AddNPC("Northern Killers Hitmen (Hostile)","sent_vj_snkmobgangkillh",vACat)
	VJ.AddNPC("Rogue Patrol Guards (Hostile)","sent_vj_senrogueguardsh",vCCat)
	VJ.AddNPC("Rogue Guards (Hostile)","sent_vj_senroguesecguardsh",vCCat)
	VJ.AddNPC("Rogue Police Officers (Hostile)","sent_vj_srogcopsh",vCCat)
	VJ.AddNPC("Smugglers (Hostile)","sent_vj_sensmugglersh",vCCat)
	VJ.AddNPC("Pirates (Hostile)","sent_vj_ssenpirateh",vCCat)
	VJ.AddNPC("Drug Cartel Squad (Hostile)","sent_vj_sdrucartelh",vCCat)
	VJ.AddNPC("European Terrorists (Hostile)","sent_vj_seuroterrorh",vTCat)
	VJ.AddNPC("Survivalists (Hostile)","sent_vj_snorthterrorsh",vTCat)
	VJ.AddNPC("Oriental Revolutionists (Hostile)","sent_vj_ssencomunrafh",vTCat)
	VJ.AddNPC("Russian Revolutionists (Hostile)","sent_vj_ssencomunrush",vTCat)
	VJ.AddNPC("Revolutionists (Hostile)","sent_vj_ssencomunh",vTCat)
	VJ.AddNPC("Arsonists (Hostile)","sent_vj_sarsonistsh",vTCat)
	VJ.AddNPC("Anarchists (Hostile)","sent_vj_sterroranarh",vTCat)
	VJ.AddNPC("Ultranationalists (Hostile)","sent_vj_sultranath",vTCat)
	VJ.AddNPC("Russian Ultranationalists (Hostile)","sent_vj_srusultranath",vTCat)
	VJ.AddNPC("Western Terrorists (Hostile)","sent_vj_swestterrorh",vTCat)
	VJ.AddNPC("Regional Separatists (Hostile)","sent_vj_sseparatistsh",vRCat)
	VJ.AddNPC("Rogue Soldiers (Hostile)","sent_vj_sparamilish",vRCat)
	VJ.AddNPC("Rogue Militia Squad (Hostile)","sent_vj_srogmilitiash",vRCat)
	VJ.AddNPC("Freedom Fighter Squad (Hostile)","sent_vj_ssenirah",vRCat)
	VJ.AddNPC("Arctic Terrorists (Hostile)","sent_vj_ssenarch",vRCat)
	VJ.AddNPC("Mideast Militia Squad (Hostile)","sent_vj_siraqiinsh",vRCat)
	VJ.AddNPC("Mideast Rioters (Hostile)","sent_vj_sriotersh",vRCat)
	VJ.AddNPC("Mideast Terrorists (Hostile)","sent_vj_sterrorsh",vRCat)
	VJ.AddNPC("Mideast Terrorists (Suiciders) (Hostile)","sent_vj_sterrorsuih",vRCat)


    VJ.AddNPCWeapon("VJ_CAG TerrorPistol","weapon_vj_senterpistol")
	VJ.AddNPCWeapon("VJ_CAG TerrorSMG","weapon_vj_sentersmg")
	VJ.AddNPCWeapon("VJ_CAG TerrorMG","weapon_vj_sentermg")
    VJ.AddNPCWeapon("VJ_CAG TerrorAssault Rifle","weapon_vj_senterassault")
    VJ.AddNPCWeapon("VJ_CAG TerrorCarbine Rifle","weapon_vj_sentercarbine")
    VJ.AddNPCWeapon("VJ_CAG TerrorMili Rifle","weapon_vj_senterrifle")
    VJ.AddNPCWeapon("VJ_CAG TerrorMili Carbine Rifle","weapon_vj_sentermilrifle")
	VJ.AddNPCWeapon("VJ_CAG TerrorShotgun","weapon_vj_senterpumpshot")
	VJ.AddNPCWeapon("VJ_CAG TerrorSniper Rifle","weapon_vj_sentersniper")

	-- ConVars --
	VJ.AddConVar("vj_dum_dummy_h",100) -- Example 1
	VJ.AddConVar("vj_dum_dummy_d",20) -- Example 2
	
			local AddConvars = {}
	AddConvars["vj_senwepaccuracy_custom"] = 0
	for k, v in pairs(AddConvars) do
		if !ConVarExists( k ) then CreateConVar( k, v, {FCVAR_ARCHIVE} ) end
	end
	
	if CLIENT then
	local function VJ_SENWEPACCURACY_MAIN(Panel)
		if !game.SinglePlayer() then
		if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
			Panel:AddControl( "Label", {Text = "You are not an admin!"})
			Panel:ControlHelp("Notice: Only admins can change this settings")
			return
			end
		end
		Panel:AddControl( "Label", {Text = "Notice: Only admins can change this settings."})
		local vj_senwepreset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "1"}
		vj_senwepreset.Options["#vjbase.menugeneral.default"] = { 
		vj_senwepaccuracy_custom = "0",
		}
		Panel:AddControl("Button",{Text = "Reset Accuracy", Command = "vj_senwepaccuracy_custom 1"})
		Panel:AddControl("Slider", {Label = "Weapon accuracy",min = 0,max = 4,Command = "vj_senwepaccuracy_custom"})
		Panel:ControlHelp("0 = Super Soldier, 1 = Hard (VJ Base Standard), 2 = Normal(Sentry's SNPCs Standard), 3 = Easy, 4 = Spray n Pray")
				
	end
	function VJ_ADDTOMENU_SENWEPAC()
		spawnmenu.AddToolMenuOption( "DrVrej", "SNPC Configures", "Sentry's SNPCs", "Sentry's SNPCs", "", "", VJ_SENWEPACCURACY_MAIN, {} )
	end
		hook.Add( "PopulateToolMenu", "VJ_ADDTOMENU_SENWEPAC", VJ_ADDTOMENU_SENWEPAC )
	end	
	
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end