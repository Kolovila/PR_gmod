att.PrintName = "30rnd Stanag Mag"
att.Icon = Material("vgui/fas2atts/stanag")
att.Description = "A 30-round metal magazine for 5.56x45MM and compatible systems"

att.SortOrder = 1

att.AutoStats = true
att.Slot = "fas2_stanag"

att.MagReducer = true

att.Override_ClipSize = 30

att.ActivateElements = {"stanag"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end