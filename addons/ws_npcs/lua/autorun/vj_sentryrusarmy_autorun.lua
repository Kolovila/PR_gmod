/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Sentry's Russian Army SNPCs"
local AddonName = "Sentry Russian ARMY"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_sentryrusarmy_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "Sentry's Cop SNPCs" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vECat = "Sentry's Militaries (East Europe)" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vCCat = "Sentry's Military (RUS)" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vPCat = "Sentry's Security (RUS)" -- Category, you can also set a category individually by replacing the vCat with a string value
	local vMCat = "Sentry's PMC" -- Category, you can also set a category individually by replacing the vCat with a string value
	VJ.AddCategoryInfo(vECat,{Icon = "vj_icons/sensol.png"})
	VJ.AddCategoryInfo(vCCat,{Icon = "vj_icons/senrus.png"})
	VJ.AddCategoryInfo(vPCat,{Icon = "vj_icons/sensec.png"})
	VJ.AddCategoryInfo(vMCat,{Icon = "vj_icons/senmerc.png"})
	list.Set( "ContentCategoryIcons", vECat, "vj_icons/sensol.png" )
	list.Set( "ContentCategoryIcons", vCCat, "vj_icons/senrus.png" )
	list.Set( "ContentCategoryIcons", vPCat, "vj_icons/sensec.png" )
	list.Set( "ContentCategoryIcons", vMCat, "vj_icons/senmerc.png" )

	local vWeapons = {"weapon_vj_senruakarmy"}
	local vLWeapons = {"weapon_vj_senruakarmy","weapon_vj_senruaksmgarmy","weapon_vj_senruaksmgarmy"}
	local vMWeapons = {"weapon_vj_senrupkmarmy"}
	local vSNWeapons = {"weapon_vj_senrusniperarmy"}
	local vSWeapons = {"weapon_vj_senrusilenriflearmy","weapon_vj_senrubizonarmy","weapon_vj_senrusilenriflearmy","weapon_vj_senrubizonarmy","weapon_vj_senruaksmgarmy"}
	local vOWeapons = {"weapon_vj_senrupistolarmy"}


	VJ.AddNPC_HUMAN("Belarusian Soldier","npc_vj_cbelsoldier",vWeapons,vECat)
	VJ.AddNPC_HUMAN("Belarusian Soldier(Support)","npc_vj_cbelsoldiermg",vMWeapons,vECat)
	VJ.AddNPC_HUMAN("Belarusian Soldier(Sergeant)","npc_vj_cbelsoldiersarge",vLWeapons,vECat)
	VJ.AddNPC_HUMAN("FSB Alpha Unit","npc_vj_crualphaspec",vSWeapons,vPCat)
	VJ.AddNPC_HUMAN("Russian Military Police","npc_vj_crumilpolice",vLWeapons,vPCat)
	VJ.AddNPC_HUMAN("Base Soldier","npc_vj_crubasesoldier",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Base Paratrooper","npc_vj_crubasesoldiervdv",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier","npc_vj_crusoldier",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Female)","npc_vj_crusoldierwo",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Medic)","npc_vj_crusoldiermedic",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Sniper)","npc_vj_crusoldiersni",vSNWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Support)","npc_vj_crusoldiermg",vMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Sergeant)","npc_vj_crusoldiersarge",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Recon)","npc_vj_crusoldierrecon",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Tundra Soldier","npc_vj_crusoldiert",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Tundra Soldier(Support)","npc_vj_crusoldiertmg",vMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Tundra Soldier(Sergeant)","npc_vj_crusoldiertsarge",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier","npc_vj_cruvdvd",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Support)","npc_vj_cruvdvdmg",vMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Sergeant)","npc_vj_cruvdvdsarge",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Paratrooper","npc_vj_cruvdvf",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Paratrooper(Support)","npc_vj_cruvdvfmg",vMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Paratrooper(Sergeant)","npc_vj_cruvdvfsarge",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Spetsnaz Unit","npc_vj_cruspec",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Spetsnaz Unit(Female)","npc_vj_cruspecwo",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Spetsnaz Unit(Sergeant)","npc_vj_cruspecsarge",vSWeapons,vCCat)
--	VJ.AddNPC_HUMAN("Spetsnaz Unit(Recon)","npc_vj_cruspecriot",vSWeapons,vCCat)
--	VJ.AddNPC_HUMAN("Desert Spetsnaz","npc_vj_cruspecsah",vSWeapons,vCCat)
--	VJ.AddNPC_HUMAN("Desert Spetsnaz (Riot)","npc_vj_cruspecriotsah",vMWeapons,vCCat)
--	VJ.AddNPC_HUMAN("Desert Spetsnaz (Sergeant)","npc_vj_cruspecsargesah",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Officer(Army)","npc_vj_cruofficer",vOWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Officer(Air Force)","npc_vj_cruofficeraf",vOWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Officer(Navy)","npc_vj_cruofficernavy",vOWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian PMC","npc_vj_cruwagner",vWeapons,vMCat)
	VJ.AddNPC_HUMAN("Russian PMC (Sniper)","npc_vj_cruwagnersni",vSNWeapons,vMCat)
	VJ.AddNPC_HUMAN("Russian PMC (Support)","npc_vj_cruwagnermg",vMWeapons,vMCat)
	VJ.AddNPC_HUMAN("Russian PMC (Sergeant)","npc_vj_cruwagnersarge",vLWeapons,vMCat)
	VJ.AddNPC_HUMAN("Russian PMC (Recon)","npc_vj_cruwagnerrecon",vLWeapons,vMCat)

	VJ.AddNPC_HUMAN("Belarusian Soldier (Hostile)","npc_vj_cbelsoldierh",vWeapons,vECat)
	VJ.AddNPC_HUMAN("Belarusian Soldier(Support) (Hostile)","npc_vj_cbelsoldiermgh",vMWeapons,vECat)
	VJ.AddNPC_HUMAN("Belarusian Soldier(Sergeant) (Hostile)","npc_vj_cbelsoldiersargeh",vLWeapons,vECat)
	VJ.AddNPC_HUMAN("FSB Alpha Unit (Hostile)","npc_vj_crualphaspech",vSWeapons,vPCat)
	VJ.AddNPC_HUMAN("Russian Military Police (Hostile)","npc_vj_crumilpoliceh",vLWeapons,vPCat)
	VJ.AddNPC_HUMAN("Base Soldier (Hostile)","npc_vj_crubasesoldierh",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Base Paratrooper (Hostile)","npc_vj_crubasesoldiervdvh",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier (Hostile)","npc_vj_crusoldierh",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Female) (Hostile)","npc_vj_crusoldierwoh",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Medic) (Hostile)","npc_vj_crusoldiermedich",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Sniper) (Hostile)","npc_vj_crusoldiersnih",vSNWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Support) (Hostile)","npc_vj_crusoldiermgh",vMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Sergeant) (Hostile)","npc_vj_crusoldiersargeh",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Soldier(Recon) (Hostile)","npc_vj_crusoldierreconh",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Tundra Soldier (Hostile)","npc_vj_crusoldierth",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Tundra Soldier(Support) (Hostile)","npc_vj_crusoldiertmgh",vMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Tundra Soldier(Sergeant) (Hostile)","npc_vj_crusoldiertsargeh",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier (Hostile)","npc_vj_cruvdvdh",vWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Support) (Hostile)","npc_vj_cruvdvdmgh",vMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Desert Soldier(Sergeant) (Hostile)","npc_vj_cruvdvdsargeh",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Paratrooper (Hostile)","npc_vj_cruvdvfh",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Paratrooper(Support) (Hostile)","npc_vj_cruvdvfmgh",vMWeapons,vCCat)
	VJ.AddNPC_HUMAN("Paratrooper(Sergeant) (Hostile)","npc_vj_cruvdvfsargeh",vLWeapons,vCCat)
	VJ.AddNPC_HUMAN("Spetsnaz Unit (Hostile)","npc_vj_cruspech",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Spetsnaz Unit(Female) (Hostile)","npc_vj_cruspecwoh",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Spetsnaz Unit(Sergeant) (Hostile)","npc_vj_cruspecsargeh",vSWeapons,vCCat)
--	VJ.AddNPC_HUMAN("Spetsnaz Unit(Recon) (Hostile)","npc_vj_cruspecrioth",vSWeapons,vCCat)
--	VJ.AddNPC_HUMAN("Desert Spetsnaz (Hostile)","npc_vj_cruspecsahh",vSWeapons,vCCat)
--	VJ.AddNPC_HUMAN("Desert Spetsnaz (Riot) (Hostile)","npc_vj_cruspecriotsahh",vMWeapons,vCCat)
--	VJ.AddNPC_HUMAN("Desert Spetsnaz (Sergeant) (Hostile)","npc_vj_cruspecsargesahh",vSWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Officer(Army) (Hostile)","npc_vj_cruofficerh",vOWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Officer(Air Force) (Hostile)","npc_vj_cruofficerafh",vOWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian Officer(Navy) (Hostile)","npc_vj_cruofficernavyh",vOWeapons,vCCat)
	VJ.AddNPC_HUMAN("Russian PMC (Hostile)","npc_vj_cruwagnerh",vWeapons,vMCat)
	VJ.AddNPC_HUMAN("Russian PMC (Sniper) (Hostile)","npc_vj_cruwagnersnih",vSNWeapons,vMCat)
	VJ.AddNPC_HUMAN("Russian PMC (Support) (Hostile)","npc_vj_cruwagnermgh",vMWeapons,vMCat)
	VJ.AddNPC_HUMAN("Russian PMC (Sergeant) (Hostile)","npc_vj_cruwagnersargeh",vLWeapons,vMCat)
	VJ.AddNPC_HUMAN("Russian PMC (Recon) (Hostile)","npc_vj_cruwagnerreconh",vLWeapons,vMCat)


	VJ.AddNPC("Belarusian Soldiers","sent_vj_cbelsoldiers",vECat)
	VJ.AddNPC("FSB Alpha Units","sent_vj_crualphaspec",vPCat)
	VJ.AddNPC("Russian MP Squad","sent_vj_crumilpolice",vPCat)
	VJ.AddNPC("Base Soldiers","sent_vj_crubasesoldiers",vCCat)
	VJ.AddNPC("Base Paratroopers","sent_vj_crubasesoldiersvdv",vCCat)
	VJ.AddNPC("Russian Soldiers","sent_vj_crusoldiers",vCCat)
	VJ.AddNPC("Tundra Soldiers","sent_vj_crusoldierst",vCCat)
	VJ.AddNPC("Desert Soldiers","sent_vj_cruvdvd",vCCat)
	VJ.AddNPC("Paratroopers","sent_vj_cruvdvf",vCCat)
	VJ.AddNPC("Spetsnaz Units","sent_vj_cruspec",vCCat)
--	VJ.AddNPC("Desert Spetsnaz Squad","sent_vj_cruspecsah",vCCat)
	VJ.AddNPC("Russian Officers Squad","sent_vj_cruofficers",vCCat)
	VJ.AddNPC("Russian PMC Mercenaries","sent_vj_cruwagners",vMCat)

	VJ.AddNPC("Belarusian Soldiers (Hostile)","sent_vj_cbelsoldiersh",vECat)
	VJ.AddNPC("FSB Alpha Units (Hostile)","sent_vj_crualphaspech",vPCat)
	VJ.AddNPC("Russian MP Squad (Hostile)","sent_vj_crumilpoliceh",vPCat)
	VJ.AddNPC("Base Soldiers (Hostile)","sent_vj_crubasesoldiersh",vCCat)
	VJ.AddNPC("Base Paratroopers (Hostile)","sent_vj_crubasesoldiersvdvh",vCCat)
	VJ.AddNPC("Russian Soldiers (Hostile)","sent_vj_crusoldiersh",vCCat)
	VJ.AddNPC("Tundra Soldiers (Hostile)","sent_vj_crusoldiersth",vCCat)
	VJ.AddNPC("Desert Soldiers (Hostile)","sent_vj_cruvdvdh",vCCat)
	VJ.AddNPC("Paratroopers (Hostile)","sent_vj_cruvdvfh",vCCat)
	VJ.AddNPC("Spetsnaz Units (Hostile)","sent_vj_cruspech",vCCat)
--	VJ.AddNPC("Desert Spetsnaz Squad (Hostile)","sent_vj_cruspecsahh",vCCat)
	VJ.AddNPC("Russian Officers Squad (Hostile)","sent_vj_cruofficersh",vCCat)
	VJ.AddNPC("Russian PMC Mercenaries (Hostile)","sent_vj_cruwagnersh",vMCat)



    VJ.AddNPCWeapon("VJ_CAG RUS ARMY AK74","weapon_vj_senruakarmy")
    VJ.AddNPCWeapon("VJ_CAG RUS ARMY PKM","weapon_vj_senrupkmarmy")
    VJ.AddNPCWeapon("VJ_CAG RUS ARMY SVD","weapon_vj_senrusniperarmy")
    VJ.AddNPCWeapon("VJ_CAG RUS ARMY Bizon","weapon_vj_senrubizonarmy")
	VJ.AddNPCWeapon("VJ_CAG RUS ARMY AKS SMG","weapon_vj_senruaksmgarmy")
    VJ.AddNPCWeapon("VJ_CAG RUS ARMY Makarov","weapon_vj_senrupistolarmy")
	VJ.AddNPCWeapon("VJ_CAG RUS ARMY AS VAL","weapon_vj_senrusilenriflearmy")

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