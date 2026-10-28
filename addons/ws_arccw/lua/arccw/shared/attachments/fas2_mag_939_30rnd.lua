att.PrintName = "SR-3M 30Rnd Mag"
att.Icon = Material("vgui/fas2atts/stanag")
att.Description = "A 30-round steel magazine for 9x39MM rifles and compatible systems"

att.SortOrder = 1

att.AutoStats = true
att.Slot = "fas2_9x39_mags"

att.MagExtender = true

att.Override_ClipSize = 30

att.ActivateElements = {"30rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end