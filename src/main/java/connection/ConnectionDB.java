package connection;

import java.sql.*;

public class ConnectionDB {
	static Connection con;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (con == null || con.isClosed()) {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(
					"jdbc:postgresql://ec2-54-197-254-117.compute-1.amazonaws.com:5432/dddovfb35cnuba",
					"knzaihosxxkwov", "86dc869c0bb38be1274780cdfa84cb3f46252ecc0b62112ad31808620c8ca811");
			return con;
		} else {
			return con;
		}
	}

	public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException {
		if (con == null || con.isClosed()) {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(
					"jdbc:postgresql://ec2-54-197-254-117.compute-1.amazonaws.com:5432/dddovfb35cnuba",
					"knzaihosxxkwov", "86dc869c0bb38be1274780cdfa84cb3f46252ecc0b62112ad31808620c8ca811");

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
