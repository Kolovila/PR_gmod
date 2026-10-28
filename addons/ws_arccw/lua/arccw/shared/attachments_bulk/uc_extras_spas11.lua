local att = {}
att.PrintName = "SPAS-11 Prototype Conversion"
att.AbbrevName = "SPAS-11 Kit"
if not GetConVar("arccw_truenames"):GetBool() then att.PrintName = "Martello 11 Prototype Conversion" end
att.Icon = Material("entities/att/uc_spas11/kit.png", "smooth mips")
att.Slot = "ur_spas12_barrel"
att.SortOrder = 21.6
att.AutoStats = true
att.Description = "An early dual-action conversion with a vented steel shroud, separate sliding fore-end and skeletal recoil-spring stock. Faster to shoulder and carry, but its light shoulder support kicks harder. Toggle the rotating forearm brace for steadier hip fire at the cost of aiming and movement speed. Manual mode gives a tighter pattern and a quicker pump stroke; semiautomatic mode favors follow-up shots."
att.Desc_Neutrals = {"Rotating forearm brace (attachment toggle)", "Integral grip, stock and eight-shell magazine"}
att.GivesFlags = {"ux_spas11_integral"}
att.ActivateElements = {"ux_spas11_kit"}
att.Mult_SpeedMult = 1.07
att.Mult_SightTime = .86
att.Mult_DrawTime = .88
att.Add_BarrelLength = 1
att.Mult_Recoil = 1.16
att.Mult_RecoilSide = 1.10
att.Mult_Sway = 1.12
att.Mult_ReloadTime = 1.08
att.Mult_RPM = 250 / 220
att.Mult_CycleTime = .85
att.Override_ClipSize = 8
att.Override_Firemodes = {
 {Mode = 1, PrintName = "fcg.semi"},
 {Mode = 1, PrintName = "fcg.pump", Override_ManualAction = true, Mult_AccuracyMOA = .75, Mult_HipDispersion = .8},
 {Mode = 0}
}
att.Override_Firemodes_Priority = 15
att.Override_IronSightStruct = {Pos = Vector(-3.765,-4,1.57), Ang = Angle(0,0,1), Magnification = 1.05, SwitchToSound = ""}
att.ToggleStats = {
 {PrintName = "Shoulder support", ActivateElements = {"ux_spas11_hook"}},
 {PrintName = "Forearm brace", ActivateElements = {"ux_spas11_brace"}, Mult_HipDispersion = .78, Mult_MoveDispersion = .85, Mult_RecoilSide = .8, Mult_SightTime = 1.13, Mult_SightedSpeedMult = .85}
}
att.Hook_GetDefaultAttName = function(wep,slot)
 if slot == 6 then return "SPAS-11 Pistol Grip" end
 if slot == 7 then return "SPAS-11 Recoil-Spring Stock" end
 if slot == 8 then return "SPAS-11 Eight-Shell Tube" end
end
ArcCW.LoadAttachmentType(att,"ux_ur_spas12_barrel_spas11")
