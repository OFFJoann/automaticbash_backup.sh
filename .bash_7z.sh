#!/bin/bash
echo "*BACKUP*"
echo $(date)

IP_Origen="192.168.1.1"
Usuario="cliente"
PSS="password"
Comprimir="C:/Users/$Usuario/7-Zip/7zG a -bd -r -t7z -y D:/COMPRIMIDO/img.7z C:/compartida"

error=$(sshpass -p "$PSS" ssh $Usuario@$IP_Origen "cmd /c del /F D:\COMPRIMIDO\img.7z" 2>&1)

if [ $? -eq 0 ]; then
	echo "Se Elimino comprimido"
	sshpass -p "$PSS" ssh $Usuario@$IP_Origen $Comprimir
else
	echo "Error"
	echo "Detalle: $error"
fi


