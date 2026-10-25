include("shared.lua")
include("cl_util.lua")
include("testhud.lua")
include("custom_scoreboard.lua")
include("player/sh_player_save.lua")
include("cl_ui.lua")
include("cl_shop.lua")
include("cl_menu.lua")
include("cl_patrols.lua")
include("cl_minimap.lua")

-- Спавн-меню (Q) и контекстное меню (C) только для админов.
-- Это только интерфейс: сами команды спавна закрыты на сервере (sv_sandbox.lua).
local function AdminOnlyMenu()
   if not PR_IsAdmin(LocalPlayer()) then
      return false
   end
end

hook.Add("ContextMenuOpen", "PR_AdminOnlyMenu", AdminOnlyMenu)
hook.Add("OnSpawnMenuOpen", "PR_AdminOnlyMenu", AdminOnlyMenu)
