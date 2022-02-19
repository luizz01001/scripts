#!/bin/bash

#script com objetivo de listar diretorios
#desenvolvido por @luizz01001

if [[ $1 == "" ]]
then
	echo
	echo "erro: dominio deve ser especificado."
	echo "exemplo: ./p4thfind3r.sh [dominio]"
	echo
else
	echo "========================================================"
	echo
	echo "[*] Listando diretorios em $1..."
	echo
	for word in $(cat lista.txt);
	do
		status=$(curl -s -o /dev/null -H "User-agent: guess" -w "%{http_code}" http://$1/$word/) 
    #user-agent modificado para evitar bloqueios de IPS
		if [ $status == "200" ]
		then
			echo "Encontrado! http://$1/$word/"
		fi
	done
	echo
	echo "========================================================"
	echo "Fim da pesquisa."
fi
