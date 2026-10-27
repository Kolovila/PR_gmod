
local tab = {}
tab.sight = "md_eft_si_exps3"
tab.func = function(self,rc)
	local rcAlpha = 255 * (self.EFTIRAlpha or 1)
	
	surface.SetDrawColor(rc.r, rc.g, rc.b, rcAlpha - 55 + math.random(45))
	surface.SetTexture(surface.GetTextureID("models/weapons/cw_eft/upgrades/scopes/xps3/xps3_reticule"))
	surface.DrawTexturedRect(184, 184, 144, 144)
end
CustomizableWeaponry_EFT_Magnifier_AddPrimarySight(tab)


local tab = {}
tab.sight = "md_eft_si_exps3_tan"
tab.func = function(self,rc)
	local rcAlpha = 255 * (self.EFTIRAlpha or 1)
	
	surface.SetDrawColor(rc.r, rc.g, rc.b, rcAlpha - 55 + math.random(45))
	surface.SetTexture(surface.GetTextureID("models/weapons/cw_eft/upgrades/scopes/xps3/xps3_reticule"))
	surface.DrawTexturedRect(184, 184, 144, 144)
end
CustomizableWeaponry_EFT_Magnifier_AddPrimarySight(tab)