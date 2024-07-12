<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <script src="js/sweetalert.min.js" type="text/javascript"></script>
        <style>
            .background{
                color: #636464;
            }
        </style>
    </head>
    <body>
    <center>
        
        <%@include file="header.jsp" %>
        <%
            Productos art = (Productos) request.getAttribute("dato");
        %>    
        <h1 class="mt-5 mb-5">Venta del producto <%=art.getNompro()%></h1>
        <form method="post" name="fr">
            <input type="hidden" name="opc" value="5">
            <input type="hidden" name="coda" value="<%=art.getIdproducto()%>">

            <table border="1" cellspacing="15" cellpadding="15">
                <tr><td rowspan="5">
                    <img src="Img/<%=art.getImg()%>.jpg" width="200" height="200">         
                    <td>Descripcion: <td><%=art.getNompro()%>
                <tr><td>Precio: <td><%=art.getPrecio()%>
                <tr><td class="text-danger">Quedan en stock <td class="text-danger"><%=art.getStock()%>
                <tr><td>Cantidad: <td><input name="cantidad">        
                <tr><td><a href="#" onclick="valida()" class="btn btn-info">Añadir al carrito</a>       
            </table>
        </form>
        <script>
            function valida() {
                st =<%=art.getStock()%>;
                can = Number(fr.cantidad.value)
                if (can > st) {
                    swal('stock no disponible', 'cambie la cantidad', 'success');
                    return;
                }
                fr.action = "servlet";
                fr.submit();
            }

        </script>          
    </center>   
</body>
</html>
