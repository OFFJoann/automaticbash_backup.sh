#!/bin/bash

old=""
count=0

# date cotrol variable
date=$(date +"%Y%m%d")


#swich power on and off
power() {
ifconfig ens33 up
ifconfig lo up
}

power

off() {
ifconfig ens33 down
ifconfig lo down
}

#transfer file
transfer() {
	rm -r /home/nas/system/$old
	mkdir /home/nas/system/$date
	sshpass -p "123" scp -r server@192.168.18.254:/home/server/Vol_1 /home/nas/system/$date > /home/nas/backup.log
}
transfer


#Validation if a backup has already been made to date
for validation in $(ls /home/nas/system); do
	if [ $count -eq 0 ]; then
		sum2=$((count=$count+1))
	fi
	if [ $(($validation)) -eq $(($date)) ]; do
		echo "today's backup has already been done"
		off
		exit
	fi	
done

#Older backup validation for deletion

for file in $(ls /home/nas/system); do
	if [ $count -eq 0 ]; then
		old=$file
	fi
	if [ $(($file)) -lt $(($old)) ]; then
		old=$file
	fi
	sum=$((count=$count+1)
transfer
done


echo "the backup is finished"
off
