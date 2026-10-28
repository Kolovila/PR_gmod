SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "Incendiary Bottle"
SWEP.TrueName = "Molotov Cocktail"
SWEP.Trivia_Class = "Improvised Incendiary"
SWEP.Trivia_Desc = [[A bottle of fuel with a burning rag in the neck. Named sarcastically by the Finns during the Winter War after the Soviet foreign minister, who claimed the bombs being dropped on them were humanitarian aid deliveries. The Finns called the bottles a drink to go with the food parcels.

Finland made half a million of them in a state liquor factory, with proper storm matches instead of rags.

STATS: breaks on the first thing it touches. 7 burning patches over 110u for 14 seconds. Direct damage is negligible at 12.

It denies ground rather than killing outright. Anything that walks through the fire catches and keeps burning after it leaves.

Water puts it out, in flight and on the ground.

CONCOCTION slot: four fuels that behave very differently.]]
SWEP.Trivia_Calibre = "Petrol/Motor Oil"
SWEP.Trivia_Mechanism = "Impact"
SWEP.Trivia_Country = "Finland"
SWEP.Trivia_Year = 1939

SWEP.ViewModel = "models/simpnades/v_molotov.mdl"
SWEP.WorldModel = "models/simpnades/w_molotov.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-3, 2, -3),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 38

SWEP.ShootEntity = "arccw_uo_nade_molotov"

SWEP.Attachments = {
    {
        PrintName = "attslot.uo_concoction",
        DefaultAttName = "attslot.uo_concoction.default",
        Slot = "uo_concoction",
    },
}

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.impact",
    },
}

SWEP.MuzzleVelocity = 1150
SWEP.MuzzleVelocityAlt = 420

SWEP.PullPinTime = 1.4
SWEP.FuseTime = 40
SWEP.CookPrimFire = true
SWEP.CookAltFire = true

SWEP.WindupTime = 0.9
SWEP.WindupMinimum = 0.5

SWEP.ShootEntityDelay = 0.24

SWEP.SpeedMult = 0.97

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local lopen = UO.Sound("nades/molotov/molotov_lighter_open.wav", UO.Snd.PinPull)
local lstrike = UO.Sound("nades/molotov/molotov_lighter_strike.wav", UO.Snd.PinPull)
local lclose = UO.Sound("nades/molotov/molotov_lighter_close.wav", UO.Snd.SpoonEject)
local ignite = UO.Sound("nades/molotov/molotov_ignite.wav", "ambient/fire/gascan_ignite1.wav")
local burnloop = UO.Sound("nades/molotov/molotov_idle_burn_loop.wav", "ambient/fire/fire_small_loop1.wav")
local throwburn = UO.Sound("nades/molotov/molotov_throw_burning.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"] = {
        Source = "base_draw",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["ready"] = {
        Source = "base_draw",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["idle"] = {
        Source = "base_idle",
    },
    ["holster"] = {
        Source = "base_holster",
    },

    ["pre_throw"] = {
        Source = "pullback_high",
        MinProgress = 0.95,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = lopen, t = 0.2},
            {s = lstrike, t = 0.5},
            {s = ignite, t = 0.8},
            {s = lclose, t = 1.0},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throwburn, t = 0},
        },
    },

    ["pre_throw_alt"] = {
        Source = "pullback_low",
        MinProgress = 0.95,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = lopen, t = 0.2},
            {s = lstrike, t = 0.5},
            {s = ignite, t = 0.8},
            {s = lclose, t = 1.0},
        },
    },
    ["throw_alt"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throwburn, t = 0, v = 0.75},
        },
    },
}

local function StopBurn(wep)
    if wep.UO_BurnSound then
        wep.UO_BurnSound:Stop()
        wep.UO_BurnSound = nil
    end
end

SWEP.Hook_PreThrow = function(wep)
    if SERVER then
        StopBurn(wep)
        wep.UO_BurnSound = CreateSound(wep, UO.PickSound(burnloop))
        if wep.UO_BurnSound then wep.UO_BurnSound:PlayEx(0.55, 100) end
    end

    if CLIENT and IsValid(wep:GetOwner()) and wep:GetOwner().GetViewModel then
        local vm = wep:GetOwner():GetViewModel()
        if IsValid(vm) and vm:SkinCount() > 1 then vm:SetSkin(1) end
    end
end

SWEP.Hook_PostThrow = function(wep)
    if SERVER then StopBurn(wep) end

    if CLIENT and IsValid(wep:GetOwner()) and wep:GetOwner().GetViewModel then
        local vm = wep:GetOwner():GetViewModel()
        if IsValid(vm) then vm:SetSkin(wep.DefaultSkin or 0) end
    end
end

SWEP.Hook_OnHolsterEnd = function(wep)
    if SERVER then StopBurn(wep) end
end

function SWEP:OnRemove()
    StopBurn(self)

    if engine.ActiveGamemode() != "terrortown" then return end
    if CLIENT and IsValid(self:GetOwner()) and self:GetOwner() == LocalPlayer() and self:GetOwner():Alive() then
        RunConsoleCommand("use", "weapon_ttt_unarmed")
    end
end
