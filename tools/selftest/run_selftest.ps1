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
    mapshot  = @('pr_mapshot_sv.lua', '')   # map picture for the minimap: then stitch_mapshot.ps1
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
    robocopy "$R\addons\$a" "$GM\addons\$a" /E /NFL /NDL /NJH /NJS /NP | Out-Null
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
        '+maxplayers', '8', '+sv_lan', '1', '+gamemode', 'testgm', '+cl_cloud_settings', '0'
    )
} else {
    # Main install: start without a map (the map lives in Workshop, mounted later), then -hijack
    $p = Start-Process $EXE -PassThru -ArgumentList @(
        '-windowed', '-w', '1280', '-h', '720', '-condebug', '-novid',
        '+maxplayers', '8', '+sv_lan', '1', '+gamemode', 'testgm'
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
        Start-Process $EXE -ArgumentList @('-hijack', '+maxplayers', '8', '+gamemode', 'testgm', '+map', 'rp_desert_conflict') | Out-Null
        $mapSent = $true
        break
    }
    if ($p.HasExited) { break }
}
"MAP_COMMAND_SENT=$mapSent after $([int]((Get-Date) - $started).TotalSeconds) s"

$done = $false
if ($mapSent) {
    $deadline = (Get-Date).AddMinutes(8)
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
