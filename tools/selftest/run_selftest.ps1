# In-game autotest of the PR gamemode.
#   -Suite: full (whole big test) | core | patrol | armor (its sections)
#           vehicles (short vehicle test) | tank | air | plane (its sections)
#   -Instance N: run in the separate test copy D:\GModTest\instN (setup_instances.ps1).
#           The user can keep playing; several instances run at once (run_parallel.ps1).
#           Without -Instance: the main install (only when the game is closed), as before.
param([string]$Suite = 'full', [int]$Instance = 0)

$ErrorActionPreference = 'Stop'

$Suites = @{
    full     = @('pr_selftest_sv.lua', '')
    core     = @('pr_selftest_sv.lua', 'core')
    patrol   = @('pr_selftest_sv.lua', 'patrol')
    armor    = @('pr_selftest_sv.lua', 'armor')
    minimap  = @('pr_selftest_sv.lua', 'minimap')
    vehicles = @('pr_selftest_vehicles_sv.lua', '')
    tank     = @('pr_selftest_vehicles_sv.lua', 'tank')
    air      = @('pr_selftest_vehicles_sv.lua', 'air')
    plane    = @('pr_selftest_vehicles_sv.lua', 'plane')
    gepard   = @('pr_selftest_vehicles_sv.lua', 'gepard')
    dogfight = @('pr_selftest_vehicles_sv.lua', 'dogfight')
    strike   = @('pr_selftest_vehicles_sv.lua', 'strike')
    helistrike = @('pr_selftest_vehicles_sv.lua', 'helistrike')
    vehground = @('pr_selftest_vehicles_sv.lua', 'tank gepard')   # vehicles split in 3 for run_parallel -Suites all
    vehair   = @('pr_selftest_vehicles_sv.lua', 'air helistrike nur')
    nur      = @('pr_selftest_vehicles_sv.lua', 'nur')   # player's Mi-24 rockets vs own helicopter
    vehplane = @('pr_selftest_vehicles_sv.lua', 'plane strike dogfight edge')
    scan1    = @('pr_selftest_scan_sv.lua', '1')   # diagnostics: every new vehicle in a patrol, half 1
    scan2    = @('pr_selftest_scan_sv.lua', '2')   # half 2
    scanground1 = @('pr_selftest_scan_sv.lua', 'ground 1')
    scanground2 = @('pr_selftest_scan_sv.lua', 'ground 2')
    scanshots1 = @('pr_selftest_scan_sv.lua', 'ground 1 shots')   # ground half 1 + a screenshot of every vehicle
    scanshots2 = @('pr_selftest_scan_sv.lua', 'ground 2 shots')
    scanair1 = @('pr_selftest_scan_sv.lua', 'air 1')
    scanair2 = @('pr_selftest_scan_sv.lua', 'air 2')
    scanair2fix = @('pr_selftest_scan_sv.lua', 'air 2 fix')   # half 2 of the helicopters + the FIX list
    scanshowplanerpg = @('pr_selftest_scan_sv.lua', 'show plane west rpg')   # A-10 180 s near the west edge, the target bot fires RPGs at it
    scanshowplanecover = @('pr_selftest_scan_sv.lua', 'show plane cover')   # A-10 180 s, target where the player hid behind cover (masked dives)
    scanshowplanewest = @('pr_selftest_scan_sv.lua', 'show plane west')   # A-10 180 s, target where the user's patrols stand (3000 from the west edge)
    scanshowplane = @('pr_selftest_scan_sv.lua', 'show plane')   # A-10 vs a ground target 90 s, camera follows
    scanshow = @('pr_selftest_scan_sv.lua', 'show')   # rocket helicopters 60 s each, camera follows, screenshot every 6 s
    scanairfix = @('pr_selftest_scan_sv.lua', 'airfix')   # a few helicopters with extra aim diagnostics
    scanaim = @('pr_selftest_scan_sv.lua', 'debugaim prefire')
    scangroundaim = @('pr_selftest_scan_sv.lua', 'debugground')   # BTR-80 / Marder aim log every second
    scanplain = @('pr_selftest_scan_sv.lua', 'plain')   # a few vehicles spawned the normal way + screenshots
    scanfixshots = @('pr_selftest_scan_sv.lua', 'fix shots')   # ground recheck list (FIX) + screenshots and wheel state
    scanfar = @('pr_selftest_scan_sv.lua', 'fix far')   # FIX list, target 4500 away: does the vehicle close in
    scanlong = @('pr_selftest_scan_sv.lua', 'long')   # cannons vs a target 5000-7000 away: shell drop correction (DROP ...)
    scanmoving = @('pr_selftest_scan_sv.lua', 'long moving')   # the same, target runs sideways: lead on moving targets
    scanmovingnolead = @('pr_selftest_scan_sv.lua', 'long moving nolead')   # the same without ground lead, to compare
    scanfarshots = @('pr_selftest_scan_sv.lua', 'fix far shots')   # the same + screenshots and wheel state   # one gunner helicopter, aim log every second
    scanprefireair = @('pr_selftest_scan_sv.lua', 'airfix prefire')   # changed helicopters; target hides in a box after 18 s
    scanfixground = @('pr_selftest_scan_sv.lua', 'fix')   # ground recheck list (FIX) without hiding the target
    scanprefireground = @('pr_selftest_scan_sv.lua', 'fix prefire')   # ground recheck list; target hides in a box after 18 s
    mapshot  = @('pr_mapshot_sv.lua', '')   # map picture for the minimap: then stitch_mapshot.ps1
    recordclimb = @('pr_record_sv.lua', 'climb')   # does the helicopter climb over the range (AI aims 3000 up)
    recordcheck = @('pr_record_sv.lua', 'auto')   # the range itself: presses F6/F7 on its own
    recordplane = @('pr_record_sv.lua', 'plane')   # the same with the A-10: spawns in the air 9000 from the target
    record   = @('pr_record_sv.lua', '')   # player flies a helicopter at a target; F6 record, F7 save and quit (data/pr_selftest/flight_*.csv)
    vanish   = @('pr_vanish_sv.lua', '')   # patrol «Техника» on spot 5: who removes its vehicles (VANISH lines)
    mapinfo  = @('pr_mapinfo_sv.lua', '')   # fog, draw distance, navmesh of the map (MAPINFO lines)
    weapons  = @('pr_selftest_weapons_sv.lua', '')   # every CW weapon of addons\ws_weapons: models, fire sound, can be held (WEAPON_BAD lines)
    infantry = @('pr_selftest_infantry_sv.lua', '')  # infantry layer: honest sight, hearing, radio, suppression, spread, gaits, patrol of soldiers
    npcw     = @('pr_selftest_npcw_sv.lua', '')      # NPC copies of CW weapons, RPG and hand grenades, screenshots npcw_*
    roles    = @('pr_selftest_roles_sv.lua', '')     # infantry roles and squad: sniper, assault, grenadier, ebitel, sneak, boss, retreat
    npcs     = @('pr_selftest_npcs_sv.lua', '')      # every VJ human NPC of the spawn menu: alive, model, weapon in hands (NPC_BAD lines)
    navgen   = @('pr_navgen_sv.lua', '')   # build the map's navmesh (maps/<map>.nav in the test copy), up to 90 min
    navzone  = @('pr_navzone_sv.lua', '')  # navmesh only around the fighting zones (incremental, limited range), NAVZONE lines
}
if (-not $Suites.ContainsKey($Suite)) { "UNKNOWN_SUITE $Suite (known: $($Suites.Keys -join ', '))"; exit 3 }

$Main = 'D:\SteamLibrary\steamapps\common\GarrysMod'
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path   # tools\selftest
$R    = (Resolve-Path "$Here\..\..").Path                 # the repo: what gets deployed
$Out  = "$env:TEMP\pr_selftest"                            # logs, screenshots, backups
New-Item -ItemType Directory -Force $Out | Out-Null
$VideoKey = 'HKCU\Software\Valve\Source\garrysmod\Settings'
$VideoClean = "$Out\gmod_video_settings_clean.reg"

function TestInstanceProcs([string]$except = '') {
    Get-CimInstance Win32_Process -Filter "Name='gmod.exe'" |
        Where-Object { $_.ExecutablePath -like 'D:\GModTest\inst*' -and ($except -eq '' -or $_.ExecutablePath -notlike "$except\*") }
}

if ($Instance -gt 0) {
    $G = "D:\GModTest\inst$Instance"
    if (-not (Test-Path "$G\bin\win64\gmod.exe")) { "NO_INSTANCE $G (run setup_instances.ps1)"; exit 4 }
    if (Get-CimInstance Win32_Process -Filter "Name='gmod.exe'" | Where-Object { $_.ExecutablePath -like "$G\*" }) { "INSTANCE_BUSY $Instance"; exit 2 }
    $tag = "_i$Instance"
} else {
    $G = $Main
    if (Get-Process gmod -ErrorAction SilentlyContinue) { 'GMOD_RUNNING'; exit 2 }
    $tag = ''
}
$GM  = "$G\garrysmod"
$EXE = "$G\bin\win64\gmod.exe"
$ts  = (Get-Date -Format yyyyMMdd_HHmmss) + $tag

# The game stores the video mode in the registry (shared by every copy, the user's game too):
# remember it while no test runs, and put it back when the last test ends
if (-not (TestInstanceProcs) -and -not (Get-Process gmod -ErrorAction SilentlyContinue)) {
    cmd /c "reg export `"$VideoKey`" `"$VideoClean`" /y >nul 2>&1" | Out-Null
}

# Saves: the main install gets backed up and restored; an instance gets a fresh copy of the
# user's real data (spots, points, players) and nothing goes back
if ($Instance -gt 0) {
    if (Test-Path "$GM\data\pr_gamemode") { Remove-Item -Recurse -Force "$GM\data\pr_gamemode" }
    if (Test-Path "$Main\garrysmod\data\pr_gamemode") { Copy-Item -Recurse "$Main\garrysmod\data\pr_gamemode" "$GM\data\" }
    if (Test-Path "$Main\garrysmod\sv.db") { Copy-Item "$Main\garrysmod\sv.db" "$GM\sv.db" -Force }
} else {
    $bk = "$Out\data_backup_$ts"
    New-Item -ItemType Directory -Force $bk | Out-Null
    Copy-Item -Recurse "$GM\data\pr_gamemode" $bk
    if (Test-Path "$GM\sv.db") { Copy-Item "$GM\sv.db" "$bk\sv.db" }
    "BACKUP=$bk"
}

# The branch into the game
robocopy "$R\gamemodes\testgm" "$GM\gamemodes\testgm" /MIR /NFL /NDL /NJH /NJS /NP | Out-Null
foreach ($a in 'VJ-Base', 'GUI-MAP-Minimap-for-GMOD', 'eft_weapons') {
    robocopy "$R\addons\$a" "$GM\addons\$a" /MIR /NFL /NDL /NJH /NJS /NP | Out-Null
}
# Оружейные аддоны из Workshop (addons\ws_weapons, ~25 ГБ): в копию игры — ссылки-соединения на папки
# репозитория (мгновенно и без места); в основную установку — как deploy.ps1, зеркалом
$ws = @(Get-ChildItem "$R\addons" -Directory -Filter 'ws_*' | ForEach-Object Name)
foreach ($old in Get-ChildItem "$GM\addons" -Directory -Filter 'ws_*' | Where-Object { $ws -notcontains $_.Name }) {
    if ($old.LinkType) { $old.Delete() } else { Remove-Item -Recurse -Force $old.FullName }
}
foreach ($a in $ws) {
    if ($Instance -gt 0) {
        $link = "$GM\addons\$a"
        if (-not (Test-Path $link)) { New-Item -ItemType Junction -Path $link -Target "$R\addons\$a" | Out-Null }
    } else {
        robocopy "$R\addons\$a" "$GM\addons\$a" /MIR /NFL /NDL /NJH /NJS /NP | Out-Null
    }
}
# The mode's own content (icons, flags, the minimap picture, the font)
robocopy "$R\materials" "$GM\materials" /E /NFL /NDL /NJH /NJS /NP | Out-Null
robocopy "$R\resource" "$GM\resource" /E /NFL /NDL /NJH /NJS /NP | Out-Null
"DEPLOYED to $G"

New-Item -ItemType Directory -Force "$GM\lua\autorun\server", "$GM\lua\autorun\client", "$GM\data" | Out-Null
Copy-Item "$Here\$($Suites[$Suite][0])" "$GM\lua\autorun\server\pr_selftest_sv.lua"
Copy-Item "$Here\pr_selftest_lib.lua" "$GM\lua\pr_selftest_lib.lua"
Copy-Item "$Here\pr_selftest_cl.lua" "$GM\lua\autorun\client\"
[IO.File]::WriteAllText("$GM\data\pr_selftest_sections.txt", $Suites[$Suite][1])
if (Test-Path "$GM\data\pr_selftest") { Remove-Item -Recurse -Force "$GM\data\pr_selftest" }
Remove-Item "$GM\console.log" -ErrorAction SilentlyContinue
"SUITE=$Suite sections=$($Suites[$Suite][1])"

function LogHas($pattern) {
    (Test-Path "$GM\console.log") -and (Select-String -Path "$GM\console.log" -Pattern $pattern -Quiet)
}

$started = Get-Date
if ($Instance -gt 0) {
    # Separate copy: own ports; the map is loaded by lua\menu\pr_automap.lua once Workshop is mounted
    $p = Start-Process $EXE -WorkingDirectory $G -PassThru -ArgumentList @(
        '-multirun', '-windowed', '-w', '1280', '-h', '720', '-novid', '-condebug', '-conclearlog',
        '-port', (27105 + 10 * $Instance), '+clientport', (27100 + 10 * $Instance), '-nohltv',
        '+maxplayers', '16', '+sv_lan', '1', '+gamemode', 'testgm', '+cl_cloud_settings', '0',
        '+con_timestamp', '1'   # метки времени в console.log: видно, на что уходит загрузка
    )
} else {
    # Main install: start without a map (the map lives in Workshop, mounted later), then -hijack
    $p = Start-Process $EXE -PassThru -ArgumentList @(
        '-windowed', '-w', '1280', '-h', '720', '-condebug', '-novid',
        '+maxplayers', '16', '+sv_lan', '1', '+gamemode', 'testgm'
    )
}
"STARTED pid=$($p.Id)"

# Until Workshop is mounted and the map command is sent
$mountDeadline = (Get-Date).AddMinutes(10)
$mapSent = $false
while ((Get-Date) -lt $mountDeadline) {
    Start-Sleep -Seconds 2
    if ($Instance -gt 0) {
        if (LogHas '\[PR_AUTOMAP\] map command sent') { $mapSent = $true; break }
        if (LogHas '\[PR_AUTOMAP\] TIMEOUT') { break }
    } elseif (LogHas 'Mounted [1-9][0-9]* of [0-9]+ workshop addons') {
        Start-Sleep -Seconds 5
        Start-Process $EXE -ArgumentList @('-hijack', '+maxplayers', '16', '+gamemode', 'testgm', '+map', 'rp_desert_conflict') | Out-Null
        $mapSent = $true
        break
    }
    if ($p.HasExited) { break }
}
"MAP_COMMAND_SENT=$mapSent after $([int]((Get-Date) - $started).TotalSeconds) s"

$done = $false
if ($mapSent) {
    # The vehicle scan goes through dozens of vehicles: give it longer
    $deadline = (Get-Date).AddMinutes($(if ($Suite -eq 'navgen') { 95 } elseif ($Suite -eq 'navzone') { 155 } elseif ($Suite -like 'record*') { 65 } elseif ($Suite -like 'scan*') { 40 } elseif ($Suite -in 'weapons', 'npcs', 'roles') { 20 } else { 8 }))
    $sawStart = $false
    while ((Get-Date) -lt $deadline) {
        Start-Sleep -Seconds 3
        if (LogHas '\[PR_SELFTEST\] DONE') { $done = $true; break }
        if (-not $sawStart -and (LogHas '\[PR_SELFTEST\] start')) { $sawStart = $true; "TEST_STARTED after $([int]((Get-Date) - $started).TotalSeconds) s" }
        if (LogHas 'map load failed') { "MAP_LOAD_FAILED"; break }
        if ($p.HasExited -and -not (Get-Process -Id $p.Id -ErrorAction SilentlyContinue)) { "GMOD_EXITED"; break }
    }
}
"FINISHED done=$done in $([int]((Get-Date) - $started).TotalSeconds) s"

# Stop only our game: its process tree, then anything left running from this copy's folder
Start-Sleep -Seconds 1
if ($Instance -gt 0) {
    taskkill /PID $p.Id /T /F 2>$null | Out-Null
    Start-Sleep -Seconds 2
    Get-CimInstance Win32_Process -Filter "Name='gmod.exe'" | Where-Object { $_.ExecutablePath -like "$G\*" } |
        ForEach-Object { Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue }
} else {
    foreach ($i in 1..2) {
        Get-Process gmod -ErrorAction SilentlyContinue | Stop-Process -Force
        Start-Sleep -Seconds 3
    }
}

# Screenshots from the test
if (Test-Path "$GM\data\pr_selftest") {
    New-Item -ItemType Directory -Force "$Out\shots_$ts" | Out-Null
    Copy-Item "$GM\data\pr_selftest\*" "$Out\shots_$ts\"
    Remove-Item -Recurse -Force "$GM\data\pr_selftest"
    "SHOTS=$Out\shots_$ts"
}

# Remove the test; put the main install's saves back
Remove-Item "$GM\lua\autorun\server\pr_selftest_sv.lua", "$GM\lua\autorun\client\pr_selftest_cl.lua", "$GM\lua\pr_selftest_lib.lua", "$GM\data\pr_selftest_sections.txt" -ErrorAction SilentlyContinue
if ($Instance -eq 0) {
    Remove-Item -Recurse -Force "$GM\data\pr_gamemode"
    Copy-Item -Recurse "$bk\pr_gamemode" "$GM\data\"
    if (Test-Path "$bk\sv.db") { Copy-Item "$bk\sv.db" "$GM\sv.db" -Force }
    "RESTORED"
}

# Last test out: the user's video mode back
if ((Test-Path $VideoClean) -and -not (TestInstanceProcs) -and ($Instance -gt 0 -or -not (Get-Process gmod -ErrorAction SilentlyContinue))) {
    cmd /c "reg import `"$VideoClean`" >nul 2>&1" | Out-Null
    "VIDEO_SETTINGS_RESTORED"
}

if (Test-Path "$GM\console.log") {
    Copy-Item "$GM\console.log" "$Out\console_$ts.log"
    "LOG=$Out\console_$ts.log"
}
exit 0
