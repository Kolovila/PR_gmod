att.PrintName = "5.56 60rnd Pmag"
att.Icon = Material("vgui/fas2atts/pmag60")
att.Description = "A 60-round polymer drum Magpul magazine for 5.56x45MM and compatible systems"

att.SortOrder = 1

att.AutoStats = true
att.Slot = "fas2_556_60rnd"

att.MagExtender = true

att.Override_ClipSize = 60

att.ActivateElements = {"60rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end