function mostrarCotizacion() {
    var idVehiculo = document.getElementById("idid").value;
    var diasAlquiler = document.getElementById("dias").value;

    if (idVehiculo && diasAlquiler > 0) {
        // Redirigir a la página de cotización con los parámetros en la URL
        window.location.href = "cotizacion.jsp?id_vehiculo=" + idVehiculo + "&dias_alquiler=" + diasAlquiler;
    } else {
        alert("Por favor, seleccione un vehículo y un número válido de días.");
    }
}
