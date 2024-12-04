
package mark.tp9_jsp_mysql;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;



public class VehiculoDAO {

    public void insertarVehiculo(String marca, String modelo, String fabricacion, String patente, String color, String transmision, int plazas, int baul, int pma) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try{
            
            conn = ConexionDAO.obtenerConexion();
            String sql = "insert into vehiculo(marca, modelo, anioFabricacion, patente, color, tipoTransmision, cantPlazas, capacidadBaul, pma) values (?,?,?,?,?,?,?,?,?);";
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, marca);
            stmt.setString(2, modelo);
            stmt.setString(3, fabricacion);
            stmt.setString(4, patente);
            stmt.setString(5, color);
            stmt.setString(6, transmision);
            stmt.setInt(7, plazas);
            stmt.setInt(8, baul);
            stmt.setInt(9, pma);
            
            stmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            ConexionDAO.cerrarConexion(conn);
            try{
                if(stmt != null){
                    stmt.close();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
    }
    
    public List<EntidadVehiculo> obtenerVehiculos(){
        List<EntidadVehiculo> vehiculos = new ArrayList<>();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try{
            conn = ConexionDAO.obtenerConexion();
            String sql = "select * from vehiculo";
            stmt = conn.prepareStatement(sql);
            
            rs = stmt.executeQuery();
            
            while(rs.next()){
                EntidadVehiculo vehiculo = new EntidadVehiculo();
                
                vehiculo.setId_vehiculo(rs.getInt("id_vehiculo"));
                vehiculo.setMarca(rs.getString("marca"));
                vehiculo.setModelo(rs.getString("modelo"));
                vehiculo.setAniofabricacion(rs.getString("anioFabricacion"));
                vehiculo.setPatente(rs.getString("patente"));
                vehiculo.setColor(rs.getString("color"));
                vehiculo.setTipotransmision(rs.getString("tipoTransmision"));
                vehiculo.setCantplazas(rs.getInt("cantPlazas"));
                vehiculo.setCapacidadbaul(rs.getInt("capacidadBaul"));
                vehiculo.setPma(rs.getInt("pma"));
                
                vehiculos.add(vehiculo);
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        finally{
            ConexionDAO.cerrarConexion(conn);
            try{
                if(stmt != null){
                    stmt.close();
                }
            } catch(SQLException ex){
                ex.printStackTrace();
            }
            
            try{
                if(rs != null){
                    rs.close();
                }
            } catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        return vehiculos;
    }
        
    public void modificarVehiculo(int id_vehiculo, String marca, String modelo, String fabricacion, String patente, String color, String transmision, int plazas, int baul, int pma) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try{
            
            conn = ConexionDAO.obtenerConexion();
            String sql = "update vehiculo set marca=?, modelo=?, anioFabricacion=?, patente=?, color=?, tipoTransmision=?, cantPlazas=?, capacidadBaul=?, pma=? where id_vehiculo=?;";
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, marca);
            stmt.setString(2, modelo);
            stmt.setString(3, fabricacion);
            stmt.setString(4, patente);
            stmt.setString(5, color);
            stmt.setString(6, transmision);
            stmt.setInt(7, plazas);
            stmt.setInt(8, baul);
            stmt.setInt(9, pma);
            stmt.setInt(10, id_vehiculo);
            
            stmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            ConexionDAO.cerrarConexion(conn);
            try{
                if(stmt != null){
                    stmt.close();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
    }
       
    public void eliminarVehiculo(int id_vehiculo) {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try{
            
            conn = ConexionDAO.obtenerConexion();
            String sql = "delete from vehiculo where id_vehiculo=?;";
            stmt = conn.prepareStatement(sql);
            
            stmt.setInt(1, id_vehiculo);
            
            stmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            ConexionDAO.cerrarConexion(conn);
            try{
                if(stmt != null){
                    stmt.close();
                }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
    }
    
    
    
    
    public double calcularCotizacion(int idVehiculo, int diasAlquiler) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        double precioBasePorDia = 2000.0;
        double precioTotal = 0.0;

        try {
            conn = ConexionDAO.obtenerConexion();
            String sql = "SELECT * FROM vehiculo WHERE id_vehiculo = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idVehiculo);

            rs = stmt.executeQuery();
            if (rs.next()) {
                int plazas = rs.getInt("cantPlazas");
                int pma = rs.getInt("pma");

                precioBasePorDia += plazas * 100; // Supongams 100 extra por plaza
                if (pma > 1000) {
                    precioBasePorDia += 500; // Suponemos 500 extra por la capacidad
                }

                precioTotal = precioBasePorDia * diasAlquiler;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConexionDAO.cerrarConexion(conn);
        }

        return precioTotal;
    }

    
}
