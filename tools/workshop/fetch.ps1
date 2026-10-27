param([string]$List, [string]$Log)
$ids = Get-Content $List | Where-Object { $_ -match '^\d+$' }
$root = 'D:\steamcmd\steamapps\workshop\content\4000'
function Have($id) { $p = Join-Path $root $id; (Test-Path $p) -and ((Get-ChildItem $p -File -ErrorAction SilentlyContinue | Measure-Object).Count -gt 0) }
for ($round = 1; $round -le 4; $round++) {
    $left = @($ids | Where-Object { -not (Have $_) })
    "ROUND $round left=$($left.Count) $(Get-Date -Format HH:mm:ss)" | Add-Content $Log
    if ($left.Count -eq 0) { break }
    for ($i = 0; $i -lt $left.Count; $i += 15) {
        $batch = $left[$i..([math]::Min($i + 14, $left.Count - 1))]
        $script = "D:\steamcmd\batch.txt"
        $lines = @('login anonymous') + ($batch | ForEach-Object { "workshop_download_item 4000 $_" }) + @('quit')
        Set-Content -Path $script -Value $lines -Encoding ascii
        & D:\steamcmd\steamcmd.exe +runscript $script 2>&1 | Select-String -Pattern 'Success|ERROR|Timeout|failed' | ForEach-Object { $_.Line } | Add-Content $Log
        $done = @($ids | Where-Object { Have $_ }).Count
        "  batch $i done, have $done/$($ids.Count) $(Get-Date -Format HH:mm:ss)" | Add-Content $Log
    }
}
$miss = @($ids | Where-Object { -not (Have $_) })
"FINISHED missing=$($miss.Count): $($miss -join ',')" | Add-Content $Log
