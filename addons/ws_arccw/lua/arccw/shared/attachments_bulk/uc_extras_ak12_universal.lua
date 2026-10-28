do
 local att = {}
 att.PrintName = "AK-12 Kobra Collimator (RDS)"
 att.Icon = Material("entities/att/uc_ak12/collimator.png", "smooth mips")
 att.Description = "Rail-mounted Kobra-style reflex sight with the four original aiming marks: dot, three-bar, dot and chevron, and chevron. Cycle sights to select the reticle."
 att.Slot = "optic"
 att.AutoStats = true
 att.Desc_Pros = {"autostat.holosight"}
 att.Model = "models/weapons/arccw/atts/uc_ak12_collimator.mdl"
 att.HolosightPiece = "models/weapons/arccw/atts/uc_ak12_collimator_hsp.mdl"
 att.AdditionalSights = {}
 local patterns = {"dot", "threebar", "dot_chevron", "chevron"}
 for _, pattern in ipairs(patterns) do
  table.insert(att.AdditionalSights, {Pos = Vector(0, 8, -1.880), Ang = Angle(), Magnification = 1.1,
   ScrollFunc = ArcCW.SCROLL_NONE, CrosshairInSights = false,
   HolosightData = {HolosightReticle = Material("hud/reticles/uc_ak12_kobra_" .. pattern .. ".png", "smooth mips"),
    HolosightPiece = att.HolosightPiece, HolosightNoFlare = true, HolosightSize = pattern == "dot" and 1.5 or 2,
    HolosightBone = "holosight", Colorable = true}})
 end
 att.Holosight = true
 att.HolosightBone = "holosight"
 att.HolosightReticle = Material("hud/reticles/uc_ak12_kobra_dot.png", "smooth mips")
 att.HolosightSize = 1.5
 att.HolosightNoFlare = true
 att.Colorable = true
 att.Mult_SightTime = 1.05
 att.Mult_SightedSpeedMult = 0.95
 ArcCW.LoadAttachmentType(att, "uc_optic_ak12_collimator")
end

do
 local att = {}
 att.PrintName = "AK-12 Muzzle Brake"
 att.Icon = Material("entities/att/uc_ak12/muzzle.png", "smooth mips")
 att.Description = "A rail-family muzzle brake that vents propellant gas to reduce recoil. It adds length and makes hip fire less forgiving."
 att.Slot = "muzzle"
 att.AutoStats = true
 att.Model = "models/weapons/arccw/atts/uc_ak12_muzzle.mdl"
 att.IsMuzzleDevice = true
 att.Override_MuzzleEffectAttachment = 1
 att.Mult_Recoil = 0.85
 att.Mult_RecoilSide = 0.8
 att.Mult_HipDispersion = 1.1
 att.Add_BarrelLength = 2.772
 att.Mult_ShootVol = 1.1
 att.Override_MuzzleEffect = "muzzleflash_4"
 ArcCW.LoadAttachmentType(att, "uc_muzzle_ak12_brake")
end

do
 local att = {}
 att.PrintName = "AK-12 Vertical Foregrip"
 att.Icon = Material("entities/att/uc_ak12/foregrip.png", "smooth mips")
 att.Description = "A vertical rail grip for a steadier support-hand hold. Improves recoil control at the cost of aiming and weapon handling speed."
 att.Slot = "foregrip"
 att.AutoStats = true
 att.Model = "models/weapons/arccw/atts/uc_ak12_foregrip.mdl"
 att.LHIK = true
 att.Mult_Recoil = 0.85
 att.Mult_MoveDispersion = 0.85
 att.Mult_SightTime = 1.1
 att.Mult_DrawTime = 1.1
 att.Mult_HolsterTime = 1.1
 att.Override_HoldtypeActive = "smg"
 att.Override_HoldtypeActive_Priority = 2
 ArcCW.LoadAttachmentType(att, "uc_grip_ak12_vertical")
end
