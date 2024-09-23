param (
    [string]$ProductKey,
    [string]$Edition
)

# Run slmgr commands
Write-Host "Running slmgr commands for $Edition with the provided key..."
slmgr /ipk $ProductKey
slmgr /skms kms.digiboy.ir
slmgr /ato
Write-Host "Activation commands executed for $Edition."