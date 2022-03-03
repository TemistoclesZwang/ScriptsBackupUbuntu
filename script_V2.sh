#!/bin/bash
echo -e -n"\n\033[1;36mSó utilize esse script depois que o ubuntu atualizar e reiniciar\ncom apt update e apt upgrade \033[1;32mOk?"
read resposta


SNAP() {
   sudo snap install $1
}


APT() {
   sudo apt install $1
}


#Utilize esse comando para exportar cd ~ dconf dump / > minhasSettings.dconf
CONFIGS_UBUNTU (){ 
   echo -e -n"\n\033[1;36mCertifique-se de que seu HD de backup \033[1;95mestá montado \033[1;32mOk?"
   read resposta
   cd ~
   dconf load / < /media/$USER/HD500/MagicRestaurador/minhasSettings.dconf
}

GIT_ALIAS_RST(){
   #!digitar manualmente os comandos perdidos 
}


EXTENSIONS_RST(){ 
   cp /media/$USER/HD500/MagicRestaurador/extensions/ .local/share/gnome-shell/extensions/
}

EXTENSIONS_RST #restaura as extensões

CONFIGS_UBUNTU #Restaurar atalhos de teclado,tamanho fonte, configurações terminal, etc

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
