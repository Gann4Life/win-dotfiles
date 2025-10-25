. ~\.config\scripts\_lib\scriptlib.ps1

Start-FloatingWindow {
    # Build a clean list of search locations
    $locations = @()
    
    # Add Home first
    $locations += [PSCustomObject]@{ 
        Display = "Home"
        Path = $env:USERPROFILE 
    }
    
    # Add all drives with progress bar
    Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Used -ne $null } | ForEach-Object {
        $usedGB = [math]::Round($_.Used / 1GB, 1)
        $totalGB = [math]::Round(($_.Used + $_.Free) / 1GB, 1)
        $freeGB = [math]::Round($_.Free / 1GB, 1)
        $percentUsed = [math]::Round(($_.Used / ($_.Used + $_.Free)) * 100)
        
        # Create progress bar (20 chars wide)
        $barLength = 20
        $filled = [math]::Round(($percentUsed / 100) * $barLength)
        $empty = $barLength - $filled
        $bar = ("#" * $filled) + ("-" * $empty)
        
        $locations += [PSCustomObject]@{ 
            Display = "Drive $($_.Name):\ [$bar] $percentUsed% ($usedGB GB / $totalGB GB)"
            Path = $_.Root 
        }
    }
    
    # Let user select location
    $selected = $locations | ForEach-Object { "$($_.Display)`t$($_.Path)" } | 
                fzf --prompt "Select location: "
    
    if ($selected) {
        $searchRoot = ($selected -split "`t")[1]
        Set-Location $searchRoot
        
        # Search for folders
        $folder = fd --type d --follow --no-ignore --hidden --max-depth 4 --exclude .git --exclude node_modules | 
                  fzf --prompt "Open folder: " -i
        
        if ($folder) {
            $fullPath = Join-Path $searchRoot $folder
            Invoke-Item $fullPath
        }
    }
    
    exit 0
}

# . ~\.config\scripts\_lib\scriptlib.ps1
# 
# Start-FloatingWindow {
#     Set-Location $env:USERPROFILE
#     
#     # fd with depth limit for better performance
#     # Add --hidden if you want to display files that start with a dot.
#     $folder = fd --type d --follow --no-ignore --hidden --max-depth 4 --exclude .git --exclude node_modules | 
#               fzf --prompt "Open folder: " -i
#     
#     if ($folder) {
#         Invoke-Item $folder
#     }
#     
#     exit 0
# }
