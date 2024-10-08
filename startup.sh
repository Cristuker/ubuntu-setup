echo "Run this script o root directory!!!"

sudo apt update && sudo apt upgrade

echo 'Installing curl'
sudo apt install curl -y
sleep 2
clear

echo 'Installing git'
sudo apt install git -y
sleep 2
clear

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Cristian Silva\""
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
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >microsoft.gpg
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

echo 'Installing flatpak'
sudo apt install flatpak
sleep 2
clear

echo 'Installing snap'
sudo apt update
sudo apt install snapd -y
sleep 2
clear

echo 'Installing slack'
read installSlack

if [ $installSlack = "y" ]; then
    flatpak install flathub com.slack.Slack
fi

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
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
sudo chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
docker compose version
sleep 2
clear

echo 'Installing dbeaver'
wget -c https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb
sudo apt-get install -f
sleep 2
clear

echo 'You want install vivaldi Browser? y/n'
read installVivaldi

if [ $installVivaldi = "y" ]; then
    echo 'Installing Vivaldi'
    wget -c https://downloads.vivaldi.com/stable/vivaldi-stable_4.3.2439.56-1_amd64.deb
    sudo dpkg -i vivaldi-stable_3.6.2165.40-1_amd64.deb
fi
sleep 2
clear

echo 'You want install uLauncher? y/n'
read installUlauncher
if [ $installUlauncher = "y" ]; then
    echo 'Installing ulauncher'
    sudo add-apt-repository ppa:agornostal/ulauncher
    sudo apt update
    sudo apt install ulauncher
fi
sleep 2
clear

echo 'You want install Ferdi (A social media manager)? y/n'
read installFerdi

if [ $installFerdi = "y" ]; then
    echo 'Installing Ferdi'
    flatpak install flathub com.getferdi.Ferdi -y
fi
sleep 2
clear

echo 'You want to install Microsoft Teams? y/n'
read installTeams

if [ $installTeams = "y" ]; then
    echo 'Installing teams'
    flatpak install flathub com.microsoft.Teams -y
fi
sleep 2
clear

echo 'You want to install postman? y/n'
read installPostman

if [ $installPostman = "y" ]; then
    wget https://dl.pstmn.io/download/latest/linux64
    tar -xzvf linux64
fi
sleep 2
clear

echo 'You want install todoist? y/n'
read installTodoist

if [ $installTodoist = "y" ]; then
    sudo snap install todoist
fi
sleep 2
clear

echo 'You want install WhatsApp? y/n'
read installWhats

if [ $installWhats = "y" ]; then
    flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y
fi
sleep 2
clear

echo 'You want install telegram? y/n'
read installTelegram

if [ $installTelegram = "y" ]; then
    sudo snap install insomnia
fi
sleep 2
clear

echo 'You want to install Insomnia? y/n'
read installInsomnia

if [ $installInsomnia = "y" ]; then
    flatpak install flathub org.telegram.desktop -y
fi
sleep 2
clear

echo 'You want to install IntelliJ IDEA? y/n'
read installInteliJ

if [ $installInteliJ = "y" ]; then
    sudo snap install intellij-idea-community --classic
fi
sleep 2
clear

echo 'You want to install Beekeeper Studio? y/n'
read installBeekeeper

if [ $installBeekeeper = "y" ]; then
    sudo snap install beekeeper-studio
fi
sleep 2
clear

echo 'You want to install github CLI? y/n'
read installGithub
if [ $installGithub = "y" ]; then
    type -p curl >/dev/null || sudo apt install curl -y
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
        sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
        sudo apt update &&
        sudo apt install gh -y
fi
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

echo 'Installing Discord'
flatpak install flathub com.discordapp.Discord
sleep 2
clear

echo 'Installing Spotify'
flatpak install flathub com.spotify.Client
sleep 2
clear

echo 'Remove sudo from docker...'
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG

echo 'Installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
zsh
sleep 2
clear

echo 'Installing Oh My Zsh'
zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sleep 2
clear

echo 'Installing nvm'
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
    git clone https://github.com/creationix/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout $(git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1))
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source ~/.zshrc
nvm --version
nvm install 16
nvm alias default 16
node --version
npm --version
sleep 2
clear

echo 'Installing autosuggestions'
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >>~/.zshrc
source ~/.zshrc
sleep 2
clear

echo 'Finishing script'
sleep 2
clear
