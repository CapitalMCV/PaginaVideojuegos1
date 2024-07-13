<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,java.util.*" %>
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

            .btn-editar {
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
        <%
            List<Compra> lista = (ArrayList<Compra>) ses.getAttribute("canasta");
        %>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-7 col-divider">
                    <div class="card-body fixed-height-card">
                        <div class="row">
                            

                            <%
                                int i = 1;
                                for (Compra x : lista) {    
                            %>
                            <div class="card text-bg-dark m-2" style="width: 12rem;">
                                <div class="card-header">Item <%=i%></div>
                                <img src="Img/<%=x.getImg()%>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%=x.getNompro()%></h5>
                                </div>
                            </div>
                            <%
                                i++;
                                }
                            %>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="row">
                        
                        <div>
                            <table class="table table-hover" id="tabla-compra">
                                <thead>
                                    <tr class="text-black">
                                        <th>Codigo</th>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio</th>
                                        <th>Total</th>
                                        <th>Accion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int cuenta = 0;
                                        for (Compra x : lista) {
                                            out.print("<tr><td>" + x.getIdproducto() + "<td>" + x.getNompro() + "<td>"
                                                    + x.getCantidad() + "<td>" + x.getPrecio() + "<td>" + x.total());
                                    %>
                                    <td><a href="servlet?opc=6&ind=<%=cuenta%>" class="btn btn-danger">
                                            eliminar</a>
                                        <%
                                                cuenta++;
                                            }
                                        %>
                                </tbody>
                            </table>
                        </div>
                        <div class="text-right mr-4">
                            <p>Total: S/. <span id="total-compra">0.00</span></p>
                        </div>
                        <div class="text-center mt-5">
                            <a href="pagPrincipal.jsp" class="btn btn-info">Seguir viendo</a>
                            <a href="pagConfirma.jsp" class="btn btn-info"><i class="bi bi-wallet-fill"></i>
                                Pagar ahora
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            function calcularTotal() {
                let total = 0;
                $('#tabla-compra tbody tr').each(function() {
                    let subtotal = parseFloat($(this).find('td:eq(4)').text());
                    total += isNaN(subtotal) ? 0 : subtotal;
                });
                $('#total-compra').text(total.toFixed(2));
            }
            
            $(document).ready(function() {
                calcularTotal();
            });
        </script>
    </body>
</html>
