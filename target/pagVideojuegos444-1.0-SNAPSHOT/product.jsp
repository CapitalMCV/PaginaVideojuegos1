<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="beans.*" %>
<%@ page import="dao.*" %>

<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Virtual Game - Administración</title>
        <link href="CSS/styleProduct.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <h1>VIRTUAL GAME</h1>
            <div class="user-icons">
                <img src="images/admin-icon.png" alt="Admin">
                <img src="images/logout-icon.png" alt="Salir">
            </div>
        </header>
        <section class="admin-dashboard">
            <h2>Administración de Productos</h2>

            <%
                productoDao productoDAO = new productoDao();
                List<producto> listaProductos = productoDAO.listProd();
            %>

            <table class="product-table">
                <thead>
                    <tr>
                        <th>Código Producto</th>
                        <th>Código Categoría</th>
                        <th>Nombre Producto</th>
                        <th>Stock</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (producto x : listaProductos) {
                    %>
                    <tr>
                        <td><%= x.getCodProd()%></td>
                        <td><%= x.getCodCat()%></td>
                        <td><%= x.getNomProd()%></td>
                        <td><%= x.getStock()%></td>
                        <td><%= x.getPrecio()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="admin-actions">
                <button>REGRESAR</button>
                <button>AÑADIR</button>
                <button>MODIFICAR</button>
                <button>ELIMINAR</button>
            </div>
        </section>
    </body>
</html>
