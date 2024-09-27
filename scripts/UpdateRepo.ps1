# This will copy files from your home directory to where this repository is located (assuming this script is located at \win-dotfiles\scripts\)
# Don't do anything stupid! This file is meant to run locally after you download the repository, I'm not responsible for anything broken if you try to run the script remotely. (Why would you?)

function Update-ConfigFile($HomePath) {
    $src = "~\$HomePath"
    $destination = "$repoRoot\$HomePath"
    Write-Host "Attempting to copy '$src' into '$destination'"
    Copy-Item -Path $src -Destination $destination -Verbose 
}


$repoRoot = "$PSScriptRoot\.."
if (Test-Path "$repoRoot\README.md") {
    Write-Host "Valid! $repoRoot"
    # HERE Add files located in your home ($Env:USERPROFILE or '~\') path.
    
    # Assuming your files are at ~\, use the file name straight away.
    # Examples:
    # komorebi.json is located at C:\Users\YourUser\komorebi.json
    # ~\ or $Env:USERPROFILE goes to C:\Users\YourUser\ directory.
    # We want to target a file named komorebi.json, so we send "komorebi.json" to -HomePath.
    # if your files are at C:\Users\YourUser\.config\some-tool\config.ini, use '-HomePath ".config\some-tool\config.ini"'.

    Update-ConfigFile -HomePath "komorebi.json" 
    Update-ConfigFile -HomePath ".config\whkdrc"
    Update-ConfigFile -HomePath ".config\yasb\config.yaml"
    Update-ConfigFile -HomePath ".config\yasb\styles.css"
    Update-ConfigFile -HomePath ".config\starship.toml"
} else {
    Write-Host "Please download the repository and run the file located at 'scripts\UpdateRepo.ps1'."
}