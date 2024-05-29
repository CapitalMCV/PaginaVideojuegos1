<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro</title>
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
            }

            .background img {
                width: 100%;
                height: auto;
                opacity: 0.9;
               
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

            .btn-registro {
                border: none;
                border-radius: 10px;
                padding: 10px 20px;
                background: #f27324;
                color: #000;
                width:  100%
            }

            .registro-container {
                margin-top: 100px;
                background-color: rgba(255, 255, 255, 0.9);
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.5); 
            }

        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-custom-purple">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><i class="fas fa-home"></i> Virtual Game<span class="sr-only">(current)</span></a>
                </li>

            </ul>
        </nav>

        <div class="container">
            <main>
                <div class="row justify-content-center">
                    <div class="col-md-6 registro-container">
                        <form action="" method="post" class="registro">
                            <h3 class="text-center mb-4">Regístrate</h3>
                            <div class="row">
                                <div class="col">
                                    <div class="group">
                                        <input required="true" class="form-control main-input" type="text" id="username">
                                        <label class="label-input" for="username">Nombre de usuario</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="group">
                                        <input required="true" class="form-control main-input" type="text" id="nombres">
                                        <label class="label-input" for="nombres">Nombres</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="group">
                                        <input required="true" class="form-control main-input" type="text" id="apellidos">
                                        <label class="label-input" for="apellidos">Apellidos</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="group">
                                        <input required="true" class="form-control main-input" type="text" id="dni">
                                        <label class="label-input" for="dni">Dni</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="group">
                                        <input required="true" class="form-control main-input" type="password" id="password">
                                        <label class="label-input" for="password">Contraseña</label>
                                    </div>
                                </div>
                            </div>
                            <button class="btn-registro">
                                Registrarse
                            </button>
                            <p class="mt-3 text-center">¿Ya tienes una cuenta? <a href="LoginPrincipal.jsp" style="color: #f27324;">Inicia sesión</a></p>
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
