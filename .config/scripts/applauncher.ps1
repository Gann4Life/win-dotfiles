. ~\.config\scripts\floating-window.ps1

Start-FloatingWindow {
# Get all apps with AppID
	$apps = Get-StartApps | Where-Object AppID

# Build a tab-separated list for fzf
	$choice = $apps | ForEach-Object { "$($_.Name)`t$($_.AppID)" } | fzf

	if ($choice) {
	    # Extract the AppID from the selection
	    $appid = ($choice -split "`t")[-1]

	    # Determine if AppID is a path to an executable
	    if (Test-Path $appid) {
		# Traditional exe
		Start-Process $appid
	    } else {
		# Likely a UWP / Store app, launch via COM Shell.Application
		try {
		    # Try the explorer.exe shell:AppsFolder trick
		    Start-Process "explorer.exe" "shell:AppsFolder\$appid"
		} catch {
		    # Fallback: COM method for more compatibility
		    $shell = New-Object -ComObject Shell.Application
		    $item = $shell.Namespace('shell:AppsFolder').Items() |
			    Where-Object { $_.Name -eq ($choice -split "`t")[0] }
		    if ($item) { $item.InvokeVerb() }
		    else { Write-Warning "Unable to launch app: $appid" }
		}
	    }
	}

# Ensure PowerShell exits cleanly for WezTerm
	exit 0
}
