-- Ограничения sandbox для обычных игроков.
-- Спавн-меню скрыто и на клиенте (cl_init.lua), но консольные команды sandbox
-- (gm_spawn, gm_giveswep, gm_spawnsent...) работают в обход меню. Закрываем их на сервере.

local SPAWN_HOOKS = {
    "PlayerSpawnObject",
    "PlayerSpawnProp",
    "PlayerSpawnRagdoll",
    "PlayerSpawnEffect",
    "PlayerSpawnVehicle",
    "PlayerSpawnNPC",
    "PlayerSpawnSENT",
    "PlayerSpawnSWEP",
    "PlayerGiveSWEP"
}

for _, name in ipairs(SPAWN_HOOKS) do
    hook.Add(name, "PR_AdminOnly", function(ply)
        if not PR_IsAdmin(ply) then return false end
    end)
end

-- Ноуклип только админам
hook.Add("PlayerNoClip", "PR_AdminOnly", function(ply, desired)
    if desired and not PR_IsAdmin(ply) then return false end
end)

-- Тулган только админам: иначе ремувером можно снести точку захвата или чужой респ
hook.Add("CanTool", "PR_AdminOnly", function(ply)
    if not PR_IsAdmin(ply) then return false end
end)

-- Физганом нельзя таскать точки захвата (и их пропы), NPC и чужие точки респа
local function IsPointPart(ent)
    return ent:GetClass() == "zahvat_ojka" or (IsValid(ent:GetParent()) and ent:GetParent():GetClass() == "zahvat_ojka")
end

hook.Add("PhysgunPickup", "PR_Protect", function(ply, ent)
    if PR_IsAdmin(ply) then return end

    if IsPointPart(ent) or ent:IsNPC() then return false end

    if ent.Faction and ent.Base == "pr_spawn_point_base" then
        local frac = ent.Faction
        if ply:GetNWString("PR_fraction") ~= frac or not ply:GetNWBool("PR_leader_" .. frac) then
            return false
        end
    end
end)

-- Стандартный набор sandbox при спавне (оружие HL2, физган, тулган, камера) только админам.
-- Обычный игрок получает кулаки, остальное — купленное оружие из пресета (init.lua, PR_GivePreset).
hook.Add("PlayerLoadout", "PR_NoSandboxLoadout", function(ply)
    if PR_IsAdmin(ply) then return end

    ply:Give("weapon_fists")
    ply:SelectWeapon("weapon_fists")

    return true
end)
