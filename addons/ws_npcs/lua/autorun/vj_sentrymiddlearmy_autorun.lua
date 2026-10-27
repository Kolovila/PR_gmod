/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Sentry's Middle East Military SNPCs"
local AddonName = "Sentry Middle East ARMY"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_sentrymiddlearmy_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "Sentry's Cop SNPCs" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vCCat = "Sentry's Militaries (Middle East)" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vOCat = "Sentry's 1990s Military (Middle East)" -- Category, you can also set a category individually by replacing the vCat with a string value
	VJ.AddCategoryInfo(vCCat,{Icon = "vj_icons/sensol.png"})
	VJ.AddCategoryInfo(vOCat,{Icon = "vj_icons/sensol.png"})
	list.Set( "ContentCategoryIcons", vCCat, "vj_icons/sensol.png" )
	list.Set( "ContentCategoryIcons", vOCat, "vj_icons/sensol.png" )

	local vMWeapons = {"weapon_vj_senarabminimiarmy"}
	local vPKWeapons = {"weapon_vj_senarabg3army","weapon_vj_senarabg3army","weapon_vj_senarabassault"}
	local vIQWeapons = {"weapon_vj_senarabassault"}
	local vIMWeapons = {"weapon_vj_senarabmg"}
	local vIQSWeapons = {"weapon_vj_senarabcarbinearmy","weapon_vj_senarabcarbinearmy","weapon_vj_senarabassault"}
	local vISWeapons = {"weapon_vj_senjewriflearmy","weapon_vj_senjewcarbinearmy"}
	local vISSWeapons = {"weapon_vj_senjewsmgarmy","weapon_vj_senjewcarbinearmy","weapon_vj_senjewriflearmy"}
	local vISRWeapons = {"weapon_vj_senjewsmgarmy","weapon_vj_senjewcarbinearmy","weapon_vj_senarabcarbinearmy"}
	local vISWeapons = {"weapon_vj_senjewriflearmy","weapon_vj_senjewcarbinearmy"}
	local vISOWeapons = {"weapon_vj_senjewriflearmy"}
	local vISCWeapons = {"weapon_vj_senjewsmgarmy"}
	local vISNWeapons = {"weapon_vj_senjewsniperarmy"}
	local vISMWeapons = {"weapon_vj_senjewmgarmy"}


	VJ.AddNPC_HUMAN("Iraqi Republican Guard","npc_vj_ciraqguard",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Republican Guard(Support)","npc_vj_ciraqguardmg",vIMWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Republican Guard(Sergeant)","npc_vj_ciraqguardsarge",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Soldier","npc_vj_ciraqforestsoldier",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Soldier(Support)","npc_vj_ciraqforestsoldiermg",vIMWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Soldier(Sergeant)","npc_vj_ciraqforestsoldiersarge",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Spec Ops","npc_vj_ciraqsoldier",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Spec Ops (Support)","npc_vj_ciraqsoldiermg",vIMWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Spec Ops (Sergeant)","npc_vj_ciraqsoldiersarge",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Soldier","npc_vj_cheboldsoldier",vISOWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Recon)","npc_vj_cheboldsoldiermg",vISCWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Sergeant)","npc_vj_cheboldsoldiersarge",vISOWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Spec Ops","npc_vj_cheboldspec",vISOWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Spec Ops (Recon)","npc_vj_cheboldspecmg",vISCWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Spec Ops (Sergeant)","npc_vj_cheboldspecsarge",vISOWeapons,vOCat)
	VJ.AddNPC_HUMAN("Afghan Soldier","npc_vj_cafgsoldier",vIQSWeapons,vOCat)
	VJ.AddNPC_HUMAN("Afghan Taliban","npc_vj_cafgtaliban",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Syrian Arab Soldier","npc_vj_csyriansoldier",vIQWeapons,vCCat)
	VJ.AddNPC_HUMAN("Syrian Free Soldier","npc_vj_csyrianfreesoldier",vIQWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iraqi Soldier","npc_vj_ciraqmsol",vIQSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iraqi Spec Ops","npc_vj_ciraqspec",vIQSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iraqi Peshmerga Soldier","npc_vj_cirpeshsoldier",vPKWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iraqi Peshmerga Soldier(Support)","npc_vj_cirpeshsoldiermg",vIMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iraqi Peshmerga Soldier(Sergeant)","npc_vj_cirpeshsoldiersarge",vIQSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Yemeni Soldier","npc_vj_cyemensoldier",vPKWeapons,vCCat)
	VJ.AddNPC_HUMAN("Yemeni Soldier(Support)","npc_vj_cyemensoldiermg",vMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Yemeni Soldier(Sergeant)","npc_vj_cyemensoldiersarge",vPKWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Soldier","npc_vj_ciransoldier",vIQWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Soldier(Support)","npc_vj_ciransoldiermg",vIMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Soldier(Sergeant)","npc_vj_ciransoldiersarge",vPKWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Marine","npc_vj_ciranmarine",vIQWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Marine(Support)","npc_vj_ciranmarinemg",vIMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Marine(Sergeant)","npc_vj_ciranmarinesarge",vPKWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Soldier","npc_vj_chebsoldier",vISWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Support)","npc_vj_chebsoldiermg",vISMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Sergeant)","npc_vj_chebsoldiersarge",vISSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Recon)","npc_vj_chebsoldierrecon",vISRWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Sniper)","npc_vj_chebsoldiersni",vISNWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Spec Ops","npc_vj_chebspec",vISRWeapons,vCCat)

	VJ.AddNPC_HUMAN("Iraqi Republican Guard (Hostile)","npc_vj_ciraqguardh",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Republican Guard(Support) (Hostile)","npc_vj_ciraqguardmgh",vIMWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Republican Guard(Sergeant) (Hostile)","npc_vj_ciraqguardsargeh",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Soldier (Hostile)","npc_vj_ciraqforestsoldierh",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Soldier(Support) (Hostile)","npc_vj_ciraqforestsoldiermgh",vIMWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Soldier(Sergeant) (Hostile)","npc_vj_ciraqforestsoldiersargeh",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Spec Ops (Hostile)","npc_vj_ciraqsoldierh",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Spec Ops (Support) (Hostile)","npc_vj_ciraqsoldiermgh",vIMWeapons,vOCat)
	VJ.AddNPC_HUMAN("Iraqi Spec Ops (Sergeant) (Hostile)","npc_vj_ciraqsoldiersargeh",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Soldier (Hostile)","npc_vj_cheboldsoldierh",vISOWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Recon) (Hostile)","npc_vj_cheboldsoldiermgh",vISCWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Sergeant) (Hostile)","npc_vj_cheboldsoldiersargeh",vISOWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Spec Ops (Hostile)","npc_vj_cheboldspech",vISOWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Spec Ops (Recon) (Hostile)","npc_vj_cheboldspecmgh",vISCWeapons,vOCat)
	VJ.AddNPC_HUMAN("Israeli Spec Ops (Sergeant) (Hostile)","npc_vj_cheboldspecsargeh",vISOWeapons,vOCat)
	VJ.AddNPC_HUMAN("Afghan Soldier (Hostile)","npc_vj_cafgsoldierh",vIQSWeapons,vOCat)
	VJ.AddNPC_HUMAN("Afghan Taliban (Hostile)","npc_vj_cafgtalibanh",vIQWeapons,vOCat)
	VJ.AddNPC_HUMAN("Syrian Arab Soldier (Hostile)","npc_vj_csyriansoldierh",vIQWeapons,vCCat)
	VJ.AddNPC_HUMAN("Syrian Free Soldier (Hostile)","npc_vj_csyrianfreesoldierh",vIQWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iraqi Soldier (Hostile)","npc_vj_ciraqmsolh",vIQSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iraqi Spec Ops (Hostile)","npc_vj_ciraqspech",vIQSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iraqi Peshmerga Soldier (Hostile)","npc_vj_cirpeshsoldierh",vPKWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iraqi Peshmerga Soldier(Support) (Hostile)","npc_vj_cirpeshsoldiermgh",vIMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iraqi Peshmerga Soldier(Sergeant) (Hostile)","npc_vj_cirpeshsoldiersargeh",vIQSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Yemeni Soldier (Hostile)","npc_vj_cyemensoldierh",vPKWeapons,vCCat)
	VJ.AddNPC_HUMAN("Yemeni Soldier(Support) (Hostile)","npc_vj_cyemensoldiermgh",vMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Yemeni Soldier(Sergeant) (Hostile)","npc_vj_cyemensoldiersargeh",vPKWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Soldier (Hostile)","npc_vj_ciransoldierh",vIQWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Soldier(Support) (Hostile)","npc_vj_ciransoldiermgh",vIMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Soldier(Sergeant) (Hostile)","npc_vj_ciransoldiersargeh",vPKWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Marine (Hostile)","npc_vj_ciranmarineh",vIQWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Marine(Support) (Hostile)","npc_vj_ciranmarinemgh",vIMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Iranian Marine(Sergeant) (Hostile)","npc_vj_ciranmarinesargeh",vPKWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Soldier (Hostile)","npc_vj_chebsoldierh",vISWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Support) (Hostile)","npc_vj_chebsoldiermgh",vISMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Sergeant) (Hostile)","npc_vj_chebsoldiersargeh",vISSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Recon) (Hostile)","npc_vj_chebsoldierreconh",vISRWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Soldier(Sniper) (Hostile)","npc_vj_chebsoldiersnih",vISNWeapons,vCCat)
	VJ.AddNPC_HUMAN("Israeli Spec Ops (Hostile)","npc_vj_chebspech",vISRWeapons,vCCat)


	VJ.AddNPC("Iraqi Republican Guards","sent_vj_ciraqguards",vOCat)
	VJ.AddNPC("Iraqi Soldiers","sent_vj_ciraqforestsoldiers",vOCat)
	VJ.AddNPC("Iraqi Spec Ops Units","sent_vj_ciraqsoldiers",vOCat)
	VJ.AddNPC("Israeli Soldiers","sent_vj_cheboldsoldiers",vOCat)
	VJ.AddNPC("Israeli Spec Ops Units","sent_vj_cheboldspec",vOCat)
	VJ.AddNPC("Afghan Soldiers","sent_vj_cafgsoldiers",vOCat)
	VJ.AddNPC("Afghan Talibans","sent_vj_cafgtalibans",vOCat)
	VJ.AddNPC("Syrian Arab Soldiers","sent_vj_csyriansoldiers",vCCat)
	VJ.AddNPC("Syrian Free Soldiers","sent_vj_csyrianfreesoldiers",vCCat)
	VJ.AddNPC("Iraqi Soldiers","sent_vj_ciraqmsols",vCCat)
	VJ.AddNPC("Iraqi Spec Ops Units","sent_vj_ciraqspec",vCCat)
	VJ.AddNPC("Iraqi Peshmerga Soldiers","sent_vj_cirpeshsoldiers",vCCat)
	VJ.AddNPC("Yemeni Soldiers","sent_vj_cyemensoldiers",vCCat)
	VJ.AddNPC("Iranian Soldiers","sent_vj_ciransoldiers",vCCat)
	VJ.AddNPC("Iranian Marines","sent_vj_ciranmarines",vCCat)
	VJ.AddNPC("Israeli Soldiers","sent_vj_chebsoldiers",vCCat)
	VJ.AddNPC("Israeli Spec Ops Units","sent_vj_chebspec",vCCat)

	VJ.AddNPC("Iraqi Republican Guards (Hostile)","sent_vj_ciraqguardsh",vOCat)
	VJ.AddNPC("Iraqi Soldiers (Hostile)","sent_vj_ciraqforestsoldiersh",vOCat)
	VJ.AddNPC("Iraqi Spec Ops Units (Hostile)","sent_vj_ciraqsoldiersh",vOCat)
	VJ.AddNPC("Israeli Soldiers (Hostile)","sent_vj_cheboldsoldiersh",vOCat)
	VJ.AddNPC("Israeli Spec Ops Units (Hostile)","sent_vj_cheboldspech",vOCat)
	VJ.AddNPC("Afghan Soldiers (Hostile)","sent_vj_cafgsoldiersh",vOCat)
	VJ.AddNPC("Afghan Talibans (Hostile)","sent_vj_cafgtalibansh",vOCat)
	VJ.AddNPC("Syrian Arab Soldiers (Hostile)","sent_vj_csyriansoldiersh",vCCat)
	VJ.AddNPC("Syrian Free Soldiers (Hostile)","sent_vj_csyrianfreesoldiersh",vCCat)
	VJ.AddNPC("Iraqi Soldiers (Hostile)","sent_vj_ciraqmsolsh",vCCat)
	VJ.AddNPC("Iraqi Spec Ops Units (Hostile)","sent_vj_ciraqspech",vCCat)
	VJ.AddNPC("Iraqi Peshmerga Soldiers (Hostile)","sent_vj_cirpeshsoldiersh",vCCat)
	VJ.AddNPC("Yemeni Soldiers (Hostile)","sent_vj_cyemensoldiersh",vCCat)
	VJ.AddNPC("Iranian Soldiers (Hostile)","sent_vj_ciransoldiersh",vCCat)
	VJ.AddNPC("Iranian Marines (Hostile)","sent_vj_ciranmarinesh",vCCat)
	VJ.AddNPC("Israeli Soldiers (Hostile)","sent_vj_chebsoldiersh",vCCat)
	VJ.AddNPC("Israeli Spec Ops Units (Hostile)","sent_vj_chebspech",vCCat)


    VJ.AddNPCWeapon("VJ_CAG ARAB ARMY Minimi","weapon_vj_senasianminimiarmy")
    VJ.AddNPCWeapon("VJ_CAG ARAB ARMY G3","weapon_vj_senarabg3army")
    VJ.AddNPCWeapon("VJ_CAG ARAB ARMY AK","weapon_vj_senarabassault")
    VJ.AddNPCWeapon("VJ_CAG ARAB ARMY PKM","weapon_vj_senarabmg")
    VJ.AddNPCWeapon("VJ_CAG ARAB ARMY M4","weapon_vj_senarabcarbinearmy")
    VJ.AddNPCWeapon("VJ_CAG Hebrew ARMY GALIL DRUM","weapon_vj_senjewmgarmy")
    VJ.AddNPCWeapon("VJ_CAG Hebrew ARMY TAVOR","weapon_vj_senjewcarbinearmy")
    VJ.AddNPCWeapon("VJ_CAG Hebrew ARMY GALIL","weapon_vj_senjewriflearmy")
    VJ.AddNPCWeapon("VJ_CAG Hebrew ARMY M24","weapon_vj_senjewsniperarmy")
    VJ.AddNPCWeapon("VJ_CAG Hebrew ARMY UZI","weapon_vj_senjewsmgarmy")

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