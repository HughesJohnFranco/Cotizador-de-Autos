
package mark.tp9_jsp_mysql;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionDAO {

    private static final String url = "jdbc:mysql://localhost:3306/db_cotizador";
    private static final String username = "root";
    private static final String pass = "E3tttx869&";
    
    public static Connection obtenerConexion(){
        Connection conn = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, pass);
        } catch(Exception e){
            System.out.println("Error al conectarnos: " + e.toString());
        }
        return conn;
    }
    
    
    public static void cerrarConexion(Connection conn){
        try{
            if(conn != null){
                conn.close();
            }
        }catch(Exception e){
            System.out.println("Error al conectarnos: " + e.toString());
        }
    } 
}
