package controller;

import model.GioHang;
import model.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CartController")
public class GioHangController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String type =null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        layTacVu(request);
        if(type != null && type.equals("add")) {
            themGioHang(request, response);
        }
        if(type != null && type.equals("xoa")) {
            xoaSanPham(request, response);
        }
        if(type != null && type.equals("capnhat")) {
            capNhat(request, response);
        }
        traVeTrangGioHang(request,response);
    }

    private  void themGioHang(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            SanPham p = SanPham.find(id);
            GioHang c = (GioHang) session.getAttribute("Cart");
            if (c==null) c=new GioHang();
            if (p!=null) c.put(p);
            session.setAttribute("Cart",c);
        }catch (NumberFormatException e){
        }
    }

    private void xoaSanPham(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            GioHang c = (GioHang) session.getAttribute("Cart");
            if (c==null) c=new GioHang();
            c.remove(id);
            session.setAttribute("Cart",c);
        }catch (NumberFormatException e){
        }
    }
    private void capNhat(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            GioHang c = (GioHang) session.getAttribute("Cart");
            if (c==null) c=new GioHang();
            c.put(id,quantity);
            session.setAttribute("Cart",c);
        }catch (NumberFormatException e){
        }
    }
    private void layTacVu(HttpServletRequest request) {
        type = request.getParameter("type");
    }
    private void traVeTrangGioHang(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        GioHang c = (GioHang) request.getSession().getAttribute("Cart");
        request.setAttribute("Cart",c);
        request.getRequestDispatcher("giohang.jsp").forward(request,response);
    }
}

