att.PrintName = "MP-153 7rnd Tube"
att.Icon = Material("vgui/fas2atts/tube")
att.Description = ""
att.SortOrder = 2

att.AutoStats = true
att.Slot = "fas2_mp153_tube"

att.MagExtender = true

att.Override_ClipSize = 7

att.ActivateElements = {"7rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end