#!/bin/bash

SNAP() {
   sudo snap install $1 --classic -y
}

APT() {
   sudo apt install $1 -y
}

BKP_EXTENSIONS_VSCODE (){
   cd ~
   cp -r /home/$USER/.vscode/extensions Desktop/
}

BKP_GIT_AND_BASH(){ #bash,git,terminal
   cd ~
   cp .bashrc Desktop/
   cp .profile Desktop/
   cp .gitconfig Desktop/
}

BKP_DCONF(){ #ubuntu user configs
   cd ~
   dconf dump / > minhasSettings_$(date +%Y-%m-%d_%H-%M-%S).dconf
   cp minhasSettings.dconf Desktop/
}

BKP_EXTENSIONS_UBUNTU(){ 
   cd /home/$USER/.local/share/gnome-shell
   cp -r extensions/ Desktop/
}

BKP_ANKI(){
   cd /home/$USER/.local/share/
   cp -r Anki2/ Desktop/
}

BACKUPS_LOCAIS(){
   BKP_DCONF
   BKP_EXTENSIONS_VSCODE
   BKP_GIT_AND_BASH
   #BKP_EXTENSIONS_UBUNTU
   #nao funciona pq o nome extensions é 
   #igual da pasta do vscode
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
   SNAP vlc
   SNAP code
   SNAP pomotroid
   SNAP discord
   SNAP telegram-desktop
   SNAP gnome-system-monitor
   SNAP insomnia
   SNAP brave

   # espelhar tela android
   APT scrcpy
   
   # pulse effects
   flatpak install --user https://flathub.org/repo/appstream/com.github.wwmm.pulseeffects.flatpakref -y
   APT flatpak
   APT gparted
   APT obs-studio
   APT flameshot
   APT gnome-usage
   APT unrar
   APT git
   APT chrome-gnome-shell
   APT gnome-tweaks
   APT python3-pip
   APT parcellite
   APT dbeaver
   APT okular
   APT postgresql
   APT mpv


   # comunicação SSH
   APT openssh-server

   # fazer conexão ssh
   # sudo service ssh start
   # depois ir no nautilus e digitar ssh://ipDestino
   # inserir login e senha do computador de destino
   # liberar extensões no site gnome extensions

   # abrir vscode no menu de contexto
   wget -qO- https://raw.githubusercontent.com/harry-cpp/code-nautilus/master/install.sh | bash

   # pomotroid
   #wget https://github.com/Splode/pomotroid/releases/download/v0.13.0/pomotroid-0.13.0-linux.deb
   #sudo dpkg -i pomotroid-0.13.0-linux.deb

   # openshot
   sudo add-apt-repository ppa:openshot.developers/ppa
   sudo apt update
   APT openshot-qt python3-openshot

   # typora
   wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
   sudo add-apt-repository 'deb https://typora.io/linux ./'
   sudo apt update
   APT typora

   # anki
   wget https://github.com/ankitects/anki/releases/download/2.1.60/anki-2.1.60-linux-qt6.tar.zst
   sudo apt install libxcb-xinerama0
   tar xaf ./anki-2.1.60-linux-qt6.tar.zst
   cd anki-2.1.60-linux-qt6
   sudo ./install.sh

   # Node
   APT nodejs
   APT npm
   sudo npm install -g typescript
   sudo npm install -g ts-node


   echo -e "\n\033[1;30mBackup realizado com sucesso"
   echo -e "\n\033[1;36mPastas para pegar do backup: .local/share lá dentro pegar /icons, /aplications, /todosGnomes, /nautilus, /anki2 pegar tbm /config ver o que tem de importante e NAO pegar a do chrome"
   echo -e "\n\033[1;36mPOMOTROID precisa ser instalado manualmente em: \n ->  https://github.com/Splode/pomotroid/releases"
}

# chrome
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
APT google-chrome-stable -y

# para remover o chrome
# sudo apt-get remove google-chrome-stable

INTERFACE () {
   echo -e "\n1 - Criar backup locais\n2 - Restaurar configs ubuntu\n3 - Download programas ubuntu"
   read opcao
   if [ $opcao -eq 1 ]; then
      BACKUPS_LOCAIS
   elif [ $opcao -eq 2 ]; then
      RESTAURAR_CONFIG_UBUNTU
   elif [ $opcao -eq 3 ]; then
      echo -e "\n\033[1;36mSó utilize esse script depois que o ubuntu atualizar e reiniciar\ncom apt update e apt upgrade \033[1;32mOk?"
      read resposta
      DOWNLOADS
   else
      echo -e "\n\033[1;31mOpção inválida \033[1;32mTente novamente"
      INTERFACE
   fi
}

INTERFACE


