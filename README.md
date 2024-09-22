---
updated_at: 2024-09-22T00:45:33.258-03:00
edited_seconds: 480
---
## Oh My Posh - PowerShell Theme
/// WIP /// TO-DO ///

## Core
[JetBrains Mono NerdFont](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip)

## Komorebi - Tiling window manager for Windows
```powershell
winget install lgug2z.komorebi lgug2z.whkd
komorebic quickstart
komorebic start --whkd
```
**Config files**
* Komorebi `$Env:USERPROFILE\komorebi.json`
* [Hotkeys](https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes) `$Env:USERPROFILE\.config\whkdrc`

## Yasb - Yet Another Status Bar
`winget install --id AmN.yasb`
[amnweb/yasb-themes: 🎨 Theme repository for YASB.](https://github.com/amnweb/yasb-themes)

I've chosen to install 'Windows 11 Theme'
```powershell
cd $Env:USERPROFILE\.config\yasb\
iwr "https://raw.githubusercontent.com/amnweb/yasb-themes/refs/heads/main/themes/7d3895d4-454b-40db-a2f9-44a238d5793b/config.yaml" -OutFile .\config.yaml
iwr "https://raw.githubusercontent.com/amnweb/yasb-themes/refs/heads/main/themes/7d3895d4-454b-40db-a2f9-44a238d5793b/styles.css" -OutFile .\styles.css
```
## Windhawk - System customization
```powershell
winget install RamenSoftware.Windhawk
```
