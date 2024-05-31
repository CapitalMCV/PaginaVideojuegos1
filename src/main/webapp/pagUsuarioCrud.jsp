<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*, java.util.*, dao.*" %>
<!DOCTYPE html><html>
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
                    <a class="nav-link" href="">Log out</a>
                </li> 
            </ul>
        </nav>
        <%
            List<usuario> lista = (ArrayList<usuario>) request.getAttribute("dato");
        %> 
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            ${titulo}
                        </div>
                        <div class="card-body">
                            <form action="controlCliente?opc=${nro}" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="codu" value="${usu.getCodu()}">
                                </div>
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" class="form-control" name="user" value="${usu.getUsername()}" >
                                </div>
                                <div class="form-group">
                                    <label>Apellido</label>
                                    <input type="text" class="form-control" name="ape" value="${usu.getApellidos()}" >
                                </div>
                                <div class="form-group">
                                    <label>Nombre</label>
                                    <input type="text" class="form-control" name="nombre" value="${usu.getNombres()}" >
                                </div>
                                <div class="form-group">
                                    <label>Dni</label>
                                    <input type="text" class="form-control" name="dni" value="${usu.getDni()}" >
                                </div>
                                <div class="form-group">
                                    <label>Rol</label>
                                    <input type="text" class="form-control" name="rol" value="${usu.getRol()}" >
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="text" class="form-control" name="pass" value="${usu.getPassword()}" >
                                </div>
                                <button class="btn btn-success" name="envia">
                                    <i class="far fa-save"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-sm-8">
                    <h2 class="text-blue">Lista de Alumno</h2>
                    <table class="table table-hover" id="tablax">
                        <thead>
                            <tr class="text-white bg-black">
                                <th>Codigo<th>Username<th>Rol<th>Apellidos<th>Nombres<th>Dni<td>Password<td>Acción      
                        </thead>  
                        <%
                            for (usuario x : lista) {
                                out.print("<tr><td>" + x.getCodu() + "<td>" + x.getUsername() + "<td>" + x.getRol()
                                        + "<td>" + x.getApellidos() + "<td>" + x.getNombres() + "<td>"
                                        + x.getDni() + "<td>" + x.getPassword());

                        %>
                        
                        <td><a href="controlCliente?opc=6&cod=<%=x.getCodu()%>" class="btn btn-success">
                                <i class="far fa-edit"></i>    
                            </a>
                            <a href="controlCliente?opc=7&cod=<%=x.getCodu()%>" class="btn btn-danger">
                                <i class="fas fa-trash-alt"></i>    
                            </a>

                            <%
                                }
                            %>     

                    </table> 
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <!-- JQUERY -->
        <script src="https://code.jquery.com/jquery-3.4.1.js"
                integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
        <!-- DATATABLES -->
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
        </script>
        <!-- BOOTSTRAP -->
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
        </script>
        <script>
            $(document).ready(function () {
                $('#tablax').DataTable({
                    language: {
                        processing: "Tratamiento en curso...",
                        search: "Buscar&nbsp;:",
                        lengthMenu: "Agrupar de _MENU_ items",
                        info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                        infoEmpty: "No existen datos.",
                        infoFiltered: "(filtrado de _MAX_ elementos en total)",
                        infoPostFix: "",
                        loadingRecords: "Cargando...",
                        zeroRecords: "No se encontraron datos con tu busqueda",
                        emptyTable: "No hay datos disponibles en la tabla.",
                        paginate: {
                            first: "Primero",
                            previous: "Anterior",
                            next: "Siguiente",
                            last: "Ultimo"
                        },
                        aria: {
                            sortAscending: ": active para ordenar la columna en orden ascendente",
                            sortDescending: ": active para ordenar la columna en orden descendente"
                        }
                    },
                    scrollY: 400,
                    lengthMenu: [[5, 10, 25, -1], [5, 10, 25, "All"]],
                });
            });
        </script>
    </body>
</html>