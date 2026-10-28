do
    local att = {}
    att.PrintName = "RPK-12 23\" Heavy Barrel with Bipod"
    att.AbbrevName = "23\" RPK-12 Heavy Barrel"
    att.Icon = Material("entities/att/uc_rpk12/barrel.png", "smooth mips")
    att.Description = "Reference-based early RPK-12 heavy front end with a folding, deployable bipod. Improves sustained-fire stability and reach, at the cost of handling. Uses the native UC RPK nominal barrel configuration; exact prototype dimensions are undocumented. Handguard and stock are selected separately."
    att.Slot = "ur_ak_barrel"
    att.AutoStats = true
    att.SortOrder = 23.1
    att.ActivateElements = {"ux_ak_barrel_rpk12"}
    att.GivesFlags = {"ak_barrelchange", "uc_noubgl", "ux_rpk12_barrel"}
    att.Add_BarrelLength = 5
    att.Mult_SightTime = 1.2
    att.Mult_SpeedMult = .95
    att.Mult_SightedSpeedMult = .8
    att.Mult_Sway = 1.5
    att.Mult_Recoil = .8
    att.Mult_AccuracyMOA = .7
    att.Mult_Range = 1.5
    att.Mult_MalfunctionMean = 2
    att.Mult_HipDispersion = 1.5
    att.Bipod = true
    att.Mult_BipodRecoil = .25
    att.Mult_BipodDispersion = .2
    ArcCW.LoadAttachmentType(att, "ux_ak_barrel_rpk12")
end

do
    local att = {}
    att.PrintName = "RPK-12 Ventilated Handguard"
    att.Icon = Material("entities/att/uc_rpk12/handguard.png", "smooth mips")
    att.Description = "Long, contoured polymer handguard based on the prototype reference. Features cooling slots, defined moulded side ribs and a standard-pitch upper rail."
    att.Slot = "ur_ak_hg"
    att.AutoStats = true
    att.ActivateElements = {"ux_ak_hg_rpk12"}
    att.GivesFlags = {"ak_railedguard", "nodong"}
    att.RequireFlags = {"ux_rpk12_barrel"}
    att.HideIfBlocked = true
    att.Mult_Sway = .9
    att.Mult_ShootSpeedMult = 1.05
    att.LHIK = true
    att.Model = "models/weapons/arccw/ak_lhik_u.mdl"
    att.ModelOffset = Vector(-22, -3.4, 3.3)
    att.OffsetAng = Angle(5, 0, 0)
    ArcCW.LoadAttachmentType(att, "ux_ak_hg_rpk12")
end

do
    local att = {}
    att.PrintName = "RPK-12 Heavy Windowed Stock"
    att.Icon = Material("entities/att/uc_rpk12/stock.png", "smooth mips")
    att.Description = "Broad prototype stock with a substantial cheek support, an open lower window, recessed sling hardware and a textured rubber shoulder pad. A stable support for sustained fire."
    att.Slot = "ur_ak_stock"
    att.AutoStats = true
    att.ActivateElements = {"ux_ak_stock_rpk12"}
    att.Mult_Recoil = .9
    att.Mult_Sway = .75
    att.Mult_MoveDispersion = .9
    att.Mult_SightTime = 1.12
    ArcCW.LoadAttachmentType(att, "ux_ak_stock_rpk12")
end
