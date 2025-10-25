function Start-FloatingWindow {
    param(
        [scriptblock]$ScriptBlock = {}
    )
    
    # Force close existing floating windows
    try {
        $state = komorebic state | ConvertFrom-Json
        
        # Get all floating wezterm windows 
        $floatingWeztermWindows = $state.monitors.elements.workspaces.elements.floating_windows.elements | 
            Where-Object { $_.class -eq "floating" -and $_.exe -eq "wezterm-gui.exe" }
        
        # Kill them all
        foreach ($window in $floatingWeztermWindows) {
            $proc = Get-Process | Where-Object { $_.MainWindowHandle -eq $window.hwnd }
            if ($proc) {
                Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
            }
        }
    } catch {
        # Silently continue
    }
    
    if ($ScriptBlock.ToString().Trim() -eq '') {
        Start-Process wezterm-gui -ArgumentList "start", "--class", "floating", "--", "powershell", "-NoProfile"
    } else {
        $tempScript = [System.IO.Path]::GetTempFileName() + ".ps1"
        $ScriptBlock.ToString() | Out-File -FilePath $tempScript -Encoding UTF8
        Start-Process wezterm-gui -ArgumentList "start", "--class", "floating", "--", "powershell", "-NoProfile", "-File", $tempScript
    }
}


function Send-Notification {
	param(
		[string] $Title,
		[string] $Description
	)

	python $HOME\.config\scripts\_lib\notify.py $Title $Description
}

# ZOMBIE CODE
# function Start-FloatingWindow {
#     param(
#         [scriptblock]$ScriptBlock = {}
#     )
#     
#     if ($ScriptBlock.ToString().Trim() -eq '') {
#         # Just launch empty wezterm
#         wezterm-gui start --class floating -- powershell -NoProfile
#     } else {
#         $tempScript = [System.IO.Path]::GetTempFileName() + ".ps1"
#         $ScriptBlock.ToString() | Out-File -FilePath $tempScript -Encoding UTF8
#         wezterm-gui start --class floating -- powershell -NoProfile -File $tempScript
#     }
# }