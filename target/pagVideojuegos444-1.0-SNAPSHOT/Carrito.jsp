<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/bootstrap/bootstrap-icons.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .btn-danger {
                text-align: right;
            }

            .fixed-height-card {
                height: 90vh;
                overflow-y: auto;
            }

            .btn-editar{
                margin-top: 3px;
                margin-right: 3px;
                background: transparent;
                border: none;
                color: #ff9900;
            }

        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-7 col-divider">
                    <div class="card-body fixed-height-card">
                        <div class="row">
                            <div class="mb-3 text-right">
                                <button class="btn btn-info"><i class="bi bi-pen"></i>
                                    Editar </button>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card text-bg-dark" style="max-width: 18rem;">
                                    <div class="card-header">Item 1</div>
                                    <div class="card-body">
                                        <h5 class="card-title">Dark card title</h5>
                                        <p class="card-text">e up the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card text-bg-dark" style="max-width: 18rem;">
                                    <div class="card-header">Item 2</div>
                                    <div class="card-body">
                                        <h5 class="card-title">Dark card title</h5>
                                        <p class="card-text">e up the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card text-bg-dark" style="max-width: 18rem;">
                                    <div class="card-header">Item 3</div>
                                    <div class="card-body">
                                        <h5 class="card-title">Dark card title</h5>
                                        <p class="card-text">e up the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card text-bg-dark" style="max-width: 18rem;">
                                    <div class="card-header">Item 4</div>
                                    <div class="card-body">
                                        <h5 class="card-title">Dark card title</h5>
                                        <p class="card-text">e up the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card text-bg-dark" style="max-width: 18rem;">
                                    <div class="card-header">Item 5</div>
                                    <div class="card-body">
                                        <h5 class="card-title">Dark card title</h5>
                                        <p class="card-text">e up the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card text-bg-dark" style="max-width: 18rem;">
                                    <div class="card-header">Item 6</div>
                                    <div class="card-body">
                                        <h5 class="card-title">Dark card title</h5>
                                        <p class="card-text">e up the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card text-bg-dark" style="max-width: 18rem;">
                                    <div class="card-header">Item 7</div>
                                    <div class="card-body">
                                        <h5 class="card-title">Dark card title</h5>
                                        <p class="card-text">e up the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card text-bg-dark" style="max-width: 18rem;">
                                    <div class="card-header">Item 8</div>
                                    <div class="card-body">
                                        <h5 class="card-title">Dark card title</h5>
                                        <p class="card-text">e up the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card text-bg-dark" style="max-width: 18rem;">
                                    <div class="card-header">Item 9</div>
                                    <div class="card-body">
                                        <h5 class="card-title">Dark card title</h5>
                                        <p class="card-text">e up the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card text-bg-dark" style="max-width: 18rem;">
                                    <div class="card-header">Item 10</div>
                                    <div class="card-body">
                                        <h5 class="card-title">Dark card title</h5>
                                        <p class="card-text">e up the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card text-bg-dark" style="max-width: 18rem;">
                                    <div class="card-header">Item 11</div>
                                    <div class="card-body">
                                        <h5 class="card-title">Dark card title</h5>
                                        <p class="card-text">e up the bulk of the card's content.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="row">
                        <div class="mb-3 mt-3 text-right">
                            <button class="btn-editar"><i class="bi bi-trash-fill"></i>
                                Eliminar </button>
                        </div>
                        <div>
                            <table class="table table-hover">
                                <thead>
                                    <tr class="text-black">
                                        <th>Cantidad<th><th>Producto<th>Precio<th><td>Accion     
                                </thead>  

                            </table> 
                        </div>
                        <div class="text-right mr-4">
                            <p>Total.        S/.</p>
                        </div>
                        <div class="text-center mt-5">
                                <button class="btn btn-info">Seguir viendo</button>
                                 <button class="btn btn-info"><i class="bi bi-wallet-fill"></i>
                                     Pagar ahora</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
