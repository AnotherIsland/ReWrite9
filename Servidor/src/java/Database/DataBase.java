package Database;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DataBase {
    private String user;
    private String password;
    private String dbName;
    private String port;
    private String driverClassName;
    private String host;
    private Connection connection;
    private Statement statement;
    
    public DataBase() {
        this.user = "root";
        this.password = "n0m3l0";
        this.dbName = "rwdatabase";
        this.port = "3306";
        this.host = "127.0.0.1";
        this.driverClassName = "com.mysql.jdbc.Driver";
    }

    public DataBase(String user, String password, String dbName, String port, String driverClassName, String host) {
        this.user = user;
        this.password = password;
        this.dbName = dbName;
        this.port = port;
        this.driverClassName = driverClassName;
        this.host = host;
    }
    
    public void connect() throws SQLException{
        String urlDB = "jdbc:mysql://"+host+":"+port+"/"+dbName;
        try {
            Class.forName(this.driverClassName).newInstance();
            this.connection = DriverManager.getConnection(urlDB, this.user, this.password);
            
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("Error "+ e.getMessage());
        }
    }
    
    public void closeConnection() throws SQLException {
        this.connection.close();
    }
    
    public ResultSet query (String query) throws SQLException {
        this.statement = (Statement) connection.createStatement();
        return this.statement.executeQuery(query);
    }
    
    public void update(String update) throws SQLException  {
        this.statement = (Statement) connection.createStatement();
        this.statement.executeUpdate(update);
    }
    
    public ResultSet delete(String delete) throws SQLException {
        this.statement = (Statement) connection.createStatement();
        return this.statement.executeQuery(delete);
    }
    
    public void insert(String insert) throws SQLException {
        this.statement = (Statement) connection.createStatement();
        this.statement.executeUpdate(insert);
    }
    
    public CallableStatement procedure(String procedure) throws SQLException {
        return this.connection.prepareCall(procedure);
    }
    
}