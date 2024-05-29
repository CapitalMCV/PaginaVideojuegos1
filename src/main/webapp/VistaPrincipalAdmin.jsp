<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS/header.css" rel="stylesheet" type="text/css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/all.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

        <style>
            body {

                margin: 0;
                font-family: Arial, sans-serif;
                background: #1a1a1a;
            }

            .container-fluid {
                text-align: center;
                position: relative;
                z-index: 1;
                margin-top: 20px;
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

            .btn-item{
                width: 300px;
                height: 480px;
                border: 2px #000;
                border-radius: 20px;
                margin-bottom: 20px;
                background-color: #FEF9E7;
                color: #000;
            }

            .img-item:hover{
                transform: scale(1.2);
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-custom-purple">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><i class="fas fa-home"></i> Virtual Game<span class="sr-only">(current)</span></a>
                </li>
                <li>
                    <a class="nav-link text-right" href="">Admin</a>
                </li> 
                <li>
                    <a class="nav-link" href="./control?opc=4">Log out</a>
                </li> 
            </ul>
        </nav>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-sm-3 mt-5">
                    <button class="btn-item">
                        <div class="imagen-item">
                            <img src="" alt="imagen de productos" style="height: 300px; width: 200px" class="img-item">
                            <p style="margin-top: 15px; color: #000;">Productos</p>
                        </div>
                    </button>
                </div>
                <div class="col-sm-3 mt-5">
                    <button class="btn-item">
                        <div class="imagen-item">
                            <img src="" alt="imagen de productos" style="height: 300px; width: 200px" class="img-item">
                            <p style="margin-top: 15px;color: #000;">Usuarios</p>
                        </div>
                    </button>
                </div>
                <div class="col-sm-3 mt-5">
                    <button class="btn-item">
                        <div class="imagen-item">
                            <img src="" alt="imagen de productos" style="height: 300px; width: 200px" class="img-item">
                            <p style="margin-top: 15px;color: #000;">Reportes</p>
                        </div>
                    </button>
                </div> 
            </div>
        </div>
    </body>
</html>
