att.PrintName = "INSIGHT X2"
att.Icon = Material("vgui/fas2atts/insight")
att.Description = "The Insight X2 is a portable laser sight and electric light designed for picatinny rails"

att.Desc_Pros = {
    "Accuracy of shooting from the hip"
}
att.Desc_Cons = {
    "Reveals out your location"
}

att.Slot = "fas2_pistol_tactical"

att.Model = "models/weapons/fas2/attachments/insight.mdl"

att.Laser = false
att.LaserStrength = 0.5
att.LaserBone = "laser"
att.LaserColor = Color(255, 0, 0)

att.Flashlight = false
att.FlashlightHFOV = 45
att.FlashlightVFOV = 45
att.FlashlightFarZ = 768
att.FlashlightTexture = "effects/flashlight001"
att.FlashlightBrightness = 1
att.FlashlightBone = "light"

att.ToggleStats = {
    {
        PrintName = "Laser",
        Laser = true,
    },
    {
        PrintName = "Flashlight",
        Flashlight = true,
    },
    {
        PrintName = "Both",
        Laser = true,
        Flashlight = true,
    },
    {
        PrintName = "Off",
        Laser = false,
        Flashlight = false,
    }
}

att.Mult_HipDispersion = 0.95

att.ActivateElements = {"mount"}

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"