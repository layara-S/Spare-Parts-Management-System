package SpareParts;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {

	private static String url = "jdbc:mysql://localhost:3306/spareparts";
	private static String user = "root";
	private static String pw = "Layara0702";
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pw);
		}
		catch(Exception e) {
			System.out.println("DB not connected");
		}
		return con;
		
	}
	
	
}
