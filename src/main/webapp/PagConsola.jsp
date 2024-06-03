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
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
        List<Productos> lista=(ArrayList<Productos>)request.getAttribute("procon");
        %>
        
        <nav class="navbar navbar-expand-lg bg-dark">
            <div class="container-fluid" >

                <a class="navbar-brand" href="#" id="cabecera-titulo">VIRTUAL GAME</a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link" aria-current="page" href="PagConsola.jsp" id="cabecera">CONSOLA</a>
                        <a class="nav-link" href="#" id="PagJuguetes.jsp">JUGUETES</a>
                        <a class="nav-link" href="PagVideojuegos.jsp" id="cabecera">VIDEOJUEGOS</a>
                    </div>
                </div>

                <div class="d-flex" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link" aria-current="page" href="#">
                            <img src="Img/logo-sin-foto.png" alt="Bootstrap" width="30" height="24">
                        </a>
                        <a class="nav-link" href="#">
                            <img src="Img/logo-sin-foto.png" alt="Bootstrap" width="30" height="24">
                        </a>
                        <a class="nav-link" href="#">
                            <img src="Img/logo-sin-foto.png" alt="Bootstrap" width="30" height="24">
                        </a>
                    </div>
                </div>

            </div>
        </nav>

        <div class="container my-4">
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
                    <div class="card m-2" style="width: 10rem;">
                        <img src="Img/<%=x.getImg()%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%=x.getNompro()%></h5>
                            <p class="card-text"><%=x.getPrecio()%></p>
                            <a href="#" class="btn btn-primary">AÑADIR A CARRITO</a>
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

        <nav class="navbar navbar-expand-lg bg-dark">
            <div class="card text-center container-fluid" id="div-transparencia">
                <div class="card_header">
                    <p class="text-white">
                        Aquí encontrarás información sobre nosotros
                    </p>
                </div>
                <div class="card-body" id="div-transparencia">
                    <div class="container d-flex justify-content-center" id="navbarNavAltMarkup">
                        <div class="card text-white mx-5" id="footer-bg-img" style="width: 7rem;">
                            <img src="Img/whatsapp.png" class="card-img-top mx-auto" style="width: 3rem;">
                            <div class="card-body" style="width: 7rem">
                                <h5 class="card-title fs-6"">Whatsapp</h5>
                            </div>
                        </div>
                        <div class="card text-white mx-5" id="footer-bg-img" style="width: 7rem;">
                            <img src="Img/facebook.png" class="card-img-top mx-auto" style="width: 3rem;">
                            <div class="card-body" style="width: 7rem;">
                                <h5 class="card-title fs-6">Facebook</h5>
                            </div>
                        </div>
                        <div class="card text-white mx-5" id="footer-bg-img" style="width: 7rem;">
                            <img src="Img/social.png" class="card-img-top mx-auto" style="width: 3rem;">
                            <div class="card-body" style="width: 7rem;">
                                <h5 class="card-title fs-6">Instagram</h5>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-footer" id="div-transparencia">
                    <p class="text-white">
                        @CopyrRight
                    </p>
                </div>
            </div>
        </nav>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
                crossorigin="anonymous">
        </script>
    </body>
</html>
