#tentando ler dados de sensor analogico no pino 8
#importando as bibliotecas
import RPi.GPIO as GPIO
import time
import mysql.connector
from datetime import datetime
 
#tratando conexao com mysql
con=mysql.connector.connect(host='192.168.0.110',user='boirod',password='Elmatader0',database='arduino')
cursor=con.cursor()
 
#dizendo o tipo de placa
GPIO.setmode(GPIO.BOARD)
#dizendo o numero do pino utilizado pelo sensor
pino_sensor=8
 
#setando pino na placa (dizendo qual e o pino do sensor)
GPIO.setup(pino_sensor,GPIO.IN)
 
#isto ira rodar infinitamente
while True:
    #imprimir na tela o valor do sensor
    print
    print GPIO.input(pino_sensor)
    #se for detectado chamas
    status=""
    if GPIO.input(pino_sensor) == 1:
        status="Agua detectada"
        print status
    else:
        status="Agua nao detectada"
        print status
    data_atual=datetime.now()
    data_em_texto=data_atual.strftime('%d/%m/%Y %H:%M:%S')
    print(data_em_texto)
    
    cursor.execute('INSERT INTO arduino.agua(status,data_hora) VALUES (%s,%s)',(status,data_em_texto))
    
    #Enviar dados para o banco de dados
    con.commit()
    #esperar 1 segundo
    time.sleep(30)
