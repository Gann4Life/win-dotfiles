. ~\.config\scripts\floating-window.ps1

Start-FloatingWindow {
    Set-Location ~
    $file = fzf
    if ($file) {
        nvim $file
    }
}
