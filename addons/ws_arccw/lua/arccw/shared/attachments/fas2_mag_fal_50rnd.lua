att.PrintName = "X-FAL/SA-58 50rnd Mag"
att.Icon = Material("vgui/fas2atts/xfal_50rnd")
att.Description = "A 50-round drum magazine for a FAL/SA-58 rifles and compatible systems"

att.SortOrder = 1

att.AutoStats = true
att.Slot = "fas2_xfal_50rnd"

att.MagExtender = true

att.Override_ClipSize = 50

att.ActivateElements = {"50rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end