<%-- 
    Document   : DHT
    Created on : 12/10/2018, 18:29:25
    Author     : Rodrigo
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.projeto.classes.Pega_hcsr04"%>
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
        <%@page import="com.projeto.beam.HCSR04" %>
        <div class="container">
           <div class="cabecalho">
                <%@include file="topo.html"%>
            </div>
            <div class="cardapio">
                <%@include file="menu.jsp" %>
            </div>
            <div class="corpo">
                <h1 class="titulo">Ultimos dados lidos do sensor HCSR04</h1>
                <%
                    //SELECT * FROM arduino.luminosidade order by idluminosidade desc limit 10;
                    Pega_hcsr04 pegando=new Pega_hcsr04();
                    ArrayList <HCSR04> lista =pegando.Pega_dados();
                    Iterator <HCSR04> vendo=lista.iterator();
                    
                    HCSR04 ultimo=lista.get(0);
                %>
                <h3 class="subtitulo">Ultimo valor lido</h3>
                <h3 class="subtitulo">ID: <%=ultimo.getIdDistancia()%> | Temperatura: <%=ultimo.getValor() %>cm | Data e hora: <%=ultimo.getData_hora()%></h3>
                <table class="tabela">
                    <tr class="tabela">
                        <th class="tabela">ID</th>
                        <th class="tabela">Distancia</th>
                        <th class="tabela">Data e hora</th>
                    </tr>
                    <%
                        while(vendo.hasNext()){
                            HCSR04 dados=vendo.next();
                    %>
                    <tr class="tabela">
                        <td class="tabela">
                            <%= dados.getIdDistancia()%>
                        </td>
                        <td class="tabela">
                            <%= dados.getValor() %>cm
                        </td>
                        <td class="tabela">
                            <%= dados.getData_hora() %>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
    </body>
</html>