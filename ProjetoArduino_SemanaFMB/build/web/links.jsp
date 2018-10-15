<%-- 
    Document   : links
    Created on : 12/10/2018, 09:03:34
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="scpt/estilo.css"/>
        <title>Links utilizados</title>
    </head>
    <body>
        <div class="container">
            <div class="cabecalho">
                <%@include file="topo.html" %>
            </div>
            <div class="cardapio">
                <%@include file="menu.jsp" %>
            </div>
            <div class="corpo">
                <h1 class="titulo">Links utilizados para realização do projeto</h1>
                Obs.:<br/>
                Todo este trabalho foi resultado de vários sites de pesquisa (não foi pego somente um e seguido até o fim) desta forma os links abaixo foram os principais utilizados.
                Todos os itens necessários para seu funcionamento estão no site citado.<br/>
                <h3 class="subtitulo">Sensor de humidade e temperatura</h3>
                O projeto tem um sensor de temperatura chamado DHT11 que mede temperaturas de 0 até 50 graus celsius e humidade do ar de 20% até 90% <br/>
                <a href="https://www.filipeflop.com/blog/temperatura-umidade-dht11-com-raspberry-pi/">https://www.filipeflop.com/blog/temperatura-umidade-dht11-com-raspberry-pi/</a><br/>
                <h3>Sensor de luz LDR (Fotoresistor)</h3>
                O projeto tem um sensor de luz LDR conhecido como fotoressistor, este e como um resistor porém o valor de sua resistência varia de acordo com a luz<br/>
                <a href="https://robozera.com/2017/01/05/sensor-de-luz-ldr-raspberry-pi/">https://robozera.com/2017/01/05/sensor-de-luz-ldr-raspberry-pi/</a><br/>
                <h3 class="subtitulo">Sensor de distância HC-SR04</h3>
                O projeto tem um sensor de distância HC-SR04 que mede distâncias entre 2 cm até 4 metros<br/>
                <a href="https://pimylifeup.com/raspberry-pi-distance-sensor/">https://pimylifeup.com/raspberry-pi-distance-sensor/</a><br/>
                <h3 class="subtitulo">Sensor de humidade do solo (que está detectando agua)</h3>
                O projeto utiliza um sensor de humidade do solo que no caso estamos detectando agua (retornando somente dois valores "0" ou "1")<br/>
                <a href="https://www.hackster.io/ben-eagan/raspberry-pi-automated-plant-watering-with-website-8af2dc#toc-hardware-setup-3">https://www.hackster.io/ben-eagan/raspberry-pi-automated-plant-watering-with-website-8af2dc#toc-hardware-setup-3</a><br/>
                <h3 class="subtitulo">Sensor de chamas</h3>
                O projeto utiliza um sensor de chamas (fogo) que também só retorna dois valores "0" ou "1".<br/>
                <a href="https://www.instructables.com/id/Flame-Sensor-Raspberry-Pi/">https://www.instructables.com/id/Flame-Sensor-Raspberry-Pi/</a><br/>
                <h3>Outros links</h3>
                Segue abaixo:<br/>
                <a href="https://www.youtube.com/watch?v=zr6J18K1wMw">Instalar sistema operacional no cartão microsd</a>
            </div>
        </div>
    </body>
</html>
