#!/bin/bash
echo $(date)
old=""
count=0
date=$(date +"%Y%m%d")

off() {
ifconfig enp2s0 down
}

for validation in $(ls /Destino/); do
	if [ $(($validation)) -eq $(($date)) ]; then
		sleep 2
		echo "La copia de seguridad ya fue realizada"
		echo "servidor fuera de red"
		echo "-----------------------------------------------"
		off
		exit
	fi
done
transfer() {
	for file in $(ls /Destino/); do
		if [ $count -eq 0 ]; then
			old=$file
		fi
		if [ $(($file)) -lt $(($old)) ]; then
			old=$file
		fi
		sum=$((count=$count+1))

	done
mkdir /Destino/$date
sleep 5

ssh_error=$(sshpass -p "password" scp -r -o ConnectTimeout=60 cliente@192.168.1.1:D:/COMPRIMIDO/img.7z /Destino/$date 2>&1)

if [ $? -eq 0 ]; then 
	echo "Copia de seguridad realizada con exito"
	rm -r /Destino/$old
else
	echo "Tienes un error en SSH, no se borrara ni se añadira nada"
	echo "Detalle: $ssh_error"
	rm -r /Destino/$date
fi
off
echo "Servidor fuera de red"
echo "-----------------------------------------------"
}
transfer

