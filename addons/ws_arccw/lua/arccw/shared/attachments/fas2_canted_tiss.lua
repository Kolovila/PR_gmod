att.PrintName = "Canted Ironsights ''Tiss''"
att.Icon = Material("vgui/fas2atts/cantedironsight")
att.Description = "The canted ironsight is an side accessory rail attachment with integrated tritium designed for close quarters combat with a lack of light"

att.Desc_Pros = {
    "The ability to switch from the telescopic sight to the side (Double E)",
    "Tririum ironsight"
}

att.Slot = "fas2_cantedsight"

att.Model = "models/weapons/fas2/attachments/tiss.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(-0.455, 9, -1.05),
        Ang = Angle(0, 0, -45),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE,
        IgnoreExtra = true
    }
}

att.KeepBaseIrons = true

att.Holosight = false

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"