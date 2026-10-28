att.PrintName = "Canted Ironsights"
att.Icon = Material("vgui/fas2atts/cantedironsight")
att.Description = "The canted ironsight is an side accessory rail attachment designed for close quarters combat"

att.Desc_Pros = {
    "The ability to switch from the main sight to the side (Double E)"
}

att.Slot = "fas2_cantedsight"

att.Model = "models/weapons/fas2/attachments/canted_ironsight.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(-0.47, 9, -1.07),
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