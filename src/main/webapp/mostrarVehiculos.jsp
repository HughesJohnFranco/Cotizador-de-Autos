
<%@page import="java.util.List"%>
<%@page import="mark.tp9_jsp_mysql.EntidadVehiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <h1 class="titulo2">Tabla de vehiculos</h1>
        
        <div class="enlace">
            <a href="index.jsp">Regresar al Menu</a>
        </div>
        
        <br>
        
        <table border="1" class="table">
            <tr>
                <th>Id</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>AñoFabricacion</th>
                <th>Patente</th>
                <th>Color</th>
                <th>TipoTransmision</th>
                <th>CantPlazas</th>
                <th>CapacidadBaul</th>
                <th>Pma</th>
            </tr>
            
            <%

                List<EntidadVehiculo> vehiculos = (List<EntidadVehiculo>) request.getAttribute("listavehiculos");
                 
                for(EntidadVehiculo vehiculo : vehiculos){
            %>
            
            
            <tr>
                <td><%= vehiculo.getId_vehiculo() %></td>
                <td><%= vehiculo.getMarca() %></td>
                <td><%= vehiculo.getModelo() %></td>
                <td><%= vehiculo.getAniofabricacion() %></td>
                <td><%= vehiculo.getPatente() %></td>
                <td><%= vehiculo.getColor() %></td>
                <td><%= vehiculo.getTipotransmision() %></td>
                <td><%= vehiculo.getCantplazas() %></td>
                <td><%= vehiculo.getCapacidadbaul() %></td>
                <td><%= vehiculo.getPma() %></td>
            </tr>       
            <%
            }
%>
        </table>
    </body>
</html>
