att.PrintName = "5.45 45rnd Mag"
att.Icon = Material("vgui/fas2atts/545_45rnd")
att.Description = "A 45-round bakelite magazine for 5.45x39MM rifles and compatible systems"

att.SortOrder = 2

att.AutoStats = true
att.Slot = "fas2_545_45rnd"

att.MagExtender = true

att.Override_ClipSize = 45

att.ActivateElements = {"45rnd"}

att.Hook_Compatible = function(wep)
    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
end