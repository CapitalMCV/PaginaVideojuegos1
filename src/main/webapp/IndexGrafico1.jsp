<%-- 
    Document   : IndexGrafico1
    Created on : 31 may. 2024, 16:33:39
    Author     : Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Ventas Totales al mes por año</h1>
        <form action="grafico1.jsp" target="zona">
            Ingrese año: <input name="tan">
            <input type="submit">
        </form>
        <br>
        <iframe name="zona" width="100%" height="500"></iframe>
    </body>
</html>
