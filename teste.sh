#!/bin/bash


SALVAR_CONFIG_UBUNTU (){ 
   echo -e -n"\n\033[1;36mO arquivo minhasSettings.dconf sera criado no \033[1;95mDESKTOP \033[1;32mLeve o .dconf para outro lugar,Ok?"
   read resposta
   cd home/temis_zwang/Desktop/scriptBackupUbuntu/
   dconf dump / > minhasSettings.dconf
}


RESTAURAR_CONFIG_UBUNTU (){
   echo -e "Insira o local para restaurar: "
   read resposta
   cd resposta
   dconf load / < minhasSettings.dconf
   echo -e "Restaurado com sucesso"
}

