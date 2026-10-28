AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false
ENT.ArcCWProjectile = true

ENT.BlastRadius = 220
ENT.BlastDamage = 70
ENT.MinHealthLeft = 5

function ENT:Draw()
    render.SetMaterial(Material("sprites/strider_blackball"))
    render.DrawSprite(self:GetPos(), 64, 64, Color(255, 255, 255))
end

function ENT:Initialize()
    self:SetModel("models/hunter/misc/sphere025x025.mdl")
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE)
    self:DrawShadow(false)

    if SERVER then
        self.TeleportedEntity = nil
    end
end

function ENT:Think()
    if CLIENT then
        local light = DynamicLight(self:EntIndex())
        if light then
            light.Pos = self:GetPos()
            light.r, light.g, light.b = 0, 0, 255
            light.Brightness = 1
            light.Size = 256
            light.Decay = 250
            light.DieTime = CurTime() + 0.2
        end
    end

    if SERVER and self:WaterLevel() > 0 then
        self:Remove()
    end
end

function ENT:PhysicsCollide(data, phys)
    if not SERVER then return end

    local hit = data.HitEntity
    if IsValid(hit) and (hit:IsNPC() or hit:IsPlayer() or IsValid(hit:GetPhysicsObject())) then
        self.TeleportedEntity = hit
    end
    self:Remove()
end

if SERVER then
    local function HullFor(ent)
        local mins, maxs = ent:OBBMins(), ent:OBBMaxs()
        if ent:IsPlayer() then return mins, maxs end
        return mins - Vector(2, 2, 0), maxs + Vector(2, 2, 2)
    end

    function ENT:FindValidTeleportPosition(ent)
        local wmins, wmaxs = game.GetWorld():GetModelBounds()
        if not wmins or not wmaxs then return nil end

        local mins, maxs = HullFor(ent)
        local origin = self:GetPos()
        local minDist = 600

        local anchors = {}
        for _, cls in ipairs({"info_player_start", "info_player_deathmatch",
                              "info_player_combine", "info_player_rebel"}) do
            for _, e in ipairs(ents.FindByClass(cls)) do
                anchors[#anchors + 1] = e:GetPos()
            end
        end

        for attempt = 1, 150 do
            local candidate

            if #anchors > 0 and attempt % 2 == 0 then
                local a = anchors[math.random(#anchors)]
                candidate = a + Vector(math.Rand(-600, 600), math.Rand(-600, 600), 16)
            else
                candidate = Vector(math.Rand(wmins.x, wmaxs.x),
                                   math.Rand(wmins.y, wmaxs.y),
                                   math.Rand(wmins.z, wmaxs.z))
            end

            if util.IsInWorld(candidate) then
                local down = util.TraceLine({
                    start = candidate,
                    endpos = candidate - Vector(0, 0, 8192),
                    mask = MASK_SOLID_BRUSHONLY,
                })

                if down.Hit and not down.HitSky and not down.StartSolid then
                    local pos = down.HitPos + Vector(0, 0, 4)

                    if pos:DistToSqr(origin) > minDist * minDist and util.IsInWorld(pos) then
                        local fit = util.TraceHull({
                            start = pos,
                            endpos = pos,
                            mins = mins,
                            maxs = maxs,
                            mask = MASK_PLAYERSOLID,
                            filter = ent,
                        })

                        if not fit.Hit and not fit.StartSolid then
                            return pos
                        end
                    end
                end
            end
        end

        return nil
    end

    local function Sparkle(pos)
        local eff = EffectData()
        eff:SetOrigin(pos)
        eff:SetMagnitude(3)
        eff:SetScale(2)
        util.Effect("cball_explode", eff)
    end

    function ENT:Displace(ent)
        local dest = self:FindValidTeleportPosition(ent)
        if not dest then return false end

        Sparkle(ent:GetPos())
        ent:EmitSound("weapons/40mm_displacer/40mm_displacer_teleport.wav", 90)

        ent:SetPos(dest)

        if ent:IsPlayer() then
            ent:SetVelocity(-ent:GetVelocity())
            ent:SetGroundEntity(NULL)
        elseif ent:IsNPC() then
            ent:SetVelocity(vector_origin)
        else
            local phys = ent:GetPhysicsObject()
            if IsValid(phys) then
                phys:SetVelocity(vector_origin)
                phys:Wake()
            end
        end

        Sparkle(dest)
        return true
    end

    function ENT:HurtWithoutKilling()
        local attacker = self:GetOwner()
        if not IsValid(attacker) then attacker = self end

        for _, ent in ipairs(ents.FindInSphere(self:GetPos(), self.BlastRadius)) do
            if not IsValid(ent) then continue end
            if not (ent:IsPlayer() or ent:IsNPC() or IsValid(ent:GetPhysicsObject())) then continue end

            local frac = math.Clamp(1 - (ent:GetPos():Distance(self:GetPos()) / self.BlastRadius), 0, 1)
            local amount = self.BlastDamage * frac
            if amount < 1 then continue end

            if ent:IsPlayer() or ent:IsNPC() then
                local survivable = math.max(ent:Health() - self.MinHealthLeft, 0)
                amount = math.min(amount, survivable)
                if amount < 1 then continue end
            end

            local dmg = DamageInfo()
            dmg:SetAttacker(attacker)
            dmg:SetInflictor(self)
            dmg:SetDamageType(DMG_SHOCK)
            dmg:SetDamage(amount)
            dmg:SetDamagePosition(self:GetPos())
            dmg:SetDamageForce((ent:GetPos() - self:GetPos()):GetNormalized() * 400)
            ent:TakeDamageInfo(dmg)
        end
    end
end

function ENT:OnRemove()
    if CLIENT then
        local light = DynamicLight(self:EntIndex())
        if light then
            light.Pos = self:GetPos()
            light.r, light.g, light.b = 0, 0, 255
            light.Brightness = 2
            light.Size = 256
            light.Decay = 250
            light.DieTime = CurTime() + 0.5
        end
        return
    end

    self:HurtWithoutKilling()
    self:EmitSound("weapons/40mm_displacer/40mm_displacer_impact.wav", 95)

    local target = self.TeleportedEntity
    if not IsValid(target) then return end

    local pos = self:GetPos()
    local owner = self:GetOwner()
    local finder = self.FindValidTeleportPosition
    local displace = self.Displace

    timer.Simple(0, function()
        if not IsValid(target) then return end

        local ghost = {
            GetPos = function() return pos end,
            GetOwner = function() return owner end,
            FindValidTeleportPosition = finder,
            Displace = displace,
        }

        if not displace(ghost, target) then
            local eff = EffectData()
            eff:SetOrigin(pos)
            util.Effect("cball_bounce", eff)
        end
    end)
end
