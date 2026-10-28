UCJavelin.Payloads = {
    heat = { jet = 2400, blast = 180, radius = 260, count = 1, speed = 1, turn = 1, scale = 1 },
    frag = { jet = 420, blast = 300, radius = 420, count = 1, speed = 1.08, turn = 1, scale = 1 },
    thermo = { jet = 180, blast = 260, radius = 520, count = 1, speed = 0.85, turn = 0.85, scale = 1 },
    swarm = { jet = 150, blast = 18, radius = 60, count = 8, speed = 1.1, turn = 1.4, scale = 0.28 },
    penetrator = { jet = 3000, blast = 70, radius = 130, count = 1, speed = 1.05, turn = 0.9, scale = 1 },
    breach = { jet = 1100, blast = 380, radius = 320, count = 1, speed = 0.78, turn = 0.75, scale = 1 },
    airburst = {
        jet = 180,
        blast = 170,
        radius = 250,
        count = 1,
        speed = 1,
        turn = 1,
        scale = 1,
        proximity = 110,
    },
}
function UCJavelin.Profile(wep)
    local payload = wep:GetBuff_Override("Override_UCJPayload", "heat") or "heat"
    local data = UCJavelin.Payloads[payload] or UCJavelin.Payloads.heat
    local velocity = wep:GetBuff_Override("Override_PhysBulletMuzzleVelocity", 360) or 360
    velocity = math.Clamp(velocity / 360 * wep:GetBuff_Mult("Mult_PhysBulletMuzzleVelocity"), 0.35, 1.8)

    if wep:GetBuff_Override("Override_TracerNum") == 0 then
        velocity = velocity * 0.7
    end
    local range = math.Clamp(wep:GetBuff_Mult("Mult_Range"), 0.4, 2)
    velocity = velocity * (wep:GetBuff_Override("Override_UCJOpticSpeed", 1) or 1)
    local damage = wep:GetBuff("Damage") / 180 * (wep:GetBuff_Override("Override_UCJOpticDamage", 1) or 1)
    local seeker = wep:GetBuff_Override("Override_UCJSeeker", "standard")
    return {
        payload = payload,
        count = data.count,
        jet = data.jet * damage,
        blast = data.blast * damage,
        radius = data.radius,
        scale = data.scale,
        maxSpeed = 3600 * velocity * data.speed,
        acceleration = 2400 * velocity,
        launchSpeed = 350 * velocity,
        turn = data.turn / math.sqrt(velocity) * (seeker == "gyro" and 1.2 or 1),
        maxDistance = 24000 * range * (wep:GetBuff_Override("Override_UCJOpticRange", 1) or 1),
        lifetime = math.Clamp(18 * range / velocity, 8, 30),
        unguided = wep:GetBuff_Override("Override_UCJUnguided") == true,
        armingDistance = wep:GetBuff_Override("Override_UCJArmingDistance", 220) or 220,
        proximity = data.proximity,
        motorDelay = seeker == "insulated" and 0.45 or 0.35,
        tubes = wep:GetCapacity(),
    }
end
function UCJavelin.Configure(rocket, profile, target, direct, lane)
    rocket.Profile = profile
    rocket.Target = target
    rocket.DirectAttack = direct
    rocket.Damage = profile.blast
    rocket.Speed = profile.launchSpeed
    rocket.LaunchDirection = rocket.Direction
    rocket.Lane = lane or 0
    rocket:SetModelScale(profile.scale, 0)
    local hull = 3 * profile.scale
    rocket:SetCollisionBounds(Vector(-hull, -hull, -hull), Vector(hull, hull, hull))
    rocket:SetHasTarget(IsValid(target))
end
function UCJavelin.LaunchBank(wep, first)
    local profile = UCJavelin.Profile(wep)
    local target = wep:GetNW2Entity("UCJTarget")
    local direct = wep:GetCurrentFiremode().JavelinDirect == true
    if profile.unguided then
        target = NULL
        direct = true
    end
    local owner, origin, angle = first:GetOwner(), first:GetPos(), first:GetAngles()
    for i = 1, profile.count * profile.tubes do
        local rocket = first
        if i > 1 then
            rocket = ents.Create("arccw_uc_javelin_missile")
            if not IsValid(rocket) then
                break
            end
            rocket:SetOwner(owner)
            rocket.Inflictor = wep
            rocket:SetPos(origin)
            rocket:SetAngles(angle)
            rocket:Spawn()
            rocket:Activate()
        end
        local tube = math.floor((i - 1) / profile.count)
        local pellet = (i - 1) % profile.count
        local yaw = profile.count > 1 and math.cos(pellet * math.pi / 4) * 7 or 0
        local pitch = profile.count > 1 and math.sin(pellet * math.pi / 4) * 7 or 0
        rocket.Direction = Angle(angle.p + pitch, angle.y + yaw, angle.r):Forward()

        rocket:SetPos(origin + angle:Right() * (tube % 2) * 12 + angle:Up() * math.floor(tube / 2) * 12)
        rocket.LaunchPos = rocket:GetPos()
        UCJavelin.Configure(rocket, profile, target, direct, i - 1)
        UCJavelin.Warn(target, rocket)
    end
end
