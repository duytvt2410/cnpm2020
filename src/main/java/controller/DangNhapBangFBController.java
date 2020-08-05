package controller;

import java.io.IOException;
import java.net.URISyntaxException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.types.User;

import dao.TaiKhoanDao;
import model.TaiKhoan;

@WebServlet("/dangnhapbangFB")
public class DangNhapBangFBController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	TaiKhoan taiKhoan = null;
	TaiKhoanDao taiKhoanDao = new TaiKhoanDao();
	
	public static String FACEBOOK_APP_ID = "608201396794677";
	  public static String FACEBOOK_APP_SECRET = "fca8303172cb94314f2502dce81dc371";
	  public static String FACEBOOK_REDIRECT_URL = "https://cnpm2020.herokuapp.com/dangnhapbangFB";
	  public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		//3.2.1: Hệ thống lấy mã code từ Facebook gửi về
		String code = request.getParameter("code");
		if (code == null || code.isEmpty()) {
			response.sendRedirect(request.getContextPath()+"/dangnhap");
		} else {
			//3.2.2: Hệ thống lấy  chuỗi mãtoken từ code của Faceook
			String accessToken = layToken(code);
			
			//3.2.3: Hệ thống lấy thông tin người dừng từ chuỗi token
			taiKhoan = layThongTinNguoiDung(accessToken);
			
			//3.2.4: Hệ thống kiểm tra mã Id của tài khoản người dùng
			//-- Nếu chưa có thì thêm vào database
			if(taiKhoanDao.kiemTraTaiKhoanTheoId(taiKhoan.getMaTaiKhoan()) == false) {
				try {
					taiKhoanDao.themTaiKhoan(taiKhoan);
				} catch (URISyntaxException e) {
					e.printStackTrace();
				}
			}
			
			//3.2.5: Hệ thống duy trì trạng thái đăng nhập 
			HttpSession session = request.getSession();
            session.setAttribute("Auth", taiKhoan);
            response.sendRedirect(request.getContextPath()+"/trangchu");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	
	private static String layToken(final String code) throws ClientProtocolException, IOException {
	    String link = String.format(FACEBOOK_LINK_GET_TOKEN, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, FACEBOOK_REDIRECT_URL, code);
	    String response = Request.Get(link).execute().returnContent().asString();
	    JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
	    String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
	    return accessToken;
	  }
	  
	private static TaiKhoan layThongTinNguoiDung(String maToken) {
		
	    FacebookClient facebookClient = new DefaultFacebookClient(maToken, FACEBOOK_APP_SECRET, Version.LATEST);
	    User user = facebookClient.fetchObject("me", User.class);
	    
	    return new TaiKhoan(user.getId(), user.getName(), "", "", "", 2, 1);
	  }
}
