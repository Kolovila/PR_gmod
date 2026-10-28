att.PrintName = "5.56 40rnd Pmag"
att.Icon = Material("vgui/fas2atts/pmag40")
att.Description = "A 40-round polymer Magpul magazine for 5.56x45MM and compatible systems"

att.SortOrder = 2

att.AutoStats = true
att.Slot = "fas2_556_40rnd"

att.MagExtender = true

att.Override_ClipSize = 40

att.ActivateElements = {"40rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end