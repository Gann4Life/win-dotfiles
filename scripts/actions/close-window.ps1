# close-window.ps1
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
    [DllImport("user32.dll")] public static extern IntPtr GetForegroundWindow();
    [DllImport("user32.dll")] public static extern bool PostMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
}
"@

$WM_CLOSE = 0x0010
$hwnd = [Win32]::GetForegroundWindow()
if ($hwnd -ne [IntPtr]::Zero) {
    [Win32]::PostMessage($hwnd, $WM_CLOSE, [IntPtr]::Zero, [IntPtr]::Zero) | Out-Null
}

