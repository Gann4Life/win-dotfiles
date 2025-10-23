Stop-Process -Name whkd
Start-Process whkd -WindowStyle hidden
sleep 1
python .\notify.py "WHKD" "Hotkey daemon is ready."

