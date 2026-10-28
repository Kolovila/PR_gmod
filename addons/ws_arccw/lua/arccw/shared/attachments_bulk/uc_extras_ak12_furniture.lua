for _, row in ipairs({
    {id = "ux_ak_stock_evo", name = "AK-12 EVO Stock", icon = "stock_modern", desc = "Black polymer L-shaped telescoping stock with a rounded comb and ribbed rubber buttpad. A compact shoulder support for the later AK-12 family."},
    {id = "ux_ak_stock_evo_riser", name = "AK-12 EVO Stock with Cheek Riser", icon = "stock_riser", desc = "EVO telescoping stock with the raised tactical cheek piece. Provides a steadier cheek weld for elevated optics, with a small handling penalty."},
}) do
    local att = {}
    att.PrintName = row.name
    att.Icon = Material("entities/att/uc_ak12/" .. row.icon .. ".png", "smooth mips")
    att.Description = row.desc
    att.Slot = "ur_ak_stock"
    att.AutoStats = true
    att.SortOrder = row.id == "ux_ak_stock_evo" and 3 or 4
    att.ActivateElements = {row.id}
    att.Mult_RecoilSide = 0.9
    att.Mult_MoveDispersion = 0.9
    att.Mult_Sway = row.id == "ux_ak_stock_evo" and 0.9 or 0.8
    att.Mult_SightTime = row.id == "ux_ak_stock_evo" and 1.03 or 1.07
    ArcCW.LoadAttachmentType(att, row.id)
end

for _, row in ipairs({
    {id = "ux_ak_barrel_ak12_k", name = "AK-12K / AK-15K 290 mm Barrel", icon = "barrel_290", mm = 290},
    {id = "ux_ak_barrel_ak12_sk", name = "AK-12SK / AK-15SK 228 mm Barrel", icon = "barrel_228", mm = 228},
}) do
    local att, ratio = {}, row.mm / 415
    att.PrintName = row.name
    att.AbbrevName = row.mm .. " mm AK-12 Barrel"
    att.Icon = Material("entities/att/uc_ak12/" .. row.icon .. ".png", "smooth mips")
    att.Description = "Compact AK-12-family barrel with a shortened gas system and repositioned front sight/gas block. Improves handling at the cost of velocity and effective range. Furniture and muzzle devices remain separately selectable."
    att.Slot = "ur_ak_barrel"
    att.AutoStats = true
    att.SortOrder = row.mm / 25.4
    att.ActivateElements = {row.id, "sight_ak12"}
    att.GivesFlags = {"ak_barrelchange", "nodong", row.mm == 290 and "ux_ak12_k_barrel" or "ux_ak12_sk_barrel"}
    att.Add_BarrelLength = (row.mm - 415) / 25.4
     
    att.Mult_PhysBulletMuzzleVelocity = ratio ^ 0.3
    att.Mult_Range = ratio ^ 0.5
    att.Mult_SightTime = ratio ^ 0.35
    att.Mult_Sway = ratio ^ 0.3
    att.Mult_Recoil = row.mm == 290 and 1.1 or 1.2
    att.Mult_AccuracyMOA = row.mm == 290 and 1.12 or 1.25
    ArcCW.LoadAttachmentType(att, row.id)
end

 
for _, row in ipairs({
    {id = "ux_ak_hg_ak12_k", name = "AK-12K Short Handguard", mm = 290},
    {id = "ux_ak_hg_ak12_sk", name = "AK-12SK Subcompact Handguard", mm = 228},
}) do
    local att = {}
    att.PrintName = row.name
    att.Icon = Material("entities/att/uc_ak12/handguard_" .. row.mm .. ".png", "smooth mips")
    att.Description = "Shortened Ratnik handguard for the " .. row.mm .. " mm AK-12-family barrel. Retains the native contoured shell and standard-pitch rail teeth. Select separately from the barrel and receiver."
    att.Slot = "ur_ak_hg"
    att.AutoStats = true
    att.ActivateElements = {row.id}
    att.GivesFlags = {"ak_railedguard", "nodong"}
    att.RequireFlags = {row.mm == 290 and "ux_ak12_k_barrel" or "ux_ak12_sk_barrel"}
    att.HideIfBlocked = true
     
    att.LHIK = true
    att.Model = "models/weapons/arccw/ak_lhik_u.mdl"
    att.ModelOffset = Vector(-22, -3.4, 3.3)
    att.OffsetAng = Angle(5, 0, 0)
    ArcCW.LoadAttachmentType(att, row.id)
end
