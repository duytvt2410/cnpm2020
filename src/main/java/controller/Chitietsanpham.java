package controller;

import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionDB;

@WebServlet("/Chitietsanpham")
public class Chitietsanpham extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("id");
        try {


            String sql1 = "SELECT id, des,name,img, price, pricea, tinhtrang, dungluong, dungluonga, mausac, mausaca, manhinh, hedieuhanh, cameratruoc, camerasau, cpu, ram, bonhotrong, thesim, dungluongpin, mota, tinhnang, noidung, imgdemo, noidunga, imgdemoa, noidungb, imgdemob FROM sanpham WHERE active=1 ";
            

            if (type != null) sql1 += " and id=" + type;
            
            PreparedStatement s1 = ConnectionDB.getPreparedStatement(sql1);
            ResultSet p = s1.executeQuery();
            request.setAttribute("p", p);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/chitietsanpham.jsp");
            rd.forward(request, response);

        } catch (ClassNotFoundException | SQLException  e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
