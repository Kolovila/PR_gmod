att.PrintName = "PSO-1"
att.Icon = Material("vgui/fas2atts/pso1")
att.Description = "The PSO-1 is a telescopic sight with 4x magnification"
att.SortOrder = 3

att.Desc_Pros = {
    "Precision sight picture",
    "4x magnification",
    "Can be switched ON or OFF (Double E)"
}
att.Desc_Cons = {
    "Visible scope glint"
}

att.Slot = "fas2_scope_pso1"

att.Model = "models/weapons/fas2/attachments/pso1.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0.06, 8.1, -0.557),
        Ang = Angle(0, 0, 0),
        Magnification = 1,
        HolosightData = {
            Holosight = true,
			HolosightMagnification = 12,
			HolosightReticle = Material("sprites/fas2/scopes/pso_off"),
            HolosightSize = 7.3,
            HolosightBlackbox = true,
            HolosightMagnificationMin = 2,
            HolosightMagnificationMax = 4,
            Colorable = true,
            HolosightPiece = "models/weapons/fas2/attachments/pso1_hsp.mdl"
        },
    },
    {
        Pos = Vector(0.06, 8.1, -0.557),
        Ang = Angle(0, 0, 0),
        Magnification = 1,	
        HolosightData = {
            Holosight = true,
			HolosightMagnification = 12,
			HolosightReticle = Material("sprites/fas2/scopes/pso_on"),
            HolosightSize = 7.3,
            HolosightBlackbox = true,
            HolosightMagnificationMin = 2,
            HolosightMagnificationMax = 4,
            Colorable = true,
            HolosightPiece = "models/weapons/fas2/attachments/pso1_hsp.mdl"
        },
    },	
}

att.ScopeGlint = true

att.Mult_GlintMagnitude = 1

att.Holosight = true
att.HolosightReticle = Material("sprites/fas2/scopes/pso_on")
att.HolosightNoFlare = true
att.HolosightSize = 27
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/fas2/attachments/pso1_hsp.mdl"

att.HolosightMagnification = 12
att.HolosightBlackbox = true

att.HolosightConstDist = 64

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"