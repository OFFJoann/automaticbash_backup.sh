import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import datetime

smtp_server = 'smtp.zoho.com'
smtp_port = 587  
smtp_username = 'copiadeseguridad@creacionesnadar.com'
smtp_password = 'Git_pel66'

dia_semana_actual = datetime.datetime.now().weekday()

if dia_semana_actual == 1: 
    destinatario = 'alopez@nadar.com.co; jduque@nadar.com.co; ccruz@nadar.com.co; digitalizador@nadar.com.co '
    copia = 'lvilla@nadar.com.co; doliveros@nadar.com.co'
    subject = 'COPIA DE SEGURIDAD SGSST, DIGITALIZADOR, MOLDES'
    carpeta = 'SGSST, DIGITALIZADOR, MOLDES'
elif dia_semana_actual == 2: 
    destinatario = 'alopez@nadar.com.co'
    copia = 'lvilla@nadar.com.co; jduque@nadar.com.co'
    subject = 'COPIA DE SEGURIDAD COMPARTIDA'
    carpeta = 'COMPARTIDA'
elif dia_semana_actual == 3: 
    destinatario = 'digitalizador@nadar.com.co'
    copia = 'doliveros@nadar.com.co; jduque@nadar.com.co'
    subject = 'COPIA DE SEGURIDAD DIGITALIZADOR'
    carpeta = 'DIGITALIZADOR'

msg = MIMEMultipart()
msg['From'] = 'copiadeseguridad@creacionesnadar.com'
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
