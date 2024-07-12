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
        <%@include file="headerSecundario.jsp" %>
        <div class="container d-flex justify-content-center align-items-center min-vh-100">
            <form action="" class="row my-3 bg-light p-2" id="marco-formulario-pago" style="width: 30rem;">
                
                <div class="col-12 my-3">
                    <h3 class="form-label text-center">
                        FINALIZAR COMPRA
                    </h3>
                </div>
                
                <div class="col-12 my-3">
                    <input class="form-control" placeholder="Numero de Tarjeta">
                </div>
                
                <div class="col-6 my-3">
                    <input class="form-control" placeholder="MM/AA">
                </div>
                <div class="col-6 my-3">
                    <input class="form-control" placeholder="CVV">
                </div>
                
                <div class="col-6 my-3">
                    <input class="form-control" placeholder="Nombre">
                </div>
                <div class="col-6 my-3">
                    <input class="form-control" placeholder="Apellido">
                </div>
                <div class="col-12 my-3">
                    <a href="servlet?opc=7" target="zona" class="btn btn-danger form-control">Pagar</a>
                </div>                
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
                crossorigin="anonymous">
        </script>
    </body>
</html>
