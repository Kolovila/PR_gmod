att.PrintName = "OTs-14 Grenade Launcher"
att.Description = "Why the hell you reading this?"

att.Slot = "fas2_ots14_ubgl"

att.UBGL = true
att.UBGL_BaseAnims = true

att.UBGL_PrintName = "UB (HE)"
att.UBGL_Automatic = false
att.UBGL_MuzzleEffect = "muzzleflash_m79"
att.UBGL_ClipSize = 1
att.UBGL_Ammo = "vog25"
att.UBGL_RPM = 1200
att.UBGL_Recoil = 2
att.UBGL_Capacity = 1

att.Hook_ShouldNotSight = function(wep)
    return wep:GetInUBGL()
end

local function Ammo(wep)
    return wep.Owner:GetAmmoCount("vog25")
end

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 then return end

    wep:PlayAnimation("fire_ubgl", 1, true, nil, nil, nil, true)

    wep:FireRocket("arccw_firearms2_vog25_fly", 1800)

    wep:EmitSound("Firearms2_OTS14_GP", 100)

    wep:SetClip2(wep:Clip2() - 1)

    wep:DoEffects()
end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 1 then return end

    if Ammo(wep) <= 0 then return end

    wep:PlayAnimation("reload_ubgl", 1, true, nil, nil, nil, true)
    wep:SetReloading(CurTime() + wep:GetAnimKeyTime("reload_ubgl"))

    local reserve = Ammo(wep)

    reserve = reserve + wep:Clip2()

    local clip = 1

    local load = math.Clamp(clip, 0, reserve)

    wep.Owner:SetAmmo(reserve - load, "vog25")

    wep:SetClip2(load)
end

att.Mult_SightTime = 1.25
att.Mult_SightedSpeedMult = 0.85