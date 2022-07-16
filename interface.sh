#!/bin/bash
source script_V2.sh


INTERFACE () {
   echo -e "\n1 - Criar backup locais\n2 - Restaurar configs ubuntu\
   \n3 - Download programas ubuntu"
   read opcao
   if [ $opcao -eq 1 ]; then
      BACKUPS_LOCAIS
   elif [ $opcao -eq 2 ]; then
      RESTAURAR_CONFIG_UBUNTU
   elif [ $opcao -eq 3 ]; then
      echo -e -n"\n\033[1;36mSó utilize esse script depois 
      que o ubuntu atualizar e reiniciar\ncom apt update e apt upgrade \033[1;32mOk?"
      read resposta
      DOWNLOADS
   else
      echo -e "\n\033[1;31mOpção inválida \033[1;32mTente novamente"
      INTERFACE
   fi
}

INTERFACE
