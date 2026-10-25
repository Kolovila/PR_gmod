# Stitches the tiles from run_selftest.ps1 -Suite mapshot into the minimap picture:
#   stitch_mapshot.ps1 -Shots <folder SHOTS=... from the run>
# Writes materials/test_gm_mat/minimap/<map>.jpg into the repo and prints the line for
# gamemode/config/minimap.lua (map bounds in world units).
param([Parameter(Mandatory = $true)][string]$Shots, [string]$Map = 'rp_desert_conflict', [int]$Quality = 90)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

$Here = Split-Path -Parent $MyInvocation.MyCommand.Path
$R = (Resolve-Path "$Here\..\..").Path

$b = (Get-Content "$Shots\map_bounds.txt" -Raw).Trim() -split '\s+' | ForEach-Object { [int]$_ }
$minX, $maxX, $minY, $maxY, $n, $px = $b
$size = $n * $px

$bmp = New-Object System.Drawing.Bitmap $size, $size
$g = [System.Drawing.Graphics]::FromImage($bmp)
# (PowerShell names are case-insensitive: the loop variables must not be $r/$R)
for ($row = 0; $row -lt $n; $row++) {
    for ($col = 0; $col -lt $n; $col++) {
        $tile = [System.Drawing.Image]::FromFile("$Shots\map_${row}_${col}.png")
        $g.DrawImage($tile, $col * $px, $row * $px, $px, $px)
        $tile.Dispose()
    }
}
$g.Dispose()

$dir = "$R\materials\test_gm_mat\minimap"
New-Item -ItemType Directory -Force $dir | Out-Null
$out = "$dir\$Map.jpg"
$codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
$params = New-Object System.Drawing.Imaging.EncoderParameters 1
$params.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality), ([long]$Quality)
$bmp.Save($out, $codec, $params)
$bmp.Dispose()

"WROTE $out ($([math]::Round((Get-Item $out).Length / 1KB)) KB, ${size}x${size})"
"CONFIG $Map = {material = `"test_gm_mat/minimap/$Map.jpg`", minX = $minX, maxX = $maxX, minY = $minY, maxY = $maxY},"
