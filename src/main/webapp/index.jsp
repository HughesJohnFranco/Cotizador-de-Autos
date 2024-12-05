
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Roboto:wght@400;500&display=swap" rel="stylesheet">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                color: #333;
                line-height: 1.6; 
                margin: 0;
                padding: 0;
            }
            .botones-container{
                text-align: center;
            }
            .botones-container-button{
                margin: 5px;
            }
            .imagen-centrada {
                display: block;
                margin: 0 auto; 
            }
            button {
                font-size: 16px; 
                padding: 10px 20px;
                background-color: #212f3c;
                color: white; 
                border: none; 
                cursor: pointer; 
            }

            .titulo {
                text-align: center;
                margin: 5px;
                font-size: 30px; 
                font-weight: bold; 
                color: #17202a; 
                text-transform: uppercase; 
                letter-spacing: 2px; 
            }
            .titulosub{
                text-align: center;
                margin: 5px;
                font-size: 22px; 
                font-weight: bold;
                color: #17202a;
                text-transform: uppercase;
                letter-spacing: 2px; 
            }
            .titulomen{
                text-align: center;
                margin: 5px;
                font-size: 27px; 
                font-weight: bold; 
                color: #17202a; 
                text-transform: uppercase;
                letter-spacing: 2px;
            }
        </style>        
    </head>
    <body>
        
        <br><br>
        <h1 class="titulo">Cotizador de Alquiler de Vehículos</h1>
        <h3 class="titulosub">Sprint</h3><br>

        <img src="images/icono.png" alt="Descripción de la imagen" class="imagen-centrada" width="500" height="225">
        
        <br><h2 class="titulomen">Bienvenido al Menú Principal</h2><br>
        
        <div class="botones-container">
            <form action="Servlet" >
                <button type="submit" name="action" value="mostrar">Ver Vehiculos</button>
                <button type="submit" name="action" value="guardar">Agregar Vehiculos</button>
                <button type="submit" name="action" value="modificar">Modificar Vehiculos</button>
                <button type="submit" name="action" value="cotizar">Cotizar Vehiculos</button>
                <button type="submit" name="action" value="eliminar">Eliminar Vehiculos</button>  
            </form>
        </div>
    </body>
</html>
