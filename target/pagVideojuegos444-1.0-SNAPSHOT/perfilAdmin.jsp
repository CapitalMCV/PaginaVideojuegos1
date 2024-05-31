<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Seleccionar Perfil</title>
        <link href="CSS/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/bootstrap/bootstrap-icons.min.css" rel="stylesheet" type="text/css"/>

        <style>


            .container {
                text-align: center;
                position: relative;
                z-index: 1;
                background-color: #1a1a1a
            }

            .background {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 0;
                filter: blur(10px);
            }

            .btn-rol{
                width: 220px;
                height: 280px;
                border: 2px #000;
                border-radius: 15px;
                margin-bottom: 20px;
                background: transparent;
                color: #1a1a1a;
            }

            .img-rol:hover{
                transform: scale(1.2);
            }


        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid mt-lg-5" >
            <div class="text-center">
                <h1 style="color: #1a1a1a">¿Con qué perfil desea ingresar?</h1>
            </div>
            <div>
                <div class="row text-center">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-2 mt-5">
                        <a href="VistaPrincipalAdmin.jsp">
                            <button class="btn-rol">
                                <div class="imagen-rol">
                                    <img src="images/fondo_perfil1.jpg" style="height: 150px; width: 150px" class="img-rol">
                                    <p style="margin-top: 15px;">Administrador</p>
                                </div>
                            </button>
                        </a>
                    </div>
                    <div class="col-sm-2 mt-5" style="margin-left: 20px;">
                        <a href="pagPrincipal.jsp">
                            <button class="btn-rol">
                                <div class="imagen-rol">
                                    <img src="images/fondo_perfil1.jpg" style="height: 150px; width: 150px" class="img-rol">
                                    <p style="margin-top: 15px;">Cliente</p>
                                </div>
                            </button>
                        </a>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </div>
        </div>      
    </body>
</html>
