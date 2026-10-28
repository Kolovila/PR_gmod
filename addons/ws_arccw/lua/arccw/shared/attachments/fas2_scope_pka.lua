att.PrintName = "PK-A"
att.Icon = Material("vgui/fas2atts/pka")
att.Description = "The PK-A is a common Russian mid-range scope with a dot reticule and 3.4x zoom"

att.SortOrder = 2

att.Desc_Pros = {
    "Precision sight picture",
    "3.4x magnification",
}
att.Desc_Cons = {
    "Doesn't support reticles switching"
}

att.Slot = "fas2_scope"

att.Model = "models/weapons/fas2/attachments/pka.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(-0.005, 5.8, -0.994),
        Ang = Angle(0, 0, 0),
        Magnification = 1,
        ZoomLevels = 1,
    }
}

att.Holosight = true
att.HolosightReticle = Material("sprites/fas2/scopes/pka")
att.HolosightNoFlare = true
att.HolosightSize = 8
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/fas2/attachments/pka_hsp.mdl"

att.HolosightMagnification = 2
att.HolosightBlackbox = true

att.ActivateElements = {"mount"}

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"