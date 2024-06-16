<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Virtual Game</title>
        <link href="CSS/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/bootstrap/bootstrap-icons.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/principal.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid text-white" id="container-video">
            <video class="miVideo" autoplay loop muted>
                <source src="images/video3.mp4" type="video/mp4">
                Tu navegador no soporta el elemento de video.
            </video>
            <div class="container-banner">
                <p>Tienda de videojuegos, consolas y juguetes</p>
                <a href="#nosotros">
                    <button class="btn-about" id="btn-nosotros">Conócenos aquí</button>
                </a>
            </div>
        </div>

        <!--parte de los botones de categoria-->
        <div class="container-fluid mt-3" id="categories">
            <div class="row justify-content-center text-center">
                <div class="col-sm-12 col-md-6 col-lg-4 col-xl-4 mb-4">
                    <div class="category-container">
                        <button class="category-button">
                            <a href="servlet?opc=2&idcat=CAT02">
                                <div class="image-container">
                                    <img src="images/consolas.jpeg" alt="">
                                    <div class="gradient-overlay"></div>
                                </div>
                                <p>CONSOLAS</p>
                            </a>
                        </button>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-4 col-xl-4 mb-4">
                    <div class="category-container">
                        <button class="category-button">
                            <a href="servlet?opc=3&idcat=CAT03">
                                <div class="image-container">
                                    <img src="images/videojuegos.jpg" alt="">
                                    <div class="gradient-overlay"></div>
                                </div>
                                <p>VIDEOJUEGOS</p>
                            </a>
                        </button>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-4 col-xl-4 mb-4">
                    <div class="category-container">
                        <button class="category-button">
                            <a href="servlet?opc=1&idcat=CAT01">
                                <div class="image-container">
                                    <img src="images/juguetes.jpg" alt="">
                                    <div class="gradient-overlay"></div>
                                </div>
                                <p>JUGUETES</p>
                            </a>
                        </button>
                    </div>
                </div>
            </div>
        </div>


        <div class="container justify-content-center text-center mt-5 mb-5" id="nosotros">
            <p>Acerca de</p>
            <h1 class="display-4 pb-2"> Virtual Game</h1>

            <div class="row">
                <div class="col-sm-0 col-md-2 col-lg-2 col-xl-2"></div>
                <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8">
                    <p>
                        En Virtual Game, somos apasionados por los videojuegos. Desde los últimos lanzamientos en consolas y 
                        juegos hasta los clásicos que todos aman, ofrecemos una amplia variedad de productos para jugadores de todas
                        las edades. Nuestro objetivo es brindar una experiencia de compra excepcional, con un servicio al cliente de 
                        primera y un entorno donde los entusiastas de los videojuegos pueden encontrar todo lo que necesitan. 
                        ¡Ven y descubre tu próxima aventura con nosotros!
                    </p>
                    <img class="img-fluid mt-4" style="border-radius: 10px; height: auto; width: 50% " src="images/fondo_tienda.jpg" alt=""/>
                </div>
                <div class="col-sm-0 col-md-2 col-lg-2 col-xl-2"></div>
            </div>    
        </div>



        <div class="container-fluid bg-dark mt-5 justify-content-center text-center text-white">
            <div class="row pt-4">
                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                    <img src="images/precio-bajo.png" alt=""/>
                    <p style="font-weight: bold">Precios bajos</p>
                    <p>Precio accesibles</p>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                    <img src="images/marketing.png" alt=""/>
                    <p style="font-weight: bold">Compra segura</p>
                    <p>Protegemos tu información</p>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                    <img src="images/insignia-de-escudo.png" alt=""/>
                    <p style="font-weight: bold">Muchas promociones</p>
                    <p>Protegemos tu información</p>
                </div>
            </div>
        </div>

        <div class="container-fluid justify-content-center ">
            <div class="row mt-5 align-items-center">
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 text-center">
                    <h1 class="display-6">Contáctanos</h1>
                    <p class="mt-4">
                        Dirección:
                    </p>
                    <p>
                        Correo:
                    </p>
                    <p>
                        Teléfono:
                    </p>
                    <p>
                        Horario de atención: L-S 10:00 am a 10:00 pm
                    </p>
                    <a>
                        <i class="bi bi-instagram"></i>
                    </a>
                    <a>
                        <i class="bi bi-facebook"></i>
                    </a>  
                    <a>
                        <i class="bi bi-discord"></i>
                    </a>    
                </div>
                <div class="col-sm-12 col-md-12 col-lg-5 col-xl-5 mb-2" id="registro">
                    <form id="registro-form">
                        <h2 class="text-center">Registrate aquí</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                <label>Username:</label>
                                <input required="true" class="txt_registro" type="text" name="user">
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                <label>Nombres:</label>
                                <input required="true" class="txt_registro" type="text" name="nom">                       
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                <label>Apellidos:</label>
                                <input required="true" class="txt_registro" type="text" name="ape">
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                <label>Dni:</label>
                                <input required="true" class="txt_registro" type="text" name="dni">                       
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-4">
                                <label>Contraseña:</label>
                                <input required="true" class="txt_registro" type="password" name="pass">                       
                            </div>
                        </div>
                        <div class="col-sm-12 justify-content-center text-center">
                            <button type="submit" class="btn-registrar">Registrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>


        <a href="https://wa.me/1234567890" class="whatsapp" target="_blank"></a>
        <script src="CSS/bootstrap/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="js/script.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
