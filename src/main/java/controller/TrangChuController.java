package controller;

import connection.ConnectionDB;

import javax.servlet.RequestDispatcher;
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
		try {
//   gia soc cuoi tuan
			String sql3 = "SELECT id, img, price, pricea, des, name FROM sanpham WHERE type =2";
			PreparedStatement a2 = ConnectionDB.getPreparedStatement(sql3);
			ResultSet b2 = a2.executeQuery(sql3);
			request.setAttribute("b2", b2);


			RequestDispatcher rd = getServletContext().getRequestDispatcher("/home.jsp");
			rd.forward(request, response);

		} catch (ClassNotFoundException | SQLException | URISyntaxException e) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/home.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
