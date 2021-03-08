echo "Run this script o root directory!!!";

sudo apt-get update

echo 'Installing curl' 
sudo apt install curl -y
sleep 2
clear

echo 'Installing git' 
sudo apt install git -y
sleep 2
clear

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Cristian Silval\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
sleep 2
clear 

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"cristian123105@gmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
sleep 2
clear

echo "Add another git configs"
cd ~
echo "
    [user]
        email = $git_config_user_email
        name = $git_config_user_name
    [core]
        editor = code --wait
    [alias]
        s = !git status -s # git status whit less information
        c = !git add --all && git commit -m #git add and git commit alias
        l = !git log --pretty=format:'%C(blue)%h %C(red)%d %C(white)%s - %C(cyan)%cn, %C(green)%cr' #Format git log message" >>.gitconfig
sleep 2
clear

echo 'Installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders
sleep 2
clear

echo "Define vscode to default editor"
git config --global core.editor code --wait
sleep 2
clear

echo 'Installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sleep 2
clear

echo 'Installing slack' 
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb
sudo apt install ./slack-desktop-*.deb -y
sleep 2
clear

echo 'Installing docker' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

chmod 777 /var/run/docker.sock
docker run hello-world
sleep 2
clear

echo 'Installing docker-compose' 
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
sleep 2
clear

echo 'Installing dbeaver'
wget -c https://dbeaver.io/files/6.0.0/dbeaver-ce_6.0.0_amd64.deb
sudo dpkg -i dbeaver-ce_6.0.0_amd64.deb
sudo apt-get install -f
sleep 2
clear

echo 'Installing snap'
sudo apt update
sudo apt install snapd -y
sleep 2
clear 

echo 'Installing Vivaldi'
wget -c https://downloads.vivaldi.com/stable/vivaldi-stable_3.6.2165.40-1_amd64.deb
sudo dpkg -i vivaldi-stable_3.6.2165.40-1_amd64.deb
sleep 2
clear

echo 'Installing ulauncher'
wget -c https://github.com/Ulauncher/Ulauncher/releases/download/5.8.1/ulauncher_5.8.1_all.deb
sudo dpkg -i ulauncher_5.8.1_all.deb
sleep 2
clear

echo 'Installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
sleep 2
clear

echo 'Installing nvm' 
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source ~/.zshrc
nvm --version
nvm install 12
nvm alias default 12
node --version
npm --version
sleep 2
clear

echo 'Installing autosuggestions' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc
sleep 2
clear

echo 'Installing Gnome Shell Extensions'
sudo apt-get install chrome-gnome-shell
sleep 2
clear

echo 'Installing Gnome Tweak Tool'
sudo apt install gnome-tweak-tool
sleep 2
clear