. ~\.config\scripts\_lib\scriptlib.ps1

Start-FloatingWindow {
    $apps = Get-StartApps | Where-Object AppID
    $choice = $apps | ForEach-Object { "$($_.Name)`t$($_.AppID)" } | fzf --prompt "Run: "
    
    if ($choice) {
        $appid = ($choice -split "`t")[-1]
        
        if (Test-Path $appid) {
            # Handle .lnk shortcuts
            if ($appid -match '\.lnk$') {
                $shell = New-Object -ComObject WScript.Shell
                $shortcut = $shell.CreateShortcut($appid)
                $targetPath = $shortcut.TargetPath
                $workingDir = $shortcut.WorkingDirectory
                
                if ([string]::IsNullOrWhiteSpace($workingDir)) {
                    $workingDir = Split-Path $targetPath -Parent
                }
                
                Start-Process -FilePath $targetPath -WorkingDirectory $workingDir
            } else {
                # Regular executable
                $exePath = Resolve-Path $appid
                $workingDir = Split-Path $exePath -Parent
                Start-Process -FilePath $exePath -WorkingDirectory $workingDir
            }
        } else {
            # UWP / Store app
            try {
                Start-Process "explorer.exe" "shell:AppsFolder\$appid"
            } catch {
                $shell = New-Object -ComObject Shell.Application
                $item = $shell.Namespace('shell:AppsFolder').Items() |
                        Where-Object { $_.Name -eq ($choice -split "`t")[0] }
                if ($item) { $item.InvokeVerb() }
                else { Write-Warning "Unable to launch app: $appid" }
            }
        }
    }
    
    exit 0
}