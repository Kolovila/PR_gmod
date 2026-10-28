AddCSLuaFile()
SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.PrintName = "FGM-148 Javelin"
SWEP.TrueName = "FGM-148 Javelin"
SWEP.Slot = 4
SWEP.UseHands = true
SWEP.Trivia_Class = "Fire-and-Forget Anti-Tank Missile"
SWEP.Trivia_Desc =
    [[Built to replace the Dragon, the Javelin reached US Army units in 1996 with a welcome change of routine: the gunner could fire, then get out of sight. Its infrared seeker remembers the target while the missile climbs to attack the thinner armour above. The expensive part stays with the soldier; the spent launch tube does not.

TOP climbs and dives onto armour; DIRECT follows a lower trajectory for aircraft and covered targets. Heavy handling, seeker preparation and a lengthy tube change trade speed for precision. Crouching steadies acquisition; moving slows it. Use + Reload while aiming to switch DAY / white-hot THERMAL.]]
SWEP.Trivia_Manufacturer = "Raytheon / Lockheed Martin"
SWEP.Trivia_Calibre = "127 mm tandem HEAT"
SWEP.Trivia_Mechanism = "Soft-launch, imaging infrared guidance"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1996
SWEP.ViewModel = "models/weapons/tfa_mw2cr/javelin/c_javelin.mdl"
SWEP.WorldModel = "models/weapons/tfa_mw2cr/javelin/w_javelin.mdl"
SWEP.ViewModelFOV = 70
SWEP.WorldModelOffset =
    { pos = Vector(13, 0, -5), ang = Angle(170, -90, 10), bone = "ValveBiped.Bip01_R_Hand", scale = 1 }
SWEP.MirrorVMWM = false
SWEP.DefaultBodygroups = "00000000"
SWEP.Damage = 180
SWEP.DamageMin = 180
SWEP.Range = 600
SWEP.Penetration = 0
SWEP.DamageType = DMG_BLAST
SWEP.ShootEntity = "arccw_uc_javelin_missile"
SWEP.MuzzleVelocity = 350
SWEP.PhysBulletMuzzleVelocity = 360
SWEP.AmmoPerShot = 1
SWEP.PhysBulletDontInheritPlayerVelocity = true
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1
SWEP.ForceDefaultClip = 1
SWEP.ForceDefaultAmmo = 2
SWEP.Primary.Ammo = "RPG_Round"
SWEP.Num = 1
SWEP.Delay = 1.2
SWEP.Firemodes = {
    { Mode = 1, PrintName = "TOP ATTACK", JavelinDirect = false },
    { Mode = 1, PrintName = "DIRECT ATTACK", JavelinDirect = true },
    { Mode = 0 },
}
SWEP.Recoil = 0.65
SWEP.RecoilSide = 0.15
SWEP.RecoilRise = 0.2
SWEP.RecoilPunch = 1.2
SWEP.AccuracyMOA = 0
SWEP.HipDispersion = 0
SWEP.MoveDispersion = 0
SWEP.NeverFreeAim = true
SWEP.Sway = 1.8
SWEP.SpeedMult = 0.78
SWEP.SightedSpeedMult = 0.35
SWEP.SightTime = 0.65
SWEP.ShootVol = 105
SWEP.ShootPitch = 100
SWEP.ShootSound = "uc_javelin/fire.wav"
SWEP.DistantShootSound = SWEP.ShootSound
SWEP.MuzzleEffect = ""
SWEP.ShellEffect = ""
SWEP.MuzzleEffectAttachment = 1
SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false
SWEP.ReloadInSights = false
SWEP.LockSightsInPriorityAnim = true
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "rpg"
SWEP.HoldtypeSights = "camera"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.ActivePos = Vector(3.48, 2.927, -5.04)
SWEP.ActiveAng = Angle(14.634, -2.927, 3.902)
SWEP.SprintPos = Vector(3, -5, -3)
SWEP.SprintAng = Angle(10, 35, 0)
SWEP.CustomizePos = Vector(3.84, -1.951, -5.72)
SWEP.CustomizeAng = Angle(29.268, 11.707, 7.805)
SWEP.BarrelLength = 24
SWEP.IronSightStruct = {
    Pos = Vector(0, -1.951, -0.68),
    Ang = Angle(14.634, -2.927, 3.902),
    Magnification = 4,
    CrosshairInSights = false,
    SwitchToSound = "",
}
SWEP.Attachments = {
    {
        PrintName = "CLU / Optic",
        Slot = "uc_javelin_optic",
        DefaultAttName = "Standard CLU",
        DefaultAttIcon = Material("entities/att/uc_javelin/optic_standard.png", "smooth mips"),
    },
    {
        PrintName = "Payload",
        Slot = "ucj_payload",
        DefaultAttName = "Tandem HEAT",
        DefaultAttIcon = Material("entities/att/uc_javelin/heat.png", "smooth mips"),
    },
    {
        PrintName = "Body Type",
        Slot = "ucj_body",
        DefaultAttName = "Single Launch Tube",
        DefaultAttIcon = Material("entities/att/uc_javelin/standard.png", "smooth mips"),
    },
    {
        PrintName = "Powder Load",
        Slot = "uc_powder",
        DefaultAttName = "Standard Motor Load",
        DefaultAttIcon = Material("entities/att/uc_javelin/powder.png", "smooth mips"),
    },
    {
        PrintName = "Internals",
        Slot = { "uc_fg", "ucj_internal" },
        DefaultAttName = "Standard Guidance Unit",
        DefaultAttIcon = Material("entities/att/uc_javelin/internals.png", "smooth mips"),
    },
    { PrintName = "Training", Slot = "uc_tp", DefaultAttName = "Basic Training" },
}
SWEP.AttachmentElements = {
    ucj_twin = {
        VMElements = {
            {
                Model = "models/weapons/uc_javelin/twin_vm.mdl",
                BoneMerge = true,
                Offset = { pos = Vector(), ang = Angle() },
                ModelBodygroups = "00",
            },
        },
        WMOverride = "models/weapons/uc_javelin/twin_wm.mdl",
    },
    ucj_rest = {
        VMElements = {
            {
                Model = "models/weapons/uc_javelin/rest_vm.mdl",
                BoneMerge = true,
                Offset = { pos = Vector(), ang = Angle() },
                ModelBodygroups = "00",
            },
        },
        WMOverride = "models/weapons/uc_javelin/rest_wm.mdl",
    },
    ucj_irons = {
        VMElements = {
            {
                Model = "models/weapons/uc_javelin/irons_vm.mdl",
                BoneMerge = true,
                Offset = { pos = Vector(), ang = Angle() },
            },
        },
    },
    ucj_quad = {
        VMElements = {
            {
                Model = "models/weapons/uc_javelin/quad_vm.mdl",
                BoneMerge = true,
                Offset = { pos = Vector(), ang = Angle() },
            },
        },
        WMOverride = "models/weapons/uc_javelin/quad_wm.mdl",
    },
    ucj_brace = {
        VMElements = {
            {
                Model = "models/weapons/uc_javelin/brace_vm.mdl",
                BoneMerge = true,
                Offset = { pos = Vector(), ang = Angle() },
            },
        },
        WMOverride = "models/weapons/uc_javelin/brace_wm.mdl",
    },
}
SWEP.JavelinRange = 24000
SWEP.JavelinMinTop = 900
SWEP.JavelinMinDirect = 350
SWEP.JavelinCoolingTime = 1.25
SWEP.JavelinLockTime = 2
SWEP.JavelinLossGrace = 0.3

local snd = "weapons/tfa_mw2r/javelin/"
local customSnd = "uc_javelin/"
SWEP.JavelinReloadHold = 0.9
SWEP.Animations = {
    idle = { Source = "idle", Time = 1 },
    idle_sights = { Source = "idle", Time = 1 },
    draw = { Source = "draw", Time = 0.9 },
    ready = {
        Source = "draw_first",
        Time = 2.4,
        SoundTable = {
            { s = customSnd .. "pickup_lift.wav", t = 0.03 },
            { s = customSnd .. "pickup_removecap.wav", t = 0.67 },
        },
    },
    holster = { Source = "holster", Time = 0.65 },
    enter_sight = { Source = "ads_up", Time = 0.65 },
    exit_sight = { Source = "ads_down", Time = 0.45 },
    fire = { Source = "fire", Time = 1.1, SoundTable = { { s = customSnd .. "mech.wav", t = 0.03 } } },
    fire_iron = { Source = "fire", Time = 1.1, SoundTable = { { s = customSnd .. "mech.wav", t = 0.03 } } },

    reload = { Source = "holster", Time = 3.95, MinProgress = 3.95 },
    tube_change = {
        Source = "holster",
        Time = 0.65,
        SoundTable = { { s = snd .. "wpfoly_javelin_reload_lift_v1.wav", t = 0.03 } },
    },
    cap_open = {
        Source = "draw_first",
        Time = 2.4,
        SoundTable = {
            { s = customSnd .. "pickup_lift.wav", t = 0.03 },
            { s = customSnd .. "pickup_removecap.wav", t = 0.67 },
        },
    },
    enter_sprint = { Source = "sprint_in", Time = 0.3 },
    idle_sprint = { Source = "sprint_loop", Time = 1 },
    exit_sprint = { Source = "sprint_out", Time = 0.3 },
    inspect = {
        Source = "inspect",
        Time = 4.4,
        SoundTable = {
            { s = snd .. "wpn_h2_javelin_inspect_look_1_01.wav", t = 0.03 },
            { s = snd .. "wpn_h2_javelin_inspect_look_2_01.wav", t = 2 },
            { s = snd .. "wpn_h2_javelin_inspect_look_rest_01.wav", t = 3.33 },
        },
    },
}
SWEP.Animations.reload_empty = SWEP.Animations.reload

function SWEP:GetCapacity()
    local body = self:GetBuff_Override("Override_UCJBody")
    return body == "quad" and 4 or body == "twin" and 2 or 1
end
function SWEP:JavelinRestDeployed()
    local owner = self:GetOwner()
    return self:GetBuff_Override("Override_UCJBody") == "rest"
        and IsValid(owner)
        and owner:Crouching()
        and owner:OnGround()
        and owner:GetVelocity():Length2D() < 40
end
function SWEP:GetChamberSize()
    return 0
end
function SWEP:JavelinGuided()
    return self:GetBuff_Override("Override_UCJUnguided") ~= true
end
function SWEP:JavelinOpticLockMult()
    return (self:GetBuff_Override("Override_UCJOpticLockMult", 1) or 1)
        * (self:GetBuff_Override("Override_UCJLockMult", 1) or 1)
        * (self:JavelinRestDeployed() and 0.7 or 1)
end

function SWEP:PlayAnimation(key, mult, pred, startfrom, tt, skipholster, priority, absolute)
    local base = weapons.GetStored("arccw_base")
    mult = mult or 1
    if key ~= "reload" and key ~= "reload_empty" then
        local played =
            base.PlayAnimation(self, key, mult, pred, startfrom, tt, skipholster, priority, absolute)
        if played and key == "tube_change" then
            self:SetNextIdle(CurTime() + (self.Animations.tube_change.Time + self.JavelinReloadHold) * mult)
        end
        return played
    end
    mult = mult or 1
    if IsFirstTimePredicted() then
        self:KillTimer("UCJCapOpen")
    end
    local played = self:PlayAnimation("tube_change", mult, pred, 0, false, skipholster, true)
    if not played then
        return
    end
    self:SetTimer((self.Animations.tube_change.Time + self.JavelinReloadHold) * mult, function()
        local owner = self:GetOwner()
        if not IsValid(owner) or owner:GetActiveWeapon() ~= self or not self:GetReloading() then
            return
        end
        base.PlayAnimation(self, "cap_open", mult, true, 0, false, nil, true)
    end, "UCJCapOpen")
    return true
end

function SWEP:JavelinReset(cooling)
    if not SERVER then
        return
    end
    self:SetNW2Entity("UCJTarget", NULL)
    self:SetNW2Float("UCJProgress", 0)
    self:SetNW2Bool("UCJLocked", false)
    self.UCJLastVisible = nil
    if cooling then
        self.UCJReadyAt = nil
    end
end

function SWEP:JavelinScoped()
    if not self:JavelinGuided() then
        return false
    end
    local owner = self:GetOwner()
    return IsValid(owner)
        and owner:IsPlayer()
        and owner:GetActiveWeapon() == self
        and self:GetState() == ArcCW.STATE_SIGHTS
        and self:GetSightDelta() < 0.05
        and not self:GetReloading()
        and not self:GetPriorityAnim()
        and self:GetHolster_Time() == 0
end

function SWEP:JavelinCheck(ent, retaining)
    if not IsValid(ent) or UCJavelin.Resolve(ent, self:GetBuff_Override("Override_UCJPersonnel")) ~= ent then
        return false, "NO TARGET"
    end
    local owner = self:GetOwner()
    if ent == owner then
        return false, "NO TARGET"
    end
    local delta = UCJavelin.AimPoint(ent) - owner:GetShootPos()
    local distance = delta:Length()
    local minimum = self:GetCurrentFiremode().JavelinDirect
            and (self:GetBuff_Override("Override_UCJMinDirect", self.JavelinMinDirect) or self.JavelinMinDirect)
        or self.JavelinMinTop
    if distance < minimum then
        return false, "TOO CLOSE"
    end
    if
        distance
        > self.JavelinRange
            * self:GetBuff_Mult("Mult_Range")
            * (self:GetBuff_Override("Override_UCJOpticRange", 1) or 1)
    then
        return false, "OUT OF RANGE"
    end
    local cone = self:GetBuff_Override(
        retaining and "Override_UCJRetainCone" or "Override_UCJAcquireCone",
        retaining and 9 or 6
    )
    if delta:GetNormalized():Dot(owner:GetAimVector()) < math.cos(math.rad(cone)) then
        return false, "CENTER TARGET"
    end
    if not UCJavelin.Visible(owner, ent) then
        return false, "TARGET OBSCURED"
    end
    return true
end

SWEP.Hook_Think = function(self)
    if not SERVER then
        return
    end
    local owner = self:GetOwner()
    if not IsValid(owner) then
        self:JavelinReset(true)
        return
    end
    if not self:JavelinGuided() then
        self:JavelinReset(true)
        self:SetNW2String("UCJStatus", "UNGUIDED")
        return
    end
    if self:GetBuff_Override("Override_UCJNoThermal") then
        self:SetNW2Bool("UCJThermal", false)
    end
    if
        not self:GetBuff_Override("Override_UCJNoThermal")
        and self:JavelinScoped()
        and owner:KeyDown(IN_USE)
        and owner:KeyPressed(IN_RELOAD)
    then
        self:SetNW2Bool("UCJThermal", not self:GetNW2Bool("UCJThermal", true))
    end
    if (self.UCJNextThink or 0) > CurTime() then
        return
    end
    self.UCJNextThink = CurTime() + 0.05
    if not self:JavelinScoped() then
        self:JavelinReset(true)
        self:SetNW2String("UCJStatus", "CLU STANDBY")
        return
    end
    self.UCJReadyAt = self.UCJReadyAt
        or CurTime()
            + self.JavelinCoolingTime * (self:GetBuff_Override("Override_UCJCoolingMult", 1) or 1) * (self:GetBuff_Override(
                "Override_UCJOpticCoolingMult",
                1
            ) or 1)
    if CurTime() < self.UCJReadyAt then
        self:SetNW2String("UCJStatus", "SEEKER COOLING")
        return
    end
    if owner:WaterLevel() >= 3 then
        self:JavelinReset(false)
        self:SetNW2String("UCJStatus", "SUBMERGED / NO LAUNCH")
        return
    end
    if self:Clip1() <= 0 then
        self:JavelinReset(false)
        self:SetNW2String("UCJStatus", "NO MISSILE")
        return
    end
    local ent = self:GetNW2Entity("UCJTarget")
    local valid, reason = self:JavelinCheck(ent, true)
    if not valid then
        if
            IsValid(ent)
            and self.UCJLastVisible
            and CurTime() - self.UCJLastVisible < self.JavelinLossGrace
        then
            self:SetNW2String("UCJStatus", reason)
            return
        end
        self:JavelinReset(false)
        local best, score = NULL, -1
        for _, target in ipairs(UCJavelin.Targets(self)) do
            if IsValid(target) then
                local ok, why = self:JavelinCheck(target, false)
                local dot = (UCJavelin.AimPoint(target) - owner:GetShootPos())
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
            self:SetNW2String("UCJStatus", reason or "NO TARGET")
            return
        end
        self:SetNW2Entity("UCJTarget", ent)
        UCJavelin.Warn(ent)
    end
    self.UCJLastVisible = CurTime()
    local duration = self.JavelinLockTime * self:JavelinOpticLockMult() * (owner:Crouching() and 0.8 or 1)
    if owner:GetVelocity():Length2D() > 60 then
        duration = duration * 1.5
    end
    local previous = self:GetNW2Float("UCJProgress", 0)
    local progress = math.min(1, previous + 0.05 / duration)
    self:SetNW2Float("UCJProgress", progress)
    self:SetNW2Bool("UCJLocked", progress >= 1)
    self:SetNW2String("UCJStatus", progress >= 1 and "LOCK / READY" or "ACQUIRING")
    if previous < 1 and progress >= 1 then
        self:EmitSound(customSnd .. "clu_lock.wav", 65, 100, 0.4, CHAN_ITEM)
    elseif progress < 1 and (self.UCJNextBeep or 0) < CurTime() then
        self.UCJNextBeep = CurTime() + 1.0
        self:EmitSound(customSnd .. "clu_acq.wav", 60, 100, 0.3, CHAN_ITEM)
    end
end

SWEP.Hook_ShouldNotFire = function(self)
    if self:Clip1() < self:GetCapacity() then
        if SERVER then
            self:GetOwner():PrintMessage(HUD_PRINTCENTER, "Reload the complete launch bank before firing")
        end
        return true
    end
    if not self:JavelinGuided() and self:GetOwner():WaterLevel() < 3 then
        return
    end
    local ready = self:JavelinScoped() and self:GetNW2Bool("UCJLocked", false)
    local valid, reason = self:JavelinCheck(self:GetNW2Entity("UCJTarget"), true)
    if ready and valid and self:GetOwner():WaterLevel() < 3 then
        return
    end
    if self:GetOwner():WaterLevel() >= 3 then
        reason = "Cannot launch while submerged"
    end
    if SERVER and (self.UCJNextNotice or 0) < CurTime() then
        self.UCJNextNotice = CurTime() + 1
        self:GetOwner()
            :PrintMessage(HUD_PRINTCENTER, reason or "Acquire a vehicle through the CLU before launch")
    end
    return true
end

SWEP.Hook_PostFireRocket = function(self, rocket)
    UCJavelin.LaunchBank(self, rocket)
    self:JavelinReset(false)
end
SWEP.Hook_PreReload = function(self)
    if self:JavelinGuided() and self:GetOwner():KeyDown(IN_USE) and self:GetState() == ArcCW.STATE_SIGHTS then
        return true
    end
    self:JavelinReset(true)
end
function SWEP:JavelinClearMask()
    if CLIENT and IsValid(self.UCJMaskedVM) then
        self.UCJMaskedVM:SetSubMaterial(0, "")
    end
    self.UCJMaskedVM = nil
end
SWEP.Hook_OnHolster = function(self)
    self:JavelinReset(true)
    self:JavelinClearMask()
end
SWEP.Hook_OnDeploy = function(self)
    self:JavelinReset(true)

    if SERVER and self:Clip1() > self:GetCapacity() then
        self:GetOwner():GiveAmmo(self:Clip1() - self:GetCapacity(), self.Primary.Ammo, true)
        self:SetClip1(self:GetCapacity())
    end
end
SWEP.Hook_ChangeFiremode = function(self)
    self:JavelinReset(false)
end
SWEP.Hook_DrawHUD = function(self)
    if UCJavelin.DrawCLU then
        UCJavelin.DrawCLU(self)
    end
end

function SWEP:OnDrop()
    self:JavelinClearMask()
    self:JavelinReset(true)
    local base = weapons.GetStored("arccw_base")
    if base.OnDrop then
        return base.OnDrop(self)
    end
end

function SWEP:OwnerChanged()
    self:JavelinClearMask()
    self:JavelinReset(true)
    local base = weapons.GetStored("arccw_base")
    if base.OwnerChanged then
        return base.OwnerChanged(self)
    end
end

if CLIENT then
    function SWEP:PreDrawViewModel(vm)
        vm:SetSubMaterial(0, self:JavelinGuided() and "" or "models/weapons/uc_javelin/hidden_clu")
        if self:JavelinGuided() then
            self.UCJMaskedVM = nil
        else
            self.UCJMaskedVM = vm
        end
        if self:JavelinScoped() then
            return true
        end
        return weapons.GetStored("arccw_base").PreDrawViewModel(self, vm)
    end

    function SWEP:PostDrawViewModel(vm)
        if self:JavelinScoped() then
            return
        end
        return weapons.GetStored("arccw_base").PostDrawViewModel(self, vm)
    end

    function SWEP:DrawCustomModel(wm, ...)
        if wm then
            if not self.WM then
                self:SetupModel(true)
            end
            local body = self:GetBuff_Override("Override_UCJBody", "standard")
            local model = "models/weapons/tfa_mw2cr/javelin/w_javelin.mdl"
            if not self:JavelinGuided() then
                model = "models/weapons/uc_javelin/irons_" .. body .. "_wm.mdl"
            elseif body == "quad" or body == "brace" or body == "twin" or body == "rest" then
                model = "models/weapons/uc_javelin/" .. body .. "_wm.mdl"
            end
            if IsValid(self.WMModel) and self.WMModel:GetModel() ~= model then
                self.WMModel:SetModel(model)
                self.WMModel:SetupBones()
            end
            if IsValid(self.WMModel) then
                if body == "rest" then
                    self.WMModel:SetBodygroup(1, self:JavelinRestDeployed() and 1 or 0)
                elseif body == "twin" then
                    self.WMModel:SetBodygroup(1, (self:Clip1() > 0 or self:GetReloading()) and 0 or 1)
                end
            end
        else
            for _, element in pairs(self.VM or {}) do
                if IsValid(element.Model) then
                    local model = element.Model:GetModel()
                    if model == "models/weapons/uc_javelin/rest_vm.mdl" then
                        element.Model:SetBodygroup(1, self:JavelinRestDeployed() and 1 or 0)
                    elseif model == "models/weapons/uc_javelin/twin_vm.mdl" then
                        element.Model:SetBodygroup(1, (self:Clip1() > 0 or self:GetReloading()) and 0 or 1)
                    end
                end
            end
        end
        return weapons.GetStored("arccw_base").DrawCustomModel(self, wm, ...)
    end
end

function SWEP:OnRemove()
    self:JavelinClearMask()
    local base = weapons.GetStored("arccw_base")
    if base.OnRemove then
        return base.OnRemove(self)
    end
end
