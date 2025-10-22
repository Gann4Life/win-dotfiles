#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\multiverse-neon.omp.json" | Invoke-Expression
Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionViewStyle ListView
Invoke-Expression (&starship init powershell)

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

# Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58
