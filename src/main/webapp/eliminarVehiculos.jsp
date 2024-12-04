
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
        <h1>Eliminar Vehiculos</h1>
        
        <a href="index.jsp">Regresar al Menu</a>
        
        <form action="Servlet" method="POST">
                
            <p><label>Id: </label><input type="text" name="id_vehiculo" id="idid" readonly>
                
            <p><label>Marca: </label><input type="text" name="marca" id="idmarca">                

            <p><label>Modelo: </label><input type="text" name="modelo" id="idmodelo">

            <p><label>Año Fabricación: </label><input type="text" name="afabricacion" id="idfabricacion">

            <p><label>Patente: </label><input type="text" name="patente" id="idpatente">

            <p><label>Color: </label><input type="text" name="color" id="idcolor">

            <p><label>Tipo Transmision: </label><input type="text" name="transmision" id="idtransmision">

            <p><label>Cant Plazas: </label><input type="text" name="plazas" id="idplazas">

            <p><label>Capacidad Baul: </label><input type="text" name="baul" id="idbaul">

            <p><label>Pma: </label><input type="text" name="pma" id="idpma">    
                
            <button type="submit" name="action" value="eliminar">Eliminar</button>
        </form>
        
        
        <h3>Lista de Vehiculos</h3>
        <table border="1" class="table" id="mitabla">
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
                <th>Accion</th>
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
                <td>
                    <button type="submit" onClick="Seleccionar()">Seleccionar</button>
                </td>
            </tr>       
            <%
            }
%>
        </table>
    </body>
</html>


<script>
    function Seleccionar(){
        var tabla = document.getElementById("mitabla");
        for(var i=1; i < tabla.rows.length; i++){
            tabla.rows[i].onclick = function(){
               document.getElementById("idid").value = this.cells[0].innerHTML; 
               document.getElementById("idmarca").value = this.cells[1].innerHTML; 
               document.getElementById("idmodelo").value = this.cells[2].innerHTML; 
               document.getElementById("idfabricacion").value = this.cells[3].innerHTML; 
               document.getElementById("idpatente").value = this.cells[4].innerHTML; 
               document.getElementById("idcolor").value = this.cells[5].innerHTML; 
               document.getElementById("idtransmision").value = this.cells[6].innerHTML; 
               document.getElementById("idplazas").value = this.cells[7].innerHTML; 
               document.getElementById("idbaul").value = this.cells[8].innerHTML; 
               document.getElementById("idpma").value = this.cells[9].innerHTML; 
            }; 
        }
    }
</script>