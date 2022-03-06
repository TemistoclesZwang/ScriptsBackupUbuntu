#!/bin/bash
echo -e -n"\n\033[1;36mSó utilize esse script depois que o ubuntu atualizar e reiniciar\ncom apt update e apt upgrade \033[1;32mOk?"
read resposta


SNAP() {
   sudo snap install $1
}


APT() {
   sudo apt install $1
}


#comando para carregar dconf load / < /media/$USER/HD500/MagicRestaurador/minhasSettings.dconf
COPIAR_GIT_BASH(){ #bash,git
   cd ~
   cp .bashrc Desktop/
   cp .minhasSettings Desktop/
   cp .profile Desktop/
   cp .gitconfig Desktop/

}
COPIAR_DCONF(){ #dconf
   cd ~
   dconf dump / > minhasSettings.dconf
   cp minhasSettings.dconf Desktop/
}

EXTENSIONS(){ 
   cd /home/temis_zwang/.local/share/gnome-shell
   cp -r extensions/ Desktop/
}



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

sudo add-apt-repository universe -y && APT gnome-tweak-tool

wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt update
APT typora

#. instalar anki, draw.io 
# .backup anki
# .opção de exportar e importa confi ubuntu
# .configuração intelijj e vscode e github
#salvar o .bashrc da pasta pessoal
#salvar o gitconfig da pasta pessoal
#retirar os y
#colocar typora como snap
#colocar dash to dock
#colocar tweak tool
#colocar chrome
#foxitReade
#git
#draw.Io ou whismical
