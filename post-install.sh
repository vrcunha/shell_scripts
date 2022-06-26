## UPDATE and UPGRADE
echo "Atualizando e Preparando o Sistema."
sudo apt update -y
sudo apt upgrade -y

## UPDATING ~/.bashrc
cat << 'EOF' >> ${HOME}/.bashrc

## CUSTOM ALIAS
alias start-airflow='cd ~/Codes/data-gathering-dag && docker-compose start'
alias stop-airflow='cd ~/Codes/data-gathering-dag && docker-compose stop'

## BASH CUTOMIZATION
which_branch() {
    # local resp = __git_ps1 '%s'
    if __git_ps1 != '';
    then
        __git_ps1 '%s'
    else
       echo -e 'blank'
    fi
}

# VIRTUAL_ENV_DISABLE_PROMPT=1 ➜ 𝞦 ✔
export PS1='\[\e[1;32m\]➜\[\e[0m\]  '
       PS1+='\[\e[1;35m\]\u\[\e[0m\] '
       PS1+='\[\e[1;32m\]in\[\e[0m\] '
       PS1+='\[\e[3;36m\]\W\[\e[0m\] '
       PS1+='\[\e[1;32m\]at\[\e[0m\] '
       PS1+='\[\e[1;34m\]$(which_branch)\[\e[0m\]'
       PS1+='\[\e[1;32m\]\n\$ \[\e[0m\] '

## PYENV CONFIG
export PATH="${HOME}/.pyenv/bin:${PATH}"
eval "$(pyenv init -)"
EOF

echo "Instalando Flatpak"
sudo apt install flatpak

## Add PPAs
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo add-apt-repository -y ppa:git-core/ppa
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

## UPDATE
sudo apt update -y

## INSTALLs
echo "Instalando VSCode, HTop, GParted, GIT, AWS cli e DBeaver."
sudo apt install code, htop gparted git awscli default-jdk dbeaver-ce -y

echo "Instalando apps em Flatpak"

echo "Instalando Telegram."
flatpak install flathub org.telegram.desktop -y

echo "Instalando Postman."
flatpak install flathub com.getpostman.Postman -y

echo "Instalando Discord."
flatpak install flathub com.discordapp.Discord -y

echo "Instalando Slack."
flatpak install flathub com.slack.Slack -y

echo "Instalando Blender."
flatpak install flathub org.blender.Blender -y

echo "Instalando Gimp."
flatpak install flathub org.gimp.GIMP -y

echo "Instalando OBS."
flatpak install flathub com.obsproject.Studio -y

echo "Instalando Zoom."
flatpak install flathub us.zoom.Zoom -y

echo "Instalando Chrome."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ./google-chrome-stable_current_amd64.deb

echo "Instalando Docker."
sudo apt-get install apt-transport-https ca-certificates curl gnupg software-properties-common -y
sudo apt install docker-ce -y
sudo systemctl enable docker

echo "Instalando docker-compose."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "Adicionando docker e docker-compose ao sudo group"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

sudo groupadd docker-compose
sudo usermod -aG docker-compose $USER
newgrp docker-compose

# echo "Instalando Fusion360."
# sudo snap install --beta fusion360 --devmode

echo "Instalando Pyenv."
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

# Export the env vars
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# Use pyenv to install Python
pyenv install -v 3.9.12
pyenv global 3.9.12

exec $SHELL

echo "Atualizando SSH e VSCODE configs"
cp /media/$USER/backup/_ssh/* ~/.ssh
cp -r /media/$USER/backup/_vscode/* ~/.vscode