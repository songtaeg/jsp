package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.User;


public class TestDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/sample";
    private String jdbcUsername = "root";
    private String jdbcPassword = "test1234";
    private Connection conn;
    
    
    protected void connect() throws SQLException {
        if (conn == null || conn.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }
    
	public String userName() {
		return "철수";
	}
	
	public User userDB() throws SQLException {
		connect();
		Statement stmt=conn.createStatement();
		String query="select * from tbl_user";
		ResultSet rs=stmt.executeQuery(query);
		
//		while(rs.next()) {
//			
//		}
		rs.next();
		String id=rs.getString("userId");
		String name=rs.getString("name");
		String status=rs.getString("status");
		
		User user=new User(id,name,status);
		
		return user;
	}
}
