-- Смена группировки и админские кнопки из табло (custom_scoreboard.lua).
-- Каждое действие проверяет права на сервере, клиенту не верим.

util.AddNetworkString("SetFrac")

util.AddNetworkString("SetAdminPR")
util.AddNetworkString("SetLeaderFracPR")
util.AddNetworkString("SetMoneyPR")
util.AddNetworkString("SetExpPR")
util.AddNetworkString("GiveMoneyForMissionPR")
util.AddNetworkString("SetExpFracPR")
util.AddNetworkString("SetCoinPR")
util.AddNetworkString("PR_KickPlayer")

net.Receive("SetFrac", function(len, ply)
    local frac = net.ReadString()
    if not PR_NetThrottle(ply, "SetFrac", 1) then return end

    local allowed = PR_IsFraction(frac) or (frac == "admin" and PR_IsAdmin(ply))
    if not allowed or ply:GetNWString("PR_fraction") == frac then return end

    ply:SetNWString("PR_fraction", frac)
    ply.PR_Outfit = nil -- форма прошлой группировки не переносится
end)

-- Цель админского действия. PR-админ (флаг из табло) не может трогать настоящих админов сервера.
local function ReadTarget(admin)
    local target = net.ReadEntity()
    if not IsValid(target) or not target:IsPlayer() then return end

    if target ~= admin and target:IsAdmin() and not admin:IsAdmin() then
        admin:ChatPrint("Нельзя: " .. target:Nick() .. " админ сервера")
        return
    end

    return target
end

-- Обработчик «админ меняет число у игрока»: деньги, опыт, монеты
local function AdminAmount(msg, apply)
    net.Receive(msg, function(len, ply)
        if not PR_IsAdmin(ply) then return end

        local target = ReadTarget(ply)
        local amount = net.ReadInt(32)
        if not target then return end

        apply(target, amount)
        PR_Log(ply, msg .. " " .. amount .. " -> " .. target:Nick())
    end)
end

local function AddInt(ply, key, amount)
    ply:SetNWInt(key, math.max(ply:GetNWInt(key) + amount, 0))
end

AdminAmount("SetMoneyPR", function(target, amount)
    AddInt(target, "PR_money", amount)
end)

AdminAmount("SetExpPR", function(target, amount)
    AddInt(target, "PR_exp", amount)
end)

AdminAmount("SetCoinPR", function(target, amount)
    AddInt(target, "PR_coin", amount)
end)

AdminAmount("SetExpFracPR", function(target, amount)
    local frac = target:GetNWString("PR_fraction")
    if PR_IsFraction(frac) then
        AddInt(target, "PR_exp_" .. frac, amount)
    end
end)

-- Награда за миссию: +10% за каждый уровень после первого, максимум +200%
AdminAmount("GiveMoneyForMissionPR", function(target, amount)
    local lvl = target:GetNWInt("PR_level")
    local bonus = lvl <= 19 and (lvl - 1) * 10 or 200

    AddInt(target, "PR_money", math.floor(amount + amount / 100 * bonus))
end)

net.Receive("SetAdminPR", function(len, ply)
    if not PR_IsAdmin(ply) then return end

    local target = ReadTarget(ply)
    if not target then return end

    target:SetNWBool("PR_admin", not target:GetNWBool("PR_admin"))
    PR_Log(ply, (target:GetNWBool("PR_admin") and "выдал" or "забрал") .. " PR-админку " .. target:Nick())
end)

-- Лидера фракции назначает админ или текущий лидер этой фракции
net.Receive("SetLeaderFracPR", function(len, ply)
    local target = net.ReadEntity()
    if not IsValid(target) or not target:IsPlayer() then return end

    local frac = target:GetNWString("PR_fraction")
    if not PR_IsFraction(frac) then return end

    local isLeader = ply:GetNWString("PR_fraction") == frac and ply:GetNWBool("PR_leader_" .. frac)
    if not PR_IsAdmin(ply) and not isLeader then return end

    for _, v in ipairs(player.GetAll()) do
        v:SetNWBool("PR_leader_" .. frac, false)
    end
    target:SetNWBool("PR_leader_" .. frac, true)

    PR_Log(ply, "назначил лидером " .. frac .. ": " .. target:Nick())
end)

net.Receive("PR_KickPlayer", function(len, ply)
    if not PR_IsAdmin(ply) then return end

    local target = ReadTarget(ply)
    if not target or target == ply then return end

    PR_Log(ply, "кикнул " .. target:Nick())
    target:Kick("Кикнут админом " .. ply:Nick())
end)
