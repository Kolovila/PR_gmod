att.PrintName = "Leupold"
att.Icon = Material("vgui/fas2atts/mk4")
att.Description = "The leupold MK4 is adjustable medium to long range optic with 8x magnification"

att.Desc_Pros = {
    "Precision sight picture",
    "8x magnification",
}
att.Desc_Cons = {
    "Visible scope glint"
}

att.Slot = "fas2_leupold2_scope"

att.Model = "models/weapons/fas2/attachments/leupold2.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(-0.04, 6, -1.105),
        Ang = Angle(0, 0, 0),
        Magnification = 2,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 4,
        ZoomSound = "fas2/sks/sks_insertlast.wav",
    }
}

att.ScopeGlint = true

att.Mult_GlintMagnitude = 1

att.Holosight = true
att.HolosightReticle = Material("sprites/fas2/scopes/leupold")
att.HolosightNoFlare = true
att.HolosightSize = 12
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/fas2/attachments/leupold2_hsp.mdl"

att.HolosightMagnification = 8
att.HolosightBlackbox = true

att.ActivateElements = {"mount"}

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"