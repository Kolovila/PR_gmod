SWEP.Base = "arccw_base_nade"

SWEP.Spawnable = false
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"
SWEP.AdminOnly = false

SWEP.Trivia_Class = "Hand Grenade"

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.CamAttachment = false

SWEP.UseHands = true

SWEP.Throwing = true
SWEP.Singleton = false

SWEP.NotForNPCs = true

SWEP.Primary.ClipSize = 1
SWEP.Primary.Ammo = "grenade"
SWEP.ChamberSize = 0

SWEP.CanBash = false
SWEP.PrimaryBash = false

SWEP.IronSightStruct = false
SWEP.CustomizePos = Vector(0, -5, 0)
SWEP.CustomizeAng = Angle(15, 15, 15)

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "slam"
SWEP.HoldtypeSights = "grenade"
SWEP.HoldtypeCustomize = "slam"

SWEP.HolsterPos = Vector(0.532, -1, 0)
SWEP.HolsterAng = Angle(-10, 0, 0)

SWEP.ActivePos = Vector(0, 4, 1.5)

SWEP.ShootWhileSprint = true
SWEP.SpeedMult = 1

SWEP.MuzzleVelocity = 1000
SWEP.MuzzleVelocityAlt = 400
SWEP.PullPinTime = 0.6
SWEP.FuseTime = 4
SWEP.WindupTime = 0
SWEP.WindupMinimum = 1
SWEP.ShootEntityDelay = 0.25

SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.Secondary.Automatic = true

SWEP.Damage = 0
SWEP.DamageMin = 0
SWEP.Range = 0
SWEP.Recoil = 0
SWEP.AccuracyMOA = 0
SWEP.ShootVol = 0
SWEP.NoRangeGraph = true

SWEP.ShellEffect = "NONE"
SWEP.Hook_PreDoEffects = function(wep, data)
    return true
end

local UO = ArcCW.UO

local detclick = UO.Sound("buttons/button17.wav", "buttons/blip1.wav")

SWEP.UO_Rattle = UO.Snd.Rattle
SWEP.UO_PinPull = UO.Snd.PinPull
SWEP.UO_Spoon = UO.Snd.SpoonEject
SWEP.UO_Pop = UO.Snd.FusePop
SWEP.UO_PopHeld = UO.Snd.FusePopHeld
SWEP.UO_Throw = UO.Snd.Throw

SWEP.Hook_TranslateAnimation = function(wep, anim)
    if !wep.Animations[anim .. "_cook"] then return end

    local fm = wep:GetCurrentFiremode()
    if !fm then return end

    local cooking = fm.Override_CookPrimFire or fm.Override_CookAltFire
    if cooking == nil then cooking = wep.CookPrimFire or wep.CookAltFire end

    if !cooking then return end

    return anim .. "_cook"
end

SWEP.UO_HandBones = false

if CLIENT then

    local function insurgencyName(valve)
        local s = string.match(valve, "^ValveBiped%.Bip01_(.+)$")
        if !s then return nil end
        return (string.gsub(s, "_", " "))
    end

    function SWEP:UO_BuildHandMap(vm, hands)
        local map = {}
        local vmbones = vm:GetBoneCount()

        for i = 0, hands:GetBoneCount() - 1 do
            local hname = hands:GetBoneName(i)
            if !hname or hname == "" or hname == "__INVALIDBONE__" then continue end

            local want = insurgencyName(hname)
            local vb = (want and vm:LookupBone(want)) or vm:LookupBone(hname)

            if vb and vb >= 0 and vb < vmbones then map[i] = vb end
        end

        return map
    end

    function SWEP:UO_PoseHands(vm, ply, hands)
        if !IsValid(vm) or !IsValid(hands) then return end

        local mdl = vm:GetModel()

        if self.UO_HandMapModel != mdl or self.UO_HandMapHands != hands then
            self.UO_HandMapModel = mdl
            self.UO_HandMapHands = hands
            self.UO_HandMap = self:UO_BuildHandMap(vm, hands)
        end

        local map = self.UO_HandMap
        if !map or table.IsEmpty(map) then return end

        hands:SetupBones()

        for hid, vid in pairs(map) do
            local m = vm:GetBoneMatrix(vid)
            if m then hands:SetBoneMatrix(hid, m) end
        end
    end

    concommand.Add("arccw_uo_hands_debug", function()
        local ply = LocalPlayer()
        local wep = IsValid(ply) and ply:GetActiveWeapon()
        if !IsValid(wep) then print("[UO] no active weapon") return end

        local vm = ply:GetViewModel()
        local hands = ply:GetHands()

        print("[UO] weapon       : " .. wep:GetClass())
        print("[UO] UO_HandBones : " .. tostring(wep.UO_HandBones))
        print("[UO] UseHands     : " .. tostring(wep.UseHands))
        print("[UO] viewmodel    : " .. (IsValid(vm) and vm:GetModel() or "INVALID"))
        print("[UO] vm bones     : " .. (IsValid(vm) and vm:GetBoneCount() or 0))
        print("[UO] hands ent    : " .. (IsValid(hands) and hands:GetModel() or "INVALID"))
        print("[UO] hands parent : " .. (IsValid(hands) and tostring(IsValid(hands:GetParent())) or "n/a"))
        print("[UO] bonemerged   : " .. (IsValid(hands) and tostring(hands:IsEffectActive(EF_BONEMERGE)) or "n/a") .. "  (want true)")
        print("[UO] map built for: " .. tostring(wep.UO_HandMapModel))
        print("[UO] mapped bones : " .. (wep.UO_HandMap and table.Count(wep.UO_HandMap) or "none"))

        if IsValid(vm) and IsValid(hands) and wep.UO_HandMap then
            local n = 0
            for hid, vid in pairs(wep.UO_HandMap) do
                print(string.format("        %-32s -> %s", hands:GetBoneName(hid), vm:GetBoneName(vid)))
                n = n + 1
                if n >= 8 then print("        ...") break end
            end
        end
    end)

    hook.Add("PreDrawPlayerHands", "ArcCW_UO_RiggedHands", function(hands, vm, ply, wep)
        if !IsValid(wep) or !wep.UO_HandBones or !wep.UO_PoseHands then return end
        wep:UO_PoseHands(vm, ply, hands)
    end)

end

SWEP.UO_CookOff = true

local function cooking(wep)
    local key = wep:GetGrenadeAlt() and "CookAltFire" or "CookPrimFire"

    local cfm = wep:GetCurrentFiremode()
    if cfm and cfm["Override_" .. key] != nil then
        return cfm["Override_" .. key] and true or false
    end

    return wep:GetTable()[key] and true or false
end

function SWEP:UO_CookThink()
    if !self.UO_CookOff then return end

    if !self:GetGrenadePrimed() then
        self.UO_Primed = false
        self.UO_ForceCookOff = false
        return
    end

    if !self.UO_Primed then
        self.UO_Primed = true

        if !isnumber(self.GrenadePrimeTime) or self.GrenadePrimeTime <= 0
            or self.GrenadePrimeTime > CurTime() then
            self.GrenadePrimeTime = CurTime()
        end
    end

    if !cooking(self) then return end

    self.isCooked = true

    local ft = self:GetBuff("FuseTime", true)
    if !isnumber(ft) or ft >= math.huge then return end
    if CurTime() - self.GrenadePrimeTime < ft then return end

    self.UO_ForceCookOff = true

    if !game.SinglePlayer() or SERVER then
        self:Throw()
    end
end

SWEP.Hook_Throw = function(wep, data)
    if !wep.UO_CookOff or !data then return end

    local left = data.fusetime
    local spent = wep.UO_ForceCookOff or (isnumber(left) and left <= 0)
    if !spent then return end

    wep.UO_ForceCookOff = false
    data.dodefault = false

    if CLIENT then return data end

    local owner = wep:GetOwner()
    if !IsValid(owner) then return data end

    local ent = ents.Create(data.shootentity or wep.ShootEntity)
    if !IsValid(ent) then return data end

    ent:SetPos(owner:EyePos() + owner:EyeAngles():Forward() * 6 - Vector(0, 0, 4))
    ent:SetAngles(owner:EyeAngles())
    ent:SetOwner(owner)
    ent.Inflictor = wep
    ent.FuseTime = 0
    ent.FuseVariance = 0
    ent:Spawn()

    timer.Simple(0, function()
        if IsValid(ent) and ent.Detonate then ent:Detonate() end
    end)

    return data
end

SWEP.UO_Detonator = false
SWEP.UO_DetonateDelay = 0.45
SWEP.UO_DetonateCooldown = 0.9

function SWEP:UO_FireDetonator()
    if !self.UO_Detonator then return end
    if self:GetGrenadePrimed() then return end
    if (self.UO_NextDetonate or 0) > CurTime() then return end

    local owner = self:GetOwner()
    if !IsValid(owner) or owner:IsNPC() then return end

    self.UO_NextDetonate = CurTime() + self.UO_DetonateCooldown

    local anim = self:SelectAnimation("detonate")
    if anim and self.Animations[anim] then
        self:PlayAnimation(anim, 1, true, 0, true, nil, true)
    end

    if CLIENT then return end

    local wep, class = self, self.ShootEntity

    timer.Simple(self.UO_DetonateDelay, function()
        if !IsValid(wep) or !IsValid(owner) then return end

        if UO.DetonateRemote(owner, class) == 0 then
            wep:EmitSound(UO.PickSound(detclick), 55, 70, 0.5)
        end
    end)
end

SWEP.UO_NoJiggle = false
SWEP.UO_HideJiggle = false

local function stopjiggle(wep, owner)
    local bones = wep.UO_NoJiggle
    if !bones then return end

    local vm = owner:GetViewModel()
    if !IsValid(vm) then return end

    if wep.UO_JiggleVM != vm then
        wep.UO_JiggleVM = vm
        wep.UO_JiggleIDs = {}

        for _, name in ipairs(bones) do
            local id = vm:LookupBone(name)
            if id then table.insert(wep.UO_JiggleIDs, id) end
        end
    end

    local ids = wep.UO_JiggleIDs
    if !ids or #ids == 0 then return end

    local jiggle = vm.ManipulateBoneJiggle

    for _, id in ipairs(ids) do
        if jiggle then jiggle(vm, id, 0) end

        vm:ManipulateBoneAngles(id, angle_zero)
        vm:ManipulateBonePosition(id, vector_origin)
    end

    if jiggle or !wep.UO_HideJiggle then return end

    for _, id in ipairs(ids) do
        vm:ManipulateBoneScale(id, vector_origin)
    end
end

SWEP.Hook_Think = function(wep)
    local owner = wep:GetOwner()
    if !IsValid(owner) or !owner:IsPlayer() then return end

    wep:UO_CookThink()

    if CLIENT then stopjiggle(wep, owner) end

    if !wep.UO_Detonator then return end

    local down = owner:KeyDown(IN_RELOAD)
    if down and !wep.UO_ReloadHeld then wep:UO_FireDetonator() end
    wep.UO_ReloadHeld = down
end

function SWEP:SecondaryAttack()
    self:PrimaryAttack()
end

function SWEP:OnRemove()
    if engine.ActiveGamemode() != "terrortown" then return end
    if CLIENT and IsValid(self:GetOwner()) and self:GetOwner() == LocalPlayer() and self:GetOwner():Alive() then
        RunConsoleCommand("use", "weapon_ttt_unarmed")
    end
end
