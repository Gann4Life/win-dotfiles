$configFolder = "~\.config\"
$yasbFolder = "~\.config\yasb"

function Download-YasbTheme {
    Write-Host "[YASB Setup: Started]"

    if (!(Test-Path $yasbFolder)) {
        New-Item -ItemType Directory -Path $yasbFolder -Verbose
    }
   
    Invoke-WebRequest -Verbose "https://raw.githubusercontent.com/Gann4Life/win-dotfiles/refs/heads/master/.config/yasb/config.yaml" -OutFile "~\.config\yasb\config.yaml"
    Invoke-WebRequest -Verbose "https://raw.githubusercontent.com/Gann4Life/win-dotfiles/refs/heads/master/.config/yasb/styles.css" -OutFile "~\.config\yasb\styles.css"
    Write-Host "[YASB Setup: Finished]"
}

function Download-KomorebiConfig {
    Write-Host "[Komorebi Setup: Started]"
    if (!(Test-Path $configFolder)) {
        New-Item -ItemType Directory -Path $configFolder -Verbose
    }

    Invoke-WebRequest -Verbose "https://raw.githubusercontent.com/Gann4Life/win-dotfiles/refs/heads/master/.config/whkdrc" -OutFile "~\.config\whkdrc"
    Invoke-WebRequest -Verbose "https://raw.githubusercontent.com/Gann4Life/win-dotfiles/refs/heads/master/komorebi.json" -OutFile "~\komorebi.json"
    Write-Host "[Komorebi Setup: Finished]"
}

function Confirm-Install {
    $title    = 'This will override your current komorebi and yasb settings files!'
    $question = 'Are you sure you want to proceed?'
    $choices  = '&Yes', '&No'

    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    if($decision -eq 0) {
        Download-KomorebiConfig
        Download-YasbTheme
    } else {
        Write-Host "Alrighty!"
    }
}

Confirm-Install
Write-Host "The setup has finished, make sure to reload your applications if required!"
Write-Host "If you have any errors, or suggestions for improvement, please create an issue at https://github.com/gann4life/win-dotfiles/issues"
Write-Host "                -Gann4Life"