AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "Sensor Grenade"

local UO = ArcCW.UO

ENT.GrenadeRadius = 0
ENT.GrenadeDamage = 0
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.DebrisSounds = false
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/uc_grenades/w_eq_sensorgrenade_thrown.mdl"
ENT.ModelFallback = "models/uc_grenades/w_eq_sensor_grenade.mdl"

ENT.PhysMass = 0.5
ENT.PhysElasticity = 0.25

ENT.StickMode = false
ENT.ArmTime = 1

ENT.Health_ = 20
ENT.DetonateOnDestroyed = false

ENT.ScanRange = 1100
ENT.PingInterval = 1.75
ENT.Lifetime = 24

ENT.LightColorIdle = Color(60, 160, 255)
ENT.LightColorArmed = Color(80, 200, 255)

ENT.PingSound = UO.Sound("npc/scanner/scanner_blip1.wav", "buttons/blip1.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Planted")
    self:NetworkVar("Bool", 2, "Triggered")
end

if SERVER then

    function ENT:OnDeviceSpawned()
        self:SetPlanted(true)
        self.PlantTime = CurTime()
        self.ExpireAt = CurTime() + self.Lifetime + self.ArmTime
    end

    function ENT:OnArmed()
        self:EmitSound(UO.PickSound(self.ArmSound), 70, 150, 0.7)
    end

    function ENT:DeviceThink()
        if CurTime() < (self.NextPing or 0) then return end
        self.NextPing = CurTime() + self.PingInterval

        local pos = self:GetPos()

        self:EmitSound(UO.PickSound(self.PingSound), 80, 110, 0.8)

        local tagged = UO.FindTargets(pos, self.ScanRange, self)
        if #tagged == 0 then return end

        UO.SensorPing(tagged, self.PingInterval + 0.5)
    end

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end
        self.BOOM = true
        self:Expire()
    end

    function ENT:Expire()
        self:EmitSound(UO.PickSound(self.BeepSound), 65, 70, 0.5)
        SafeRemoveEntityDelayed(self, 0.2)
        self.ExpireAt = nil
    end

else

    function ENT:GrenadeThinkCL()
        if self.Ticks % 2 != 0 then return end

        local armed = self:GetArmed()
        local c = armed and self.LightColorArmed or self.LightColorIdle

        local pulse = armed and (0.5 + 0.5 * math.sin(CurTime() * 6)) or 0.35

        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = self:GetPos() + Vector(0, 0, 3)
            dl.r, dl.g, dl.b = c.r, c.g, c.b
            dl.Brightness = 1.5 * pulse
            dl.Decay = 1500
            dl.Size = 140 * pulse
            dl.DieTime = CurTime() + 0.15
        end
    end

end
