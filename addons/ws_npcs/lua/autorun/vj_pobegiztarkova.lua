/*--------------------------------------------------
	While you must respect the original copyrights in which this work is built upon (namely DrVrej's VJ Base),
	permission is granted to re-use any aspects of this code for your own purposes. Credit where necessary would be appreciated.
	All I ask is that you do not claim the entirety of this addon as your own. Thank you and enjoy! - KrazyCake
--------------------------------------------------*/

------------------ Addon Information ------------------
local PublicAddonName = "VJ Escape From Tarkov +"
local AddonName = "VJ Escape From Tarkov +"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_pobegiztarkova.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	-- Category
	local vCat = "Escape From Tarkov +"
	VJ.AddCategoryInfo(vCat,{Icon = "models/vj_icon/eft+.png"})
	
	-- Bear NPC		
	VJ.AddNPC_HUMAN("CHVK BEAR","sent_vj_chvk_bear",vWeapons,vCat)
	VJ.AddNPC_HUMAN("CHVK BEAR (Sniper)","npc_vj_chvk_bear_sniper",{"weapon_vj_dvl10"},vCat)	

	-- USEC NPC	
	VJ.AddNPC_HUMAN("CHVK USEC","sent_vj_chvk_usec",vWeapons,vCat)		
	VJ.AddNPC_HUMAN("CHVK USEC (Sniper)","npc_vj_chvk_usec_sniper",{"weapon_vj_m700"},vCat)			

	-- Spawners	
    VJ.AddNPC_HUMAN("CHVK BEAR Spawner ","sent_vj_spawner_bear",vWeapons,vCat)
    VJ.AddNPC_HUMAN("CHVK USEC Spawner ","sent_vj_spawner_usec",vWeapons,vCat)	
	
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