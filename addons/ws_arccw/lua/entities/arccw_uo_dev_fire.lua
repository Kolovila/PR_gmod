AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Burning Fuel"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

local UO = ArcCW.UO

ENT.Model = "models/Items/AR2_Grenade.mdl"
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE
ENT.ArcCW_Killable = false

ENT.FireTime = 14
ENT.FireRadius = 110
ENT.FireDamage = 4
ENT.DamageInterval = 0.4

ENT.IgniteTime = 4
ENT.IgniteDamage = 24

ENT.Ticks = 0

local burnloop = UO.Sound("nades/molotov/molotov_burn_loop.wav", "ambient/fire/fire_small_loop1.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Float", 0, "DieAt")
end

if SERVER then

    function ENT:Initialize()
        self:SetModel(self.Model)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:PhysicsInitBox(Vector(-1, -1, -1), Vector(1, 1, 1))
        self:DrawShadow(false)
        self:SetNoDraw(true)

        local phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
            phys:SetMass(1)
        end

        self.SpawnTime = CurTime()
        self.FireTime = math.Rand(self.FireTime * 0.8, self.FireTime * 1.2)
        self:SetDieAt(CurTime() + self.FireTime)

        self.Sound = CreateSound(self, burnloop)
        if self.Sound then self.Sound:PlayEx(0.55, 100) end

        self.NextDamage = 0
    end

    function ENT:Think()
        if self:GetVelocity():LengthSqr() <= 64 and self:GetMoveType() != MOVETYPE_NONE then
            self:SetMoveType(MOVETYPE_NONE)
        end

        if self:WaterLevel() >= 2 then
            self:Douse()
            return
        end

        if CurTime() >= self:GetDieAt() then
            self:Remove()
            return
        end

        if CurTime() >= self.NextDamage then
            self.NextDamage = CurTime() + self.DamageInterval

            local pos = self:GetPos()
            local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self

            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(attacker)
            d:SetDamage(self.FireDamage * UO.DamageMult())
            d:SetDamageType(DMG_BURN)
            util.BlastDamageInfo(d, pos, self.FireRadius)

            for _, ent in ipairs(UO.FindTargets(pos, self.FireRadius * 0.8)) do
                if ent.Ignite and !ent:IsOnFire() then
                    ent:Ignite(self.IgniteTime, self.IgniteDamage)
                end
            end
        end

        self:NextThink(CurTime())
        return true
    end

    function ENT:Douse()
        if self.Dying then return end
        self.Dying = true

        self:EmitSound("ambient/water/water_splash" .. math.random(1, 3) .. ".wav", 65, 90, 0.6)
        self:Remove()
    end

    function ENT:OnRemove()
        if self.Sound then self.Sound:Stop() end
    end

else

    local flames = {
        "sprites/flamelet1",
        "sprites/flamelet2",
        "sprites/flamelet3",
        "sprites/flamelet4",
        "sprites/flamelet5",
    }

    function ENT:Initialize()
        self:SetNoDraw(true)
    end

    function ENT:Think()
        self.Ticks = self.Ticks + 1

        if self:WaterLevel() >= 2 then return end

        local pos = self:GetPos()
        local emitter = ParticleEmitter(pos)
        if !IsValid(emitter) then return end

        local left = self:GetDieAt() - CurTime()
        local intensity = math.Clamp(left / 2, 0, 1)

        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = pos + Vector(0, 0, 12)
            dl.r = 255
            dl.g = 140 + math.random(-20, 20)
            dl.b = 50
            dl.Brightness = 2 * intensity
            dl.Decay = 900
            dl.Size = 260 * intensity
            dl.DieTime = CurTime() + 0.2
        end

        for i = 1, 2 do
            if math.Rand(0, 1) > intensity then continue end

            local p = emitter:Add(flames[math.random(#flames)], pos + VectorRand() * 18)
            if !p then continue end

            p:SetVelocity(VectorRand() * 40 + Vector(0, 0, 70))
            p:SetGravity(Vector(0, 0, 110))
            p:SetDieTime(math.Rand(0.4, 0.8))
            p:SetStartAlpha(230)
            p:SetEndAlpha(0)
            p:SetStartSize(math.Rand(18, 30))
            p:SetEndSize(math.Rand(50, 80))
            p:SetRoll(math.Rand(-180, 180))
            p:SetRollDelta(math.Rand(-0.6, 0.6))
            p:SetColor(255, 255, 255)
            p:SetAirResistance(120)
            p:SetLighting(false)
            p:SetCollide(true)
            p:SetBounce(0.5)
        end

        if math.random(1, 100) <= 12 * intensity then
            local p = emitter:Add("particles/smokey", pos + VectorRand() * 12)
            if p then
                p:SetVelocity(VectorRand() * 30 + Vector(0, 0, 60))
                p:SetGravity(Vector(0, 0, 220))
                p:SetDieTime(math.Rand(1, 2.2))
                p:SetStartAlpha(120)
                p:SetEndAlpha(0)
                p:SetStartSize(20)
                p:SetEndSize(130)
                p:SetRoll(math.Rand(-180, 180))
                p:SetRollDelta(math.Rand(-0.3, 0.3))
                p:SetColor(45, 40, 38)
                p:SetAirResistance(140)
                p:SetLighting(false)
            end
        end

        emitter:Finish()
    end

    function ENT:Draw()
    end

end
