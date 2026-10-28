att.PrintName = "5.45 60rnd Mag"
att.Icon = Material("vgui/fas2atts/545_60rnd")
att.Description = "A 60-round quad-stack polymer magazine for 5.45x39MM rifles and compatible systems"

att.SortOrder = 1

att.AutoStats = true
att.Slot = "fas2_545_60rnd"

att.MagExtender = true

att.Override_ClipSize = 60

att.ActivateElements = {"60rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end