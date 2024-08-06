import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import datetime

smtp_server = 'smtp.mail.com'
smtp_port = serverport  
smtp_username = 'mail@domain.com'
smtp_password = 'Password'

dia_semana_actual = datetime.datetime.now().weekday()

if dia_semana_actual == 1: 
    destinatario = 'mail1@domain.com; mail2@domain.com; mail3@domain.com; mail4@domain.com '
    copia = 'copymail@domain.com; copy2mail@domain.com'
    subject = 'COPIA DE SEGURIDAD SGSST, DIGITALIZADOR, MOLDES'
    carpeta = 'SGSST, DIGITALIZADOR, MOLDES'
elif dia_semana_actual == 2: 
    destinatario = 'mail@domain.com'
    copia = 'mail@domain.com; mail@domain.com'
    subject = 'COPIA DE SEGURIDAD COMPARTIDA'
    carpeta = 'COMPARTIDA'
elif dia_semana_actual == 3: 
    destinatario = 'mail@domain.com'
    copia = 'mail@domain.com; mail@domain.com'
    subject = 'COPIA DE SEGURIDAD DIGITALIZADOR'
    carpeta = 'DIGITALIZADOR'

msg = MIMEMultipart()
msg['From'] = 'cmail@domain.com'
msg['To'] = destinatario
msg['Subject'] = subject
msg['CC'] = copia


body = """
Buenos días,

La copia de seguridad de la carpeta '{}' se realizara el día de hoy, por favor no reinicies ni apagues tu computador en todo el día.

ATT:Servidor de backups
""".format(carpeta)
msg.attach(MIMEText(body, 'plain'))

server = smtplib.SMTP(smtp_server, smtp_port)
server.starttls() 
server.login(smtp_username, smtp_password)

server.send_message(msg)

server.quit()
