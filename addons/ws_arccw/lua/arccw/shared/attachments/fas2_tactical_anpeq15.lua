att.PrintName = "AN/PEQ-15"
att.Icon = Material("vgui/fas2atts/anpeq15")
att.Description = "The AN/PEQ-15 is a portable laser sight designed for picatinny rails"

att.SortOrder = 2

att.Desc_Pros = {
    "Accuracy of shooting from the hip"
}
att.Desc_Cons = {
    "Reveals out your location"
}

att.Slot = "fas2_tactical"

att.Model = "models/weapons/fas2/attachments/anpeq15.mdl"

att.Laser = false
att.LaserStrength = 1
att.LaserBone = "laser"
att.LaserColor = Color(0, 255, 0)

att.Mult_HipDispersion = 0.95

att.ToggleStats = {
    {
        PrintName = "On",
        Laser = true
    },
    {
        PrintName = "Off",
        Laser = false,
    }
}

att.ActivateElements = {"handguard"}

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"