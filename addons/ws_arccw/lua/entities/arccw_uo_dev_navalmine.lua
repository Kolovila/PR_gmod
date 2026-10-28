AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "Naval Mine"

local UO = ArcCW.UO

ENT.GrenadeRadius = 1050
ENT.GrenadeDamage = 340

ENT.WaterRadiusMult = 2.0
ENT.WaterDamageMult = 1.4

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 85
ENT.ExplosionSoundLevel = 149

ENT.Model = "models/weapons/w_navalmine.mdl"
ENT.ModelFallback = "models/weapons/t43_mine/w_t43_mine.mdl"

ENT.PhysMass = 12
ENT.PhysElasticity = 0

ENT.StickMode = "flat"
ENT.StickOffset = 2.2
ENT.ArmTime = 3.5

ENT.Health_ = 60
ENT.DetonateOnDestroyed = true

ENT.TriggerRange = 85
ENT.TriggerDelay = 0.1

ENT.FragCount = 26
ENT.FragDamage = 22
ENT.FragRange = 1200

ENT.BeepInterval = 3

ENT.WaterSounds = UO.Sound({"weapons/ied/water/ied_water_detonate_01.wav", "weapons/ied/water/ied_water_detonate_02.wav", "weapons/ied/water/ied_water_detonate_03.wav"}, "weapons/underwater_explode3.wav")
ENT.WaterSoundsDistant = UO.Sound({"weapons/ied/water/ied_water_detonate_dist_01.wav", "weapons/ied/water/ied_water_detonate_dist_02.wav", "weapons/ied/water/ied_water_detonate_dist_03.wav"}, "weapons/underwater_explode3.wav")

ENT.Floats = false
ENT.FloatRise = 60
ENT.FloatDepth = 5

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Planted")
    self:NetworkVar("Bool", 2, "Triggered")
end

if SERVER then

    local STEP = 6

    local function wet(p)
        return bit.band(util.PointContents(p), CONTENTS_WATER) != 0
    end

    function ENT:WaterTop(from)
        local base = nil

        for i = 0, 10 do
            if wet(from + Vector(0, 0, i * STEP)) then base = i break end
        end

        if !base then return nil end

        for i = base, 250 do
            if !wet(from + Vector(0, 0, i * STEP)) then
                return from.z + (i - 1) * STEP
            end
        end

        return nil
    end

    function ENT:Lift()
        local phys = self:GetPhysicsObject()
        if !IsValid(phys) then return end

        phys:Wake()
        phys:EnableGravity(false)

        local v = phys:GetVelocity()
        phys:SetVelocity(Vector(v.x * 0.7, v.y * 0.7, self.FloatRise))
    end

    function ENT:FloatThink()
        local pos = self:GetPos()
        local top = self:WaterTop(pos)

        if !top then
            if self:WaterLevel() >= 2 then self:Lift() end
            return
        end

        local want = top - self.FloatDepth

        if pos.z >= want then
            self:Moor(Vector(pos.x, pos.y, want))
            return
        end

        self:Lift()
    end

    function ENT:Moor(pos)
        if self:GetPlanted() then return end

        self:SetPos(pos)
        self:SetAngles(Angle(0, self:GetAngles().y, 0))
        self:SetMoveType(MOVETYPE_NONE)

        local phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:EnableMotion(false)
            phys:Sleep()
        end

        self:SetPlanted(true)
        self.PlantTime = CurTime()
        self.PlantNormal = vector_up

        self:EmitSound("ambient/water/water_splash" .. math.random(1, 3) .. ".wav", 65, 95, 0.6)
        self:OnPlanted()
    end

    concommand.Add("arccw_uo_mine_debug", function(ply)
        local n = 0
        for _, e in ipairs(ents.FindByClass("arccw_uo_dev_navalmine")) do
            n = n + 1
            local pos = e:GetPos()
            print(string.format(
                "[UO] mine %d  Floats=%s planted=%s armed=%s waterlevel=%d contents_water=%s watertop=%s z=%.1f",
                n, tostring(e.Floats), tostring(e:GetPlanted()), tostring(e:GetArmed()),
                e:WaterLevel(),
                tostring(bit.band(util.PointContents(pos), CONTENTS_WATER) != 0),
                tostring(e:WaterTop(pos)), pos.z))
        end
        if n == 0 then print("[UO] no naval mines placed") end
    end)

    function ENT:OnGrenadeCollide(data, physobj)
        if self.Floats and !self:GetPlanted() and self:WaterLevel() >= 2 then return end

        return self.BaseClass.OnGrenadeCollide(self, data, physobj)
    end

    function ENT:Think()
        if self.Floats and !self:GetPlanted() then
            self:FloatThink()
        end

        return self.BaseClass.Think(self)
    end

    function ENT:DeviceThink()
        if self:GetTriggered() then return end

        local ct = CurTime()

        if ct >= (self.NextBeep or 0) then
            self.NextBeep = ct + self.BeepInterval
            self:EmitSound(UO.PickSound(self.BeepSound), 60, 85, 0.35)
        end

        if ct < (self.NextScan or 0) then return end
        self.NextScan = ct + 0.1

        for _, ent in ipairs(UO.FindTargets(self:GetPos(), self.TriggerRange, self)) do
            self:Trip()
            return
        end
    end

    function ENT:Trip()
        if self:GetTriggered() then return end
        self:SetTriggered(true)

        self:EmitSound(UO.PickSound(self.BeepSound), 75, 170, 1)

        timer.Simple(self.TriggerDelay, function()
            if !IsValid(self) then return end
            self:Detonate()
        end)
    end

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end

        if !self.Wet and self:WaterLevel() >= 2 then
            self.Wet = true
            self.GrenadeRadius = self.GrenadeRadius * self.WaterRadiusMult
            self.GrenadeDamage = self.GrenadeDamage * self.WaterDamageMult
            self.ExplosionShake = self.ExplosionShake * 1.5

            self.ExplosionSounds = self.WaterSounds
            self.ExplosionSoundsIndoors = self.WaterSoundsDistant
        end

        return self.BaseClass.Detonate(self, pos)
    end

    function ENT:PostDetonation()
        local attacker = self:GetAttacker()

        if !self.Wet then
            UO.Shrapnel(self, attacker, self.FragCount, self.FragDamage, self.FragRange)
        end

        UO.BustDoors(self, self:GetPos(), self.GrenadeRadius * 0.6)
    end

end
