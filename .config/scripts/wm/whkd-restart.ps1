. ~\.config\scripts\_lib\scriptlib.ps1

Stop-Process -Name whkd
Start-Process whkd -WindowStyle hidden
Start-Sleep 1

Send-Notification "WHKD" "Hotkey daemon is ready"

