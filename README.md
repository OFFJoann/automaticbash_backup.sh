# automaticbash_backup_au in .bash

¿What is it for and how to make it work?

# What is it for
* perform backups with automated tasks in linux with crontab
* una forma rapida, de forma segura y silenciosa de realizar bakups completos con sus respectivos logs en tu escritorio
* delete the oldest backup and create a new one

# how to make it work
* you must store on the Qnap NAS 
* change the value of the routes where the backup is on the server and the route where you will save the information within the Nas
* Create a crontab task to run whenever you want
* remember to put your date format like this 10052023 without a sidebar or anything, like this the number followed

# to run manuallys
* go to the file path
* execute with ./ main.sh
* To add the crontab task you must type crontab -e in the console
* | * * * * * ./ main.sh   A format like this will appear, in the asterisks, you put the days, hours, etc.