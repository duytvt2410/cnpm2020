package connection;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.*;

public class ConnectionDB {
	static Connection con;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		URI dbUri;
		try {
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String username = dbUri.getUserInfo().split(":")[0];
	        String password = dbUri.getUserInfo().split(":")[1];
	        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
	        if (con == null || con.isClosed()) {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection(dbUrl, username, password);
				return con;
			} else {
				return con;
			}
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

      
		return con;
		
	}

	public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException {
		URI dbUri;
		try {
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String username = dbUri.getUserInfo().split(":")[0];
	        String password = dbUri.getUserInfo().split(":")[1];
	        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
	        if (con == null || con.isClosed()) {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection(dbUrl, username, password);

			}
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        
		
		return con.prepareStatement(sql);

	}

	public static void main(String[] args) throws Exception {
		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement("select * from sanpham");
//    	PreparedStatement pst = getPreparedStatement("select * from sanpham");
		ResultSet rs = pst.executeQuery();
//        int i=rs.
		rs.last();
		System.out.println(rs.getRow());
		rs.beforeFirst();
		while (rs.next()) {
			System.out.println(rs.getString(2));
		}
	}
}
