package connection;

import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConnectionDB {
	static Connection con;

	public static Connection getConnection() throws URISyntaxException, SQLException, ClassNotFoundException {
		Class.forName("org.postgresql.Driver");
		String urlDB = System.getenv("JDBC_DATABASE_URL");
		return DriverManager.getConnection(urlDB);

	}

	public static PreparedStatement getPreparedStatement(String sql)
			throws ClassNotFoundException, SQLException, URISyntaxException {
		Class.forName("org.postgresql.Driver");
		String urlDB = System.getenv("JDBC_DATABASE_URL");
		return DriverManager.getConnection(urlDB).prepareStatement(sql);

	}

	public static void main(String[] args) throws Exception {
	}
}
