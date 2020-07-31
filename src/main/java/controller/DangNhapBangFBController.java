package controller;

import dao.TaiKhoanDao;
import model.TaiKhoan;

import javax.servlet.RequestDispatcher;
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

import java.io.IOException;
import java.net.URISyntaxException;

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
		String code = request.getParameter("code");

		if (code == null || code.isEmpty()) {
			response.sendRedirect(request.getContextPath()+"/dangnhap");
		} else {
			String accessToken = getToken(code);
			User user = getUserInfo(accessToken);
			taiKhoan = new TaiKhoan(user.getId(), user.getName(), "", "", "", 2, 1);
			if(taiKhoanDao.kiemTraTaiKhoanTheoId(taiKhoan.getMaTaiKhoan()) == false) {
				try {
					taiKhoanDao.themTaiKhoan(taiKhoan);
				} catch (URISyntaxException e) {
					e.printStackTrace();
				}
			}
			HttpSession session = request.getSession();
            session.setAttribute("Auth", taiKhoan);
            response.sendRedirect(request.getContextPath()+"/trangchu");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	
	private static String getToken(final String code) throws ClientProtocolException, IOException {
	    String link = String.format(FACEBOOK_LINK_GET_TOKEN, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, FACEBOOK_REDIRECT_URL, code);
	    String response = Request.Get(link).execute().returnContent().asString();
	    JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
	    String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
	    return accessToken;
	  }
	  
	private static User getUserInfo(String accessToken) {
	    FacebookClient facebookClient = new DefaultFacebookClient(accessToken, FACEBOOK_APP_SECRET, Version.LATEST);
	    return facebookClient.fetchObject("me", User.class);
	  }
}
