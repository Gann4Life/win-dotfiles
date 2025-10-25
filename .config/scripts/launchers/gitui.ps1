. ~\.config\scripts\_lib\scriptlib.ps1

Start-FloatingWindow {
    Set-Location $env:USERPROFILE\GitHub\

# fd with depth limit for better performance
# Add --hidden if you want to display files that start with a dot.
    $folder = fd --type d --no-ignore --hidden --max-depth 1 --exclude .git --exclude node_modules | 
    fzf --prompt "Open repository: " -i

    if ($folder) {
        gitui -d $folder
    }

    exit 0
}