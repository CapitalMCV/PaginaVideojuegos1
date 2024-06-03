<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="beans.*,dao.Negocio" %>
<html>
    <head>
        <script src=
        "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
        <style>
            .container {
                width: 70%;
                margin: 15px auto;
            }
            body {
                text-align: center;
                color: green;
            }
            h2 {
                text-align: center;
                font-family: "Verdana", sans-serif;
                font-size: 30px;
            }
        </style>
        <link href="CSS/adminlte.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            Negocio obj = new Negocio();
            int an = 0;
            String tipo = "";

            if (request.getParameter("tan") != null) {
                an = Integer.parseInt(request.getParameter("tan"));
            }

            if (request.getParameter("opc") != null) {
                tipo = request.getParameter("opc");
            }

        %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <form action="">
                                <div class="form-group">
                                    <label>Ingrese año:</label>
                                    <input name="tan" class="form-control" value="<%=an%>">
                                </div>
                                <div class="form-group">
                                    <input type="radio" name="opc" value="bar">Barra
                                    <input type="radio" name="opc" value="pie">Torta
                                    <input type="radio" name="opc" value="line">Lineal
                                </div>
                                <button class="btn btn-primary">Enviar</button>
                                <br>
                                <table class="table table-bordered">
                                    <tr><th>Nombre<th>Total Vendido
                                            <%
                                                for (VentaCat x : obj.lisvencat(an)) {
                                                    out.print("<tr><td>" + x.getNomcat() + "<td>" + x.getTotal());
                                                }
                                            %>
                                </table>
                            </form>
                        </div>
                    </div>

                </div>
                <div class="col-sm-8">
                    <div class="container">
                        <h2>Ventas del año: <%=an%></h2>
                        <div>
                            <canvas id="myChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#" onclick="history.back()" class="btn btn-success">Retorno</a>
        </div>


        <%
            String label = "", data = "";
            for (VentaCat x : obj.lisvencat(an)) {
                label = label + "'" + x.getNomcat() + "',";
                data = data + x.getTotal() + ",";
            }

            if (data.length() > 0)
                data = data.substring(0, data.length() - 1);
        %>


    </body>
    <script>
        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: "<%=tipo%>",
            data: {
                labels: [<%=label%>],
                datasets: [
                    {
                        label: "ventas",
                        data: [<%=data%>],
                        backgroundColor: "rgba(153,205,1,0.6)",
                    },
                ],
            },
        });
    </script>
</html>