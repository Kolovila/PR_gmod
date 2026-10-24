-- Серверные мелочи, которые нужны остальным sv_*.lua

-- Антиспам: true, если игрок не слал это действие последние delay секунд
function PR_NetThrottle(ply, key, delay)
    ply.PR_NextAction = ply.PR_NextAction or {}

    if CurTime() < (ply.PR_NextAction[key] or 0) then
        return false
    end

    ply.PR_NextAction[key] = CurTime() + delay
    return true
end

-- Строчка в консоль сервера о действии игрока (для разборов «кто выдал деньги»)
function PR_Log(ply, text)
    local who = IsValid(ply) and (ply:Nick() .. " [" .. tostring(ply:SteamID()) .. "]") or "Сервер"
    MsgN("[PR] " .. who .. ": " .. text)
end
