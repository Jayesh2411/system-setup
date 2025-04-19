#!/bin/bash

# Update and install prerequisites
sudo apt update && sudo apt install -y \
  wget \
  curl \
  git \
  build-essential \
  software-properties-common \
  zsh \
  vim \
  snapd \
  apt-transport-https \
  ca-certificates

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/ms-packages.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms-packages.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update && sudo apt install -y code

# Install IntelliJ IDEA Community Edition
echo "Installing IntelliJ IDEA Community Edition..."
sudo snap install intellij-idea-community --classic

# Install JDK 17
echo "Installing JDK 17..."
sudo apt install -y openjdk-17-jdk

# Install Node.js LTS
echo "Installing Node.js LTS..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Install Homebrew (Linuxbrew)
echo "Installing Homebrew (Linuxbrew)..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

# Add common aliases to .zshrc
echo "Adding common aliases..."
cat <<EOL >> ~/.zshrc

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listing
alias l='ls -lFh'
alias la='ls -lAFh'
alias ll='ls -la'

# File operations
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# System updates
alias update='sudo apt update && sudo apt upgrade'
alias brewup='brew update && brew upgrade'

# Git shortcuts
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gbr='git branch'

# Development tools
alias serve='python3 -m http.server'
alias code='code .'
alias v='vim'
alias sv='sudo vim'

# Productivity
alias reload='source ~/.zshrc'
alias h='history -n'
alias hgrep='history | grep'
alias please='sudo'
alias top='sudo htop'

# Networking & system info
alias ipconfig='ifconfig | grep "inet "'
alias pingg='ping -c 5'
alias dusage='df -h'
alias speed='speedtest-cli'
EOL

# Apply changes
source ~/.zshrc

echo "Installation complete! Please restart your terminal or run 'exec zsh' to apply all changes."

