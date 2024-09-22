# MrGann's Windows Config

## Core
| Wallpaper | [wallhaven.cc](https://whvn.cc/m3kqmy) |
|-|-|
| Fonts | [JetBrains Mono NerdFont](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip) |

## Komorebi - Tiling window manager for Windows
```powershell
winget install lgug2z.komorebi lgug2z.whkd
komorebic quickstart
komorebic start --whkd
```
**Config files**
* Komorebi `$Env:USERPROFILE\komorebi.json`
* [Hotkeys](https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes) `$Env:USERPROFILE\.config\whkdrc`

## YASB (Yet Another Status Bar)
`winget install --id AmN.yasb` <br>
[🎨 Theme repository for YASB.](https://github.com/amnweb/yasb-themes)

I've chosen to install 'Windows 11 Theme'
```powershell
cd $Env:USERPROFILE\.config\yasb\
iwr "https://raw.githubusercontent.com/amnweb/yasb-themes/refs/heads/main/themes/7d3895d4-454b-40db-a2f9-44a238d5793b/config.yaml" -OutFile .\config.yaml
iwr "https://raw.githubusercontent.com/amnweb/yasb-themes/refs/heads/main/themes/7d3895d4-454b-40db-a2f9-44a238d5793b/styles.css" -OutFile .\styles.css
```

## Oh My Posh - PowerShell Theme
/// WIP /// TO-DO ///

# Others
Windhawk - System customization
```powershell
winget install RamenSoftware.Windhawk
```
---
[Millenium - Steam themes](https://github.com/SteamClientHomebrew/Millennium)
```powershell
iwr -useb "https://raw.githubusercontent.com/SteamClientHomebrew/Millennium/main/scripts/install.ps1" | iex
```
[Theme (steambrew.app)](https://steambrew.app/theme?id=F8h9ZhwOdoNygNcAfjIZ)
---


## Preview
![Imgur](https://imgur.com/T29BNHJ.png)