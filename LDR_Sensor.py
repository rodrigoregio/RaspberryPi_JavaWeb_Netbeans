#carregando bibliotecas
import RPi.GPIO as GPIO
import time
import mysql.connector
from datetime import datetime
 
#Setando modo do GPIO da placa Raspberry
GPIO.setmode(GPIO.BOARD)
 
#setando pino do sensor LDR
pino_ldr=7
 
#funcao para ler o LDR
def rc_time(pino_ldr):
    count=0
    #Output no pino para
    GPIO.setup(pino_ldr,GPIO.OUT)
    GPIO.output(pino_ldr,GPIO.LOW)
    time.sleep(0.1)
    #mudando o pino para INPUT
    GPIO.setup(pino_ldr,GPIO.IN)
    #Contar ate o pino ir para HIGH
    while (GPIO.input(pino_ldr) == GPIO.LOW):
        count+=1
    return count
    
#tratando conexao com mysql
con=mysql.connector.connect(host='192.168.0.110',user='boirod',password='Elmatader0',database='arduino')
cursor=con.cursor()
 
#Informacoes iniciais
print "*** Lendo os valores do LDR"
while(1):
#Lendo dados do sensor LDR
    print
    print("Lendo dado LDR")
    valorLDR=rc_time(pino_ldr)
    estado=""
    print(valorLDR)
    if valorLDR < 1500:
        estado="Esta claro"
        print estado
    else:
        estado="Esta escuro"
        print estado
    data_atual=datetime.now()
    data_em_texto=data_atual.strftime('%d/%m/%Y %H:%M:%S')
    print(data_em_texto)
        
    cursor.execute('INSERT INTO arduino.luminosidade(valor,estado,data_hora) VALUES (%s,%s,%s)',(valorLDR,estado,data_em_texto))
    
    con.commit()
    time.sleep(30)
 
#observacao: Se o LDR estiver escuro fica uns 7000 se estiver claro fica uns 94
