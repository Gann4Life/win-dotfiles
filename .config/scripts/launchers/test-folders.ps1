Set-Location $env:USERPROFILE

Write-Host "=== GitHub folder investigation ===" -ForegroundColor Cyan
Write-Host ""

Write-Host "Does GitHub folder exist?" -ForegroundColor Yellow
Test-Path "GitHub"
Write-Host ""

Write-Host "GitHub folder attributes:" -ForegroundColor Yellow
Get-Item "GitHub" -Force | Select-Object FullName, Attributes
Write-Host ""

Write-Host "Repos inside GitHub:" -ForegroundColor Yellow
Get-ChildItem "GitHub" -Directory | Select-Object Name
Write-Host ""

Write-Host "fd from root, looking for GitHub:" -ForegroundColor Yellow
fd --type d --max-depth 1 "GitHub"
Write-Host ""

Write-Host "fd searching everything with max-depth 2:" -ForegroundColor Yellow
fd --type d --max-depth 2 | Where-Object { $_ -like "*GitHub*" }
Write-Host ""

Write-Host "fd with no restrictions:" -ForegroundColor Yellow
fd --type d --no-ignore --hidden --max-depth 2 | Where-Object { $_ -like "*GitHub*" }
