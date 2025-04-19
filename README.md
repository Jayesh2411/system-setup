# system-setup


ThinkPad:
1. Change terminal settings.
2. Change shell to zsh
    sudo apt update
    sudo apt install zsh -y
    chsh -s $(which zsh)
    sudo apt install build-essentials 
    sudo apt install git
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

2. Java 17
     sudo apt install openjdk-17-jdk -y\n
3. Node 20
    sudo apt install -y ca-certificates curl gnupg\n
    sudo mkdir -p /etc/apt/keyrings\ncurl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg\n

    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.1 $(lsb_release -c | awk '{print $2}') main" | sudo tee /etc/apt/sources.list.d/nodesource.list\n

    sudo apt update\nsudo apt install -y nodejs\n

    node -v

4. Docker
    sudo apt install -y ca-certificates curl gnupg lsb-release
    
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
    
    echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    sudo apt update
    
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    
    sudo docker --version

    Start Docker
        sudo dockerd
    Stop Docker
        docker stop $(docker ps -q)
        sudo systemctl stop docker
        docker system prune -a -f
5. Install Vscode and intelliJ

6. Autosugestions
    sudo apt install zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    plugins=( ... zsh-autosuggestions)

7. Brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bash_profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

8. Github SSH
    
    ssh-keygen -t ed25519 -C "jsinha2411@gmail.com"
    Add in github
    
    git config --global user.email "jsinha2411@gmail.com"
    git config --global user.name "Jayesh Sinha"


9. Aliases Add in .zshrc
    alias update='sudo apt update && sudo apt upgrade'  # Update system packages
    alias brewup='brew update && brew upgrade'         # Update Homebrew and packages
    alias brewinst='brew install'                      # Install a package via Homebrew
    alias brewrem='brew uninstall'                     # Remove a package via Homebrew
    
    alias gs='git status'        # Check the status of your Git repository
    alias ga='git add .'         # Stage all changes
    alias gc='git commit -m'     # Commit changes with a message
    alias gp='git push'          # Push changes to the remote repository
    alias gl='git pull'          # Pull the latest changes from the remote repository
    alias gco='git checkout'     # Switch branches
    alias gbr='git branch'       # List all branches

    alias serve='python3 -m http.server'  # Start a simple HTTP server
    alias code='code .'                   # Open current directory in Visual Studio Code
    alias v='vim'                         # Open Vim editor
    alias sv='sudo vim'                   # Open Vim editor with sudo


    alias reload='source ~/.zshrc'    # Reload Zsh configuration
    alias h='history -n'              # Display command history
    alias hgrep='history | grep'      # Search command history
    alias please='sudo'               # Use sudo with a friendly alias
    alias top='sudo htop'             # Open htop with sudo privileges
    alias yt='youtube-dl'             # Download YouTube videos

    alias ipconfig='ifconfig | grep "inet "'  # Display IP configuration
    alias pingg='ping -c 5'                   # Ping a host 5 times
    alias dusage='df -h'                      # Show disk usage in human-readable format
    alias speed='speedtest-cli'               # Test internet speed
    

