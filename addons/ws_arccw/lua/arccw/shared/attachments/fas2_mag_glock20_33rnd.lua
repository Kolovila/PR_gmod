att.PrintName = "Glock-20 33rnd Mag"
att.Icon = Material("vgui/fas2atts/33rnd")
att.Description = "A 33-round magazine for Glock systems"

att.AutoStats = true
att.Slot = "fas2_glock20_33rnd"

att.MagExtender = true

att.Override_ClipSize = 33

att.ActivateElements = {"33rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end