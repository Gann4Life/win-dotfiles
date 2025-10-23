. ~\.config\scripts\floating-window.ps1

Start-FloatingWindow {
# Format processes nicely for display
	$selected = Get-Process | ForEach-Object { 
	    "{0,-40} | PID: {1,-8} | CPU: {2,8} | Mem: {3,10} MB" -f `
		$_.ProcessName, `
		$_.Id, `
		[math]::Round($_.CPU, 2), `
		[math]::Round($_.WorkingSet / 1MB, 2)
	} | fzf --prompt "Kill: " --header="Process Name                             | PID      | CPU Usage  | Memory" --height=40%

# Extract the process name (first part before the |) and kill ALL instances
	if ($selected) {
	    $name = ($selected -split '\|')[0].Trim()
	    
	    Write-Host "Killing all instances of: $name" -ForegroundColor Red
	    Stop-Process -Name $name -Force
	}
}


