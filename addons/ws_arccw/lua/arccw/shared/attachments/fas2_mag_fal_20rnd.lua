att.PrintName = "FAL/SA-58 20rnd Mag"
att.Icon = Material("vgui/fas2atts/fnfal20mag")
att.Description = "A 20-round double stack steel magazine for a FAL/SA-58 rifles and compatible systems"

att.SortOrder = 2

att.AutoStats = true
att.Slot = "fas2_falmag"

att.MagExtender = true 

att.Override_ClipSize = 20

att.ActivateElements = {"mag"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end