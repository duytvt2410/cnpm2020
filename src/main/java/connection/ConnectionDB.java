package connection;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConnectionDB {
	static Connection con;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (con == null || con.isClosed()) {
			Class.forName("org.postgresql.Driver");
			String username = "knzaihosxxkwov";
			String password = "86dc869c0bb38be1274780cdfa84cb3f46252ecc0b62112ad31808620c8ca811";
			String dbUrl = "jdbc:postgresql://"+"ec2-54-197-254-117.compute-1.amazonaws.com:5432"+"/dddovfb35cnuba";
			
			con = DriverManager.getConnection(dbUrl, username, password);
			return con;
		} else {
			return con;
		}

	}

	public static PreparedStatement getPreparedStatement(String sql)
			throws ClassNotFoundException, SQLException, URISyntaxException {
		if (con == null || con.isClosed()) {
			Class.forName("org.postgresql.Driver");
			String username = "knzaihosxxkwov";
			String password = "86dc869c0bb38be1274780cdfa84cb3f46252ecc0b62112ad31808620c8ca811";
			String dbUrl = "jdbc:postgresql://"+"ec2-54-197-254-117.compute-1.amazonaws.com:5432"+"/dddovfb35cnuba";
			
			con = DriverManager.getConnection(dbUrl, username, password);
			return con.prepareStatement(sql);
		} else {
			return con.prepareStatement(sql);
		}

	}

	public static void main(String[] args) throws Exception {
	}
}
