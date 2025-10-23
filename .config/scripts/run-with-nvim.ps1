. ~\.config\scripts\floating-window.ps1

Start-FloatingWindow {
    Set-Location ~
    $file = fzf --prompt "Open with nvim: "
    if ($file) {
        nvim $file
    }
}
