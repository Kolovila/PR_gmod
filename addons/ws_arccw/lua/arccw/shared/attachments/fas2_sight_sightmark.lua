att.PrintName = "Sightmark SM13003B-DT"
att.Icon = Material("vgui/fas2atts/sightmark")
att.Description = "The Sightmark SM13003B-DT is a Three Lines Sight weapon sight developed for picatinny accessory rails."

att.SortOrder = 11

att.Desc_Pros = {
    "Increasing aiming mobility",
    "Provides comfortable aiming reticle"
}
att.Desc_Cons = {
    "Doesn't provide magnification",
    "Doesn't support reticles switching"
}

att.Slot = "fas2_sight"

att.Model = "models/weapons/fas2/attachments/kobrards.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(-0.007, 6.5, -0.92),
        Ang = Angle(0, 0, 0),
        Magnification = 1,
        ScrollFunc = ArcCW.SCROLL_NONE,
        IgnoreExtra = true,
        HolosightBone = "holosight",
        HolosightData = {
            Holosight = true,
            HolosightReticle =  Material("sprites/fas2/sights/cobrards"),
            HolosightNoFlare = true,
            HolosightSize = 1.5,
            HolosightNoHSP = true
        },
    },
    -- {
    --     Pos = Vector(-0.007, 6.5, -0.92),
    --     Ang = Angle(0, 0, 0),
    --     Magnification = 1,
    --     ScrollFunc = ArcCW.SCROLL_NONE,
    --     IgnoreExtra = true,
    --     HolosightBone = "holosight",
    --     HolosightData = {
    --         Holosight = true,
    --         HolosightReticle =  Material("sprites/fas2/sights/cmore"),
    --         HolosightNoFlare = true,
    --         HolosightSize = 1.5,
    --         HolosightNoHSP = true
    --     },
    -- },
    -- {
    --     Pos = Vector(-0.007, 6.5, -0.92),
    --     Ang = Angle(0, 0, 0),
    --     Magnification = 1,
    --     ScrollFunc = ArcCW.SCROLL_NONE,
    --     IgnoreExtra = true,
    --     HolosightBone = "holosight",
    --     HolosightData = {
    --         Holosight = true,
    --         HolosightReticle =  Material("sprites/fas2/sights/dot"),
    --         HolosightNoFlare = true,
    --         HolosightSize = 1.5,
    --         HolosightNoHSP = true
    --     },
    -- },
}


att.ActivateElements = {"mount"}

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"