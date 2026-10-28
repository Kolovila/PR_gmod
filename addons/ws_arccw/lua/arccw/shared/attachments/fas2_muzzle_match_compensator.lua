att.PrintName = "Match Compensator"
att.Icon = Material("vgui/fas2atts/muzzlebrake.png")
att.Description = "The Match compensator is a special USP Match device that will add additional weight to the front of your gun assisting to reduce vertical recoil."

att.AutoStats = true
att.Slot = "fas2_match_compensator"

att.SortOrder = 9

att.Model = false

att.Add_BarrelLength = 2

att.Mult_Recoil = 0.85
att.Mult_RecoilSide = 0.9
att.Mult_RecoilPunch = 0.85
att.Mult_Range = 1.1

att.ExcludeFlags = {"tactical", "sight"}
att.GivesFlags = {"match_compensator"}

att.ActivateElements = {"match_compensator"}

att.Hook_GetShootSound = function(wep, sound)
    return "Firearms2_USP_MATCH"
end

att.AttachSound = "fas2/cstm/attach.wav"
att.DetachSound = "fas2/cstm/detach.wav"

