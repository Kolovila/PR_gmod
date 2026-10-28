local sights = {Pos = Vector(-2.806967, 0, .820687), Ang = Angle(0, 0, 0), Magnification = 1.1, SwitchToSound = ""}
for _, kind in ipairs({"long", "short"}) do
    local att = {}
    local short = kind == "short"
    att.PrintName = short and "Colt ACR Short Barrel Assembly" or "Colt ACR Rifle Barrel Assembly"
    att.AbbrevName = short and "ACR Short Barrel" or "ACR Rifle Barrel"
    att.Description = "Reference-based Colt ACR front end with rounded polymer handguard, perforated sighting rib, protected front post and ported compensator. The handguard is integral to the assembly."
    att.Icon = Material("entities/att/uc_colt_acr/" .. kind .. ".png", "smooth mips")
    att.Slot = "ud_m16_blen"
    att.AutoStats = true
    att.ActivateElements = {"ux_colt_acr_" .. kind}
    att.GivesFlags = {"ux_m16_integral_barrel", "ux_colt_acr_barrel"}
    att.ExcludeFlags = {"m16_usas", "upper_50bmg"}
    att.Mult_SightTime = short and 1.0 or 1.12
    att.Mult_Range = short and .8 or 1.0
    att.Mult_AccuracyMOA = short and 1.15 or .95
    att.Mult_Recoil = short and .95 or .85
    att.Mult_Sway = short and .95 or 1.12
    att.Add_BarrelLength = short and -5.4 or 0
    att.Mult_PhysBulletMuzzleVelocity = short and .88 or 1
    
 
    local pitch = -math.deg(math.atan2(.479313, short and 12.93865 or 17.85865))
    att.Override_IronSightStruct = {Pos = Vector(-2.815, 0, 1.3 - 11.46135 * math.tan(math.rad(pitch))),
        Ang = Angle(pitch, 0, 0), Magnification = 1.1, SwitchToSound = ""}
    att.Hook_GetDefaultAttName = function(wep, slot)
        if slot == 3 then return "Integral ACR Handguard" end
        if slot == 4 then return "ACR Compensator" end
    end
    ArcCW.LoadAttachmentType(att, "ux_ud_m16_barrel_colt_acr_" .. kind)
end

do
    local att = {}
    att.PrintName = "Colt ACR Telescoping Stock"
    att.AbbrevName = "ACR Stock"
    att.Description = "Broad, triangular ACR stock with a defined cheek shell, angled adjustment lever, sling slot and rubber shoulder plate."
    att.Icon = Material("entities/att/uc_colt_acr/stock.png", "smooth mips")
    att.Slot = "ud_m16_stock"
    att.ActivateElements = {"ux_colt_acr_stock"}
    att.ExcludeFlags = {"m16_usas", "upper_50bmg"}
    att.AutoStats = true
    att.Mult_Recoil = .95
    att.Mult_Sway = .9
    att.Mult_SightTime = 1.05
    ArcCW.LoadAttachmentType(att, "ux_ud_m16_stock_colt_acr")
end

do
    local att = {}
    att.PrintName = "Colt ACR Carry-Handle Upper"
    att.AbbrevName = "ACR Upper"
    att.Description = "Native flat-top action with the ACR's low clamp-on carry handle and adjustable rear aperture sight. The handle occupies the optic rail. Loads experimental 5.56mm duplex cartridges containing a 35-grain leading bullet and a 33-grain trailing bullet: two projectiles per cartridge, with wider dispersion and damage shared between them."
    att.Icon = Material("entities/att/uc_colt_acr/upper.png", "smooth mips")
    att.Slot = "ud_m16_receiver"
    att.ActivateElements = {"ux_colt_acr_upper"}
    att.GivesFlags = {"ux_colt_acr_upper"}
    att.Override_Num = 2
    att.Override_Num_Priority = 2
    att.Override_Trivia_Calibre = "5.56x45mm Duplex"
    att.Override_PhysBulletMuzzleVelocity = 884
    att.Mult_AccuracyMOA = 1.5
    att.ExcludeFlags = {"upper_50bmg", "m16_usas", "ud_m16_retro", "ux_colt_acr_optic"}
    att.Override_IronSightStruct = sights
    att.Override_IronSightStruct_Priority = 2
    att.O_Hook_Override_IronSightStruct = function(wep, data)
        local barrel = wep.Attachments[2].Installed or ""
        if barrel == "ux_ud_m16_barrel_colt_acr_long" or barrel == "ux_ud_m16_barrel_colt_acr_short" then return end
        
 
        local fronts = {
            ux_ud_m16_barrel_exposed = {-30.497983, -1.293092},
            ux_ud_m16_barrel_tactical_A4 = {-35.497983, -1.293092},
            ux_ud_m16_barrel_smg = {-25.3884215, -.83914375},
            ux_ud_m16_barrel_m4 = {-28.3628005, -.83914375},
            ux_ud_m16_barrel_wood = {-34.0209825, -.83914375},
            ux_ud_m16_barrel_wood_short = {-27.9965835, -.83914375},
            ux_ud_m16_barrel_cursed = {-34.17092, -5.08559},
        }
        local front = fronts[barrel]
        if not front then
            local short = barrel == "ud_m16_barrel_14in" or barrel == "ud_m16_barrel_11in"
            local adar = wep.Attachments[3].Installed == "ud_m16_hg_adar"
            front = {adar and -27.285994 or short and -26.160586 or -30.498122, -1.293092}
        end
        local pitch = -math.deg(math.atan2(front[2] + .820687, -10.44 - front[1]))
        data.current = {Pos = Vector(-2.806967, 0, .820687 - 10.44 * math.tan(math.rad(pitch))),
            Ang = Angle(pitch, 0, 0), Magnification = 1.1, SwitchToSound = ""}
        return data
    end
    att.IronSight = true
    att.AutoStats = true
    att.Mult_SightTime = 1.03
    ArcCW.LoadAttachmentType(att, "ux_ud_m16_upper_colt_acr")
end
