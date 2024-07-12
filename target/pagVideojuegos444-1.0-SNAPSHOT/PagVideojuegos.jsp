<%-- 
    Document   : Consola
    Created on : 24 may. 2024, 6:06:31 p. m.
    Author     : USUARIO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="beans.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <link href="CSS/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <%
            List<Productos> lista = (ArrayList<Productos>) request.getAttribute("provid");
        %>
        <%@include file="header.jsp" %>

        <div class="container my-4">
            <h1 class="display-4 justify-content-center"> Videojuegos</h1>
            <div class="row">


                <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <ul class="list-group list-group-flush">Filtrado Por:
                        <li class="list-group-item">Marca</li>
                        <li class="list-group-item">Sub-Categoria</li>
                        <li class="list-group-item">Vendido Por</li>
                        <li class="list-group-item">Gama de Precios</li>

                    </ul>
                </div>



                <div class="col-sm-12 col-md-8 col-lg-8 col-xl-8 d-flex flex-wrap">
                    <%for (Productos x:lista) {%> 
                    <div class="card m-2" style="width: 12rem;">
                        <img src="Img/<%=x.getImg()%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%=x.getNompro()%></h5>
                            <p class="card-text"><%=x.getPrecio()%></p>
                            <a href="servlet?opc=4&cod=<%=x.getIdproducto()%>" class="btn btn-primary">AÑADIR A CARRITO</a>
                        </div>
                    </div>
                    <%}%> 

                    <div class="d-flex mt-4">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>

            </div>  
        </div>

        
         <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
                crossorigin="anonymous">
        </script>
    </body>
</html>
