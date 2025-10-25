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
}

function Send-Notification {
	param(
		[string] $Title,
		[string] $Description
	)

	python $HOME\.config\scripts\_lib\notify.py $Title $Description
}
