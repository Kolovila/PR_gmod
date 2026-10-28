AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Base Placed Ordnance"
ENT.Spawnable = false

local UO = ArcCW.UO

ENT.FuseTime = math.huge
ENT.ArmTime = 1.5
ENT.BounceSounds = true

ENT.StickMode = "flat"
ENT.StickToProps = true
ENT.StickOffset = 0

ENT.Health_ = 25
ENT.DetonateOnDestroyed = false

ENT.ArmSound = UO.Sound("buttons/button17.wav", "buttons/blip1.wav")
ENT.BeepSound = UO.Sound("npc/roller/mine/rmine_blip1.wav", "buttons/blip1.wav")
ENT.BeepInterval = 1.5

ENT.LightColorIdle = Color(255, 190, 40)
ENT.LightColorArmed = Color(255, 40, 40)

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Planted")
    self:NetworkVar("Bool", 2, "Triggered")
end

if SERVER then

    function ENT:OnGrenadeSpawned()
        self:SetPlanted(false)

        self:SetMaxHealth(self.Health_)
        self:SetHealth(self.Health_)

        local life = UO.PlacedLife()
        if life < math.huge then
            self.ExpireAt = CurTime() + life
        end

        self:OnDeviceSpawned()
    end

    function ENT:OnDeviceSpawned()
    end

    function ENT:Think()
        if self:GetPlanted() and !self:GetArmed() and CurTime() - (self.PlantTime or 0) >= self.ArmTime then
            self:SetArmed(true)
            self:OnArmed()
        end

        if self.ExpireAt and CurTime() >= self.ExpireAt then
            self:Expire()
            if !IsValid(self) then return end
        end

        if self:GetArmed() then
            self:DeviceThink()
            if !IsValid(self) then return end
        end

        self:NextThink(CurTime())
        return true
    end

    function ENT:DeviceThink()
    end

    function ENT:OnArmed()
        if self.ArmSound then
            self:EmitSound(UO.PickSound(self.ArmSound), 65, 120, 0.7)
        end
    end

    function ENT:Expire()
        self:Remove()
    end

    function ENT:OnGrenadeCollide(data, physobj)
        if self:GetPlanted() then return end
        if !self.StickMode then return end

        local hit = data.HitEntity
        local world = !IsValid(hit)

        if !world and !self.StickToProps then return end
        if !world and (hit:IsPlayer() or hit:IsNPC() or hit:IsNextBot()) then return end

        local pos = data.HitPos
        local vel = data.OurOldVelocity

        timer.Simple(0, function()
            if !IsValid(self) then return end
            self:Plant(pos, vel, world and NULL or hit)
        end)
    end

    function ENT:Plant(pos, vel, parent)
        if self:GetPlanted() then return end

        local dir = vel:GetNormalized()
        if dir:LengthSqr() < 0.01 then dir = Vector(0, 0, -1) end

        local tr = util.TraceLine({
            start = pos - dir * 12,
            endpos = pos + dir * 12,
            mask = MASK_SOLID,
            filter = self,
        })

        local up = tr.Hit and tr.HitNormal or vector_up
        if up:LengthSqr() < 0.01 then up = vector_up end
        up = Vector(up)
        up:Normalize()

        local ang

        if self.StickMode == "upright" then
            local fwd = vel:GetNormalized()
            fwd = fwd - up * fwd:Dot(up)

            if fwd:LengthSqr() < 0.01 then
                fwd = Vector(1, 0, 0)
                fwd = fwd - up * fwd:Dot(up)

                if fwd:LengthSqr() < 0.01 then
                    fwd = Vector(0, 1, 0)
                    fwd = fwd - up * fwd:Dot(up)
                end
            end
            fwd:Normalize()

            ang = fwd:AngleEx(up)
        else
            ang = up:Angle()
            ang:RotateAroundAxis(ang:Right(), -90)
        end

        if self.StickAngleOffset then
            ang:RotateAroundAxis(ang:Up(), self.StickAngleOffset.y or 0)
            ang:RotateAroundAxis(ang:Right(), self.StickAngleOffset.p or 0)
            ang:RotateAroundAxis(ang:Forward(), self.StickAngleOffset.r or 0)
        end

        self:SetPlanted(true)
        self.PlantTime = CurTime()
        self.PlantNormal = up

        self:SetPos(pos + up * self.StickOffset)
        self:SetAngles(ang)

        self:SetMoveType(MOVETYPE_NONE)

        local phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:EnableMotion(false)
            phys:Sleep()
        end

        if IsValid(parent) then
            self:SetParent(parent)
        end

        self:EmitSound(UO.PickSound(UO.Snd.BounceSoft), 65, 90, 0.8)

        self:OnPlanted()
    end

    function ENT:OnPlanted()
    end

    function ENT:OnTakeDamage(dmginfo)
        if !GetConVar("arccw_uo_placedkillable"):GetBool() then return end
        if self.BOOM then return end

        self:SetHealth(self:Health() - dmginfo:GetDamage())

        if self:Health() > 0 then return end

        if self.DetonateOnDestroyed then
            self:Detonate()
        else
            self:Destroyed(dmginfo)
        end
    end

    function ENT:Destroyed(dmginfo)
        if self.BOOM then return end
        self.BOOM = true

        local pos = self:GetPos()
        UO.Sparks(pos, self.PlantNormal or vector_up, 4, 1)
        sound.Play("physics/metal/metal_box_break1.wav", pos, 75, math.random(90, 110), 1)

        self:Remove()
    end

else

    function ENT:GrenadeThinkCL()
        if self.Ticks % 2 != 0 then return end
        if !self.LightColorIdle then return end

        local armed = self:GetArmed()
        local c = armed and self.LightColorArmed or self.LightColorIdle
        if !c then return end

        local on = true
        if armed then
            on = (CurTime() % 1) < 0.15
        end

        if !on then return end

        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = self:GetPos() + (self:GetUp() * 3)
            dl.r, dl.g, dl.b = c.r, c.g, c.b
            dl.Brightness = armed and 1.5 or 0.6
            dl.Decay = 1500
            dl.Size = armed and 90 or 50
            dl.DieTime = CurTime() + 0.15
        end
    end

end
