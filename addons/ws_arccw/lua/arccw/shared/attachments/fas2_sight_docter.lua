att.PrintName = "Docter Sight"
att.Icon = Material("vgui/fas2atts/docter")
att.Description = "The Delta Point is a triangle style sight developed for pistol accessory rails"

att.Desc_Pros = {
    "Slighty increasing aiming mobility",
    "Provides comfortable Triangle reticle"
}
att.Desc_Cons = {
    "Doesn't provide magnification",
    "Doesn't support reticles switching"
}

att.Slot = "fas2_pistol_sight"

att.Model = "models/weapons/fas2/attachments/doctersight.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(-0.013, 7.613, -0.56),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,
        IgnoreExtra = true
    }
}

att.Holosight = true
att.HolosightReticle = Material("sprites/fas2/sights/tria")
att.HolosightNoFlare = true
att.HolosightSize = 1.5
att.HolosightBone = "holosight"
att.HolosightNoHSP = true

att.ActivateElements = {"mount"}

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"