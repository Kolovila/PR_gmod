 
local ironSights = {
    exposed = {Pos = Vector(-2.815, 0, 1.304159087), Ang = Angle(-0.020791451, 0, 0), Magnification = 1.1, SwitchToSound = ""},
    tactical_A4 = {Pos = Vector(-2.815, 0, 1.303293931), Ang = Angle(-0.016466501, 0, 0), Magnification = 1.1, SwitchToSound = ""},
    smg = {Pos = Vector(-2.815, 0, 1.679263852), Ang = Angle(-1.895264673, 0, 0), Magnification = 1.1, SwitchToSound = ""},
    m4 = {Pos = Vector(-2.815, 0, 1.612519614), Ang = Angle(-1.561911914, 0, 0), Magnification = 1.1, SwitchToSound = ""},
    wood = {Pos = Vector(-2.815, 0, 1.534136561), Ang = Angle(-1.170295921, 0, 0), Magnification = 1.1, SwitchToSound = ""},
    wood_short = {Pos = Vector(-2.815, 0, 1.619441197), Ang = Angle(-1.596486925, 0, 0), Magnification = 1.1, SwitchToSound = ""},
    cursed = {Pos = Vector(-2.815, 0, -0.610558938), Ang = Angle(9.463946454, 0, 0), Magnification = 1.1, SwitchToSound = ""},
}
 
 
local barrelNames = {
    {"smg", "SMG Barrel", 0.65, 0.8, "Compact barrel and ribbed handguard for a lighter, quicker-handling rifle."},
    {"exposed", "Exposed Barrel", 0.9, 0.9, "Open barrel assembly with a minimal handguard and exposed front-end hardware."},
    {"cursed", "Cursed Barrel", 0.5, 0.7, "A bent barrel that drops the muzzle below the receiver before pointing forward. Fires parallel to the sights from a lower position: useful beneath obstacles, but low cover can catch your shots."},
    {"m4", "M4 Barrel Assembly", 0.8, 0.85, "Carbine-length barrel with a ribbed handguard and fixed front sight."},
    {"tactical_A4", "M16A4 Barrel Assembly", 1, 1.05, "Rifle-length barrel with a ventilated rail handguard and fixed front sight."},
    {"wood", "Wooden Barrel and Rail", 1, 1.1, "Rifle-length barrel with a walnut handguard, metal fittings, and an integral rail."},
    {"wood_short", "Short Wooden Barrel and Rail", 0.75, 0.9, "Short barrel with a walnut handguard and integral rail for a compact wooden front end."},
}
for index, config in ipairs(barrelNames) do
    local att = {}
    att.PrintName = config[2]
    att.AbbrevName = config[2]
    att.Icon = Material("entities/att/ux_ud_m16_barrel_" .. config[1] .. ".png", "smooth mips")
    att.ActivateElements = {"ux_m16_muzzle_" .. config[1]}
    att.Description = config[5]
    att.Override_IronSightStruct = ironSights[config[1]]
    att.Slot = "ud_m16_blen"
    att.AutoStats = true
    att.SortOrder = -50
    att.Mult_Range = config[3]
    att.Mult_SightTime = config[4]
    att.Override_MuzzleEffectAttachment = 5 + index
    if config[1] == "cursed" then
        att.Desc_Pros = {"Shoots from a lowered muzzle"}
        att.Desc_Cons = {"Low cover can obstruct shots"}
         
         
         
        att.GivesFlags = {"ux_m16_integral_barrel", "ux_m16_lowered_bore"}
    else
        att.GivesFlags = {"ux_m16_integral_barrel"}
    end
    if config[1] == "exposed" then
        att.LHIK = true
        att.LHIKHide = true
    end
    if config[1] == "wood" or config[1] == "wood_short" then
        att.LHIK = true
        att.Model = "models/weapons/arccw/atts/ux_restored_" .. (config[1] == "wood" and "wood" or "wood_short") .. "_lhik.mdl"
    end
    att.ExcludeFlags = {"m16_usas", "upper_50bmg"}
    att.Hook_GetDefaultAttName = function(wep, slot)
        if slot == 3 then return "Integral Handguard" end
    end
    ArcCW.LoadAttachmentType(att, "ux_ud_m16_barrel_" .. config[1])
end

do
    local att = {}
    att.PrintName = "M79 Double Barrel"
    att.AbbrevName = "Double Barrel"
    att.Icon = Material("entities/att/ux_ud_m79_barrel_double.png", "smooth mips")
    att.Description = "Over-and-under assembly with two loaded tubes and an optic rail. Fires one grenade per trigger pull; a reload loads both tubes together."
    att.Slot = "ud_m79_barrel"
    att.ActivateElements = {"ux_m79_double"}
    att.GivesFlags = {"ux_m79_double"}
    att.ExcludeFlags = {"m79_poly", "m79_pirategun"}
    att.Override_ClipSize = 2
    att.Mult_SightTime = 1.2
    att.Mult_SpeedMult = 0.95
    att.Mult_ReloadTime = 1.3
    att.AutoStats = true
    ArcCW.LoadAttachmentType(att, "ux_ud_m79_barrel_double")
end
