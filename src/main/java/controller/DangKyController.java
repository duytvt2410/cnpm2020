package controller;

import dao.TaiKhoanDao;
import model.TaiKhoan;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/dangky")
public class DangKyController extends HttpServlet {
    TaiKhoan taiKhoan = null;
    TaiKhoanDao taiKhoanDao = new TaiKhoanDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Use case: Đăng ký.
        //B2. Hệ thống gọi phương thức trả về trang đăng ký.
        traVeTrangDangKy(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        taiKhoan = layThongTinDangKy(request);
        kiemTraThongTinDangKy(taiKhoan, request, response);
    }

    //    Phương thức trả về trang đăng ký:
    private void traVeTrangDangKy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
        rd.forward(request, response);
    }

        //Use case: Đăng ký.
        // B3: Hệ thống lấy thông tin người dùng vừa nhập,
        //kiểm tra xem tài khoản đã tồn tại hay chưa, kiểm tra thông tin mà người dùng nhập có đúng định dạng hay không.
        //Có 2 trường hợp:
    private TaiKhoan layThongTinDangKy(HttpServletRequest request) {
        TaiKhoan tk = new TaiKhoan();
        tk.setTenDangNhap(request.getParameter("uname"));
        tk.setEmail(request.getParameter("uemail"));
        tk.setMatKhau(request.getParameter("pwd"));
        return tk;
    }

    private void kiemTraThongTinDangKy(TaiKhoan taiKhoan, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = taiKhoan.getTenDangNhap();
        String email = taiKhoan.getEmail();
        String password = taiKhoan.getMatKhau();
        String re_password = request.getParameter("pwd1");
        String regex_email = "^[A-Za-z0-9]+([_\\.\\-]?[A-Za-z0-9])*@[A-Za-z0-9]+([\\.\\-]?[A-Za-z0-9]+)*(\\.[A-Za-z]+)+$";
        String regex_password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\\$%\\^&\\*]).{8,}$";
        String name_error = "";
        String email_error = "";
        String password_error = "";
        String repass_error = "";

        //Use case: Đăng ký.
        // B3.1. Nếu kiểm tra thông tin đăng ký là sai: hiển thị các thông báo sai tương ứng ở form
        //(các trường rỗng, email sai định dạng, mật khẩu không đủ mạnh, mật khẩu nhập lại chưa đúng).
        if (name.equals("")) {
            name_error = "✖ Vui lòng nhập tên!";
        } else if (taiKhoanDao.kiemTraTaiKhoan(name) == true) {
            name_error = "✖ Địa chỉ đã được đăng ký";
        }
        if (name_error.length() > 0) {
            request.setAttribute("name_error", name_error);
        }
        //Kiểm tra email:
        if (email.equals("")) {
            email_error = "✖ Vui lòng nhập email";
        } else if (taiKhoanDao.regexMatches(regex_email, email) == false) {
            email_error = "✖ Email sai định dạng";
        }
        if (email_error.length() > 0) {
            request.setAttribute("email_error", email_error);
        }
        //Kiểm tra mật khẩu:
        if (password.equals("")) {
            password_error = "✖ Vui lòng nhập mật khẩu";
        } else if (taiKhoanDao.regexMatches(regex_password, password) == false) {
            password_error = "✖ Mật khẩu không đủ mạnh";
        }
        if (password_error.length() > 0) {
            request.setAttribute("password_err", password_error);
        }
        //Kiểm tra người dùng nhập lại mật khẩu có đúng không:
        if (re_password.equals("")) {
            repass_error = "✖ Vui lòng xác nhận lại mật khẩu";
        } else if (!re_password.equals(password)) {
            repass_error = "✖ Mật khẩu nhập lại không đúng!";
        }
        if (repass_error.length() > 0) {
            request.setAttribute("repass_err", repass_error);
        }
        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("password", password);
        request.setAttribute("repass", re_password);
        String url = "/register.jsp";

        try {
            //Use case: Đăng ký.
            //B3.2. Nếu kiểm tra thông tin đăng ký là đúng: lưu thông tin đăng ký của người dùng
            //vào database, chuyển đến trang đăng nhập.
            if (name_error.length() == 0 && email_error.length() == 0 && password_error.length() == 0 && repass_error.length() == 0) {
                Date id = new Date();
                taiKhoan = new TaiKhoan("" + id.getTime(), name, email, taiKhoanDao.maHoaMD5(password), 2, 1);
                taiKhoanDao.themTaiKhoan(taiKhoan);
                url = "/sign.jsp";
            } else {
                url = "/register.jsp";
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
