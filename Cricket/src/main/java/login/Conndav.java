package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conndav {
	public static Connection conn()
	{
		Connection con=null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			try {
				con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","cricket","cricket");
			} catch (SQLException e) {
				con=null;
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	
		return con;
	}
}
