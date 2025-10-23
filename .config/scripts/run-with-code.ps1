. ~\.config\scripts\floating-window.ps1

Start-FloatingWindow {
    Set-Location ~
    $file = fzf --prompt "Open with VS Code:"
    if ($file) {
        code $file
    }
}
