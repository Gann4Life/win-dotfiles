# Function to check if the script is running as administrator
function Test-Administrator {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
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

# Display options to the user
function DisplayOptions {
    Write-Host "Choose a Windows edition to activate:"
    $index = 1
    foreach ($edition in $editions.Keys) {
        Write-Host "$index. $edition"
        $index++
    }
}

# Main logic to capture and validate user choice
while ($true) {
    DisplayOptions
    $choice = Read-Host "Enter the number corresponding to your choice"

    # Validate and convert choice to integer
    if (-not ($choice -match '^\d+$')) {
        Write-Host "Invalid input. Please enter a valid number."
        continue
    }

    $choice = [int]$choice

    # Check if the choice is within the valid range
    if ($choice -le 0 -or $choice -gt $editions.Count) {
        Write-Host "Invalid choice. Please enter a number between 1 and $($editions.Count)."
        continue
    }

    $selectedEdition = $editions.Keys[$choice - 1]
    $productKey = $editions[$selectedEdition]

    # URL of the ActivateWindowsKey.ps1 script
    $scriptUrl = "https://raw.githubusercontent.com/Gann4Life/win-dotfiles/refs/heads/master/scripts/utils/ActivateWindowsKey.ps1"

    # Download the script content
    $scriptContent = (iwr -Uri $scriptUrl -UseBasicParsing).Content

    # Check if running as administrator
    if (-not (Test-Administrator)) {
        Write-Host "Script is not running as administrator. Restarting with elevated privileges..."
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" -ProductKey `"$productKey`" -Edition `"$selectedEdition`"" -Verb RunAs -Wait
        exit
    }

    # Execute the script with the product key and edition as arguments
    Write-Host "Executing the activation script..."
    iex "$scriptContent -ProductKey $productKey -Edition '$selectedEdition'"
    Write-Host "Activation script executed."
    exit
}