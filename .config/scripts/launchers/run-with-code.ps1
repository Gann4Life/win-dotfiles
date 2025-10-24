. ~\.config\scripts\_lib\scriptlib.ps1

Start-FloatingWindow {
    Set-Location ~
    $file = fzf --prompt "Open with VS Code:"
    if ($file) {
        code $file
    }
}
