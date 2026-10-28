local SHARED = {
    "arccw_tpik/sh_config.lua",
    "arccw_tpik/sh_ik.lua",
    "arccw_tpik/sh_detect.lua",
    "arccw_tpik/sh_filter.lua",
    "arccw_tpik/sh_registry.lua"
}

local SERVERSIDE = {
    "arccw_tpik/sv_sync.lua"
}

local CLIENTSIDE = {
    "arccw_tpik/cl_convars.lua",
    "arccw_tpik/cl_sync.lua",
    "arccw_tpik/cl_mirror.lua",
    "arccw_tpik/cl_magdrop.lua",
    "arccw_tpik/cl_lhik.lua",
    "arccw_tpik/cl_solver.lua",
    "arccw_tpik/cl_editor.lua",
    "arccw_tpik/cl_menu.lua"
}

if SERVER then
    for _, path in ipairs(SHARED) do AddCSLuaFile(path) end
    for _, path in ipairs(CLIENTSIDE) do AddCSLuaFile(path) end
end

for _, path in ipairs(SHARED) do
    include(path)
end

if SERVER then
    for _, path in ipairs(SERVERSIDE) do include(path) end
else
    for _, path in ipairs(CLIENTSIDE) do include(path) end
end
