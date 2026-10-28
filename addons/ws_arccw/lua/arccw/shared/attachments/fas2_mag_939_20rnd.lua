att.PrintName = "9x39 20Rnd Mag"
att.Icon = Material("vgui/fas2atts/stanag")
att.Description = "A 20-round polymer magazine for 9x39MM rifles and compatible systems"

att.SortOrder = 2

att.AutoStats = true
att.Slot = "fas2_9x39_mags"

att.MagExtender = true

att.Override_ClipSize = 20

att.ActivateElements = {"20rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end