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

