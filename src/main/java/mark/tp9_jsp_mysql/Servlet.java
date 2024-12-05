
package mark.tp9_jsp_mysql;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "Servlet", urlPatterns = {"/Servlet"})
public class Servlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {   
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if("mostrar".equals(action)){
            mostrarVehiculos(request,response);
        }
        else if ("guardar".equals(action)){
            mostrarVehiculosGuardar(request, response);
        }
        else if ("modificar".equals(action)){
            mostrarVehiculosModificar(request, response);
        }
        else if ("eliminar".equals(action)){
            mostrarVehiculosEliminar(request, response);
        }
        else if("cotizar".equals(action)){
            mostrarVehiculosCotizar(request, response);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("guardar".equals(action))
        {
            guardarVehiculos(request, response);
        }
        else if ("modificar".equals(action))
        {
            modificarVehiculos(request, response);
        }
        else if ("eliminar".equals(action))
        {
            eliminarVehiculos(request, response);
        }
        else if ("cotizar".equals(action)) {
        cotizarVehiculo(request, response);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
    
    
    public void guardarVehiculos(HttpServletRequest request, HttpServletResponse responde)
    throws ServletException, IOException{
        
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String aniofabricacion = request.getParameter("afabricacion");
        String patente = request.getParameter("patente");
        String color = request.getParameter("color");
        String tipotransmision = request.getParameter("transmision");
        int plazas = Integer.parseInt(request.getParameter("plazas"));
        int baul = Integer.parseInt(request.getParameter("baul"));
        int pma = Integer.parseInt(request.getParameter("pma"));
        
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        vehiculoDAO.insertarVehiculo(marca, modelo, aniofabricacion, patente, color, tipotransmision, plazas, baul, pma); 
        mostrarVehiculosGuardar(request,responde);
    }
    
    
    public void mostrarVehiculos(HttpServletRequest request, HttpServletResponse responde)
    throws ServletException, IOException{           
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        List<EntidadVehiculo> vehiculos = vehiculoDAO.obtenerVehiculos();       
        request.setAttribute("listavehiculos", vehiculos);        
        request.getRequestDispatcher("mostrarVehiculos.jsp").forward(request, responde);
    }
    
    
    
    public void mostrarVehiculosGuardar(HttpServletRequest request, HttpServletResponse responde)
    throws ServletException, IOException{           
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        List<EntidadVehiculo> vehiculos = vehiculoDAO.obtenerVehiculos();       
        request.setAttribute("listavehiculos", vehiculos);        
        request.getRequestDispatcher("guardarVehiculos.jsp").forward(request, responde);
    }
    
    
    
    public void modificarVehiculos(HttpServletRequest request, HttpServletResponse responde)
    throws ServletException, IOException{
        int id_vehiculo = Integer.parseInt(request.getParameter("id_vehiculo"));
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String aniofabricacion = request.getParameter("afabricacion");
        String patente = request.getParameter("patente");
        String color = request.getParameter("color");
        String tipotransmision = request.getParameter("transmision");
        int plazas = Integer.parseInt(request.getParameter("plazas"));
        int baul = Integer.parseInt(request.getParameter("baul"));
        int pma = Integer.parseInt(request.getParameter("pma"));
        
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        vehiculoDAO.modificarVehiculo(id_vehiculo, marca, modelo, aniofabricacion, patente, color, tipotransmision, plazas, baul, pma);
        mostrarVehiculosModificar(request,responde);
    }
    
    
    
    public void mostrarVehiculosModificar(HttpServletRequest request, HttpServletResponse responde)
    throws ServletException, IOException{           
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        List<EntidadVehiculo> vehiculos = vehiculoDAO.obtenerVehiculos();       
        request.setAttribute("listavehiculos", vehiculos);        
        request.getRequestDispatcher("modificarVehiculos.jsp").forward(request, responde);
    }
    
    
    public void mostrarVehiculosEliminar(HttpServletRequest request, HttpServletResponse responde)
    throws ServletException, IOException{           
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        List<EntidadVehiculo> vehiculos = vehiculoDAO.obtenerVehiculos();       
        request.setAttribute("listavehiculos", vehiculos);        
        request.getRequestDispatcher("eliminarVehiculos.jsp").forward(request, responde);
    }

    
    public void eliminarVehiculos(HttpServletRequest request, HttpServletResponse responde)
    throws ServletException, IOException{  
        int id_vehiculo = Integer.parseInt(request.getParameter("id_vehiculo"));
        
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        vehiculoDAO.eliminarVehiculo(id_vehiculo);
        mostrarVehiculosEliminar(request, responde);
    }    
    
    

    private void mostrarVehiculosCotizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        List<EntidadVehiculo> vehiculos = vehiculoDAO.obtenerVehiculos();
        request.setAttribute("listavehiculos", vehiculos);
        request.getRequestDispatcher("cotizarVehiculos.jsp").forward(request, response);
    }    
    
    
    private void cotizarVehiculo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idVehiculo = Integer.parseInt(request.getParameter("id_vehiculo"));
            int diasAlquiler = Integer.parseInt(request.getParameter("dias_alquiler"));

            VehiculoDAO vehiculoDAO = new VehiculoDAO();
            double cotizacion = vehiculoDAO.calcularCotizacion(idVehiculo, diasAlquiler);

            request.setAttribute("cotizacion", cotizacion);
            request.setAttribute("idVehiculo", idVehiculo);
            request.setAttribute("diasAlquiler", diasAlquiler);
            request.getRequestDispatcher("resultadoCotizacion.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("mensajeError", "Error al calcular la cotización.");
            request.getRequestDispatcher("cotizarVehiculos.jsp").forward(request, response);
        }
    }
   
}
