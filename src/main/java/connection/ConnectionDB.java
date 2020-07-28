package connection;

import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionDB {
	static Connection con;

	public static Connection getConnection() throws ClassNotFoundException, SQLException, URISyntaxException {

		String dbUrl = System.getenv("JDBC_DATABASE_URL");

		

		if (con == null || con.isClosed()) {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dbUrl);
			return con;
		} else {
			return con;
		}

	}

	public static PreparedStatement getPreparedStatement(String sql)
			throws ClassNotFoundException, SQLException, URISyntaxException {
		String dbUrl = System.getenv("JDBC_DATABASE_URL");
		if (con == null || con.isClosed()) {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dbUrl);
			return con.prepareStatement(sql);
		} else {
			return con.prepareStatement(sql);
		}


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
