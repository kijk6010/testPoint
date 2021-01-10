package conn;
 
import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBConnect {
    private static DBConnect db =new DBConnect();
    private Connection conn =null;
    
    String jdbc_Driver = "com.mysql.jdbc.Driver";
    String jdbc_url ="jdbc:mysql://localhost:3306/gtpoint";
 
    public static DBConnect getInstance(){
        return db;
    }
    
    public Connection getConnection(){
        try{
            Class.forName(jdbc_Driver);
            System.out.println("Driver Loading OK");
 
            conn = DriverManager.getConnection(jdbc_url,"root","onlyroot");
            System.out.println("DB Connect OK");
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return conn;
    }
}


