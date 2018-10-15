<%-- 
    Document   : DHT
    Created on : 12/10/2018, 13:27:25
    Author     : Rodrigo
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.projeto.classes.Pega_dht"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="scpt/estilo.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="com.projeto.beam.DHT" %>
        <div class="container">
           <div class="cabecalho">
                <%@include file="topo.html"%>
            </div>
            <div class="cardapio">
                <%@include file="menu.jsp" %>
            </div>
            <div class="corpo">
                <h1 class="titulo">Ultimos dados lidos do sensor DHT</h1>
                <%
                    //SELECT * FROM arduino.luminosidade order by idluminosidade desc limit 10;
                    Pega_dht pegando=new Pega_dht();
                    ArrayList <DHT> lista =pegando.Pega_dados();
                    Iterator <DHT> vendo=lista.iterator();
                    
                    DHT ultimo=lista.get(0);
                %>
                <h3 class="subtitulo">Ultimo valor lido</h3>
                <h3 class="subtitulo">ID: <%=ultimo.getId() %> | Temperatura: <%=ultimo.getTemperatura() %> | Humidade: <%=ultimo.getUmidade() %> | Data e hora: <%=ultimo.getData_hora()%></h3>
                <table class="tabela">
                    <tr class="tabela">
                        <th class="tabela">ID</th>
                        <th class="tabela">Temperatura</th>
                        <th class="tabela">Humidade</th>
                        <th class="tabela">Data e hora</th>
                    </tr>
                    <%
                        while(vendo.hasNext()){
                            DHT dados=vendo.next();
                    %>
                    <tr class="tabela">
                        <td class="tabela">
                            <%=dados.getId()%>
                        </td>
                        <td class="tabela">
                            <%=dados.getTemperatura() %>º C
                        </td>
                        <td class="tabela">
                            <%=dados.getUmidade() %>%
                        </td>
                        <td class="tabela">
                            <%=dados.getData_hora() %>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
    </body>
</html>