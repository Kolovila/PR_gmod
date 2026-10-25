# Installs the current branch into the main GMod (the one the user plays):
# the gamemode, the bundled addons, materials and the font. Better with the game closed.
#   .\tools\deploy.ps1
param([string]$GMod = 'D:\SteamLibrary\steamapps\common\GarrysMod')

$ErrorActionPreference = 'Stop'
$R  = (Resolve-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Path)\..").Path
$GM = "$GMod\garrysmod"
if (-not (Test-Path "$GM\gameinfo.txt")) { "NO_GMOD at $GMod"; exit 1 }

$running = Get-CimInstance Win32_Process -Filter "Name='gmod.exe'" | Where-Object { $_.ExecutablePath -like "$GMod\*" }
if ($running) { 'WARNING: the game is running; it picks up Lua changes only after a map change or restart' }

robocopy "$R\gamemodes\testgm" "$GM\gamemodes\testgm" /MIR /NFL /NDL /NJH /NJS /NP | Out-Null
foreach ($a in 'VJ-Base', 'GUI-MAP-Minimap-for-GMOD', 'eft_weapons') {
    robocopy "$R\addons\$a" "$GM\addons\$a" /E /NFL /NDL /NJH /NJS /NP | Out-Null
}
robocopy "$R\materials" "$GM\materials" /E /NFL /NDL /NJH /NJS /NP | Out-Null
robocopy "$R\resource" "$GM\resource" /E /NFL /NDL /NJH /NJS /NP | Out-Null
$branch = git -C $R rev-parse --abbrev-ref HEAD
$commit = git -C $R log --oneline -1
"DEPLOYED $branch ($commit) to $GM"
exit 0
