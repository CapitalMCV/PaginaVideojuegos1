<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="beans.Ventas,dao.Negocio" %>
<html>
    <head>
        <script src=
        "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
        <style>
            .container {
                width: 100%;
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
            int an = Integer.parseInt(request.getParameter("tan"));
            String label="", data="";
            for(Ventas x:obj.lisMes(an)){
            label=label+"'"+x.Lmes()+"',";
            data=data+x.getMonto()+",";
            }
            
            if(data.length()>0)
            data=data.substring(0,data.length()-1);
        %>

        <div class="container">
            <h2>Ventas del año: <%=an%></h2>
            <div>
                <canvas id="myChart"></canvas>
            </div>
        </div>
    </body>
    <script>
        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: "bar",
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