/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = ""
local AddonName = ""
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_weapons.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	-- Weapons			
	VJ.AddNPCWeapon("VJ_EFT_AK74N", "weapon_vj_ak74n")
	VJ.AddNPCWeapon("VJ_EFT_AK74N_Plum", "weapon_vj_ak74n_Plum")
	VJ.AddNPCWeapon("VJ_EFT_AKS74UN", "weapon_vj_aks74un")	
	VJ.AddNPCWeapon("VJ_EFT_ASVAL", "weapon_vj_asval")		
	VJ.AddNPCWeapon("VJ_EFT_COLT_M4A1", "weapon_vj_colt_m4a1")	
	VJ.AddNPCWeapon("VJ_EFT_DVL10", "weapon_vj_dvl10")		
	VJ.AddNPCWeapon("VJ_EFT_M700", "weapon_vj_m700")		
	VJ.AddNPCWeapon("VJ_EFT_M870", "weapon_vj_m870")		
	VJ.AddNPCWeapon("VJ_EFT_SAIGA12", "weapon_vj_saiga12")		
	VJ.AddNPCWeapon("VJ_EFT_UMP45", "weapon_vj_ump45")		
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