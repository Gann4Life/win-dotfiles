function Start-FloatingWindow {
    param(
        [scriptblock]$ScriptBlock = {}
    )
    
    if ($ScriptBlock.ToString().Trim() -eq '') {
        # Just launch empty wezterm
        wezterm-gui start --class floating -- powershell -NoProfile
    } else {
        $tempScript = [System.IO.Path]::GetTempFileName() + ".ps1"
        $ScriptBlock.ToString() | Out-File -FilePath $tempScript -Encoding UTF8
        wezterm-gui start --class floating -- powershell -NoProfile -File $tempScript
    }
    
    # Wait for window to appear
    #$beforeCount = (Get-Process wezterm-gui -ErrorAction SilentlyContinue | 
    #                Where-Object { $_.MainWindowHandle -ne 0 }).Count
    #
    #$timeout = 50
    #$count = 0
    #while ($count -lt $timeout) {
    #    $afterCount = (Get-Process wezterm-gui -ErrorAction SilentlyContinue | 
    #                   Where-Object { $_.MainWindowHandle -ne 0 }).Count
    #    
    #    if ($afterCount -gt $beforeCount) {
    #        break
    #    }
    #    
    #    Start-Sleep -Milliseconds 100
    #    $count++
    #}
    #
    #komorebic toggle-float
}
