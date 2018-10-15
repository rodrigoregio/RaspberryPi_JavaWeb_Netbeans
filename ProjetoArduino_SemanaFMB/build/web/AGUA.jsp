<%-- 
    Document   : AGUA
    Created on : 13/10/2018, 06:57:51
    Author     : Rodrigo
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.projeto.classes.Pega_aguas"%>
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
        <%@page import="com.projeto.beam.Agua" %>
        <div class="container">
           <div class="cabecalho">
                <%@include file="topo.html"%>
            </div>
            <div class="cardapio">
                <%@include file="menu.jsp" %>
            </div>
            <div class="corpo">
                <h1 class="titulo">Ultimos dados lidos do sensor de Agua (Moisture)</h1>
                <%
                    //SELECT * FROM arduino.luminosidade order by idluminosidade desc limit 10;
                    Pega_aguas pegando=new Pega_aguas();
                    ArrayList <Agua> lista =pegando.Pega_dados();
                    Iterator <Agua> vendo=lista.iterator();
                    
                    Agua ultimo=lista.get(0);
                %>
                <h3 class="subtitulo">Ultimo valor lido</h3>
                <h3 class="subtitulo">ID: <%=ultimo.getIdAgua() %> | Status: <%=ultimo.getStatus() %> |  Data e hora: <%=ultimo.getData_hora()%></h3>
                <table class="tabela">
                    <tr class="tabela">
                        <th class="tabela">ID</th>
                        <th class="tabela">Status</th>
                        <th class="tabela">Data e hora</th>
                    </tr>
                    <%
                        while(vendo.hasNext()){
                            Agua dados=vendo.next();
                    %>
                    <tr class="tabela">
                        <td class="tabela">
                            <%=dados.getIdAgua()%>
                        </td>
                        <td class="tabela">
                            <%=dados.getStatus() %>
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