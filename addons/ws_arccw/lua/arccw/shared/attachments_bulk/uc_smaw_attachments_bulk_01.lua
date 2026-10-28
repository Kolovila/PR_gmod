-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_smaw_ranger.lua
do
    local att = {}

att.PrintName = "9x51mm Spotting Rifle"
att.AbbrevName = "Spotting Rifle"

att.Icon = Material("", "mips smooth")
att.Description = "The reason the launcher hits anything at all. A six-round semi-automatic rifle bolted to the tube, firing a tracer round loaded to fly the same curve as the 83mm rocket - the same distance, dropping the same amount, at the same point in flight. Walk a spotting round onto the target, do not touch the sight, pull the other trigger. Where the tracer struck is where the warhead goes."
att.Desc_Pros = {
    "Tracer marks its impact point for 12 seconds",
    "Trajectory identical to the rocket's",
}
att.Desc_Cons = {
    "Announces you before the rocket does",
}
att.Desc_Neutrals = {
}
att.AutoStats = true
att.Slot = "uc_smaw_ranger"
att.SortOrder = 8

att.Mult_SightTime = 1.10
att.Mult_SpeedMult = 0.96
att.Mult_SightedSpeedMult = 0.95
att.Mult_Sway = 1.08

att.UBGL = true
att.ExcludeFlags = {"ubgl"}
att.UBGL_BaseAnims = true

att.UBGL_PrintName = "9x51MM SPOTTER"
att.UBGL_Automatic = false
att.UBGL_ClipSize = 6
att.UBGL_Capacity = 6
att.UBGL_Ammo = "smg1"
att.UBGL_RPM = 120
att.UBGL_Recoil = 0.6
att.UBGL_MuzzleEffect = "muzzleflash_1"

att.GivesFlags = {"smaw_spotter"}

local SPOT_VELOCITY = 8660

local function Ammo(wep)
    return wep:GetOwner():GetAmmoCount("smg1")
end

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 then return end

    wep:PlayAnimation("fire_ranger")
    wep:EmitSound("uc_smaw/fire_ranger.wav", 95)

    if SERVER then
        local round = wep:FireRocket("arccw_uc_smaw_spotter", SPOT_VELOCITY)
        if IsValid(round) then
            round.Damage = 0
            round.Radius = 0
        end
    end

    wep:SetClip2(wep:Clip2() - 1)
    wep:SetNextPrimaryFire(CurTime() + 0.5)
    wep:DoEffects()
end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 6 then return end
    if Ammo(wep) <= 0 then return end

    wep:SetNextSecondaryFire(CurTime() + (wep:Clip2() == 0 and 3.5 or 3))
    wep:PlayAnimation("reload_ranger", nil, true)

    local reserve = Ammo(wep) + wep:Clip2()
    local load = math.Clamp(6, 0, reserve)

    wep:GetOwner():SetAmmo(reserve - load, "smg1")
    wep:SetClip2(load)
end

    ArcCW.LoadAttachmentType(att, "uc_smaw_ranger")
end
-- END BUNDLED ATTACHMENT: uc_smaw_ranger.lua
