# Oh My Posh Theme
oh-my-posh init pwsh --config "C:\Users\harsh\.oh-my-posh-themes\jblab_2021.omp.json" | Invoke-Expression

# Auto Suggestion with dropdown list
Import-Module PSReadLine
# Enable dropdown list suggestions from history
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView       # dropdown; press F2 to toggle
# Arrow keys search history by what you've already typed
Set-PSReadLineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
# Tab opens a navigable completion menu
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
# Suggestion color (fixed key name)
Set-PSReadLineOption -Colors @{ InlinePrediction = 'DarkGreen' }

# Custom functions
function linkspeed {
    Get-NetAdapter | Select-Object Name, LinkSpeed, Status
}