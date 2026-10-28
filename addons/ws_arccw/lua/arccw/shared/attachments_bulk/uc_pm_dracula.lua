do
    local att = {}
    att.PrintName = "Dracula Md. 98 Machine Pistol"
    att.AbbrevName = "Dracula Md. 98"
    att.Icon = Material("entities/att/ur_pm_dracula.png", "mips smooth")
    att.Description = [[Romanian Stechkin derivative made by Uzina Mecanica Sadu. A 20-round magazine, selective fire and an inverted spare magazine under the extended dust cover distinguish this configuration.]]
    att.Slot = "ur_pm_variant"
    att.SortOrder = 4
    att.AutoStats = true
    att.Model = "models/weapons/arccw/ur_pm_dracula_grip_pose.mdl"
    att.ModelOffset = Vector(0, 0, 0)
    att.OffsetAng = Angle(0, 0, 0)
    att.NoDraw = true
    att.LHIK = true
    att.Override_HoldtypeActive = "smg"
    att.Override_HoldtypeSights = "smg"
    att.Desc_Neutrals = {"20-round magazine + chamber", "Semi / automatic / safe", "Fixed spare-magazine foregrip"}

    att.Override_ClipSize = 20
    att.Mult_RPM = 650 / 575
    att.Override_PhysBulletMuzzleVelocity = 385
    att.Override_MuzzleVelocity = 385
    att.Override_Trivia_Class = "Machine Pistol"
    att.Override_Trivia_Calibre = "9x19mm Parabellum"
    att.Override_Trivia_Manufacturer = "Uzina Mecanica Sadu"
    att.Override_Trivia_Country = "Romania"
    att.Override_Trivia_Year = 1998
    att.Override_Trivia_Mechanism = "Blowback / DA-SA"
    att.Override_Trivia_Desc = att.Description
    att.Override_Ammo = "pistol"
    att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
    att.Override_ShellScale = 1
    att.Override_Firemodes = {
        {Mode = 2},
        {Mode = 1},
        {Mode = 0},
    }

     
    att.Mult_Damage = 32 / 28
    att.Mult_DamageMin = 19 / 17
    att.Mult_Penetration = 8 / 6
    att.Mult_Recoil = 1.35
    att.Mult_RecoilSide = 1.15
    att.Mult_AccuracyMOA = 1.25
    att.Mult_HipDispersion = 0.9
    att.Mult_ReloadTime = 1.2
    att.Mult_SightTime = 1.1
    att.Mult_SpeedMult = 0.97
    att.Mult_SightedSpeedMult = 0.9
    att.Mult_DrawTime = 1.1
    att.Mult_HolsterTime = 1.1

    att.ActivateElements = {"ur_dracula"}
    att.GivesFlags = {"ur_dracula"}
    att.Hook_Compatible = function(wep)
        if wep:GetClass() ~= "arccw_ur_pm" then return false end
        for _, slot in ipairs({3, 5, 6}) do
            if wep.Attachments[slot].Installed then return false end
        end
    end
    att.Hook_NameChange = function(wep, name)
        return "Dracula Md. 98"
    end
    ArcCW.LoadAttachmentType(att, "ur_pm_variant_dracula")
end
