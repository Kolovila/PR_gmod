# Several test suites at once, each in its own GMod copy (setup_instances.ps1):
#   run_parallel.ps1 -Suites vehicles,full
#   run_parallel.ps1 -Suites air,air,air      (the same flaky check three times at once)
# Suites go to free copies D:\GModTest\inst1..N; a busy copy is skipped. Prints each suite's
# result, failed checks and log path.
#   run_parallel.ps1 -Suites all              (everything on 4 copies: full + vehicles split in 3)
param([string[]]$Suites = @('vehicles', 'full'), [int]$StaggerSeconds = 20)   # 20 s: four copies loading the map at once ran out of memory
if ($Suites.Count -eq 1 -and $Suites[0] -eq 'all') { $Suites = @('vehair', 'vehplane', 'vehground', 'full') }

$ErrorActionPreference = 'Stop'
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path
$Out = "$env:TEMP\pr_selftest"
New-Item -ItemType Directory -Force $Out | Out-Null

$instances = Get-ChildItem 'D:\GModTest' -Directory -Filter 'inst*' -ErrorAction SilentlyContinue |
    Where-Object { Test-Path "$($_.FullName)\bin\win64\gmod.exe" } |
    ForEach-Object { [int]($_.Name -replace '\D', '') } | Sort-Object
$busy = Get-CimInstance Win32_Process -Filter "Name='gmod.exe'" | ForEach-Object { $_.ExecutablePath }
$free = @($instances | Where-Object { $n = $_; -not ($busy | Where-Object { $_ -like "D:\GModTest\inst$n\*" }) })
if ($free.Count -lt $Suites.Count) { "NOT_ENOUGH_INSTANCES free=$($free.Count) wanted=$($Suites.Count) (setup_instances.ps1 -Count N)"; exit 2 }

$runs = @()
for ($i = 0; $i -lt $Suites.Count; $i++) {
    $n = $free[$i]
    $runnerLog = "$Out\parallel_$(Get-Date -Format HHmmss)_i$n.txt"
    $p = Start-Process powershell -PassThru -WindowStyle Hidden -RedirectStandardOutput $runnerLog -ArgumentList @(
        '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', "$Here\run_selftest.ps1", '-Suite', $Suites[$i], '-Instance', $n)
    $runs += [pscustomobject]@{ Suite = $Suites[$i]; Instance = $n; Proc = $p; RunnerLog = $runnerLog }
    "STARTED $($Suites[$i]) in inst$n"
    if ($i -lt $Suites.Count - 1) { Start-Sleep -Seconds $StaggerSeconds }
}

$runs | ForEach-Object { $_.Proc.WaitForExit() }

foreach ($r in $runs) {
    $text = if (Test-Path $r.RunnerLog) { Get-Content $r.RunnerLog -Raw } else { '' }
    $log = [regex]::Match($text, 'LOG=(\S+)').Groups[1].Value
    $finished = [regex]::Match($text, 'FINISHED done=\S+ in \d+ s').Value
    $done = if ($log -and (Test-Path $log)) { Select-String -Path $log -Pattern '\[PR_SELFTEST\] DONE.*' | Select-Object -Last 1 } else { $null }
    "== $($r.Suite) (inst$($r.Instance)): $(if ($done) { $done.Line.Trim() } else { 'NO RESULT' }); $finished"
    if ($log -and (Test-Path $log)) {
        # Failed checks and Lua errors (addons print them as "[Addon] lua/...lua:123: message")
        Select-String -Path $log -CaseSensitive -Pattern '\[PR_SELFTEST\] FAIL|Lua Error|\[ERROR\] |\.lua:\d+: ' | Select-Object -First 30 | ForEach-Object { "   " + $_.Line.Trim() }
        "   log: $log"
    } else {
        "   runner output: $($r.RunnerLog)"
    }
}
