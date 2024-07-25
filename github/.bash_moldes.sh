#!/bin/bash
echo $(date)
old=""
count=0
date=$(date +"%Y%m%d")

off() {
ifconfig enp2s0 down
}

for validation in $(ls /Raid/BK_MOLDES); do
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
	for file in $(ls /Raid/BK_MOLDES); do
		if [ $count -eq 0 ]; then
			old=$file
		fi
		if [ $(($file)) -lt $(($old)) ]; then
			old=$file
		fi
		sum=$((count=$count+1))

	done
mkdir /Raid/BK_MOLDES/$date
sleep 5

error_ssh=$(sshpass -p "trazo7896*#" scp -r -o ConnectTimeout=60 corte@192.168.7.199:C:/Users/corte/img.7z /Raid/BK_MOLDES/$date 2>&1)

if [ $? -eq 0 ]; then 
	echo "Copia de seguridad realizada con exito"
	rm -r /Raid/BK_MOLDES/$old
else
	echo "Tienes un error en SSH, no se borrara ni se añadira nada"
	echo "Detalle: $error_ssh"
	rm -r /Raid/BK_MOLDES/$date
fi
off
echo "servidor fuera de red"
echo "-----------------------------------------------"
}
transfer

