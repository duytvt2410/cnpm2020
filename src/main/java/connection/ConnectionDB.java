package connection;

import java.sql.*;

public class ConnectionDB {
	static Connection con;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (con == null || con.isClosed()) {
			con = DriverManager.getConnection(
					"jdbc:postgresql://ec2-54-197-254-117.compute-1.amazonaws.com:5432/d4v6ds4kd744at?useUnicode=true&characterEncoding=utf-8",
					"rsdwrjxshstfoe", "7480e7a404fc17bed9b523fdb430a270024beb1b6eb59cf2df4156db2b959f81");
			return con;
		} else {
			return con;
		}
	}

	public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException {
		if (con == null || con.isClosed()) {
			con = DriverManager.getConnection(
					"jdbc:postgresql://ec2-54-197-254-117.compute-1.amazonaws.com:5432/d4v6ds4kd744at?useUnicode=true&characterEncoding=utf-8",
					"rsdwrjxshstfoe", "7480e7a404fc17bed9b523fdb430a270024beb1b6eb59cf2df4156db2b959f81");

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
