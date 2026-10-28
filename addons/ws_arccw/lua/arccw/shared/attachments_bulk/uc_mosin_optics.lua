-- These models have physical lens meshes, rather than ArcCW HSP bodygroups.
-- ArcCW owns sight selection/sensitivity; the client renderer owns the glass.
local optics = {
    {id = "uc_mosin_optic_pe", name = "PE Scope (3x)", model = "a_optic_mn9130_pe_3x", zoom = 3,
        pos = Vector(-2.567, -5, 0.821), time = 1.12},
    {id = "uc_mosin_optic_pu", name = "PU Scope (4x)", model = "a_optic_mn9130_4x", zoom = 4,
        pos = Vector(-2.504, -5, 0.824), time = 1.15},
    {id = "uc_mosin_optic_pu_cloth", name = "Clothwrapped PU Scope (4x)", model = "a_optic_mn9130_4x_cloth", zoom = 4,
        pos = Vector(-2.504, -5, 0.824), time = 1.15},
}

for index, optic in ipairs(optics) do
    local att = {}
    att.PrintName = optic.name
    local icon = string.sub(optic.id, #"uc_mosin_" + 1)
    att.Icon = Material("entities/att/uc_mosin/" .. icon .. ".png", "smooth mips")
    att.Description = "A fixed-power telescopic sight mounted to the Mosin sniper receiver."
    att.Slot = "uc_mosin_optic"
    att.RequireFlags = {"mosin_sniper"}
    att.AutoStats = true
    att.SortOrder = 300 + index
    att.Desc_Pros = {"autostat.zoom"}
    att.Model = "models/weapons/comradebear/ww2/att/" .. optic.model .. ".mdl"
    att.BoneMerge = true
    att.UCMosinNativeOptic = true
    att.Mult_SightTime = optic.time
    att.Mult_SightedSpeedMult = 0.9
    att.KeepBaseIrons = true
    att.BaseIronsFirst = false
    att.AdditionalSights = {{
        Pos = optic.pos,
        Ang = Angle(0, 0, 0),
        GlobalPos = true,
        GlobalAng = true,
        Magnification = 1,
        ScopeMagnification = optic.zoom,
        MagnifiedOptic = true,
        ViewModelFOV = 55,
        CrosshairInSights = false,
        UCMosinScope = true,
        SwitchToSound = "",
        SwitchFromSound = "",
    }}
    att.DrawFunc = function(wep, element, world)
        if UCMosinOptics then UCMosinOptics.DrawModel(wep, element, world) end
    end
    ArcCW.LoadAttachmentType(att, optic.id)
end
