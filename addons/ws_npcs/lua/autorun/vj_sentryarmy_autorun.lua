/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Sentry's Army SNPCs"
local AddonName = "Sentry ARMY"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_sentryarmy_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "Sentry's Cop SNPCs" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vFCat = "Sentry's Federal Agents" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vCCat = "Sentry's 1990s Military" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vSCat = "Sentry's Military" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vUCat = "Sentry's Military (U.S)" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vPCat = "Sentry's Security" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vMCat = "Sentry's PMC" -- Category, you can also set a category individually by replacing the vCat with a string value
	VJ.AddCategoryInfo(vFCat,{Icon = "vj_icons/senfed.png"})
	VJ.AddCategoryInfo(vCCat,{Icon = "vj_icons/senus.png"})
	VJ.AddCategoryInfo(vSCat,{Icon = "vj_icons/senus.png"})
	VJ.AddCategoryInfo(vUCat,{Icon = "vj_icons/senus.png"})
	VJ.AddCategoryInfo(vPCat,{Icon = "vj_icons/sensec.png"})
	VJ.AddCategoryInfo(vMCat,{Icon = "vj_icons/senmerc.png"})
	list.Set( "ContentCategoryIcons", vFCat, "vj_icons/senfed.png" )
	list.Set( "ContentCategoryIcons", vCCat, "vj_icons/senus.png" )
	list.Set( "ContentCategoryIcons", vSCat, "vj_icons/senus.png" )
	list.Set( "ContentCategoryIcons", vUCat, "vj_icons/senus.png" )
	list.Set( "ContentCategoryIcons", vPCat, "vj_icons/sensec.png" )
	list.Set( "ContentCategoryIcons", vMCat, "vj_icons/senmerc.png" )

	local vSWeapons = {"weapon_vj_sensmgarmy","weapon_vj_sencarbinearmy","weapon_vj_senpumpshotarmy"}
	local vSPWeapons = {"weapon_vj_sensilensmgarmy","weapon_vj_sendescarbinearmy","weapon_vj_sensilensmgarmy","weapon_vj_sendescarbinearmy","weapon_vj_senpumpshotarmy"}
	local vBMWeapons = {"weapon_vj_sensilensmgarmy"}
	local vAWeapons = {"weapon_vj_sendescarbinearmy","weapon_vj_sendescarbinearmy","weapon_vj_sendescarbinearmy","weapon_vj_senpumpshotarmy"}
	local vBWeapons = {"weapon_vj_senriflearmy"}
	local vCWeapons = {"weapon_vj_senmgarmy"}
	local vDWeapons = {"weapon_vj_sencarbinearmy","weapon_vj_sencarbinearmy","weapon_vj_sencarbinearmy","weapon_vj_senpumpshotarmy"}
	local vRWeapons = {"weapon_vj_senpumpshotarmy"}
	local vSNWeapons = {"weapon_vj_sensniperarmy"}
	local vNGWeapons = {"weapon_vj_sensmgarmy","weapon_vj_sencarbinearmy","weapon_vj_senriflearmy","weapon_vj_senpumpshotarmy"}
	local vIWeapons = {"weapon_vj_sencarbinearmy","weapon_vj_sencarbinearmy","weapon_vj_senriflearmy"}
	local vBMSWeapons = {"weapon_vj_senbmssmgarmy","weapon_vj_senbmssmgarmy","weapon_vj_senbmspumpshotarmy"}
	local vODWeapons = {"weapon_vj_sencarbinearmy","weapon_vj_senretroriflearmy","weapon_vj_senpumpshotarmy"}
	local vOIWeapons = {"weapon_vj_sencarbinearmy","weapon_vj_senretroriflearmy","weapon_vj_senretroriflearmy"}
	local vONGWeapons = {"weapon_vj_sensmgarmy","weapon_vj_sencarbinearmy","weapon_vj_senretroriflearmy","weapon_vj_senpumpshotarmy"}


	VJ.AddNPC_HUMAN("Desert Spec Ops","npc_vj_cusdelta",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier","npc_vj_cussoldierg",vOIWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Support)","npc_vj_cussoldiergmg",vCWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Sergeant)","npc_vj_cussoldiergsarge",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Soldier","npc_vj_cussoldierwood",vOIWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Soldier(Support)","npc_vj_cussoldierwoodmg",vCWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Soldier(Sergeant)","npc_vj_cussoldierwoodsarge",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Airborne","npc_vj_cussoldierf",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Airborne (Sniper)","npc_vj_cussoldierfsni",vSNWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Airborne (Support)","npc_vj_cussoldierfmg",vCWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Airborne (Sergeant)","npc_vj_cussoldierfsarge",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Airborne (Recon)","npc_vj_cussoldierfrecon",vOIWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban Soldier","npc_vj_cussoldierar",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Sniper)","npc_vj_cussoldierarsni",vSNWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Support)","npc_vj_cussoldierarmg",vCWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Sergeant)","npc_vj_cussoldierarsarge",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Recon)","npc_vj_cussoldierarrecon",vOIWeapons,vCCat)
	VJ.AddNPC_HUMAN("U.S Marine","npc_vj_cusmarine",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("U.S Marine (Mask)","npc_vj_cusmarinegas",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("U.S Marine (Pointman)","npc_vj_cusmarinebreach",vBMSWeapons,vCCat)
	VJ.AddNPC_HUMAN("U.S Marine (Medic)","npc_vj_cusmarinemed",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("U.S Marine (Sergeant)","npc_vj_cusmarinecomm",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("HECU Trooper","npc_vj_cushecu",vBMSWeapons,vCCat)
	VJ.AddNPC_HUMAN("HECU Trooper(Medic)","npc_vj_cushecumed",vBMSWeapons,vCCat)
	VJ.AddNPC_HUMAN("HECU Trooper(Sergeant)","npc_vj_cushecusarge",vBMSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban PMC","npc_vj_cpmcur",vSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Urban PMC (Mask)","npc_vj_cpmcurmask",vSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Urban PMC (Riot)","npc_vj_cpmcurriot",vRWeapons,vMCat)
	VJ.AddNPC_HUMAN("Urban PMC (Recon)","npc_vj_cpmcurrecon",vSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Urban PMC (Officer)","npc_vj_cpmcurleader",vAWeapons,vMCat)
	VJ.AddNPC_HUMAN("Desert PMC","npc_vj_cpmcd",vAWeapons,vMCat)
	VJ.AddNPC_HUMAN("Desert PMC (Mask)","npc_vj_cpmcdmask",vAWeapons,vMCat)
	VJ.AddNPC_HUMAN("Desert PMC (Recon)","npc_vj_cpmcdrecon",vSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Desert PMC (Riot)","npc_vj_cpmcdriot",vRWeapons,vMCat)
	VJ.AddNPC_HUMAN("Desert PMC (Officer)","npc_vj_cpmcdleader",vAWeapons,vMCat)
	VJ.AddNPC_HUMAN("Forest PMC","npc_vj_cpmcg",vBMSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Forest PMC (Sniper)","npc_vj_cpmcgsni",vSNWeapons,vMCat)
	VJ.AddNPC_HUMAN("Forest PMC (Recon)","npc_vj_cpmcgrecon",vIWeapons,vMCat)
	VJ.AddNPC_HUMAN("Forest PMC (Riot)","npc_vj_cpmcgmg",vCWeapons,vMCat)
	VJ.AddNPC_HUMAN("Forest PMC (Officer)","npc_vj_cpmcgsarge",vBMSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Black Ops","npc_vj_cpmcbla",vBMWeapons,vMCat)
	VJ.AddNPC_HUMAN("Black Ops (Mask)","npc_vj_cpmcblamask",vBMWeapons,vMCat)
--	VJ.AddNPC_HUMAN("Black Ops (Recon)","npc_vj_cpmcblarecon",vBMWeapons,vMCat)
	VJ.AddNPC_HUMAN("Black Ops (Officer)","npc_vj_cpmcblaleader",vBMSWeapons,vMCat)
	VJ.AddNPC_HUMAN("US Coast Guard","npc_vj_csenuscg",vSWeapons,vSCat)
	VJ.AddNPC_HUMAN("US Military Police","npc_vj_cmilpolice",vSWeapons,vSCat)
	VJ.AddNPC_HUMAN("Urban Soldier","npc_vj_cussoldierur",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Sniper)","npc_vj_cussoldierursni",vSNWeapons,vSCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Support)","npc_vj_cussoldierurmg",vCWeapons,vSCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Sergeant)","npc_vj_cussoldierursarge",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Recon)","npc_vj_cussoldierurrecon",vIWeapons,vSCat)
	VJ.AddNPC_HUMAN("Arctic Soldier","npc_vj_mussoldierar",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Arctic Soldier(Support)","npc_vj_mussoldierarmg",vCWeapons,vSCat)
	VJ.AddNPC_HUMAN("Arctic Soldier(Sergeant)","npc_vj_mussoldierarsarge",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Arctic Soldier(Sniper)","npc_vj_mussoldierarsni",vSNWeapons,vSCat)
	VJ.AddNPC_HUMAN("Arctic Soldier(Recon)","npc_vj_mussoldierarrecon",vIWeapons,vSCat)
	VJ.AddNPC_HUMAN("Desert Soldier","npc_vj_cussoldierd",vAWeapons,vSCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Marksman)","npc_vj_cussoldierdsni",vBWeapons,vSCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Support)","npc_vj_cussoldierdmg",vCWeapons,vSCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Sergeant)","npc_vj_cussoldierdsarge",vAWeapons,vSCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Female)","npc_vj_cussoldierdwo",vAWeapons,vSCat)
	VJ.AddNPC_HUMAN("Modern Soldier","npc_vj_mussoldierm",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Modern Soldier(Sniper)","npc_vj_mussoldiermsni",vSNWeapons,vSCat)
	VJ.AddNPC_HUMAN("Modern Soldier(Support)","npc_vj_mussoldiermmg",vCWeapons,vSCat)
	VJ.AddNPC_HUMAN("Modern Soldier(Sergeant)","npc_vj_mussoldiermsarge",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Modern Soldier(Recon)","npc_vj_mussoldiermrecon",vAWeapons,vSCat)
	VJ.AddNPC_HUMAN("CIA Unit","npc_vj_cussoldiercia",vAWeapons,vFCat)
	VJ.AddNPC_HUMAN("CIA Unit(Sniper)","npc_vj_cussoldierciasni",vSNWeapons,vFCat)
	VJ.AddNPC_HUMAN("CIA Unit(Support)","npc_vj_cussoldierciamg",vCWeapons,vFCat)
	VJ.AddNPC_HUMAN("CIA Unit(Officer)","npc_vj_cussoldierciasarge",vBMSWeapons,vFCat)
	VJ.AddNPC_HUMAN("CIA Unit(Recon)","npc_vj_cussoldierciarecon",vSPWeapons,vFCat)
	VJ.AddNPC_HUMAN("U.S Airborne","npc_vj_musspec",vSPWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Airborne (Mask)","npc_vj_musspecmask",vSPWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Airborne (Riot)","npc_vj_musspecriot",vRWeapons,vUCat)
	VJ.AddNPC_HUMAN("Marine","npc_vj_musmarine",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("Marine (Mask)","npc_vj_musmarinemask",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("Marine (Recon)","npc_vj_musmarinerecon",vIWeapons,vUCat)
	VJ.AddNPC_HUMAN("Marine (Riot)","npc_vj_musmarineriot",vRWeapons,vUCat)
	VJ.AddNPC_HUMAN("Marine (Sergeant)","npc_vj_musmarineleader",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("Forest Marine","npc_vj_mussoldierf",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("Forest Marine(Sniper)","npc_vj_mussoldierfsni",vSNWeapons,vUCat)
	VJ.AddNPC_HUMAN("Forest Marine(Support)","npc_vj_mussoldierfmg",vCWeapons,vUCat)
	VJ.AddNPC_HUMAN("Forest Marine(Sergeant)","npc_vj_mussoldierfsarge",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("Forest Marine(Recon)","npc_vj_mussoldierfrecon",vIWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Soldier","npc_vj_naussoldier",vIWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Soldier(Medic)","npc_vj_naussoldiermedic",vSWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Soldier(Sniper)","npc_vj_naussoldiersni",vSNWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Soldier(Support)","npc_vj_naussoldiermg",vCWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Soldier(Sergeant)","npc_vj_naussoldiersarge",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Base Soldier","npc_vj_nabaseussoldier",vNGWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Base Soldier(Drill Instructor)","npc_vj_nabaseusdrillins",vNGWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Base Soldier(Recruit)","npc_vj_nabaseusrecruit",vSWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Marine Spec Ops","npc_vj_nausmarinespec",vSPWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Spec Ops","npc_vj_nausspec",vSPWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Spec Ops (Sniper)","npc_vj_nausspecsni",vSNWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Spec Ops (Sergeant)","npc_vj_nausspecsarge",vSPWeapons,vUCat)
	VJ.AddNPC_HUMAN("National Guard","npc_vj_cusrsrv",vONGWeapons,vPCat)
	VJ.AddNPC_HUMAN("National Guard(Sergeant)","npc_vj_cusrsrvsarge",vONGWeapons,vPCat)
	VJ.AddNPC_HUMAN("National Guard(Female)","npc_vj_cusrsrvwo",vONGWeapons,vPCat)
	VJ.AddNPC_HUMAN("Modern National Guard","npc_vj_musrsrv",vNGWeapons,vPCat)
	VJ.AddNPC_HUMAN("Modern National Guard(Sergeant)","npc_vj_musrsrvsarge",vNGWeapons,vPCat)
	VJ.AddNPC_HUMAN("Modern National Guard(Female)","npc_vj_musrsrvwo",vNGWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Peacekeeper","npc_vj_csenunsol",vONGWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Peacekeeper (Riot)","npc_vj_csenunsolriot",vCWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Peacekeeper (Officer)","npc_vj_csenunsolleader",vDWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Forest Peacekeeper","npc_vj_csenunsof",vONGWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Forest Peacekeeper (Riot)","npc_vj_csenunsofriot",vCWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Forest Peacekeeper (Officer)","npc_vj_csenunsofleader",vNGWeapons,vPCat)


	VJ.AddNPC_HUMAN("Desert Spec Ops (Hostile)","npc_vj_cusdeltah",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier (Hostile)","npc_vj_cussoldiergh",vOIWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Support) (Hostile)","npc_vj_cussoldiergmgh",vCWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Sergeant) (Hostile)","npc_vj_cussoldiergsargeh",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Soldier (Hostile)","npc_vj_cussoldierwoodh",vOIWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Soldier(Support) (Hostile)","npc_vj_cussoldierwoodmgh",vCWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Soldier(Sergeant) (Hostile)","npc_vj_cussoldierwoodsargeh",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Airborne (Hostile)","npc_vj_cussoldierfh",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Airborne (Sniper) (Hostile)","npc_vj_cussoldierfsnih",vSNWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Airborne (Support) (Hostile)","npc_vj_cussoldierfmgh",vCWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Airborne (Sergeant) (Hostile)","npc_vj_cussoldierfsargeh",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Forest Airborne (Recon) (Hostile)","npc_vj_cussoldierfreconh",vOIWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban Soldier (Hostile)","npc_vj_cussoldierarh",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Sniper) (Hostile)","npc_vj_cussoldierarsnih",vSNWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Support) (Hostile)","npc_vj_cussoldierarmgh",vCWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Sergeant) (Hostile)","npc_vj_cussoldierarsargeh",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Recon) (Hostile)","npc_vj_cussoldierarreconh",vOIWeapons,vCCat)
	VJ.AddNPC_HUMAN("U.S Marine (Hostile)","npc_vj_cusmarineh",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("U.S Marine (Mask) (Hostile)","npc_vj_cusmarinegash",vODWeapons,vCCat)
	VJ.AddNPC_HUMAN("U.S Marine (Pointman) (Hostile)","npc_vj_cusmarinebreachh",vBMSWeapons,vCCat)
	VJ.AddNPC_HUMAN("U.S Marine (Medic) (Hostile)","npc_vj_cusmarinemedh",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("U.S Marine (Sergeant) (Hostile)","npc_vj_cusmarinecommh",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("HECU Trooper (Hostile)","npc_vj_cushecuh",vBMSWeapons,vCCat)
	VJ.AddNPC_HUMAN("HECU Trooper(Medic) (Hostile)","npc_vj_cushecumedh",vBMSWeapons,vCCat)
	VJ.AddNPC_HUMAN("HECU Trooper(Sergeant) (Hostile)","npc_vj_cushecusargeh",vBMSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Urban PMC (Hostile)","npc_vj_cpmcurh",vSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Urban PMC (Mask) (Hostile)","npc_vj_cpmcurmaskh",vSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Urban PMC (Riot) (Hostile)","npc_vj_cpmcurrioth",vRWeapons,vMCat)
	VJ.AddNPC_HUMAN("Urban PMC (Recon) (Hostile)","npc_vj_cpmcurreconh",vSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Urban PMC (Officer) (Hostile)","npc_vj_cpmcurleaderh",vAWeapons,vMCat)
	VJ.AddNPC_HUMAN("Desert PMC (Hostile)","npc_vj_cpmcdh",vAWeapons,vMCat)
	VJ.AddNPC_HUMAN("Desert PMC (Mask) (Hostile)","npc_vj_cpmcdmaskh",vAWeapons,vMCat)
	VJ.AddNPC_HUMAN("Desert PMC (Recon) (Hostile)","npc_vj_cpmcdreconh",vSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Desert PMC (Riot) (Hostile)","npc_vj_cpmcdrioth",vRWeapons,vMCat)
	VJ.AddNPC_HUMAN("Desert PMC (Officer) (Hostile)","npc_vj_cpmcdleaderh",vAWeapons,vMCat)
	VJ.AddNPC_HUMAN("Forest PMC (Hostile)","npc_vj_cpmcgh",vBMSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Forest PMC (Sniper) (Hostile)","npc_vj_cpmcgsnih",vSNWeapons,vMCat)
	VJ.AddNPC_HUMAN("Forest PMC (Recon) (Hostile)","npc_vj_cpmcgreconh",vIWeapons,vMCat)
	VJ.AddNPC_HUMAN("Forest PMC (Riot) (Hostile)","npc_vj_cpmcgmgh",vCWeapons,vMCat)
	VJ.AddNPC_HUMAN("Forest PMC (Officer) (Hostile)","npc_vj_cpmcgsargeh",vBMSWeapons,vMCat)
	VJ.AddNPC_HUMAN("Black Ops (Hostile)","npc_vj_cpmcblah",vBMWeapons,vMCat)
	VJ.AddNPC_HUMAN("Black Ops (Mask) (Hostile)","npc_vj_cpmcblamaskh",vBMWeapons,vMCat)
--	VJ.AddNPC_HUMAN("Black Ops (Recon) (Hostile)","npc_vj_cpmcblareconh",vBMWeapons,vMCat)
	VJ.AddNPC_HUMAN("Black Ops (Officer) (Hostile)","npc_vj_cpmcblaleaderh",vBMSWeapons,vMCat)
	VJ.AddNPC_HUMAN("US Coast Guard (Hostile)","npc_vj_csenuscgh",vSWeapons,vSCat)
	VJ.AddNPC_HUMAN("US Military Police (Hostile)","npc_vj_cmilpoliceh",vSWeapons,vSCat)
	VJ.AddNPC_HUMAN("Urban Soldier (Hostile)","npc_vj_cussoldierurh",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Sniper) (Hostile)","npc_vj_cussoldierursnih",vSNWeapons,vSCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Support) (Hostile)","npc_vj_cussoldierurmgh",vCWeapons,vSCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Sergeant) (Hostile)","npc_vj_cussoldierursargeh",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Urban Soldier(Recon) (Hostile)","npc_vj_cussoldierurreconh",vIWeapons,vSCat)
	VJ.AddNPC_HUMAN("Arctic Soldier (Hostile)","npc_vj_mussoldierarh",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Arctic Soldier(Support) (Hostile)","npc_vj_mussoldierarmgh",vCWeapons,vSCat)
	VJ.AddNPC_HUMAN("Arctic Soldier(Sergeant) (Hostile)","npc_vj_mussoldierarsargeh",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Arctic Soldier(Sniper) (Hostile)","npc_vj_mussoldierarsnih",vSNWeapons,vSCat)
	VJ.AddNPC_HUMAN("Arctic Soldier(Recon) (Hostile)","npc_vj_mussoldierarreconh",vIWeapons,vSCat)
	VJ.AddNPC_HUMAN("Desert Soldier (Hostile)","npc_vj_cussoldierdh",vAWeapons,vSCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Marksman) (Hostile)","npc_vj_cussoldierdsnih",vBWeapons,vSCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Support) (Hostile)","npc_vj_cussoldierdmgh",vCWeapons,vSCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Sergeant) (Hostile)","npc_vj_cussoldierdsargeh",vAWeapons,vSCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Female) (Hostile)","npc_vj_cussoldierdwoh",vAWeapons,vSCat)
	VJ.AddNPC_HUMAN("Modern Soldier (Hostile)","npc_vj_mussoldiermh",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Modern Soldier(Sniper) (Hostile)","npc_vj_mussoldiermsnih",vSNWeapons,vSCat)
	VJ.AddNPC_HUMAN("Modern Soldier(Support) (Hostile)","npc_vj_mussoldiermmgh",vCWeapons,vSCat)
	VJ.AddNPC_HUMAN("Modern Soldier(Sergeant) (Hostile)","npc_vj_mussoldiermsargeh",vDWeapons,vSCat)
	VJ.AddNPC_HUMAN("Modern Soldier(Recon) (Hostile)","npc_vj_mussoldiermreconh",vAWeapons,vSCat)
	VJ.AddNPC_HUMAN("CIA Unit (Hostile)","npc_vj_cussoldierciah",vAWeapons,vFCat)
	VJ.AddNPC_HUMAN("CIA Unit(Sniper) (Hostile)","npc_vj_cussoldierciasnih",vSNWeapons,vFCat)
	VJ.AddNPC_HUMAN("CIA Unit(Support) (Hostile)","npc_vj_cussoldierciamgh",vCWeapons,vFCat)
	VJ.AddNPC_HUMAN("CIA Unit(Officer) (Hostile)","npc_vj_cussoldierciasargeh",vBMSWeapons,vFCat)
	VJ.AddNPC_HUMAN("CIA Unit(Recon) (Hostile)","npc_vj_cussoldierciareconh",vSPWeapons,vFCat)
	VJ.AddNPC_HUMAN("U.S Airborne (Hostile)","npc_vj_musspech",vSPWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Airborne (Mask) (Hostile)","npc_vj_musspecmaskh",vSPWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Airborne (Riot) (Hostile)","npc_vj_musspecrioth",vRWeapons,vUCat)
	VJ.AddNPC_HUMAN("Marine (Hostile)","npc_vj_musmarineh",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("Marine (Mask) (Hostile)","npc_vj_musmarinemaskh",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("Marine (Recon) (Hostile)","npc_vj_musmarinereconh",vIWeapons,vUCat)
	VJ.AddNPC_HUMAN("Marine (Riot) (Hostile)","npc_vj_musmarinerioth",vRWeapons,vUCat)
	VJ.AddNPC_HUMAN("Marine (Sergeant) (Hostile)","npc_vj_musmarineleaderh",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("Forest Marine (Hostile)","npc_vj_mussoldierfh",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("Forest Marine(Sniper) (Hostile)","npc_vj_mussoldierfsnih",vSNWeapons,vUCat)
	VJ.AddNPC_HUMAN("Forest Marine(Support) (Hostile)","npc_vj_mussoldierfmgh",vCWeapons,vUCat)
	VJ.AddNPC_HUMAN("Forest Marine(Sergeant) (Hostile)","npc_vj_mussoldierfsargeh",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("Forest Marine(Recon) (Hostile)","npc_vj_mussoldierfreconh",vIWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Soldier (Hostile)","npc_vj_naussoldierh",vIWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Soldier(Medic) (Hostile)","npc_vj_naussoldiermedich",vSWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Soldier(Sniper) (Hostile)","npc_vj_naussoldiersnih",vSNWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Soldier(Support) (Hostile)","npc_vj_naussoldiermgh",vCWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Soldier(Sergeant) (Hostile)","npc_vj_naussoldiersargeh",vDWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Base Soldier (Hostile)","npc_vj_nabaseussoldierh",vNGWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Base Soldier(Drill Instructor) (Hostile)","npc_vj_nabaseusdrillinsh",vNGWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Base Soldier(Recruit) (Hostile)","npc_vj_nabaseusrecruith",vSWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Marine Spec Ops (Hostile)","npc_vj_nausmarinespech",vSPWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Spec Ops (Hostile)","npc_vj_nausspech",vSPWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Spec Ops (Sniper) (Hostile)","npc_vj_nausspecsnih",vSNWeapons,vUCat)
	VJ.AddNPC_HUMAN("U.S Spec Ops (Sergeant) (Hostile)","npc_vj_nausspecsargeh",vSPWeapons,vUCat)
	VJ.AddNPC_HUMAN("National Guard (Hostile)","npc_vj_cusrsrvh",vONGWeapons,vPCat)
	VJ.AddNPC_HUMAN("National Guard(Sergeant) (Hostile)","npc_vj_cusrsrvsargeh",vONGWeapons,vPCat)
	VJ.AddNPC_HUMAN("National Guard(Female) (Hostile)","npc_vj_cusrsrvwoh",vONGWeapons,vPCat)
	VJ.AddNPC_HUMAN("Modern National Guard (Hostile)","npc_vj_musrsrvh",vNGWeapons,vPCat)
	VJ.AddNPC_HUMAN("Modern National Guard(Sergeant) (Hostile)","npc_vj_musrsrvsargeh",vNGWeapons,vPCat)
	VJ.AddNPC_HUMAN("Modern National Guard(Female) (Hostile)","npc_vj_musrsrvwoh",vNGWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Peacekeeper (Hostile)","npc_vj_csenunsolh",vONGWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Peacekeeper (Riot) (Hostile)","npc_vj_csenunsolrioth",vCWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Peacekeeper (Officer) (Hostile)","npc_vj_csenunsolleaderh",vDWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Forest Peacekeeper (Hostile)","npc_vj_csenunsofh",vONGWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Forest Peacekeeper (Riot) (Hostile)","npc_vj_csenunsofrioth",vCWeapons,vPCat)
	VJ.AddNPC_HUMAN("U.N Forest Peacekeeper (Officer) (Hostile)","npc_vj_csenunsofleaderh",vNGWeapons,vPCat)


	VJ.AddNPC("Desert Spec Ops Squad","sent_vj_cusdelta",vCCat)
	VJ.AddNPC("Desert Soldiers","sent_vj_cussoldiersg",vCCat)
	VJ.AddNPC("Forest Soldiers","sent_vj_cussoldierwood",vCCat)
	VJ.AddNPC("Forest Airborne Squad","sent_vj_cussoldiersf",vCCat)
	VJ.AddNPC("Urban Soldiers","sent_vj_cussoldiersar",vCCat)
	VJ.AddNPC("U.S Marines","sent_vj_cusmarines",vCCat)
	VJ.AddNPC("HECU Troopers","sent_vj_cushecu",vCCat)
	VJ.AddNPC("Desert PMC Mercenaries","sent_vj_cpmcd",vMCat)
	VJ.AddNPC("Forest PMC Mercenaries","sent_vj_cpmcg",vMCat)
	VJ.AddNPC("Urban PMC Mercenaries","sent_vj_cpmcur",vMCat)
	VJ.AddNPC("Black Ops Mercenaries","sent_vj_cpmcbla",vMCat)
	VJ.AddNPC("US Coast Guards","sent_vj_csenuscg",vSCat)
	VJ.AddNPC("US MP Squad","sent_vj_cmilpolice",vSCat)
	VJ.AddNPC("Urban Soldiers","sent_vj_cussoldiersur",vSCat)
	VJ.AddNPC("Arctic Soldiers","sent_vj_mussoldiersar",vSCat)
	VJ.AddNPC("Desert Soldiers","sent_vj_cussoldiersd",vSCat)
	VJ.AddNPC("Modern Soldiers","sent_vj_mussoldiersm",vSCat)
	VJ.AddNPC("CIA Units","sent_vj_cussoldiercia",vFCat)
	VJ.AddNPC("U.S Airborne Squad","sent_vj_musspec",vUCat)
	VJ.AddNPC("Marines","sent_vj_musmarine",vUCat)
	VJ.AddNPC("Forest Marines","sent_vj_mussoldiersf",vUCat)
	VJ.AddNPC("U.S Soldiers","sent_vj_naussoldiers",vUCat)
	VJ.AddNPC("U.S Base Soldiers","sent_vj_nabaseussoldiers",vUCat)
	VJ.AddNPC("U.S Marine Spec Ops Squad","sent_vj_nausmarinespec",vUCat)
	VJ.AddNPC("U.S Spec Ops Squad","sent_vj_nausspec",vUCat)
	VJ.AddNPC("National Guards","sent_vj_cusrsrv",vPCat)
	VJ.AddNPC("Modern National Guards","sent_vj_musrsrv",vPCat)
	VJ.AddNPC("U.N Peacekeepers","sent_vj_csenunsol",vPCat)
	VJ.AddNPC("U.N Forest Peacekeepers","sent_vj_csenunsof",vPCat)


	VJ.AddNPC("Desert Spec Ops Squad (Hostile)","sent_vj_cusdeltah",vCCat)
	VJ.AddNPC("Desert Soldiers (Hostile)","sent_vj_cussoldiersgh",vCCat)
	VJ.AddNPC("Forest Soldiers (Hostile)","sent_vj_cussoldierwoodh",vCCat)
	VJ.AddNPC("Forest Airborne Squad (Hostile)","sent_vj_cussoldiersfh",vCCat)
	VJ.AddNPC("Urban Soldiers (Hostile)","sent_vj_cussoldiersarh",vCCat)
	VJ.AddNPC("U.S Marines (Hostile)","sent_vj_cusmarinesh",vCCat)
	VJ.AddNPC("HECU Troopers (Hostile)","sent_vj_cushecuh",vCCat)
	VJ.AddNPC("Desert PMC Mercenaries (Hostile)","sent_vj_cpmcdh",vMCat)
	VJ.AddNPC("Forest PMC Mercenaries (Hostile)","sent_vj_cpmcgh",vMCat)
	VJ.AddNPC("Urban PMC Mercenaries (Hostile)","sent_vj_cpmcurh",vMCat)
	VJ.AddNPC("Black Ops Mercenaries (Hostile)","sent_vj_cpmcblah",vMCat)
	VJ.AddNPC("US Coast Guards (Hostile)","sent_vj_csenuscgh",vSCat)
	VJ.AddNPC("US MP Squad (Hostile)","sent_vj_cmilpoliceh",vSCat)
	VJ.AddNPC("Urban Soldiers (Hostile)","sent_vj_cussoldiersurh",vSCat)
	VJ.AddNPC("Arctic Soldiers (Hostile)","sent_vj_mussoldiersarh",vSCat)
	VJ.AddNPC("Desert Soldiers (Hostile)","sent_vj_cussoldiersdh",vSCat)
	VJ.AddNPC("Modern Soldiers (Hostile)","sent_vj_mussoldiersmh",vSCat)
	VJ.AddNPC("CIA Units (Hostile)","sent_vj_cussoldierciah",vFCat)
	VJ.AddNPC("U.S Airborne Squad (Hostile)","sent_vj_musspech",vUCat)
	VJ.AddNPC("Marines (Hostile)","sent_vj_musmarineh",vUCat)
	VJ.AddNPC("Forest Marines (Hostile)","sent_vj_mussoldiersfh",vUCat)
	VJ.AddNPC("U.S Soldiers (Hostile)","sent_vj_naussoldiersh",vUCat)
	VJ.AddNPC("U.S Base Soldiers (Hostile)","sent_vj_nabaseussoldiersh",vUCat)
	VJ.AddNPC("U.S Marine Spec Ops Squad (Hostile)","sent_vj_nausmarinespech",vUCat)
	VJ.AddNPC("U.S Spec Ops Squad (Hostile)","sent_vj_nausspech",vUCat)
	VJ.AddNPC("National Guards (Hostile)","sent_vj_cusrsrvh",vPCat)
	VJ.AddNPC("Modern National Guards (Hostile)","sent_vj_musrsrvh",vPCat)
	VJ.AddNPC("U.N Peacekeepers (Hostile)","sent_vj_csenunsolh",vPCat)
	VJ.AddNPC("U.N Forest Peacekeepers (Hostile)","sent_vj_csenunsofh",vPCat)


    VJ.AddNPCWeapon("VJ_CAG ARMY Military Rifle","weapon_vj_senriflearmy")
    VJ.AddNPCWeapon("VJ_CAG ARMY Assault Rifle","weapon_vj_senretroriflearmy")
    VJ.AddNPCWeapon("VJ_CAG ARMY Sniper Rifle","weapon_vj_sensniperarmy")
    VJ.AddNPCWeapon("VJ_CAG ARMY Machine Gun","weapon_vj_senmgarmy")
	VJ.AddNPCWeapon("VJ_CAG ARMY SMG","weapon_vj_sensmgarmy")
	VJ.AddNPCWeapon("VJ_CAG ARMY MP7","weapon_vj_sensilensmgarmy")
    VJ.AddNPCWeapon("VJ_CAG ARMY Carbine Rifle","weapon_vj_sencarbinearmy")
    VJ.AddNPCWeapon("VJ_CAG ARMY Desert Carbine Rifle","weapon_vj_sendescarbinearmy")
	VJ.AddNPCWeapon("VJ_CAG ARMY Pump Shotgun","weapon_vj_senpumpshotarmy")
	VJ.AddNPCWeapon("VJ_CAG ARMY BMS SMG","weapon_vj_senbmssmgarmy")
	VJ.AddNPCWeapon("VJ_CAG ARMY BMS Shotgun","weapon_vj_senbmspumpshotarmy")

	-- ConVars --
	VJ.AddConVar("vj_dum_dummy_h",100) -- Example 1
	VJ.AddConVar("vj_dum_dummy_d",20) -- Example 2
	
			local AddConvars = {}
	AddConvars["vj_senhecuclothes_custom"] = 0
	AddConvars["vj_senwepaccuracy_custom"] = 0
	for k, v in pairs(AddConvars) do
		if !ConVarExists( k ) then CreateConVar( k, v, {FCVAR_ARCHIVE} ) end
	end
	
	if CLIENT then
	local function VJ_SENHECUCLOTHES_MAIN(Panel)
		if !game.SinglePlayer() then
		if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
			Panel:AddControl( "Label", {Text = "You are not an admin!"})
			Panel:ControlHelp("Notice: Only admins can change this settings")
			return
			end
		end
		Panel:AddControl( "Label", {Text = "Notice: Only admins can change this settings."})
		local vj_senjapreset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "1"}
		vj_senjapreset.Options["#vjbase.menugeneral.default"] = { 
		vj_senhecuclothes_custom = "0",
		}
		Panel:AddControl("Checkbox", {Label = "NVG for HECU Troopers?", Command = "vj_senhecuclothes_custom"})
		Panel:ControlHelp("Checking it will make the HECU Troopers equip the Night Vision Goggles.")
				
	end
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
	function VJ_ADDTOMENU_SENTRYHECU()
		spawnmenu.AddToolMenuOption( "DrVrej", "SNPC Configures", "Sentry's Military SNPCs", "Sentry's Military SNPCs", "", "", VJ_SENHECUCLOTHES_MAIN, {} )
	end
		hook.Add( "PopulateToolMenu", "VJ_ADDTOMENU_SENTRYHECU", VJ_ADDTOMENU_SENTRYHECU )
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