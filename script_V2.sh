#!/bin/bash
source interface.sh


SNAP() {
   sudo snap install $1
}


APT() {
   sudo apt install $1
}

BKP_EXTENSIONS_VSCODE (){
   cd ~
   cp /home/temis_zwang/.vscode/extensions Desktop/
}

BKP_GIT_AND_BASH(){ #bash,git,terminal
   cd ~
   cp .bashrc Desktop/
   cp .minhasSettings Desktop/
   cp .profile Desktop/
   cp .gitconfig Desktop/

}
BKP_DCONF(){ #ubuntu user configs
   cd ~
   dconf dump / > minhasSettings.dconf
   cp minhasSettings.dconf Desktop/
}

BKP_EXTENSIONS(){ 
   cd /home/temis_zwang/.local/share/gnome-shell
   cp -r extensions/ Desktop/
}

BKP_ANKI(){
   cd /home/temis_zwang/.local/share/
   cp -r Anki2/ Desktop/
}

BACKUPS_LOCAIS(){
   BKP_EXTENSIONS_VSCODE
   BKP_GIT_AND_BASH
   BKP_DCONF
   BKP_EXTENSIONS
   BKP_ANKI

}


RESTAURAR_CONFIG_UBUNTU (){
   echo -e "Insira o caminho onde está o arquivo .dconf a ser restaurado: "
   read resposta
   cd resposta
   dconf load / < minhasSettings.dconf
   echo -e "Restaurado com sucesso"
}


# download programas
DOWNLOADS (){
   SNAP vlc -y 
   SNAP code --classic -y
   SNAP pomotroid -y
   SNAP discord -y
   SNAP telegram-desktop -y
   SNAP gnome-system-monitor -y

   APT gparted -y
   APT obs-studio -y
   APT flameshot -y
   APT gnome-usage -y
   APT unrar -y
   APT google-chrome-stable -y
   APT gnome-tweaks


   sudo add-apt-repository ppa:openshot.developers/ppa
   sudo apt update
   APT openshot-qt python3-openshot

   wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
   sudo add-apt-repository 'deb https://typora.io/linux ./'
   sudo apt update
   APT typora

   echo -e "\n\033[1;30mBackup realizado com sucesso"
   echo -e "\n\033[1;36mAnki precisa ser instalado manualmente em: \n ->  https://docs.ankiweb.net/platform/linux/installing.html"
}


# .configuração intelijj e vscode e github
#compilar código fonte foxitReader
#instalar git
#draw.Io ou whismical
