#!/bin/bash
echo -e -n"\n\033[1;36mSó utilize esse script depois 
que o ubuntu atualizar e reiniciar\ncom apt update e apt upgrade \033[1;32mOk?"
read resposta


SNAP() {
   sudo snap install $1
}


APT() {
   sudo apt install $1
}


COPIAR_GIT_BASH(){ #bash,git
   cd ~
   cp .bashrc Desktop/
   cp .minhasSettings Desktop/
   cp .profile Desktop/
   cp .gitconfig Desktop/

}
COPIAR_DCONF(){
   #comando para carregar backup
   # dconf load / < /caminho/minhasSettings.dconf
   cd ~
   dconf dump / > minhasSettings.dconf
   cp minhasSettings.dconf Desktop/
}

EXTENSIONS(){ 
   cd /home/temis_zwang/.local/share/gnome-shell
   cp -r extensions/ Desktop/
}

ANKI(){
   cd /home/temis_zwang/snap
   cp -r anki-woodrow Desktop/
}

# download programas

SNAP vlc -y 
SNAP code --classic -y
SNAP pomotroid -y
SNAP discord -y
SNAP telegram-desktop -y
SNAP gnome-system-monitor -y
SNAP anki-woodrow

APT gparted -y
APT obs-studio -y
APT flameshot -y
APT gnome-usage -y
APT unrar -y
APT google-chrome-stable -y
APT gnome-tweaks

wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt update
APT typora


# .configuração intelijj e vscode e github
#colocar typora como APT
#colocar dash to dock
#compilar código fonte foxitReader
#instalar git
#draw.Io ou whismical
