
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
                color: #333; /* Color gris oscuro para un tono profesional */
                line-height: 1.6; /* Mejora la legibilidad */
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
                margin: 0 auto; /* Centra la imagen horizontalmente */
            }
            button {
                font-size: 16px; /* Tamaño del texto */
                padding: 10px 20px; /* Espaciado interno */
                background-color: #212f3c; /* Color de fondo */
                color: white; /* Color del texto */
                border: none; /* Eliminar bordes */
                cursor: pointer; /* Cambia el cursor al pasar por encima */
            }
            /* Estilo para los títulos */
            .titulo {
                text-align: center;
                margin: 5px;
                font-size: 30px; /* Tamaño del texto */
                font-weight: bold; /* Negrita */
                color: #17202a; /* Color de texto */
                text-transform: uppercase; /* Transformar a mayúsculas */
                letter-spacing: 2px; /* Espaciado entre letras */
            }
            .titulosub{
                text-align: center;
                margin: 5px;
                font-size: 22px; /* Tamaño del texto */
                font-weight: bold; /* Negrita */
                color: #17202a; /* Color de texto */
                text-transform: uppercase; /* Transformar a mayúsculas */
                letter-spacing: 2px; /* Espaciado entre letras */
            }
            .titulomen{
                text-align: center;
                margin: 5px;
                font-size: 27px; /* Tamaño del texto */
                font-weight: bold; /* Negrita */
                color: #17202a; /* Color de texto */
                text-transform: uppercase; /* Transformar a mayúsculas */
                letter-spacing: 2px; /* Espaciado entre letras */
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
