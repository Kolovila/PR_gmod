AddCSLuaFile()

UC_Extras = UC_Extras or {}

local cvNoFly = CreateConVar("arccw_extra_nofly", "0", FCVAR_REPLICATED + FCVAR_ARCHIVE,
    "Limit how far ArcCW UC Extras recoil-jumps can launch you.")

local MAXSPEED = 2400

function UC_Extras.RecoilJump(wep, force, lift)
    if CLIENT then return end
    if not IsValid(wep) then return end

    local owner = wep:GetOwner()
    if not IsValid(owner) or not owner:IsPlayer() then return end
    if not owner:Alive() then return end

    force = force or 600
    lift = lift or 0

    local dir = -owner:EyeAngles():Forward()

    local mul = owner:IsOnGround() and 1 or 1.25

    if cvNoFly:GetBool() and not owner:IsOnGround() then
        mul = 0.35
    end

    local push = dir * force * mul
    push.z = push.z + lift * mul

    local vel = owner:GetVelocity() + push
    if vel:Length() > MAXSPEED then
        vel:Normalize()
        vel = vel * MAXSPEED
    end

    if owner:IsOnGround() and push.z > 0 then
        owner:SetGroundEntity(NULL)
    end

    owner:SetVelocity(vel - owner:GetVelocity())
end

function UC_Extras.Ricochet(wep, data, falloff)
    if CLIENT then return end
    if not IsValid(wep) then return end
    if not data or not data.tr then return end

    local tr = data.tr
    if tr.HitSky or not tr.Hit then return end

    local dot = tr.Normal:Dot(tr.HitNormal)
    if dot > -0.35 then return end

    local dir = tr.Normal - 2 * dot * tr.HitNormal
    local owner = wep:GetOwner()

    local dmg = (data.damage or 0) * (falloff or 0.6)
    if dmg <= 0 then return end

    local eff = EffectData()
    eff:SetOrigin(tr.HitPos)
    eff:SetNormal(tr.HitNormal)
    eff:SetMagnitude(1.5)
    eff:SetScale(0.5)
    eff:SetRadius(3)
    util.Effect("Sparks", eff)

    wep:FireBullets({
        Attacker = IsValid(owner) and owner or wep,
        Inflictor = wep,
        Damage = dmg,
        Force = 8,
        Num = 1,
        Tracer = 0,
        TracerName = "",
        Dir = dir,
        Src = tr.HitPos + tr.HitNormal * 2,
        Distance = 8000,
        Spread = Vector(0, 0, 0),
    })
end

if CLIENT then
    hook.Add("PreDrawViewModel", "UC_Extras_LaserOffsetCleanup", function(vm, ply, wep)
        if not IsValid(wep) then return end
        if not wep.UC_LaserFixTime then return end

        if CurTime() - wep.UC_LaserFixTime > 0.25 then
            wep.LaserOffsetAngle = nil
            wep.UC_LaserFixTime = nil
        end
    end)
end
