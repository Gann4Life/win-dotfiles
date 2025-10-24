. ~\.config\scripts\lib\scriptlib.ps1

Stop-Process -Name whkd
Start-Process whkd -WindowStyle hidden
Start-Sleep 1
python $HOME\.config\scripts\notify.py "WHKD" "Hotkey daemon is ready."

