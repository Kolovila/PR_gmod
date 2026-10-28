att.PrintName = "MP5A5 Handguard W/Light"
att.Icon = Material("vgui/fas2atts/inforce_light")
att.Description = "The handguard with integrated flashlight designed for work in low light conditions"

att.SortOrder = 1

att.Desc_Pros = {
    "Provides artificial lighting in dark places"
}
att.Desc_Cons = {
    "Reveals out your location"
}

att.Slot = "fas2_mp5a5_light"

att.Model = "models/weapons/fas2/attachments/inforce_light.mdl"

att.Flashlight = true
att.FlashlightHFOV = 60
att.FlashlightVFOV = 60
att.FlashlightFarZ = 768
att.FlashlightTexture = "effects/flashlight001"
att.FlashlightBrightness = 1.5
att.FlashlightBone = "light"


att.ToggleStats = {
    {
        PrintName = "On",
        Flashlight = true
    },
    {
        PrintName = "Off",
        Flashlight = false,
    }
}

att.ActivateElements = {"handguard_light"}

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"