att.PrintName = "SG551 Intergrated Scope"
att.Description = "No, I'm not kidding. Boo. Aboba"

att.Slot = "firearms2_sg551"

att.Model = "models/weapons/fas2/attachments/sg551_hsp.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(-0.001, 2.2, 0.003),
        Ang = Angle(0, 0, 0),
        Magnification = 2.25,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 4,
        ZoomSound = "fas2/sr25/sr25_safety.wav",
    }
}

att.ScopeGlint = true

att.Holosight = true
att.HolosightReticle = Material("sprites/fas2/scopes/leupold")
att.HolosightNoFlare = true
att.HolosightSize = 13
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/fas2/attachments/sg551_hsp.mdl"

att.HolosightMagnification = 12
att.HolosightBlackbox = true

att.HolosightMagnificationMin = 2
att.HolosightMagnificationMax = 12