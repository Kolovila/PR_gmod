local att = {}
att.PrintName = "PKS-7 Rifle Scope (4x)"
att.AbbrevName = "PKS-7 (4x)"
att.Description =
    "A fixed-power rifle scope with a simple illuminated chevron. A rail adapter permits use on other rifles. Good target visibility at medium range, with slower sighting and aimed movement."
att.Slot = { "optic", "optic_sniper" }
att.Icon = Material("entities/att/uc_ndm86_optic_pks7.png", "mips smooth")
att.SortOrder = 4
att.AutoStats = true
att.Desc_Pros = { "autostat.holosight", "autostat.zoom" }
att.Model = "models/weapons/arccw/atts/uc_ndm86_pks7.mdl"
att.ModelOffset = Vector(0, 0, 0)
att.ModelScale = Vector(1, 1, 1)
att.HolosightPiece = "models/weapons/arccw/atts/uc_ndm86_pks7_hsp.mdl"
att.Mult_SightTime = 1.18
att.Mult_SightedSpeedMult = 0.78
att.Colorable = true
att.AdditionalSights = {
    {
        Pos = Vector(0.020212, 12, -0.859182),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ViewModelFOV = 38,
        IgnoreExtra = true,
        CrosshairInSights = false,
        HolosightBone = "holosight",
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/uc_ndm86_pks7.png", "smooth"),
            HolosightNoFlare = true,
            HolosightSize = 32,
            HolosightPiece = "models/weapons/arccw/atts/uc_ndm86_pks7_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = UC_HalfScope(4),
            Colorable = true,
        },
    },
}
ArcCW.LoadAttachmentType(att, "uc_ndm86_optic_pks7")
