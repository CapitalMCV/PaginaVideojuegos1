
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <center>
        
        <%
          HttpSession ses=request.getSession();
          List<Compra> lista=(ArrayList<Compra>)ses.getAttribute("canasta");
        %> 
        <%@include file="headerSecundario.jsp" %>
        <h1>Confirma compra</h1>
        <a href="controlCliente?opc=9" target="zona" class="btn btn-success">Aceptar</a>
        <a href="" class="btn btn-success">Cancelar compra</a>
        
        <table class="table table-hover">
            <thead>
                <tr class="text-white bg-dark">
                    <th>Codigo<th>Descripcion<th>Precio<th>Cantidad<th>Total
            </thead>    
             <%double sm=0;
             for(Compra x:lista){
             out.print("<tr><td>"+x.getIdproducto()+"<td>"+x.getNompro()+"<td>"+
             x.getPrecio()+"<td>"+x.getCantidad()+"<td>"+x.total()+"</tr>");
                 sm +=x.total();
                 }
             ses.setAttribute("total", sm);
             %>
             <tr><td colspan="4">Total compra <td><%=sm%>
            
        </table>
             <iframe name="zona" height="400" width="400"></iframe>     
             <a href="pagPrincipal.jsp" class="btn btn-success">Otra Compra</a>         
    </center>   
    </body>
</html>
