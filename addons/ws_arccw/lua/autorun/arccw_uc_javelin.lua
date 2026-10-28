if SERVER then
    AddCSLuaFile()
    AddCSLuaFile("arccw/shared/uc_javelin.lua")
    AddCSLuaFile("arccw/shared/uc_javelin_custom.lua")
    AddCSLuaFile("arccw/client/uc_javelin_clu.lua")
end
include("arccw/shared/uc_javelin.lua")
include("arccw/shared/uc_javelin_custom.lua")
if CLIENT then
    include("arccw/client/uc_javelin_clu.lua")
end
