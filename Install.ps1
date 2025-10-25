# THIS FILE WILL SETUP THE WHOLE INSTALLATION OF THE DOTFILES.
# FILES WILL BE OVERRIDEN.
# YOU HAVE BEEN WARNED.

# // CORE TOOLS SETUP (Requires scoop to be installed) //
# CLI Tools
# scoop install git gitui sudo fzf fd grep neovim yazi starship btop ffmpeg curl fastfetch cava python
# Tiling WM
# scoop install komorebi whkd yasb
# Programs / GUI
# scoop install wezterm sharex zen-browser vscode mpv
# Fonts
# scoop install jetbrainsmono-nf jetbrainsmono-nf-mono jetbrainsmono-nf-propo
# Fun / Misc (The optional ones I guess)
# scoop install cowsay base64

# // PRE-INSTALL COMMANDS //
# Turn Focus Assist ON (prevents notifications)
# sudo Set-ExecutionPolicy RemoteSigned
# Set-FocusAssist -QuietHoursMode On

# // INSTALL POWERSHELL MODULES //
# sudo Install-Module Terminal-Icons
# sudo Install-Module Microsoft.PowerShell.PSResourceGet
# sudo Install-PSResource PSReadLine

# // WRITE POWERSHELL PROFILE TO $PROFILE //
# .\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -> $PROFILE

# // COPY CONFIGS //
# .\.config\ -> ~\.config\

# // COPY KOMOREBI FILES //
# .\komorebi.json -> ~\komorebi.json
# .\komorebi.bar.json -> ~\komorebi.bar.json
# .\applications.json -> ~\applications.json

# // AUTOMATED THEME SETUP (catppuccin mocha) //
# * komorebi (already comes with komorebi.json I believe)
# * yasb (already configured under .config\yasb I believe)
# * mpv (already configured under .config\mpv I belive)
# * btop (already cunfigured under .config\btop ??)
# * keepassxc
# * qbittorrent
# * discord
# * vscode
# * zen-browser
# * sharex
# * wezterm (already configured under .config\wezterm I believe)
# Qutebrowser (catppuccin)
# git clone https://github.com/catppuccin/qutebrowser.git $env:APPDATA\qutebrowser\config\catppuccin
# cp .\AppData\Roaming\qutebrowser\config\config.py $env:APPDATA\qutebrowser\config\config.py



# // EXTRA NOTES //
#
# 1. If you install scoop in another directory, make a link to ~\scoop\.

# // FINISHING //
# Prompt user to activate windows (yes/no)
# If positive, run 'iwr -useb https://get.activated.win | iex'
#
# Ask user to hide taskbar (yes/no)
# Download https://github.com/amnweb/thide/releases/download/v0.1.0/thide.exe if positive.
# Also we assume that .\.config\ folder exists.
# iwr -useb https://github.com/amnweb/thide/releases/download/v0.1.0/thide.exe .\.config\thide.exe
# .\.config\thide.exe enable-autostart
