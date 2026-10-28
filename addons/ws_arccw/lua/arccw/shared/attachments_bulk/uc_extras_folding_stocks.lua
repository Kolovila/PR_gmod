do
 local att = {}
att.PrintName = "Mini-14 GB Folding Stock"
att.AbbrevName = "Folding Stock"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot 812 Folding Stock"
end

att.Icon = Material("entities/att/acwatt_ud_mini14_stock_tactical_wood.png", "smooth mips")
att.Description = "Chassis replacement installed with both a pistol grip and exotic folding stock to improve deployment and movement speed; the stock, however, is rather unwieldy due to its shape."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_stock"

att.AutoStats = true

att.Mult_SightTime = 0.9
att.Mult_SpeedMult = 1.15
att.Mult_SightedSpeedMult = 1.1
att.Mult_DrawTime = 0.7
att.Mult_HolsterTime = 0.7

att.Mult_Recoil = 1.2
att.Mult_Sway = 1.5

 



att.Ignore = false
att.ToggleStats = {
 {PrintName = "Extended", ActivateElements = {"ud_mini14_stock_tactical"}},
 {PrintName = "Folded", ActivateElements = {"ud_mini14_stock_tactical_folded"}, Mult_Recoil = 1.3, Mult_RecoilSide = 1.3, Mult_Sway = 1.5, Mult_SightTime = 0.7, Mult_DrawTime = 0.85, Mult_HolsterTime = 0.85, Mult_SightedSpeedMult = 1.1, Add_BarrelLength = -10}
}

 ArcCW.LoadAttachmentType(att, "ud_mini14_stock_tactical")
end

do
 local att = {}
att.PrintName = "Mini-14 GB Tactical Stock"
att.AbbrevName = "Tactical Stock"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Patriot 812 Tactical Stock"
end

att.Icon = Material("entities/att/acwatt_ud_mini14_stock_tactical.png", "smooth mips")
att.Description = "A lightweight body replacement that improves weapon handling by combining a polymer chassis and a side-folding stock. Prioritizes speed when aiming the sights at the cost of increased recoil."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "ud_mini14_stock"

att.AutoStats = true

att.Mult_SightTime = 0.75
att.Mult_SpeedMult = 1.05
att.Mult_SightedSpeedMult = 1.2
att.Mult_ShootSpeedMult = 1.1

att.Mult_Recoil = 1.33
att.Mult_Sway = 1.2

 



att.Ignore = false
att.ToggleStats = {
 {PrintName = "Extended", ActivateElements = {"ud_mini14_stock_tactical_polymer"}},
 {PrintName = "Folded", ActivateElements = {"ud_mini14_stock_tactical_polymer_folded"}, Mult_Recoil = 1.3, Mult_RecoilSide = 1.3, Mult_Sway = 1.5, Mult_SightTime = 0.7, Mult_DrawTime = 0.85, Mult_HolsterTime = 0.85, Mult_SightedSpeedMult = 1.1, Add_BarrelLength = -10}
}

 ArcCW.LoadAttachmentType(att, "ud_mini14_stock_tactical_polymer")
end
