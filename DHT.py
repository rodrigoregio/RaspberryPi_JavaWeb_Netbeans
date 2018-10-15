#carrega bibliotecas
import Adafruit_DHT
import RPi.GPIO as GPIO
import time
import mysql.connector
from datetime import datetime
 
#definindo o tipo do sensor
sensor=Adafruit_DHT.DHT11
 
#Setando modo do GPIO
GPIO.setmode(GPIO.BOARD)
 
#setando pino do GPIO conectado o pino de dados do sensor DHT11
pino_sensor=25
 
#tratando conexao com mysql
con=mysql.connector.connect(host='192.168.0.110',user='boirod',password='Elmatader0',database='arduino')
cursor=con.cursor()
 
#Informacoes iniciais
print("*** Lendo os valores de temperatura e umidade");
 
while(1):
    #Fazendo leitura do sensor
    umid, temp=Adafruit_DHT.read_retry(sensor, pino_sensor);
    #Se a leitura estiver Ok, mostra os valores na tela
    if umid is not None and temp is not None:
        print("Temperatura = {0:0.1f} Umidade = {1:0.1f}n").format(temp,umid);    
        #Carregando data e hora atual do sistema
        data_atual=datetime.now()
        data_em_texto=data_atual.strftime('%d/%m/%Y %H:%M:%S')
        print(data_em_texto)
        print
        cursor.execute('INSERT INTO arduino.umidade_e_temperatura(umidade,temperatura,data_hora) VALUES (%s,%s,%s)',(umid,temp,data_em_texto))
        
        #Enviar dados para o banco de dados
        con.commit()
        time.sleep(30)
    else:
        #Mensagem de erro da comunicacao com o sensor
        print("Falha ao ler dados do sensor DHT11!!");
        print("Aguarde 30 segundos para nova leitura...");
