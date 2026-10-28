att.PrintName = "Acog"
att.Icon = Material("vgui/fas2atts/acog")
att.Description = "The ACOG is a series of rifle prismatic telescopic sights with 4x magnification"

att.SortOrder = 4

att.Desc_Pros = {
    "Precision sight picture",
    "4x magnification",
}
att.Desc_Cons = {
    "Visible scope glint"
}

att.Slot = "fas2_scope"

att.Model = "models/weapons/fas2/attachments/acog.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(-0.01, 5, -1.065),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
    }
}

att.ScopeGlint = true

att.Mult_GlintMagnitude = 0.5

att.Holosight = true
att.HolosightReticle = Material("sprites/fas2/scopes/acog")
att.HolosightNoFlare = true
att.HolosightSize = 9.1
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/fas2/attachments/acog_hsp.mdl"

att.HolosightMagnification = 4
att.HolosightBlackbox = true

att.ActivateElements = {"mount"}

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"