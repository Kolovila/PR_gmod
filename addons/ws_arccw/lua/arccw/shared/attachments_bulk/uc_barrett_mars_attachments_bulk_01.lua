-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_mars_mag_10.lua
do
    local att = {}

att.PrintName = "MARS 10-Round Magazine"
att.AbbrevName = "10-Round Magazine"
att.Description = "Extended box magazine for sustained grenade fire. Its weight slows handling."
att.SortOrder = 10
att.Slot = "uc_mars_mag"
att.AutoStats = true
att.Override_ClipSize = 10
att.Mult_SightTime = 1.13
att.Mult_ReloadTime = 1.12
att.Mult_SpeedMult = 0.96
att.Mult_Sway = 1.12
att.ActivateElements = {"mars_mag_10"}

    ArcCW.LoadAttachmentType(att, "uc_mars_mag_10")
end
-- END BUNDLED ATTACHMENT: uc_mars_mag_10.lua

-- BEGIN BUNDLED ATTACHMENT: uc_mars_mag_drum.lua
do
    local att = {}

att.PrintName = "MARS 20-Round Drum"
att.AbbrevName = "20-Round Drum"
att.Description = "High-capacity drum for suppressive grenade fire. Considerably heavier than a box magazine."
att.SortOrder = 20
att.Slot = "uc_mars_mag"
att.AutoStats = true
att.Override_ClipSize = 20
att.Mult_SightTime = 1.3
att.Mult_ReloadTime = 1.3
att.Mult_SpeedMult = 0.88
att.Mult_SightedSpeedMult = 0.9
att.Mult_Sway = 1.3
att.ActivateElements = {"mars_mag_drum"}

    ArcCW.LoadAttachmentType(att, "uc_mars_mag_drum")
end
-- END BUNDLED ATTACHMENT: uc_mars_mag_drum.lua
