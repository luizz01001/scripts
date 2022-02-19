#!/bin/bash

#script para tentativa de transferncia de zona dns.
#desenvolvido por @luizz01001.

if [[ $1 == "" ]]
then
	echo
	echo "erro de sintaxe: dominio deve ser especificado." 
	echo "exemplo de uso: ./zonetransfer.sh [dominio]"
	echo
else	
	for ns in $(host -t ns $1 | cut -d " " -f 4 | sed s'/.$//'g);
	do
		host -l -a $1 $ns;
	done
fi
