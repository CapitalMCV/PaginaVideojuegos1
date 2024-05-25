<!DOCTYPE html>
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
        <table class="product-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Genero</th>
                    <th>Descripción</th>
                    <th>Categoría</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <!-- Aquí irán las filas de productos -->
                <tr>
                    <td>001</td>
                    <td>Producto 1</td>
                    <td>Acción</td>
                    <td>Descripción del Producto 1</td>
                    <td>Videojuego</td>
                    <td>S/.199.99</td>
                    <td>50</td>
                    <td>Disponible</td>
                </tr>
                <!-- Más filas de ejemplo -->
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
