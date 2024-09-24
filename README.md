# MrGann's Windows Config
# 🚧 Still under construction! Please wait until everyting has been tested. 🚧
## Prequisites
* [JetBrains NerdFonts](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip) (mostly for Yasb, see step 2)
## 🛠️ Install
Make sure to use PowerShell~
1. Setup [Komorebi](https://github.com/LGUG2Z/komorebi)
```powershell
winget install lgug2z.komorebi lgug2z.whkd
# Restart your terminal and run komorebi:
komorebic quickstart
komorebic start --whkd
```

2. Setup [Yasb](https://github.com/amnweb/yasb)
```powershell
winget install AmN.yasb
```

3. Load my config (Do previous steps first!)
```powershell
iwr -useb "https://raw.githubusercontent.com/Gann4Life/win-dotfiles/refs/heads/master/scripts/Install.ps1" | iex
```

Optional features:
* 🎨 [Theme repository for YASB.](https://github.com/amnweb/yasb-themes)
* 🕹️ [Millenium](https://github.com/SteamClientHomebrew/Millennium) (Steam themes)
* 🗨️ [BetterDiscord](https://betterdiscord.app/) (For discord themes and plugins)
* ⚙️ [Windhawk](https://windhawk.net/) (System customization)


## 📚 Resources
* [Wallpaper](https://whvn.cc/m3kqmy) from wallhaven.cc
* List of [Virtual KeyCodes](https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes) for [whkd](https://github.com/LGUG2Z/whkd)
* 🔑 Need to activate Windows? [**Try my script**](https://github.com/Gann4Life/win-dotfiles/tree/master/scripts/utils)!

## Oh My Posh - PowerShell Theme
/// WIP ///

## Preview
![Imgur](https://imgur.com/T29BNHJ.png)
![Imgur](https://imgur.com/67KSHII.gif)
