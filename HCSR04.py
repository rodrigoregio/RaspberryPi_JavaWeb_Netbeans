#Foram conectados na raspberry da seguinte forma: echo pin35 GPIO 24 : Trig  pin37 GPIO 25
import RPi.GPIO as GPIO
import time
import mysql.connector
from datetime import datetime
 
#tratando conexao com mysql
con=mysql.connector.connect(host='192.168.0.110',user='boirod',password='Elmatader0',database='arduino')
cursor=con.cursor()
 
while(1):
    try:
        GPIO.setmode(GPIO.BOARD)
        pino_trig=37
        pino_echo=35
    
        GPIO.setup(pino_trig,GPIO.OUT)
        GPIO.setup(pino_echo,GPIO.IN)
    
        GPIO.output(pino_trig,GPIO.LOW)
        print
        GPIO.output(pino_trig,GPIO.HIGH)
        time.sleep(0.00001)
        GPIO.output(pino_trig,GPIO.LOW)
    
        while GPIO.input(pino_echo) == 0:
            pulse_start_time=time.time()
        while GPIO.input(pino_echo) == 1:
            pulse_end_time=time.time()
        pulse_duracao=pulse_end_time-pulse_start_time
        distance=round(pulse_duracao*17150,2)
        print "Distancia: ",distance," cm"
        data_atual=datetime.now()
        data_em_texto=data_atual.strftime('%d/%m/%Y %H:%M:%S')
        print(data_em_texto)
        
        cursor.execute('INSERT INTO arduino.distancias(valor,data_hora) VALUES (%s,%s)',(distance,data_em_texto))
        
        #Enviar dados para o banco de dados
        con.commit()
        
    finally:
        GPIO.cleanup()
    time.sleep(30)
