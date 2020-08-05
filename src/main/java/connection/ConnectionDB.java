package connection;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.commons.mail.Email;

public class ConnectionDB {
	static Connection con;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (con == null || con.isClosed()) {
			Class.forName("org.postgresql.Driver");
			String username = "hwjyatmanxmgus";
			String password = "37758779b22c5ec25382de80cb6b3a3ef612d0c610bc418c11862d5ae3931034";
			String dbUrl = "jdbc:postgresql://"+"ec2-107-20-104-234.compute-1.amazonaws.com:5432"+"/d6sealtljb2s52";
			
			con = DriverManager.getConnection(dbUrl, username, password);
			return con;
		} else {
			return con;
		}

	}

	public static PreparedStatement getPreparedStatement(String sql)
			throws ClassNotFoundException, SQLException {
		if (con == null || con.isClosed()) {
			Class.forName("org.postgresql.Driver");
			String username = "hwjyatmanxmgus";
			String password = "37758779b22c5ec25382de80cb6b3a3ef612d0c610bc418c11862d5ae3931034";
			String dbUrl = "jdbc:postgresql://"+"ec2-107-20-104-234.compute-1.amazonaws.com:5432"+"/d6sealtljb2s52";
			
			con = DriverManager.getConnection(dbUrl, username, password);
			return con.prepareStatement(sql);
		} else {
			return con.prepareStatement(sql);
		}

	}

}


//package connection;
//
//import java.net.URISyntaxException;
//import java.sql.*;
//
//public class 	ConnectionDB {
//    static Connection con;
//
//    public static Connection getConnection() throws ClassNotFoundException, SQLException {
//        if (con == null || con.isClosed()) {
//            Class.forName("com.mysql.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cnpm_pj?useUnicode=true&characterEncoding=utf-8", "root", "");
//            return con;
//        } else {
//            return con;
//        }
//    }
//	public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException  {
//		if (con==null||con.isClosed()) {
//			Class.forName("com.mysql.jdbc.Driver");
//			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cnpm_pj?useUnicode=true&characterEncoding=utf-8", "root", "");
//
//		}
//		return con.prepareStatement(sql);
//
//
//	}
//
//
//}

