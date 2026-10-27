/*--------------------------------------------------
	While you must respect the original copyrights in which this work is built upon (namely DrVrej's VJ Base),
	permission is granted to re-use any aspects of this code for your own purposes. Credit where necessary would be appreciated.
	All I ask is that you do not claim the entirety of this addon as your own. Thank you and enjoy! - KrazyCake
--------------------------------------------------*/

------------------ Addon Information ------------------
local PublicAddonName = "VJ Escape From Tarkov +"
local AddonName = "VJ Escape From Tarkov +"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_pobegiztarkova1.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	-- Category
	local vCat = "Escape From Tarkov +"
	VJ.AddCategoryInfo(vCat,{Icon = "models/vj_icon/eft+.png"})
	
	-- RUAF NPC		
	VJ.AddNPC_HUMAN("RUAF Soldier","sent_vj_ruaf_soldier",vWeapons,vCat)	
	VJ.AddNPC_HUMAN("RUAF Officer","sent_vj_ruaf_officer",vWeapons,vCat)	
	VJ.AddNPC_HUMAN("RUAF Rocketman","npc_vj_ruaf_rocketman",{"weapon_vj_rpg7"},vCat)	
	VJ.AddNPC_HUMAN("RUAF Support","npc_vj_ruaf_support",{"weapon_vj_pkm"},vCat)		
	VJ.AddNPC_HUMAN("RUAF Sniper","npc_vj_ruaf_sniper",{"weapon_vj_svds"},vCat)	

	-- Spawners	
    VJ.AddNPC_HUMAN("RUAF Spawner ","sent_vj_spawner_ruaf",vWeapons,vCat)
    VJ.AddNPC_HUMAN("RUAF SPEC Spawner ","sent_vj_spawner_ruaf_spec",vWeapons,vCat)	
	
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