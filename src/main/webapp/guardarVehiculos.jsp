
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
        <h1>Guardar Vehiculos</h1>
        
        <div>
            <a href="index.jsp">Regresar al Menu</a>
        </div>
        
        <br>
        

        <form action="Servlet" method="POST" >
                
            <p><label>Marca: </label><input type="text" name="marca" id="idmarca">                

            <p><label>Modelo: </label><input type="text" name="modelo" id="idmodelo">

            <p><label>Año Fabricación: </label><input type="text" name="afabricacion" id="idfabricacion">

            <p><label>Patente: </label><input type="text" name="patente" id="idpatente">

            <p><label>Color: </label><input type="text" name="color" id="idcolor">

            <p><label>Tipo Transmision: </label><input type="text" name="transmision" id="idtransmision">

            <p><label>Cant Plazas: </label><input type="text" name="plazas" id="idplazas">

            <p><label>Capacidad Baul: </label><input type="text" name="baul" id="idbaul">

            <p><label>Pma: </label><input type="text" name="pma" id="idpma">     

            <button type="submit" name="action" value="guardar">Guardar</button>
        </form>
        
        
        
        
        <h3>Lista de Vehiculos</h3>
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
