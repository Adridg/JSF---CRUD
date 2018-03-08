import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
public class datosDB {
String sdriver="com.mysql.jdbc.Driver";  
String sUrl_JDBC="jdbc:mysql://localhost:3306/encuestamaraton";
String consultaSQL="SELECT p.id, p.nombre, p.apellidos, p.dni, p.sexo, n.nacionalidad from personas p, nacionalidad n where n.id_nac = p.nacionalidad order by p.nombre";
private Statement stmt;
private Connection conn;
private ResultSet rset;
private String serror;
private ResultSet rsMarca;
private ResultSet rsMaraton;
public datosDB() {
        try
        {
            Class.forName(sdriver);
     
        }
        catch (Exception e)
        {
            serror=e.toString();
        }
        
        //crear objeto connection
         try
        {
            conn=DriverManager.getConnection(sUrl_JDBC,"root","");
            serror="conexión realizada con éxito";
        }
        catch (Exception e)
        {
            serror=e.toString();
        }
         //crear objeto statetement y proceso
         try
        {
           stmt=conn.createStatement();
           rset=stmt.executeQuery(consultaSQL);
           serror+=", ejecuta la select";
        }
        catch (Exception e)
        {
            serror=e.toString();
        }
        
    }
    
    /**
     * @return the serror
     */
    public String getSerror() {
        return serror;
    }

    /**
     * @param serror the serror to set
     */
    public void setSerror(String serror) {
        this.serror = serror;
    }

    /**
     * @return the rset
     */
    public ResultSet getRset() {
        return rset;
    }

    /**
     * @param rset the rset to set
     */
    public void setRset(ResultSet rset) {
        this.rset = rset;
    }

    /**
     * @return the rsMarca
     */
    public ResultSet getRsMarca() 
    {
         try
        {
           String consultaMarca=" SELECT m.marca  from marca m, marcapersonas mp, personas p ";
                 consultaMarca+=" where m.id_marca = mp.idMarca AND p.id = mp.id_Persona ";
                 consultaMarca+=" and p.id = "+rset.getString("id");
                 consultaMarca+=" order by m.marca";
                      
           Statement stmt2=conn.createStatement();
           rsMarca=stmt2.executeQuery(consultaMarca);
        }
        
        catch (Exception e)
        {
            serror=e.toString();
        }
        return rsMarca;
      
    }

    /**
     * @return the rsidiomas
     */
    public ResultSet getRsMaraton() {
         try
        {
           String consultaMaraton=" SELECT m.maraton  from maratones m, maratonespersonas mt, personas p ";
                 consultaMaraton+=" where m.id_maraton = mt.idMaraton AND p.id = mt.id_Persona ";
                 consultaMaraton+=" and p.id ="+rset.getString("id");
                 consultaMaraton+=" order by m.maraton";
           Statement stmt3=conn.createStatement();
           rsMaraton=stmt3.executeQuery(consultaMaraton);
        }
      
        catch (Exception e)
        {
            serror=e.toString();
        }
        return rsMaraton;
    }
    
    
}
