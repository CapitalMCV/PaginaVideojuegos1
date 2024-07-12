<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*, java.util.*, dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>    
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="CSS/header.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/all.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

        <style>
            .background {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
                z-index: -1;
                filter: blur(5px);
                opacity: 2;
            }

            .background img {
                width: 100%;
                height: auto;
            }

            .login-container {
                margin-top: 80px;
                background-color: rgba(255, 255, 255, .9);
                padding: 30px;
                border-radius: 10px;
                text-align: center;
                display: flex;
                flex-direction: column;
                justify-content: center;
                width: 70px;
                height: 550px;
            }


            .btn-login {
                border: none;
                border-radius: 10px;
                padding: 2px;
                height: 40px;
                width: 100%;
                background: #f27324;
            }

            .container-1 {
                margin-top: 100px;
            }

            .main-input {
                border-radius: 0;
                border: none;
                border-bottom: 2px solid #000;
                outline: #000;
                outline-width: 2px;
                text-align: center;
                box-shadow: none;
                background: transparent;
            }

            .group {
                position: relative;
                margin-bottom: 45px;
            }

            .label-input {
                position: absolute;
                top: 10px;
                left: 0;
                font-size: 16px;
                color: #999;
                pointer-events: none;
                transition: .2s ease all;
            }

            .main-input:focus ~ .label-input, .main-input:valid ~ .label-input {
                top: -20px;
                font-size: 12px;
                color: #f27324;
            }



        </style>
    </head>
    <body>

        <%@include file="headerSecundario.jsp" %>
        <%
            String men = "";
            if (request.getAttribute("mensaje") != null) {
                men = (String) request.getAttribute("mensaje");
            }
            %> 
        <div class="container">
            <main>
                <div class="row justify-content-center">
                    <div class="col-md-6 mt-5 login-container">
                        <form action="controlCliente?opc=1" method="post">
                            <h3 class="text-center mb-4">Inicia sesión</h3>

                            <div class="group">
                                <input required="true" class="form-control main-input" type="text" id="username" name="username">
                                <label class="label-input" for="username">Username</label>
                            </div>
                            <div class="group">
                                <input required="true" class="form-control main-input" type="password" id="password" name="password">
                                <label class="label-input" for="password">Contraseña</label>
                            </div>
                            <button class="btn-login" name="submit">Login</button>
                            <p class="text-danger"><%=men%></p>
                            <p class="mt-3 text-center">¿No tienes una cuenta? <a href="registroCuenta.jsp" style="color: #f27324;">Crea una</a></p>
                        </form>
                    </div>
                </div>
            </main>
        </div>
        <div class="background">
            <img src="images/p3.jpg" alt="">
        </div>
    </body>
</html>
