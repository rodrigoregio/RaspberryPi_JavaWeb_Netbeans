<%-- 
    Document   : LDR
    Created on : 12/10/2018, 09:55:25
    Author     : Rodrigo
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.projeto.classes.Pega_ldr"%>
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
        <%@page import="com.projeto.beam.LDR" %>
        <div class="container">
           <div class="cabecalho">
                <%@include file="topo.html"%>
            </div>
            <div class="cardapio">
                <%@include file="menu.jsp" %>
            </div>
            <div class="corpo">
                <h1 class="titulo">Ultimos dados lidos do sensor LDR</h1>
                <%
                    //SELECT * FROM arduino.luminosidade order by idluminosidade desc limit 10;
                    Pega_ldr pegando=new Pega_ldr();
                    ArrayList <LDR> lista =pegando.Pega_dados();
                    Iterator <LDR> vendo=lista.iterator();
                    
                    LDR ultimo=lista.get(0);
                %>
                <h3 class="subtitulo">Ultimo valor lido</h3>
                <h3 class="subtitulo">ID: <%=ultimo.getIdLuminosidade()%> | Valor: <%=ultimo.getValor()%> | Estado: <%=ultimo.getEstado()%> | Data e hora: <%=ultimo.getData_hora()%></h3>
                <table class="tabela">
                    <tr class="tabela">
                        <th class="tabela">ID</th>
                        <th class="tabela">Valor</th>
                        <th class="tabela">Estado</th>
                        <th class="tabela">Data e hora</th>
                    </tr>
                    <%
                        while(vendo.hasNext()){
                            LDR dados=vendo.next();
                    %>
                    <tr class="tabela">
                        <td class="tabela">
                            <%=dados.getIdLuminosidade()%>
                        </td>
                        <td class="tabela">
                            <%=dados.getValor()%>
                        </td>
                        <td class="tabela">
                            <%=dados.getEstado()%>
                        </td>
                        <td class="tabela">
                            <%=dados.getData_hora()%>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
    </body>
</html>