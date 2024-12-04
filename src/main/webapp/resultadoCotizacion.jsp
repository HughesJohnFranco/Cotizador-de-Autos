<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Resultado de Cotización</title>
</head>
<body>
    <h1>Resultado de la Cotización</h1>

    <%
        double cotizacion = (double) request.getAttribute("cotizacion");
        int idVehiculo = (int) request.getAttribute("idVehiculo");
        int diasAlquiler = (int) request.getAttribute("diasAlquiler");
    %>

    <p>ID del Vehículo: <%= idVehiculo %></p>
    <p>Días de Alquiler: <%= diasAlquiler %></p>
    <p>Costo Total: $<%= cotizacion %></p>

    <a href="index.jsp">Regresar al Menu principal</a>
</body>
</html>