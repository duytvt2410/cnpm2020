package connection;

import java.sql.*;

public class 	ConnectionDB {
    static Connection con;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (con == null || con.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cnpm_pj?useUnicode=true&characterEncoding=utf-8", "root", "");
            return con;
        } else {
            return con;
        }
    }
	public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException  {
		if (con==null||con.isClosed()) {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cnpm_pj?useUnicode=true&characterEncoding=utf-8", "root", "");

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
