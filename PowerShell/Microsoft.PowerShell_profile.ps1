# Oh My Posh Theme
# oh-my-posh init pwsh --config "C:\Users\harsh\.oh-my-posh-themes\jblab_2021.omp.json" | Invoke-Expression

# --- Oh My Posh (cached init) ---

    # IMP Copy the theme file to local to reduce load time.
    # --------------------------------------------------------------
    # New-Item -ItemType Directory -Force "$env:LOCALAPPDATA\omp" | Out-Null
    # Copy-Item "C:\Users\harsh\.oh-my-posh-themes\jblab_2021.omp.json" "$env:LOCALAPPDATA\omp\jblab_2021.omp.json"

$ompTheme = "$env:LOCALAPPDATA\omp\jblab_2021.omp.json"
$ompCache = "$env:LOCALAPPDATA\omp\omp-init.ps1"

# Regenerate cache only if missing or theme is newer than the cache
if (-not (Test-Path $ompCache) -or
    (Get-Item $ompTheme).LastWriteTime -gt (Get-Item $ompCache).LastWriteTime) {
    oh-my-posh init pwsh --config $ompTheme | Out-File $ompCache -Encoding utf8
}
. $ompCache

# --- Fast PSReadLine setup (module is auto-loaded in PS7, no explicit Import needed) ---
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab       -Function MenuComplete
Set-PSReadLineOption -Colors @{ InlinePrediction = 'DarkGreen' }

# Custom functions
function linkspeed {
    Get-NetAdapter | Select-Object Name, LinkSpeed, Status
}