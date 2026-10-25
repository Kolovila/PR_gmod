-- PR autotest: start a listen server on MAP as soon as Workshop addons are mounted.
-- Goes ONLY into a test instance:  <inst>\garrysmod\lua\menu\pr_automap.lua
-- and is loaded by this line appended to <inst>\garrysmod\lua\menu\menu.lua:
--     include( "pr_automap.lua" )
-- The harness rewrites the constants below before each run.

local MAP        = "rp_desert_conflict"
local GAMEMODE   = "testgm"
local MAXPLAYERS = 8
local SETTLE     = 5     -- seconds after the map becomes visible (same 5 s pause as today)
local TIMEOUT    = 600   -- a fresh instance may first extract ~2.9 GB of legacy GMAs

local t0, fired = SysTime(), false

local function StartServer()
	RunConsoleCommand( "progress_enable" )
	RunConsoleCommand( "disconnect" )
	RunConsoleCommand( "maxplayers", tostring( MAXPLAYERS ) )
	RunConsoleCommand( "sv_lan", "1" )
	RunConsoleCommand( "map", MAP )
	print( "[PR_AUTOMAP] map command sent: " .. MAP )
end

local function Check()
	if fired or IsInGame() then return end

	-- Same test the stock menu uses in LoadLastMap() (lua/menu/getmaps.lua):
	-- a Workshop map is only visible once its GMA has been mounted.
	if not file.Exists( "maps/" .. MAP .. ".bsp", "GAME" ) then
		if SysTime() - t0 > TIMEOUT then
			fired = true
			timer.Remove( "PR_AutoMap" )
			print( "[PR_AUTOMAP] TIMEOUT: maps/" .. MAP .. ".bsp never appeared" )
		end
		return
	end

	fired = true
	timer.Remove( "PR_AutoMap" )

	local mounted = 0
	for _, a in ipairs( engine.GetAddons() ) do
		if a.mounted then mounted = mounted + 1 end
	end
	print( string.format( "[PR_AUTOMAP] map visible, %d workshop addons mounted, starting in %ds", mounted, SETTLE ) )

	timer.Simple( SETTLE, function()
		if engine.ActiveGamemode() ~= GAMEMODE then
			RunConsoleCommand( "gamemode", GAMEMODE )
			timer.Simple( 2, StartServer )
		else
			StartServer()
		end
	end )
end

timer.Create( "PR_AutoMap", 1, 0, Check )
hook.Add( "GameContentChanged", "PR_AutoMap", Check )
