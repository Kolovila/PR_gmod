SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.PrintName = "RPG-26"
SWEP.Trivia_Class = "Disposable Anti-Tank Launcher"
SWEP.Trivia_Desc =
    [[Soviet disposable anti-tank launcher developed by Bazalt to replace the RPG-22. Adopted in 1985 as the Aglen, it provided individual riflemen with a lightweight means of engaging armour without carrying a reusable launcher and spare rockets. Its single-piece fibreglass tube eliminated the telescoping assembly of its predecessors, simplifying preparation for firing.

Light and quick to shoulder for an anti-tank launcher, trading the AT4's heavier blast for easier handling. Effective against vehicles with a direct hit, but its small blast radius and pronounced projectile arc demand careful aim against infantry and distant targets. A single shot leaves a spent tube, while the backblast makes confined firing positions dangerous.]]
SWEP.Trivia_Manufacturer = "NPO Bazalt"
SWEP.Trivia_Calibre = "72.5 mm PG-26 HEAT"
SWEP.Trivia_Mechanism = "Disposable, recoilless"
SWEP.Trivia_Country = "Soviet Union"
SWEP.Trivia_Year = 1985
SWEP.Slot = 4
SWEP.NPCWeaponType = "weapon_rpg"
SWEP.NPCWeight = 10
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/arccw/uc_rpg26/c_rpg26_grip15.mdl"
SWEP.WorldModel = "models/weapons/arccw/uc_rpg26/w_rpg26.mdl"
SWEP.ViewModelFOV = 70
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset =
    { pos = Vector(4, 1, -4), ang = Angle(0, 180, 180), bone = "ValveBiped.Bip01_R_Hand", scale = 1 }
SWEP.Damage = 145
SWEP.DamageMin = 145
SWEP.Range = 250
SWEP.Penetration = 0
SWEP.DamageRand = 0
SWEP.ShootEntity = "arccw_uc_rpg26_rocket"
SWEP.MuzzleVelocity = 144 / 0.0254
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Ammo = "none"
SWEP.AutoReload = false
SWEP.Recoil = 0.35
SWEP.RecoilSide = 0.15
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 1.2
SWEP.Delay = 2
SWEP.Num = 1
SWEP.Firemodes = { { Mode = 1, PrintName = "HEAT" } }
SWEP.AccuracyMOA = 6
SWEP.HipDispersion = 400
SWEP.MoveDispersion = 200
SWEP.Sway = 0.65
SWEP.SpeedMult = 0.95
SWEP.SightedSpeedMult = 0.7
SWEP.SightTime = 0.4
SWEP.ShootVol = 120
SWEP.ShootPitch = 100
SWEP.ShootSound = "uc_rpg26/fire.wav"
SWEP.DistantShootSound = "uc_rpg26/distant.wav"

local blastTail = ")/arccw_uc/common/50bmg/"
SWEP.DistantShootSoundOutdoors = {}
SWEP.DistantShootSoundIndoors = {}
for i = 1, 6 do
    SWEP.DistantShootSoundOutdoors[i] = blastTail .. string.format("fire-dist-50bmg-rif-ext-%02d.ogg", i)
    SWEP.DistantShootSoundIndoors[i] = blastTail .. string.format("fire-dist-50bmg-rif-int-%02d.ogg", i)
end
SWEP.DistantShootSoundOutdoorsVolume = 0.16
SWEP.DistantShootSoundIndoorsVolume = 0.20
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty
SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.MuzzleEffectAttachment = 1
SWEP.ShellEffect = nil
SWEP.ShellModel = nil
SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "rpg"
SWEP.HoldtypeSights = "rpg"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.ActivePos = Vector(3, 6, -1)
SWEP.ActiveAng = Angle(0, 0, 0)
SWEP.IronSightStruct = { Pos = Vector(0, 6, 0), Ang = Angle(0, 0, 0), Magnification = 1.1 }
SWEP.SprintPos = Vector(1, -2, -2)
SWEP.SprintAng = Angle(-10, 25, -12)
SWEP.CustomizePos = Vector(8, 0, -1)
SWEP.CustomizeAng = Angle(10, 25, 0)
SWEP.HolsterPos = Vector(0, -5, -4)
SWEP.HolsterAng = Angle(-20, 15, 0)
SWEP.BarrelLength = 22
SWEP.Attachments = {
    { PrintName = "Powder Load", Slot = "uc_powder", DefaultAttName = "Standard Load" },
    { PrintName = "Training Package", Slot = "uc_tp", DefaultAttName = "Basic Training" },
    { PrintName = "Internals", Slot = "uc_fg_singleshot", DefaultAttName = "Standard Internals" },
}

local foley = "uc_rpg26/"
local movement = ")/arccw_uc/common/"
SWEP.Animations = {
    idle = { Source = "idle", Time = 1 },
    idle_empty = { Source = "idle_empty", Time = 1 },
    draw = {
        Source = "draw",
        Time = 1.25,
        SoundTable = {
            { s = movement .. "raise.ogg", t = 0, v = 0.22 },
            { s = movement .. "cloth_6.ogg", t = 0.38, v = 0.20 },
            { s = movement .. "shoulder.ogg", t = 0.95, v = 0.24 },
        },
    },
    draw_empty = {
        Source = "draw_empty",
        Time = 1.25,
        SoundTable = {
            { s = movement .. "raise.ogg", t = 0, v = 0.22 },
            { s = movement .. "cloth_6.ogg", t = 0.38, v = 0.20 },
            { s = movement .. "shoulder.ogg", t = 0.95, v = 0.24 },
        },
    },
    ready = {
        Source = "ready",
        Time = 3.917,
        SoundTable = {
            { s = foley .. "mech.wav", t = 0 },
            { s = movement .. "cloth_1.ogg", t = 0.05, v = 0.15 },
            { s = movement .. "cloth_3.ogg", t = 0.62, v = 0.18 },
            { s = foley .. "front.wav", t = 1.10 },
            { s = foley .. "rear.wav", t = 1.83 },
            { s = movement .. "grab.ogg", t = 2.32, v = 0.18 },
            { s = foley .. "pin.wav", t = 2.40 },
            { s = movement .. "shoulder.ogg", t = 3.55, v = 0.22 },
        },
    },
    fire = {
        Source = "fire",
        Time = 2,
        SoundTable = {
            { s = foley .. "trigger_press.wav", t = 0, v = 0.85 },
            { s = movement .. "cloth_2.ogg", t = 0.08, v = 0.16 },
            { s = movement .. "cloth_6.ogg", t = 0.80, v = 0.12 },
            { s = foley .. "trigger_release.wav", t = 34 / 30.5, v = 0.85 },
        },
    },
    fire_iron = {
        Source = "fire",
        Time = 2,
        SoundTable = {
            { s = foley .. "trigger_press.wav", t = 0, v = 0.85 },
            { s = movement .. "cloth_2.ogg", t = 0.08, v = 0.16 },
            { s = movement .. "cloth_6.ogg", t = 0.80, v = 0.12 },
            { s = foley .. "trigger_release.wav", t = 34 / 30.5, v = 0.85 },
        },
    },
    holster = {
        Source = "holster",
        Time = 0.65,
        SoundTable = {
            { s = movement .. "rattle.ogg", t = 0, v = 0.15 },
            { s = movement .. "cloth_2.ogg", t = 0.22, v = 0.22 },
        },
    },
    holster_empty = {
        Source = "holster_empty",
        Time = 0.667,
        SoundTable = {
            { s = movement .. "rattle.ogg", t = 0, v = 0.15 },
            { s = movement .. "cloth_2.ogg", t = 0.22, v = 0.22 },
        },
    },
    discard = {
        Source = "discard",
        Time = 1.4,
        SoundTable = {
            { s = movement .. "cloth_4.ogg", t = 0.10, v = 0.22 },
            { s = movement .. "cloth_6.ogg", t = 0.62, v = 0.20 },
            { s = foley .. "toss.wav", t = 0.98, v = 0.8 },
        },
    },
}

function SWEP:DoPrimaryAnim()
    local anim = self:SelectAnimation("fire") or "fire"
    local mult = self:GetBuff_Mult("Mult_FireAnimTime", anim) or 1
    if self:PlayAnimation(anim, mult, true, 0, false, false, true) then
        self:SetPriorityAnim(CurTime() + self:GetAnimKeyTime(anim) * mult)
    end
end

function SWEP:Holster(weapon)
    if (self.LastAnimKey == "fire" or self.LastAnimKey == "fire_iron") and self:GetPriorityAnim() then
        return false
    end
    return baseclass.Get("arccw_base").Holster(self, weapon)
end

function SWEP:RPG26Range()
    return 50
end

function SWEP:Reload()
    if CLIENT then
        return
    end
    if self:GetNextPrimaryFire() > CurTime() or self:GetPriorityAnim() then
        return
    end
    if (self.RPG26ReloadAt or 0) > CurTime() then
        return
    end
    self.RPG26ReloadAt = CurTime() + 0.35
    if self:GetNW2Bool("RPG26Spent") then
        if self.RPG26Discarding then
            return
        end
        self.RPG26Discarding = true
        self:PlayAnimation("discard", 1, true)
        self:SetNextPrimaryFire(CurTime() + 1.4)
        timer.Simple(1.25, function()
            if not IsValid(self) then
                return
            end
            local owner = self:GetOwner()
            if IsValid(owner) and owner:IsPlayer() and owner:GetActiveWeapon() ~= self then
                self.RPG26Discarding = false
                return
            end
            local tube = ents.Create("prop_physics")
            if IsValid(tube) then
                tube:SetModel(self.WorldModel)
                tube:SetPos(
                    IsValid(owner) and owner:GetShootPos() + owner:GetAimVector() * 20 or self:GetPos()
                )
                tube:SetAngles(IsValid(owner) and owner:EyeAngles() or self:GetAngles())
                tube:Spawn()
                tube:ResetSequence("empty")
                tube:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
                local phys = tube:GetPhysicsObject()
                if IsValid(phys) then
                    phys:SetVelocity(IsValid(owner) and owner:GetAimVector() * 100 or vector_origin)
                end
                SafeRemoveEntityDelayed(tube, 20)
            end
            self:Remove()
        end)
        return
    end
end

SWEP.Hook_ShouldNotFire = function(wep)
    if wep:GetNW2Bool("RPG26Spent") or wep.RPG26Discarding then
        return true
    end
end

function SWEP:FireRocket(ent, vel, ang, dontinheritvel)
    ang = ang or (self:GetOwner():EyeAngles() + self:GetFreeAimOffset())
    local launch = Angle(ang.p, ang.y, ang.r)
    if self:GetState() == ArcCW.STATE_SIGHTS then
        local gravity = 386.09 * GetConVar("sv_gravity"):GetFloat() / 600
        local range = self:RPG26Range() / 0.0254
        launch.p = launch.p - math.deg(0.5 * math.asin(math.Clamp(gravity * range / (vel * vel), -1, 1)))
    end
    return baseclass.Get("arccw_base").FireRocket(self, ent, vel, launch, dontinheritvel)
end

SWEP.Hook_PostFireBullets = function(wep)
    if CLIENT then
        return
    end
    wep:SetNW2Bool("RPG26Spent", true)
    wep:ResetSequence("empty")
    local owner = wep:GetOwner()
    if not IsValid(owner) then
        return
    end
    local origin = owner:GetShootPos()
    local forward = owner:GetAimVector()
    local rearward = -forward
    local attacker = owner:IsPlayer() and owner or wep

    local smoke = EffectData()
    smoke:SetOrigin(origin + rearward * 24)
    smoke:SetNormal(rearward)
    smoke:SetScale(1)
    util.Effect("arccw_uc_rpg26_backblast", smoke, true, true)

    for _, ent in ipairs(ents.FindInCone(origin, rearward, 180, 0.72)) do
        if IsValid(ent) and ent ~= owner and ent ~= wep then
            local center = ent:WorldSpaceCenter()
            local exposure = util.TraceLine({
                start = origin + rearward * 12,
                endpos = center,
                filter = { owner, wep },
                mask = MASK_SHOT,
            })

            if not exposure.Hit or exposure.Entity == ent then
                local fraction = math.Clamp(origin:Distance(center) / 180, 0, 1)
                local strength = 1 - fraction
                local damage = DamageInfo()
                damage:SetAttacker(attacker)
                damage:SetInflictor(wep)
                damage:SetDamage(75 * strength)
                damage:SetDamageType(bit.bor(DMG_BLAST, DMG_BURN))
                damage:SetDamagePosition(center)
                damage:SetDamageForce(rearward * 9000 * strength)
                ent:TakeDamageInfo(damage)

                if exposure.Hit then
                    util.Decal(
                        "Scorch",
                        exposure.HitPos + exposure.HitNormal * 4,
                        exposure.HitPos - exposure.HitNormal * 12,
                        { owner, wep }
                    )
                end

                if ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot() then
                    if IsValid(ent) and ent:Health() > 0 then
                        ent:SetVelocity(rearward * 360 * strength)
                    end
                elseif IsValid(ent) then
                    local phys = ent:GetPhysicsObject()
                    if IsValid(phys) and phys:IsMotionEnabled() then
                        local effectiveMass = math.min(phys:GetMass(), 75)
                        phys:ApplyForceCenter(rearward * effectiveMass * 5000 * strength)
                    end
                end
            end
        end
    end

    local rearTrace = util.TraceLine({
        start = origin + rearward * 12,
        endpos = origin + rearward * 128,
        filter = { owner, wep },
        mask = MASK_SOLID,
    })

    if rearTrace.Hit and rearTrace.Fraction < 0.7 and owner:IsPlayer() then
        local reflected = DamageInfo()
        reflected:SetAttacker(attacker)
        reflected:SetInflictor(wep)
        reflected:SetDamage(30 * (1 - rearTrace.Fraction))
        reflected:SetDamageType(DMG_BLAST)
        reflected:SetDamagePosition(origin)
        owner:TakeDamageInfo(reflected)
        owner:ViewPunch(Angle(5, math.Rand(-2, 2), math.Rand(-2, 2)))
    end

    if rearTrace.Hit then
        util.Decal(
            "Scorch",
            rearTrace.HitPos + rearTrace.HitNormal * 6,
            rearTrace.HitPos - rearTrace.HitNormal * 18,
            { owner, wep }
        )
    end

    if owner:IsPlayer() then
        owner:SetVelocity(rearward * 65)
    end
end
