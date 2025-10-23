#Set-Location ~
#wezterm-gui start -- powershell -NoProfile -Command "`$file = fzf; if (`$file) { code `$file }"

. ~\.config\scripts\floating-window.ps1

Start-FloatingWindow {
    Set-Location ~
    $file = fzf
    if ($file) {
        code $file
    }
}
