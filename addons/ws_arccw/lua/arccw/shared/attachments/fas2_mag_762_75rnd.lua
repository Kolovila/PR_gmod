att.PrintName = "7.62 75rnd Mag"
att.Icon = Material("vgui/fas2atts/762_75rnd")
att.Description = "A 75-round metal drum magazine for 7.62x39MM rifles and compatible systems"

att.SortOrder = 1

att.AutoStats = true
att.Slot = "fas2_762_75rnd"

att.MagExtender = true

att.Override_ClipSize = 75

att.ActivateElements = {"75rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end