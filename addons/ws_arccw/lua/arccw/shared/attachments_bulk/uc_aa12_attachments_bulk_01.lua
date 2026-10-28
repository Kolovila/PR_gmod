do
    local att = {}

    att.PrintName = "18\" Double Barrel"
    att.AbbrevName = "18\" Double Barrel"
    att.SortOrder = 20

    att.Description =
        "A second full-length barrel that discharges alongside the first. Each trigger pull fires two complete shell loads and consumes two shells, delivering brutal output at the cost of recoil, weight, and ammunition economy."
    att.Slot = "uc_aa12_barrel"
    att.AutoStats = true
    att.HideIfBlocked = true

    att.Mult_Recoil = 1.45
    att.Mult_RecoilSide = 1.20
    att.Mult_VisualRecoilMult = 1.35
    att.Mult_SightTime = 1.15
    att.Mult_Sway = 1.20
    att.Mult_SpeedMult = 0.92
    att.Mult_SightedSpeedMult = 0.88
    att.Mult_ShootSpeedMult = 0.90

    att.Override_Firemodes = {
        {
            Mode = 2,
            Mult_Num = 2,
            Override_AmmoPerShot = 2,
            AutoStats = true,
        },
        {
            Mode = 0,
        },
    }

    att.GivesFlags = { "aa12_twin_barrel" }
    att.ActivateElements = { "barrel_double" }

    att.Icon = Material("entities/att/" .. "uc_aa12_barrel_double" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_aa12_barrel_double")
end

do
    local att = {}

    att.PrintName = "18\" Double-Ported Barrel"
    att.AbbrevName = "18\" Double-Ported Barrel"
    att.SortOrder = 18

    att.Description =
        "Twin full-length barrels with integral porting. Each trigger pull fires two complete shell loads and consumes two shells; the ports tame some of the doubled impulse, but the assembly remains heavy and ammunition-hungry."
    att.Slot = "uc_aa12_barrel"
    att.AutoStats = true
    att.HideIfBlocked = true

    att.Mult_Recoil = 1.15
    att.Mult_RecoilSide = 0.95
    att.Mult_VisualRecoilMult = 1.10
    att.Mult_ShootVol = 1.15
    att.Mult_SightTime = 1.20
    att.Mult_Sway = 1.25
    att.Mult_SpeedMult = 0.90
    att.Mult_SightedSpeedMult = 0.85
    att.Mult_ShootSpeedMult = 0.88

    att.Override_Firemodes = {
        {
            Mode = 2,
            Mult_Num = 2,
            Override_AmmoPerShot = 2,
            AutoStats = true,
        },
        {
            Mode = 0,
        },
    }

    att.GivesFlags = { "aa12_integral_ports", "aa12_twin_barrel" }
    att.ActivateElements = { "barrel_doubleported" }

    att.Icon = Material("entities/att/" .. "uc_aa12_barrel_doubleported" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_aa12_barrel_doubleported")
end

do
    local att = {}

    att.PrintName = "18\" Ported Barrel"
    att.AbbrevName = "18\" Ported Barrel"
    att.SortOrder = 19

    att.Description =
        "A factory-length barrel with integral expansion ports. It keeps muzzle rise in check during automatic fire, but produces a harsher report and cannot accept a separate muzzle device."
    att.Slot = "uc_aa12_barrel"
    att.AutoStats = true
    att.HideIfBlocked = true

    att.Mult_Recoil = 0.86
    att.Mult_RecoilSide = 0.90
    att.Mult_ShootVol = 1.10
    att.Mult_SightTime = 1.03
    att.Mult_Sway = 0.95

    att.GivesFlags = { "aa12_integral_ports" }
    att.ActivateElements = { "barrel_ported" }

    att.Icon = Material("entities/att/" .. "uc_aa12_barrel_ported" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_aa12_barrel_ported")
end

do
    local att = {}

    att.PrintName = "100-Round Drum Magazine"
    att.AbbrevName = "100-Round Drum"
    att.SortOrder = 10

    att.Description =
        "A cursed high-capacity drum built for sustained automatic fire. One hundred shells make the weapon exceptionally heavy, slow, unbalanced, and cumbersome to reload."
    att.Slot = "uc_aa12_mag"
    att.AutoStats = true
    att.HideIfBlocked = true

    att.Override_ClipSize = 100
    att.Mult_SightTime = 1.45
    att.Mult_ReloadTime = 1.65
    att.Mult_Sway = 2.20
    att.Mult_SpeedMult = 0.74
    att.Mult_SightedSpeedMult = 0.68
    att.Mult_ShootSpeedMult = 0.70
    att.Mult_DrawTime = 1.45
    att.Mult_HolsterTime = 1.45
    att.Mult_HipDispersion = 1.40
    att.Mult_RecoilSide = 1.15
    att.Mult_MalfunctionMean = 0.75

    att.ActivateElements = { "mag_100" }

    att.Hook_SelectReloadAnimation = function(wep, anim)
        if anim == "reload" or anim == "reload_empty" then
            return anim .. "_drum"
        end
    end

    att.Icon = Material("entities/att/" .. "uc_aa12_mag_100" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_aa12_mag_100")
end

do
    local att = {}

    att.PrintName = "20-Round Drum Magazine"
    att.AbbrevName = "20-Round Drum"
    att.SortOrder = 20

    att.Description =
        "A compact drum that more than doubles standard capacity. Its bulk slows handling and reloads, but it remains practical enough for sustained automatic fire."
    att.Slot = "uc_aa12_mag"
    att.AutoStats = true
    att.HideIfBlocked = true

    att.Override_ClipSize = 20
    att.Mult_SightTime = 1.16
    att.Mult_ReloadTime = 1.20
    att.Mult_Sway = 1.30
    att.Mult_SpeedMult = 0.93
    att.Mult_SightedSpeedMult = 0.90
    att.Mult_ShootSpeedMult = 0.91
    att.Mult_DrawTime = 1.14
    att.Mult_HolsterTime = 1.14
    att.Mult_HipDispersion = 1.10

    att.ActivateElements = { "mag_20" }

    att.Hook_SelectReloadAnimation = function(wep, anim)
        if anim == "reload" or anim == "reload_empty" then
            return anim .. "_drum"
        end
    end

    att.Icon = Material("entities/att/" .. "uc_aa12_mag_20" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_aa12_mag_20")
end

do
    local att = {}

    att.PrintName = "5-Round Compact Magazine"
    att.AbbrevName = "5-Round Magazine"
    att.SortOrder = 30

    att.Description =
        "A short magazine for a lighter, less obstructive weapon. Capacity is severely limited, but every handling operation becomes faster."
    att.Slot = "uc_aa12_mag"
    att.AutoStats = true
    att.HideIfBlocked = true

    att.Override_ClipSize = 5
    att.Mult_SightTime = 0.88
    att.Mult_ReloadTime = 0.82
    att.Mult_Sway = 0.88
    att.Mult_SpeedMult = 1.06
    att.Mult_SightedSpeedMult = 1.08
    att.Mult_ShootSpeedMult = 1.06
    att.Mult_DrawTime = 0.88
    att.Mult_HolsterTime = 0.88

    att.ActivateElements = { "mag_5" }

    att.Icon = Material("entities/att/" .. "uc_aa12_mag_5" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_aa12_mag_5")
end

do
    local att = {}

    att.PrintName = "Stockless Endcap"
    att.AbbrevName = "Stockless"
    att.SortOrder = 10

    att.Description =
        "Removes the shoulder stock for maximum compactness. The constant-recoil action remains usable, but the weapon becomes much less stable outside close quarters."
    att.Slot = "uc_aa12_stock"
    att.AutoStats = true
    att.HideIfBlocked = true

    att.Add_BarrelLength = -4
    att.Mult_SightTime = 0.78
    att.Mult_DrawTime = 0.82
    att.Mult_HolsterTime = 0.82
    att.Mult_SpeedMult = 1.08
    att.Mult_SightedSpeedMult = 1.10
    att.Mult_ShootSpeedMult = 1.08
    att.Mult_HipDispersion = 0.82
    att.Mult_Recoil = 1.28
    att.Mult_RecoilSide = 1.45
    att.Mult_AccuracyMOA = 1.15
    att.Mult_Sway = 1.45

    att.ActivateElements = { "stock_none" }

    att.Icon = Material("entities/att/" .. "uc_aa12_stock_none" .. ".png", "mips smooth")

    ArcCW.LoadAttachmentType(att, "uc_aa12_stock_none")
end
