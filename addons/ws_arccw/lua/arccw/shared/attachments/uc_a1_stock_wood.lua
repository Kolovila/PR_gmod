att.PrintName = "AMCAR Wooden Stock"
att.AbbrevName = "Wooden Stock"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M16 Wooden Stock"
end

att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
att.Description = "A fat stock made from wood, made to fit the receiver. Much heavier than polymer. Sort of makes you wish for a nuclear winter.. but not really."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_a1_stock"

att.AutoStats = true

att.Mult_Recoil = 0.9
att.Mult_RecoilSide = 0.75
att.Mult_SightedSpeedMult = 0.9
att.Mult_SpeedMult = 0.95
att.Mult_Sway = 0.75