AddCSLuaFile()
CustomizableWeaponry_EFT_atts= true


//The code below is written by KnifeKitty. I DO NOT claim credit for it or intend to steal it. I altered "KK" with "EFT" simply to prevent conflicts.
if CLIENT then
	CustomizableWeaponry_EFT_ReflexSightRT = GetRenderTarget("ReflexSightRTEFT", 512, 512, false) 
	CustomizableWeaponry_EFT_ReflexSightRT_Ini = true 
	CustomizableWeaponry_EFT_MagnifyingRT = GetRenderTarget("MagnifyingRTEFT", 512, 512, false)
	CustomizableWeaponry_EFT_MagnifyingRT_Ini = true
	CustomizableWeaponry_EFT_SimpleTelescopeRT = GetRenderTarget("SimpleTelescopeRTEFT", 1024, 1024, false)
	CustomizableWeaponry_EFT_SimpleTelescopeRT_Ini = true
	CustomizableWeaponry_EFT_HoloSightRT = GetRenderTarget("HoloSightRTEFT", 512, 512, false)
	CustomizableWeaponry_EFT_HoloSightRT_Ini = true
	
	local function CW20_EFT_ExtraRenderScene()
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()
		
		if IsValid(wep) and wep.CW20Weapon then			
			if wep.EFTRenderTargetFunc then
				wep.EFTRenderTargetFunc(wep)
			end
		end
	end

	hook.Add("RenderScene", "CW20_EFT_ExtraRenderScene", CW20_EFT_ExtraRenderScene)
end
	

