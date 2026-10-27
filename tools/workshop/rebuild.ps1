# Пересобрать оружейные аддоны addons\ws_* из Workshop (их тяжёлого контента нет в git):
# скачать (steamcmd), разобрать, отобрать без дублей и конфликтов, распаковать в addons\.
#   .\tools\workshop\rebuild.ps1                 # всё по collection_ids.txt
#   .\tools\workshop\rebuild.ps1 -SkipDownload   # уже скачано — только отбор и распаковка
# Нужны: D:\steamcmd\steamcmd.exe (Valve), Python 3, прокси Hiddify 127.0.0.1:12334 для Steam API.
param([switch]$SkipDownload, [string]$Work = "$env:TEMP\pr_workshop")

$ErrorActionPreference = 'Stop'
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path
$R = (Resolve-Path "$Here\..\..").Path
$GMod = 'D:\SteamLibrary\steamapps\common\GarrysMod'
$Subs = 'D:\SteamLibrary\steamapps\workshop\content\4000'   # подписки игрока (часть уже скачана там)
$Cmd  = 'D:\steamcmd\steamapps\workshop\content\4000'
New-Item -ItemType Directory -Force $Work | Out-Null

$ids = Get-Content "$Here\collection_ids.txt" | Where-Object { $_ -match '^\d+$' }

# 1. Сведения Workshop (названия, даты, подписчики) — для отбора
$body = "itemcount=$($ids.Count)&" + (($ids | ForEach-Object -Begin { $i = 0 } -Process { "publishedfileids[$i]=$_"; $i++ }) -join '&')
Set-Content -Path "$Work\req.txt" -Value $body -Encoding ascii -NoNewline
curl.exe -s -x http://127.0.0.1:12334 --max-time 60 --data "@$Work\req.txt" -o "$Work\det.json" https://api.steampowered.com/ISteamRemoteStorage/GetPublishedFileDetails/v1/
if (-not (Test-Path "$Work\det.json")) { 'NO_STEAM_API (прокси Hiddify запущен?)'; exit 1 }

# 2. Скачать то, чего нет ни в подписках, ни у steamcmd
if (-not $SkipDownload) {
    $need = $ids | Where-Object { -not ((Test-Path "$Subs\$_\*") -or (Test-Path "$Cmd\$_\*")) }
    Set-Content "$Work\todo.txt" $need
    & "$Here\fetch.ps1" -List "$Work\todo.txt" -Log "$Work\fetch.log"
    Get-Content "$Work\fetch.log" -Tail 2
}

# 3. Файлы самой игры (что уже есть без аддонов), стволы магазина (их не выкидываем)
$vpks = @(Get-ChildItem "$GMod\garrysmod\*_dir.vpk", "$GMod\sourceengine\*_dir.vpk" | ForEach-Object FullName)
python -I "$Here\vpk_list.py" "$Work\base_files.txt" @vpks
$shop = Select-String -Path "$R\gamemodes\testgm\gamemode\config\shop_defaults.lua" -Pattern '"((?:cw|khr)_[a-z0-9_]+)"' -AllMatches |
    ForEach-Object { $_.Matches } | ForEach-Object { $_.Groups[1].Value }
$db = python -I -c "import sqlite3; c=sqlite3.connect('file:$($GMod.Replace('\','/'))/garrysmod/sv.db?mode=ro', uri=True); print('\n'.join(r[0] for r in c.execute('select class from pr_shop_weapons')))"
Set-Content "$Work\shop_classes.txt" (@($shop) + @($db) | Sort-Object -Unique)

# 4. Разбор, отбор, распаковка
python -I "$Here\cw_index.py" "$Here\collection_ids.txt" "$Work\index.json" $Subs $Cmd | Out-Null
python -I "$Here\cw_select.py" "$Work\index.json" "$Work\base_files.txt" "$Work\det.json" "$Work\shop_classes.txt" "$Work\selection.json"
python -I "$Here\cw_extract.py" "$Work\selection.json" "$Work\index.json" "$R\addons" | Select-Object -Last 3

# 5. Паки NPC и плеермоделей (npc_ids.txt) -> addons\ws_npcs; после оружия: файлы, которые уже есть
#    в других папках addons (VJ-Base, ws_weapons), не дублируются
$npc = Get-Content "$Here\npc_ids.txt" | Where-Object { $_ -match '^\d+$' }
$body = "itemcount=$($npc.Count)&" + (($npc | ForEach-Object -Begin { $i = 0 } -Process { "publishedfileids[$i]=$_"; $i++ }) -join '&')
Set-Content -Path "$Work\npc_req.txt" -Value $body -Encoding ascii -NoNewline
curl.exe -s -x http://127.0.0.1:12334 --max-time 60 --data "@$Work\npc_req.txt" -o "$Work\npc_det.json" https://api.steampowered.com/ISteamRemoteStorage/GetPublishedFileDetails/v1/
if (-not $SkipDownload) {
    $need = $npc | Where-Object { -not ((Test-Path "$Subs\$_\*") -or (Test-Path "$Cmd\$_\*")) }
    Set-Content "$Work\npc_todo.txt" $need
    & "$Here\fetch.ps1" -List "$Work\npc_todo.txt" -Log "$Work\npc_fetch.log"
}
python -I "$Here\cw_index.py" "$Here\npc_ids.txt" "$Work\npc_index.json" $Subs $Cmd | Out-Null
# Боссы EFT (npc_models_only_ids.txt): из заброшенных VJ-паков и плеермоделей — только модели,
# текстуры и звуки, без их Lua; NPC из них — наш класс бойца
python -I "$Here\npc_select.py" "$Work\npc_index.json" "$Work\npc_det.json" "$R\addons" "$Work\npc_selection.json" "--models-only=$Here\npc_models_only_ids.txt"
python -I "$Here\cw_extract.py" "$Work\npc_selection.json" "$Work\npc_index.json" "$R\addons" --folder=ws_npcs "--manifest=$Here\manifest_npcs.json" | Select-Object -Last 3
'Дальше: tools\deploy.ps1 (в игру), run_selftest.ps1 -Suite weapons и -Suite npcs'
