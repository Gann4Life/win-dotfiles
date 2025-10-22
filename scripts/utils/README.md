# Activate Windows
ℹ I highly suggest to use [this tool](https://github.com/massgravel/Microsoft-Activation-Scripts) rather than my own script.

# Activate Windows 10/11 (OLD / OBSOLETE)
Run in powershell the following command:
```powershell
iwr -useb "https://raw.githubusercontent.com/Gann4Life/win-dotfiles/refs/heads/master/scripts/utils/ActivateWindows.ps1" | iex
```

---
### Breakdown
The process is the same as you would find in a generic web search.

These *generic* blogs will guide you step by step to: <br>
* Open console
* Find your key in the table
* Copy key
* Paste this command
* Then paste your key after the command
* Wow paste this other command blah blah blah.
* Oh! You forgot to run as admin.

Sorry I hate these blogs, they're awful and there's walls of texts for no reason trying to explain you what's the console, what's this, why we do this, the reasons we want to activate windows, bunch of crap we don't care about.

This script does exactly the same, but for you.
1. **Run the command** <br>
If you didn't run with admin privileges, it will ask you to restart with admin privileges. Just tell it yes or no, if you deny, the program will exit.

2. **When the program runs in administrator mode:** <br>
It will display to you all editions available, **pick the one you have**! Works for both Windows 10 and Windows 11.

3. Honestly that's it, some messages will display on screen and in the console, you should have windows activated by now.

Keys were obtained from [Microsoft's Webiste](https://learn.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys?tabs=server2022%2Cwindows10ltsc%2Cversion1803%2Cwindows81)!
