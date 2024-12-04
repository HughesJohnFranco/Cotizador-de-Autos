<%@page import="java.util.List"%>
<%@page import="mark.tp9_jsp_mysql.EntidadVehiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cotizar Vehículos</title>
    <script>
        function seleccionarVehiculo(id) {
            document.getElementById("idid").value = id;
        }

        function validarFormulario() {
            const dias = document.getElementById("dias").value;
            if (dias <= 0) {
                alert("¡Error! Seleccione una opcion valida");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h1>Cotización de Vehículos</h1>

    <a href="index.jsp">Regresar al Menú</a>

    <!-- Mostrar mensajes de error o éxito -->
    <%
        String mensajeError = (String) request.getAttribute("mensajeError");
        String mensajeExito = (String) request.getAttribute("mensajeExito");
        if (mensajeError != null) {
    %>
        <div class="error"><%= mensajeError %></div>
    <% 
        } else if (mensajeExito != null) {
    %>
        <div class="success"><%= mensajeExito %></div>
    <% 
        }
    %>

    <form action="Servlet" method="POST" onsubmit="return validarFormulario()">
        <input type="hidden" name="action" value="cotizar">
        <p>
            <label>ID Vehículo: </label>
            <input type="text" name="id_vehiculo" id="idid" readonly required>
        </p>
        <p>
            <label>Días de alquiler: </label>
            <input type="number" name="dias_alquiler" id="dias" required>
        </p>
        <button type="submit" class="btn">Cotizar</button>
    </form>

    <h3>Lista de Vehículos Disponibles</h3>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Año</th>
            <th>Color</th>
            <th>Acción</th>
        </tr>
        <%
            List<EntidadVehiculo> vehiculos = (List<EntidadVehiculo>) request.getAttribute("listavehiculos");
            if (vehiculos != null && !vehiculos.isEmpty()) {
                for (EntidadVehiculo vehiculo : vehiculos) {
        %>
        <tr>
            <td><%= vehiculo.getId_vehiculo() %></td>
            <td><%= vehiculo.getMarca() %></td>
            <td><%= vehiculo.getModelo() %></td>
            <td><%= vehiculo.getAniofabricacion() %></td>
            <td><%= vehiculo.getColor() %></td>
            <td>
                <button type="button" onclick="seleccionarVehiculo(<%= vehiculo.getId_vehiculo() %>)">Seleccionar</button>
            </td>
        </tr>
        <% 
                }
            } else { 
        %>
        <tr>
            <td colspan="6">No hay vehículos disponibles.</td>
        </tr>
        <% 
            } 
        %>
    </table>
</body>
</html>
