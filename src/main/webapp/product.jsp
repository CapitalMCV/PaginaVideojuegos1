<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virtual Game - Administraci�n</title>
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
        <h2>Administraci�n de Productos</h2>
        <table class="product-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Genero</th>
                    <th>Descripci�n</th>
                    <th>Categor�a</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <!-- Aqu� ir�n las filas de productos -->
                <tr>
                    <td>001</td>
                    <td>Producto 1</td>
                    <td>Acci�n</td>
                    <td>Descripci�n del Producto 1</td>
                    <td>Videojuego</td>
                    <td>S/.199.99</td>
                    <td>50</td>
                    <td>Disponible</td>
                </tr>
                <!-- M�s filas de ejemplo -->
            </tbody>
        </table>
        <div class="admin-actions">
            <button>REGRESAR</button>
            <button>A�ADIR</button>
            <button>MODIFICAR</button>
            <button>ELIMINAR</button>
        </div>
    </section>
</body>
</html>
