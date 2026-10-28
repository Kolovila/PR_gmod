AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Zarya"

local UO = ArcCW.UO

ENT.GrenadeRadius = 150
ENT.GrenadeDamage = 12
ENT.GrenadeDamageType = DMG_BLAST
ENT.FuseTime = 1.8

ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.ExplosionShake = 0
ENT.DebrisSounds = false
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/weapons/eqp/thrnw/w_arccw_r_clbr_zarya.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.3
ENT.PhysElasticity = 0.35
ENT.PhysMaterial = "metal"

ENT.BurstCount = 4
ENT.BurstDelay = 0.85
ENT.FlashPower = 430
ENT.FlashTime = 2.2

ENT.DetonateSound = UO.Sound("grenades/zarya/flash_bang.wav", "ambient/explosions/explode_4.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Int", 0, "Burst")
end

if SERVER then

    function ENT:DoDetonation()
        self:Burst(1)
    end

    function ENT:Burst(n)
        if !IsValid(self) then return end

        local pos = self:GetPos()
        local attacker = self:GetAttacker()

        self:SetBurst(n)

        if self:WaterLevel() >= 1 then
            UO.Explosion(pos, nil, true)
            sound.Play("weapons/underwater_explode3.wav", pos, 105, 140, 0.5)
        else
            sound.Play(UO.PickSound(self.DetonateSound), pos, 135, math.random(96, 106), 1)
            UO.Sparks(pos, vector_up, 6, 2)

            local ed = EffectData()
            ed:SetOrigin(pos)
            ed:SetMagnitude(3)
            ed:SetScale(1.5)
            ed:SetRadius(3)
            util.Effect("arccw_flashexplosion", ed)

            UO.Blast(self, attacker, pos, self.GrenadeRadius, self.GrenadeDamage, self.GrenadeDamageType)
            UO.Flash(pos, attacker, self.FlashPower, self.FlashTime)
        end

        if n >= self.BurstCount then
            SafeRemoveEntityDelayed(self, 0.5)
            return
        end

        timer.Simple(self.BurstDelay, function()
            if IsValid(self) then self:Burst(n + 1) end
        end)
    end

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end
        self.BOOM = true
        self:DoDetonation()
    end

end

if CLIENT then
    function ENT:GrenadeThinkCL()
        if self:GetBurst() <= 0 then return end
        if self.Ticks % 2 != 0 then return end

        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = self:GetPos()
            dl.r, dl.g, dl.b = 255, 250, 230
            dl.Brightness = 1.2
            dl.Decay = 2000
            dl.Size = 90
            dl.DieTime = CurTime() + 0.1
        end
    end
end
