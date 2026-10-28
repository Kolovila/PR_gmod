AddCSLuaFile()
SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.PrintName = "9K38 Igla"
SWEP.TrueName = "9K38 Igla"
SWEP.Author = "Urban Resurgence / Krazy"
SWEP.Slot = 4
SWEP.Trivia_Class = "Man-Portable Air Defence System"
SWEP.Trivia_Manufacturer = "KB Mashinostroyeniya"
SWEP.Trivia_Calibre = "72 mm / 9M39"
SWEP.Trivia_Mechanism = "Ejection motor / dual-band infrared seeker"
SWEP.Trivia_Country = "Soviet Union"
SWEP.Trivia_Year = 1983
SWEP.Trivia_Desc =
    [[The Needle trades the anti-tank launcher's large shaped charge for a fast, compact fragmentation missile built to intercept aircraft. A cooled infrared seeker acquires the target before launch; the gunner can then leave immediately. The missile ejects before its sustainer lights and flies a direct interception path, without a Javelin-style climb.

Aim at a vehicle or aircraft, allow the seeker to prepare, and hold the target inside the acquisition cone until the tone confirms lock. Rear-aspect and airborne targets acquire faster; movement slows acquisition. Close targets are inhibited and the warhead remains safe during initial flight. Aimed use continues to illuminate semi-active radar missiles after firing. Optional guidance packages offer manual laser steering, continuous radar illumination or autonomous radar acquisition. A thermal observation sight helps identify vehicles in poor visibility.]]
SWEP.UseHands = true
SWEP.ViewModel = "models/uc_igla/igla_v.mdl"
SWEP.WorldModel = "models/uc_igla/igla_w.mdl"
SWEP.ViewModelFOV = 55
SWEP.MirrorVMWM = false
SWEP.DefaultBodygroups = "00"
SWEP.DefaultSkin = 0
SWEP.Damage = 520
SWEP.DamageMin = 520
SWEP.DamageType = DMG_BLAST
SWEP.BlastRadius = 230
SWEP.DamageRand = 0
SWEP.Range = 600
SWEP.Penetration = 0
SWEP.ShootEntity = "arccw_uc_igla_missile"
SWEP.MuzzleVelocity = 900
SWEP.PhysBulletDontInheritPlayerVelocity = true
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1
SWEP.ForceDefaultClip = 1
SWEP.ForceDefaultAmmo = 2
SWEP.Primary.Ammo = "RPG_Round"
SWEP.MagID = "uc_igla"
SWEP.Num = 1
SWEP.Delay = 1.4
SWEP.Firemodes = { { Mode = 1, PrintName = "SEEKER" }, { Mode = 0 } }
SWEP.NPCWeaponType = "weapon_rpg"
SWEP.NPCWeight = 80
SWEP.Recoil = 0.55
SWEP.RecoilSide = 0.12
SWEP.RecoilRise = 0.15
SWEP.RecoilPunch = 1.1
SWEP.Sway = 1.5
SWEP.AccuracyMOA = 0
SWEP.HipDispersion = 0
SWEP.MoveDispersion = 0
SWEP.NeverFreeAim = true
SWEP.SpeedMult = 0.74
SWEP.SightedSpeedMult = 0.4
SWEP.SightTime = 0.7
SWEP.ShootVol = 110
SWEP.ShootPitch = 100
SWEP.ShootSound = "igla/motor_fire.wav"
SWEP.DistantShootSound = "igla/fire_alt.wav"
SWEP.ShootDrySound = "igla/click.wav"
SWEP.MuzzleEffect = ""
SWEP.ShellEffect = ""
SWEP.MuzzleEffectAttachment = 1
SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false
SWEP.ReloadInSights = false
SWEP.LockSightsInPriorityAnim = true
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "rpg"
SWEP.HoldtypeSights = "rpg"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.ActivePos = Vector(0.8, -0.488, 1.36)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(0.35, -2, 2)
SWEP.SprintAng = Angle(-10, 0, -3)
SWEP.HolsterPos = Vector(3, 0, -5)
SWEP.HolsterAng = Angle(-40, -30, 10)
SWEP.CustomizePos = Vector(3.24, 2.439, -0.96)
SWEP.CustomizeAng = Angle(12.683, 19.512, -2.927)
SWEP.BarrelLength = 36
SWEP.IronSightStruct = {
    Pos = Vector(-3.593, -0.612, 0.955),
    Ang = Angle(-1.278, -0.885, 0.589),
    Magnification = 1.15,
    CrosshairInSights = false,
    SwitchToSound = "igla/iron_in.wav",
    SwitchFromSound = "igla/iron_out.wav",
}
SWEP.Attachments = {
    {
        PrintName = "Sight",
        Slot = "uc_igla_optic",
        DefaultAttName = "Mechanical Sight",
        DefaultAttIcon = Material("entities/att/uc_igla/optic_mechanical.png", "smooth mips"),
    },
    {
        PrintName = "Missile / Guidance",
        Slot = "uc_igla_round",
        DefaultAttName = "9M39 Infrared",
        DefaultAttIcon = Material("entities/att/uc_igla/missile_ir.png", "smooth mips"),
    },
    { PrintName = "Training", Slot = { "uc_tp", "uc_igla_training" }, DefaultAttName = "Basic Training" },
}
SWEP.AttachmentElements = {
    uc_igla_scope = { VMBodygroups = { { ind = 1, bg = 1 } }, WMBodygroups = { { ind = 1, bg = 1 } } },
    uc_igla_laser = { VMSkin = 1, WMSkin = 1 },
    uc_igla_passive = { VMSkin = 2, WMSkin = 2 },
    uc_igla_active = { VMSkin = 3, WMSkin = 3 },
}

SWEP.Animations = {
    idle = { Source = "idle", Time = 1 },
    idle_empty = { Source = "idle_empty", Time = 1 },
    draw = { Source = "draw", Time = 1.1 },
    draw_empty = { Source = "draw_empty", Time = 1.1 },
    ready = { Source = "draw", Time = 1.4 },
    holster = { Source = "holster", Time = 0.65 },
    holster_empty = { Source = "holster_empty", Time = 0.65 },
    fire = {
        Source = "fire_empty",
        Time = 1.5,
        SoundTable = { { s = UCIgla.Sound("mech"), t = 0, c = CHAN_AUTO, v = 0.7 } },
    },
    fire_iron = {
        Source = "iron_fire_empty",
        Time = 1.5,
        SoundTable = { { s = UCIgla.Sound("mech"), t = 0, c = CHAN_AUTO, v = 0.7 } },
    },

    reload = {
        Source = "reload",
        Time = 5.2,
        MinProgress = 5.2,
        SoundTable = { { s = UCIgla.Sound("insert_slide"), t = 0.1, c = CHAN_AUTO, v = 0.7 } },
    },
    idle_sprint = { Source = "sprint", Time = 1 },
    idle_sprint_empty = { Source = "sprint_empty", Time = 1 },
    inspect = { Source = "idle", Time = 2.4, SoundTable = { { s = UCIgla.Sound("clank"), t = 0.6 } } },
}
SWEP.Animations.reload_empty = SWEP.Animations.reload

function SWEP:IglaAiming()
    local owner = self:GetOwner()
    return IsValid(owner)
        and owner:IsPlayer()
        and owner:GetActiveWeapon() == self
        and self:GetState() == ArcCW.STATE_SIGHTS
        and self:GetSightDelta() < 0.08
        and not self:GetReloading()
        and not self:GetPriorityAnim()
        and self:GetHolster_Time() == 0
end
function SWEP:IglaReset(cooling)
    if not SERVER then
        return
    end
    self:SetNW2Entity("UCIglaTarget", NULL)
    self:SetNW2Float("UCIglaProgress", 0)
    self:SetNW2Bool("UCIglaLocked", false)
    self.UCIglaLastSeen = nil
    if cooling then
        self.UCIglaReadyAt = nil
        self:SetNW2Bool("UCIglaReady", false)
    end
end
function SWEP:IglaCheck(ent, retain)
    local owner = self:GetOwner()
    if not IsValid(owner) or not UCIgla.Target(ent) or UCIgla.Friendly(owner, ent) then
        return false, "NO HOSTILE VEHICLE"
    end
    local p = UCIgla.Profile(self)
    local delta = UCIgla.Point(ent) - owner:GetShootPos()
    local distance = delta:Length()
    if distance < 650 then
        return false, "TOO CLOSE"
    end
    if distance > p.range then
        return false, "OUT OF RANGE"
    end
    local cone = p.cone * (retain and 1.6 or 1)
    if delta:GetNormalized():Dot(owner:GetAimVector()) < math.cos(math.rad(cone)) then
        return false, "CENTER TARGET"
    end
    if not UCIgla.Visible(owner:GetShootPos(), ent, { owner, self }) then
        return false, "OBSCURED"
    end
    return true
end
SWEP.Hook_Think = function(self)
    if CLIENT then
        if self.IglaAudio then
            self:IglaAudio()
        end
        return
    end
    if (self.UCIglaNextThink or 0) > CurTime() then
        return
    end
    self.UCIglaNextThink = CurTime() + 0.05
    local p, kind = UCIgla.Profile(self)
    if kind ~= self.UCIglaLastRound then
        if self.UCIglaLastRound and self:Clip1() > 0 then
            local owner = self:GetOwner()
            if IsValid(owner) then
                owner:GiveAmmo(self:Clip1(), self.Primary.Ammo, true)
            end
            self:SetClip1(0)
        end
        self.UCIglaLastRound = kind
        self:IglaReset(true)
    end
    local owner = self:GetOwner()
    if not self:IglaAiming() or owner:WaterLevel() >= 3 then
        self:IglaReset(true)
        self:SetNW2String("UCIglaStatus", "STANDBY")
        return
    end

    if self:Clip1() <= 0 and kind ~= "passive" and kind ~= "laser" then
        self:IglaReset(true)
        self:SetNW2String("UCIglaStatus", "EMPTY TUBE")
        return
    end
    self.UCIglaReadyAt = self.UCIglaReadyAt or CurTime() + 1.2
    if CurTime() < self.UCIglaReadyAt then
        self:SetNW2String("UCIglaStatus", "SEEKER PREPARATION")
        return
    end
    self:SetNW2Bool("UCIglaReady", true)
    if kind == "laser" or kind == "active" then
        self:IglaReset(false)
        self:SetNW2String("UCIglaStatus", kind == "laser" and "LASER / HOLD AIM" or "RADAR / LEAD TARGET")
        return
    end
    local ent = self:GetNW2Entity("UCIglaTarget")
    local valid, reason = self:IglaCheck(ent, true)
    if not valid then
        self:SetNW2Bool("UCIglaLocked", false)
        if IsValid(ent) and self.UCIglaLastSeen and CurTime() - self.UCIglaLastSeen < 0.2 then
            self:SetNW2String("UCIglaStatus", reason)
            return
        end
        self:IglaReset(false)
        local best, score = NULL, -1
        for _, target in ipairs(ents.FindInSphere(owner:GetShootPos(), p.range)) do
            if UCIgla.Target(target) then
                local ok, why = self:IglaCheck(target, false)
                local dot = (UCIgla.Point(target) - owner:GetShootPos())
                    :GetNormalized()
                    :Dot(owner:GetAimVector())
                if ok and dot > score then
                    best, score = target, dot
                end
                if not ok and dot > 0.995 then
                    reason = why
                end
            end
        end
        ent = best
        if not IsValid(ent) then
            self:SetNW2String("UCIglaStatus", reason or "NO TARGET")
            return
        end
        self:SetNW2Entity("UCIglaTarget", ent)
    end
    self.UCIglaLastSeen = CurTime()
    local duration = p.lock
    local airborne = UCIgla.AirNPCs[ent:GetClass()]
        or ent.LFS
        or ent.LVS
        or ent.IsAircraft
        or (ent:GetVelocity():Length() > 150 and not ent:IsOnGround())
    if kind == "ir" then
        duration = duration * (airborne and 0.8 or 1.4)
        local rear = ent:GetForward():Dot((owner:GetShootPos() - ent:GetPos()):GetNormalized()) < -0.4
        if rear then
            duration = duration * 0.75
        end
    end
    if owner:Crouching() then
        duration = duration * 0.85
    end
    if owner:GetVelocity():Length2D() > 70 then
        duration = duration * 1.5
    end
    local progress = math.min(1, self:GetNW2Float("UCIglaProgress", 0) + 0.05 / duration)
    self:SetNW2Float("UCIglaProgress", progress)
    self:SetNW2Bool("UCIglaLocked", progress >= 1)
    self:SetNW2String("UCIglaStatus", progress >= 1 and "LOCK / LAUNCH" or "ACQUIRING")
end
SWEP.Hook_ShouldNotFire = function(self)
    local owner = self:GetOwner()
    if not IsValid(owner) or owner:WaterLevel() >= 3 then
        return true
    end

    if owner:IsNPC() then
        return not self:IglaCheck(owner:GetEnemy(), true)
    end
    local _, kind = UCIgla.Profile(self)
    local ready = self:IglaAiming() and self:GetNW2Bool("UCIglaReady", false)
    if kind == "ir" or kind == "passive" then
        ready = ready
            and self:GetNW2Bool("UCIglaLocked", false)
            and self:IglaCheck(self:GetNW2Entity("UCIglaTarget"), true)
    end
    local obstruction = util.TraceHull({
        start = owner:GetShootPos(),
        endpos = owner:GetShootPos() + owner:GetAimVector() * 64,
        mins = Vector(-3, -3, -3),
        maxs = Vector(3, 3, 3),
        filter = { owner, self },
        mask = MASK_SHOT,
    })
    if ready and not obstruction.Hit then
        return
    end
    if SERVER and (self.UCIglaNextNotice or 0) < CurTime() then
        self.UCIglaNextNotice = CurTime() + 1
        owner:PrintMessage(
            HUD_PRINTCENTER,
            obstruction.Hit and "Launch tube obstructed"
                or "Aim and prepare the seeker; IR / semi-active rounds require lock"
        )
    end
    return true
end
SWEP.Hook_PostFireRocket = function(self, rocket)
    if not IsValid(rocket) then
        return
    end
    local p, kind = UCIgla.Profile(self)
    rocket.Profile = table.Copy(p)
    rocket.Kind = kind
    rocket.Launcher = self
    rocket.Attacker = self:GetOwner()
    rocket.LastTrack = CurTime()
    rocket.Target = self:GetOwner():IsNPC() and self:GetOwner():GetEnemy()
        or self:GetNW2Entity("UCIglaTarget")
    rocket:SetSkin(p.skin)
    rocket.Damage = p.damage * self:GetBuff_Mult("Mult_Damage")
    rocket.BlastRadius = p.radius * self:GetBuff_Mult("Mult_BlastRadius")
    rocket.Direction = self:GetOwner():GetAimVector()
    rocket:SetPos(self:GetOwner():GetShootPos() + rocket.Direction * 32)
    if kind ~= "passive" then
        self:IglaReset(true)
    end
end
SWEP.Hook_PreReload = function(self)
    self:IglaReset(true)
end
SWEP.Hook_OnDeploy = function(self)
    self:IglaReset(true)
end
SWEP.Hook_OnHolster = function(self)
    self:IglaReset(true)
    if self.IglaCleanup then
        self:IglaCleanup()
    end
end
SWEP.Hook_OnHolsterEnd = SWEP.Hook_OnHolster
function SWEP:OnRemove()
    if self.IglaCleanup then
        self:IglaCleanup()
    end
    local base = baseclass.Get("arccw_base")
    if base and base.OnRemove then
        base.OnRemove(self)
    end
end

if CLIENT then
    function SWEP:FormPP() end
    function SWEP:FormThermalImaging() end
    function SWEP:TranslateFOV(fov)
        local base = baseclass.Get("arccw_base")
        local sight = self:GetActiveSights()
        if sight and self:GetBuff_Override("Override_UCIglaThermal") then
            local magnification = sight.ScopeMagnification
            local magnifiedOptic = sight.MagnifiedOptic
            sight.ScopeMagnification = 1

            sight.MagnifiedOptic = false
            local result = base.TranslateFOV(self, fov)
            sight.ScopeMagnification = magnification
            sight.MagnifiedOptic = magnifiedOptic
            return result
        end
        return base.TranslateFOV(self, fov)
    end

    function SWEP:FormRTScope() end
    function SWEP:FormCheapScope() end
    function SWEP:IglaCleanup()
        for _, patch in pairs(self.UCIglaAudio or {}) do
            patch:Stop()
        end
        self.UCIglaAudio = nil
        if IsValid(self.UCIglaVM) then
            self.UCIglaVM:SetSubMaterial(4, "")
        end
        self.UCIglaVM = nil
    end
    function SWEP:IglaAudio()
        if self:GetOwner() ~= LocalPlayer() or not self:IglaAiming() then
            self:IglaCleanup()
            return
        end
        if not self.UCIglaAudio then
            self.UCIglaAudio = {}
            for _, sample in ipairs({ "hum_loop", "seeking", "locked", "scope_hum" }) do
                self.UCIglaAudio[sample] = CreateSound(self, "igla/" .. sample .. ".wav")
            end
        end
        local thermal = self:GetBuff_Override("Override_UCIglaThermal")
        if not thermal and IsValid(self.UCIglaVM) then
            self.UCIglaVM:SetSubMaterial(4, "")
            self.UCIglaVM = nil
        end
        local _, kind = UCIgla.Profile(self)
        local progress = self:GetNW2Float("UCIglaProgress", 0)
        local locked = self:GetNW2Bool("UCIglaLocked", false)
        for sample, patch in pairs(self.UCIglaAudio) do
            local play = sample == "scope_hum" and thermal
                or sample == "hum_loop" and not thermal
                or sample == "seeking" and not thermal and progress > 0 and not locked
                or sample == "locked" and not thermal and locked
            if play then
                if not patch:IsPlaying() then
                    patch:PlayEx(0.25, 100)
                end
            else
                patch:Stop()
            end
        end
        if not thermal and kind == "passive" and progress > 0 and (self.UCIglaNextRadar or 0) < CurTime() then
            self.UCIglaNextRadar = CurTime() + 0.8
            self:EmitSound("igla/aa_tracking_" .. math.random(1, 3) .. ".wav", 55, 100, 0.3, CHAN_ITEM)
        end
    end
    SWEP.Hook_DrawHUD = function(self)
        if not self:IglaAiming() or self:GetBuff_Override("Override_UCIglaThermal") then
            return
        end
        local status = self:GetNW2String("UCIglaStatus", "STANDBY")
        draw.SimpleText(
            status,
            "DermaDefaultBold",
            ScrW() / 2,
            ScrH() * 0.66,
            Color(230, 220, 170),
            TEXT_ALIGN_CENTER
        )
    end
end
