att.PrintName = "7.62 40rnd Mag"
att.Icon = Material("vgui/fas2atts/545_45rnd")
att.Description = "A 40-round metal magazine for 7.62x39MM rifles and compatible systems"

att.SortOrder = 2

att.AutoStats = true
att.Slot = "fas2_762_40rnd"

att.MagExtender = true

att.Override_ClipSize = 40

att.ActivateElements = {"40rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end