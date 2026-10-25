# Prepares separate GMod copies for autotests: D:\GModTest\inst1..N
# (so tests can run while the user plays, and several at once).
# Reads the main install only. Run again after a GMod update: it relinks/recopies what changed.
#   hardlinked (no extra disk, the game never writes them): sourceengine\*, garrysmod\*.vpk, maps
#   copied: bin, platform, root materials, small garrysmod dirs, base gamemodes, addons,
#           the decompressed legacy Workshop .gma files (with timestamps, else GMod re-extracts)
#   menu patch: lua\menu\pr_automap.lua loads the map once Workshop is mounted (no -hijack)
param([int]$Count = 2)

$ErrorActionPreference = 'Stop'
$G    = 'D:\SteamLibrary\steamapps\common\GarrysMod'
$WS   = 'D:\SteamLibrary\steamapps\workshop\content\4000'
$Root = 'D:\GModTest'
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path

function Mirror($src, $dst, [string[]]$extra = @()) {
    robocopy $src $dst /MIR /NFL /NDL /NJH /NJS /NP @extra | Out-Null
    if ($LASTEXITCODE -ge 8) { throw "robocopy failed ($LASTEXITCODE): $src -> $dst" }
}

# Hardlink every file of $src under $dst (same volume). A link whose size/time no longer
# matches the source (Steam replaced the file) is relinked.
function LinkTree($src, $dst, [string]$filter = '*', [switch]$Recurse) {
    $files = if ($Recurse) { Get-ChildItem $src -Recurse -File -Filter $filter } else { Get-ChildItem $src -File -Filter $filter }
    $n = 0
    foreach ($f in $files) {
        $rel = $f.FullName.Substring($src.Length).TrimStart('\')
        $target = Join-Path $dst $rel
        $dir = Split-Path $target
        if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force $dir | Out-Null }
        if (Test-Path $target) {
            $t = Get-Item $target
            if ($t.Length -eq $f.Length -and $t.LastWriteTimeUtc -eq $f.LastWriteTimeUtc) { continue }
            Remove-Item $target -Force
        }
        New-Item -ItemType HardLink -Path $target -Target $f.FullName | Out-Null
        $n++
    }
    return $n
}

# Legacy Workshop items are mounted from garrysmod\cache\workshop\<id>.gma
$legacy = Get-ChildItem $WS -Directory | Where-Object { Get-ChildItem $_.FullName -Filter '*_legacy.bin' -ErrorAction SilentlyContinue } |
    ForEach-Object { "$($_.Name).gma" } | Where-Object { Test-Path "$G\garrysmod\cache\workshop\$_" }

foreach ($n in 1..$Count) {
    $I = "$Root\inst$n"
    $IG = "$I\garrysmod"
    "== inst$n"
    New-Item -ItemType Directory -Force $I, $IG | Out-Null

    # Engine and binaries
    "  sourceengine: linked $(LinkTree "$G\sourceengine" "$I\sourceengine" -Recurse) files"
    Mirror "$G\bin" "$I\bin"
    Mirror "$G\platform" "$I\platform"
    Mirror "$G\materials" "$I\materials"
    Get-ChildItem $G -File | Where-Object { $_.Name -ne 'steam_appid.txt' } | ForEach-Object { Copy-Item $_.FullName "$I\" -Force }
    # Started directly, Steam reads the app id from the working directory (no relaunch via Steam)
    [IO.File]::WriteAllText("$I\steam_appid.txt", '4000')

    # garrysmod: archives linked, small files copied
    "  vpk: linked $(LinkTree "$G\garrysmod" $IG '*.vpk') files"
    foreach ($f in 'gameinfo.txt', 'steam.inf', 'garrysmod.ver', 'cl.db', 'mn.db', 'detail.vbsp', 'lights.rad') {
        if (Test-Path "$G\garrysmod\$f") { Copy-Item "$G\garrysmod\$f" "$IG\" -Force }
    }
    foreach ($d in 'lua', 'html', 'cfg', 'settings', 'resource', 'materials', 'models', 'sound', 'particles', 'scenes', 'backgrounds', 'addons') {
        if (Test-Path "$G\garrysmod\$d") { Mirror "$G\garrysmod\$d" "$IG\$d" }
    }
    foreach ($gm in 'base', 'sandbox', 'terrortown') { Mirror "$G\garrysmod\gamemodes\$gm" "$IG\gamemodes\$gm" }
    # maps: .bsp and the rest linked; graphs\ (node graphs the server writes) stays per instance
    "  maps: linked $(LinkTree "$G\garrysmod\maps" "$IG\maps" '*') files"
    New-Item -ItemType Directory -Force "$IG\maps\graphs" | Out-Null

    # Legacy Workshop .gma (copy, keeps timestamps)
    New-Item -ItemType Directory -Force "$IG\cache\workshop" | Out-Null
    if ($legacy) {
        robocopy "$G\garrysmod\cache\workshop" "$IG\cache\workshop" @legacy /NFL /NDL /NJH /NJS /NP | Out-Null
        if ($LASTEXITCODE -ge 8) { throw "robocopy legacy gma failed ($LASTEXITCODE)" }
    }
    "  legacy gma: $($legacy.Count)"

    foreach ($d in 'data', 'download', 'downloadlists', 'logs', 'saves', 'dupes', 'demos', 'screenshots', 'crashes') {
        New-Item -ItemType Directory -Force "$IG\$d" | Out-Null
    }

    # Auto map load from the main menu
    Copy-Item "$Here\pr_automap.lua" "$IG\lua\menu\pr_automap.lua" -Force
    $menu = "$IG\lua\menu\menu.lua"
    if (-not (Select-String -Path $menu -Pattern 'pr_automap' -Quiet)) {
        Add-Content -Path $menu -Value "`r`ninclude( `"pr_automap.lua`" )" -Encoding ASCII
    }

    [IO.File]::WriteAllText("$I\pr_instance.txt", "prepared $(Get-Date -Format s) from $G")
    "  ready: $I"
}
