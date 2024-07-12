<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*, java.util.*, dao.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="CSS/header.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg bg-dark">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="pagPrincipal.jsp">VIRTUAL GAME</a>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <ul class="navbar-nav justify-content-center">
                        <li class="nav-item">
                            <a class="nav-link active text-white" aria-current="page" href="#">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="servlet?opc=3&idcat=CAT03">Videojuegos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="servlet?opc=2&idcat=CAT02">Consolas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="servlet?opc=1&idcat=CAT01">Juguetes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Nosotros</a>
                        </li>
                    </ul>
                    <form class="justify-content-end" id="container-1">
                        <%
                            HttpSession ses = request.getSession(false);
                            if (session != null && session.getAttribute("username") != null) {
                                String nombreUsuario = (String) session.getAttribute("username");
                        %>
                            <span class="text-white">Hola, <%= nombreUsuario %></span>
                            <a class="" href="controlCliente?opc=8">Cerrar sesión</a>
                        <% 
                            } else {
                        %>
                            <a class="btn btn-outline-light" href="LoginPrincipal.jsp">Login</a>
                            <a class="btn btn-outline-light" href="registroCuenta.jsp" id="btn-registro">Registro</a>
                        <% 
                            }
                        %>
                    </form>
                </div>
            </div>
        </nav>
    </header>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
