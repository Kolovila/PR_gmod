att.PrintName = "M1911 11rnd Mag"
att.Icon = Material("vgui/fas2atts/11rnd")
att.Description = "A 11-round .45 ACP magazine for M1911 pistol"

att.AutoStats = true
att.Slot = "fas2_m1911_11rnd"

att.MagExtender = true

att.Override_ClipSize = 11

att.ActivateElements = {"11rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end