att.PrintName = "AUG 45rnd Mag"
att.Icon = Material("vgui/fas2atts/545_45rnd")
att.Description = "A 45-round magazine for AUG A3 and compatible systems"

att.SortOrder = 3

att.AutoStats = true
att.Slot = "fas2_aug_45rnd"

att.MagExtender = true

att.Override_ClipSize = 45

att.ActivateElements = {"45rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end