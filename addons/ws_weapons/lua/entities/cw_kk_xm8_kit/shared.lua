
-- if CustomizableWeaponry and CustomizableWeaponry_KK_HK416 then
if CustomizableWeaponry then

	ENT.Type = "anim"
	ENT.Base = "cw_attpack_base"
	ENT.PrintName = "HK XM8 Kit"
	ENT.PackageText = "HK XM8 Barrels, Stocks, Misc"
	ENT.Category = "CW 2.0 Attachments"
	ENT.Author = "Spy"
	ENT.Spawnable = true
	ENT.AdminSpawnable = true 
	
	if CustomizableWeaponry_KK_HK416 then
		ENT.attachments = {
			"bg_kk_xm8_paint4", 
			"bg_kk_xm8_paint3", 
			"bg_kk_xm8_paint2", 
			"bg_kk_xm8_paint1", 
			"bg_kk_xm8_stock_compact", 
			"bg_kk_xm8_stock_heavy",
			"bg_hk416_cmag",
			"bg_kk_xm8_foregrip_compact", 
			"bg_kk_xm8_foregrip_long", 
			"bg_hk416_silencer", 
			"bg_kk_xm8_receiver_railed",
			"md_eotech_xps_kk",
			"bg_kk_xm8_reticle5", 
			"bg_kk_xm8_reticle4", 
			"bg_kk_xm8_reticle3", 
			"bg_kk_xm8_reticle2", 
			"bg_kk_xm8_reticle1", 
		}
	else
		ENT.attachments = {
			"bg_kk_xm8_paint4", 
			"bg_kk_xm8_paint3", 
			"bg_kk_xm8_paint2", 
			"bg_kk_xm8_paint1", 
			"bg_kk_xm8_stock_compact", 
			"bg_kk_xm8_stock_heavy",
			"bg_hkxm8_forgrip_compact", 
			"bg_kk_xm8_foregrip_long", 
			"bg_kk_xm8_receiver_railed",
			"bg_kk_xm8_reticle5", 
			"bg_kk_xm8_reticle4", 
			"bg_kk_xm8_reticle3", 
			"bg_kk_xm8_reticle2", 
		}
	end
end