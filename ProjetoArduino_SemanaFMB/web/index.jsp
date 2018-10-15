<%-- 
    Document   : index
    Created on : 11/10/2018, 16:15:04
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="scpt/estilo.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
           <div class="cabecalho">
                <%@include file="topo.html"%>
            </div>
            <div class="cardapio">
                <%@include file="menu.jsp" %>
            </div>
            <div class="corpo">
                <h1 class="titulo">Sejam bem vindos á Semana de Cultura e Tecnologia FMB</h1>
                <h3 class="subtitulo">Monitoramento de dados com Raspberry Pi <!-- 3 model B--></h3>
                <p>
                    Este é um projeto demonstrando o monitoramento de dados com o RaspberryPi para coleta de dados. E outro computador para armazenar os dados e mostrar como página web<br/>
                    <b>Clique nos links ao lado para verificar os ultimos dados recebidos.</b><br/>
                    Itens utilizados:<br/><br/>
                    Raspberry Pi 3 Model B<br/>
                    <img class="imagemTexto" src="IMAGENS/rasp.jpg"/><br/>
                    Cartão de memória<br/>
                    <img class="imagemTexto" src="IMAGENS/microsd.jpg"/><br/>
                    Sensor de temperatura<br/>
                    <img class="imagemTexto" src="IMAGENS/dht-11.png"/><br/>
                    Sensor de luminosidade LDR<br/>
                    <img class="imagemTexto" src="IMAGENS/ldr.jpg"/><br/>
                    Sensor de distância Ultrasonico<br/>
                    <img class="imagemTexto" src="IMAGENS/HC-SR04.jpg"/><br/>
                    Sensor de chamas<br/>
                    <img class="imagemTexto" src="IMAGENS/flame.jpg"/><br/>
                    Sensor de umidade de solo<br/>
                    <img class="imagemTexto" src="IMAGENS/moisture.jpg"/><br/>
                    Fios Jumpers tantos machos quanto femeas (em quantidades diferentes)<br/>
                    <img class="imagemTexto" src="IMAGENS/jumper.jpg"/><br/>
                    Resistores de tamanhos variados de acordo com a página de links dos projetos<br/>
                    <img class="imagemTexto" src="IMAGENS/resistor.jpg"/><br/>
                </p>
            </div>
        </div>
    </body>
</html>
