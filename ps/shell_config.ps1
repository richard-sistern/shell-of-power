
# Create a profile file for the current user
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

# Install Scoop
iwr -useb get.scoop.sh | iex
# https://github.com/lukesampson/scoop/wiki/Quick-Start

# Add a decent font
# https://www.nerdfonts.com/font-downloads

# Install Starship
scoop install startship
# Add the following to $profile
Invoke-Expression (&starship init powershell)
#https://starship.rs/

# Change default for Windows Terminal
# https://www.codyhosterman.com/2020/05/defaulting-windows-terminal-to-powershell-7-x-core/

#TODO
# https://www.hanselman.com/blog/how-to-make-a-pretty-prompt-in-windows-terminal-with-powerline-nerd-fonts-cascadia-code-wsl-and-ohmyposh
# https://www.hanselman.com/blog/you-should-be-customizing-your-powershell-prompt-with-psreadline
