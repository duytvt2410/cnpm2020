package controller;

import connection.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/trangchu")
public class TrangChuController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//   gia soc cuoi tuan

		try {
			String sql3 = "SELECT id, img, price, pricea, des, name FROM sanpham WHERE type =2";
			PreparedStatement pre = null;
			try {
				pre = ConnectionDB.getConnection().prepareStatement(sql3);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ResultSet b2;
			b2 = pre.executeQuery(sql3);
			request.setAttribute("b2", b2);
			request.getRequestDispatcher("trangchu.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
