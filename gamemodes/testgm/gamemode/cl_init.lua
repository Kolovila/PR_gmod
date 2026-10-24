include("shared.lua")
include("cl_util.lua")
include("testhud.lua")
include("custom_scoreboard.lua")
include("sh_f4menu.lua")
include("cl_weaponshop.lua")
include("cl_equipment.lua")
include("cl_cloth.lua")
include("cl_vehicle.lua")
include("cl_profile.lua")
include("player/sh_player_save.lua")

-- Спавн-меню (Q) и контекстное меню (C) только для админов.
-- Это только интерфейс: сами команды спавна закрыты на сервере (sv_sandbox.lua).
local function AdminOnlyMenu()
   if not PR_IsAdmin(LocalPlayer()) then
      return false
   end
end

hook.Add("ContextMenuOpen", "PR_AdminOnlyMenu", AdminOnlyMenu)
hook.Add("OnSpawnMenuOpen", "PR_AdminOnlyMenu", AdminOnlyMenu)
