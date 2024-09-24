# Function to check if the script is running as administrator
function Test-Administrator {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Display options to the user
function DisplayOptions {
    Write-Host "Choose a Windows edition to activate:"
    $index = 1
    foreach ($edition in $editions.Keys) {
        Write-Host "$index) $edition"
        $index++
    }
}

function LogMessage($msg) {
    Write-Host "[Activation] $msg"
}

function Invoke-Activation($ProductKey, $Edition) {
    Write-Host "Running slmgr commands for $Edition with the provided key..."

    LogMessage "Installing your product key..."
    Start-Process -FilePath "slmgr.vbs" -ArgumentList "/ipk", $ProductKey -Wait
    LogMessage "Setting key management service..." 
    Start-Process -FilePath "slmgr.vbs" -ArgumentList "/skms", "kms.digiboy.ir" -Wait
    LogMessage "Activating your product..."
    Start-Process -FilePath "slmgr.vbs" -ArgumentList "/ato" -Wait

    LogMessage $@"[Activation] Done! Your product is ready to use.
    Edition: $Edition
    Key: $Key
    "@
    Pause
}

# Dictionary of Windows editions and their corresponding keys
$editions = @{
    "Pro"                    = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
    "Pro N"                  = "MH37W-N47XK-V7XM9-C7227-GCQG9"
    "Pro for Workstations"   = "NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J"
    "Pro for Workstations N" = "9FNHH-K3HBT-3W4TD-6383H-6XYWF"
    "Pro Education"          = "6TP4R-GNPTD-KYYHQ-7B7DP-J447Y"
    "Pro Education N"        = "YVWGF-BXNMC-HTQYQ-CPQ99-66QFC"
    "Education"              = "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
    "Education N"            = "2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"
    "Enterprise"             = "NPPR9-FWDCX-D2C8J-H872K-2YT43"
    "Enterprise N"           = "DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"
    "Enterprise G"           = "YYVX9-NTFWV-6MDM3-9PT4T-4M68B"
    "Enterprise G N"         = "44RPN-FTY23-9VTTB-MP9BX-T84FV"
}

$dictKeys = @($editions.Keys)
$adminScriptUrl = "https://raw.githubusercontent.com/Gann4Life/win-dotfiles/refs/heads/master/scripts/utils/ActivateWindows.ps1"

# Check if running as administrator
if (-not (Test-Administrator)) {
    # Ask user if it wants to proceed with elevated privileges
    $title    = 'The script needs to run with elevated privileges.'
    $question = 'Do you want to re-run with administrator rights?'
    $choices  = '&Yes', '&No'

    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    if($decision -eq 0) {
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"& {iwr -Uri $adminScriptUrl -UseBasicParsing | iex} -ProductKey '$productKey' -Edition '$selectedEdition'`"" -Verb RunAs 
    } else {
        Write-Host "Ok! The script will now exit."
        Pause
    }
    exit
}

# Main logic to capture and validate user choice
while ($true) {
    DisplayOptions
    $choice = Read-Host "Enter the number corresponding to your choice"
    $choice = [int]$choice

    # Check if the choice is within the valid range
    if ($choice -le 0 -or $choice -gt $editions.Count) {
        Write-Host "Invalid choice. Please enter a number between 1 and $($editions.Count)."
        continue
    }

    $selectedEdition = $dictKeys[$choice - 1]
    $productKey = $editions[$selectedEdition]

    # Execute the script with the product key and edition as arguments
    Invoke-Activation -ProductKey "$productKey" -Edition "$selectedEdition"
    exit
}