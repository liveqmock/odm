package com.jiang.filter;


import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.jiang.bean.User;

public class UserFilter implements Filter {
	private static final Log logger = LogFactory.getLog(UserFilter.class);

	private static final String lOGIN_PAGE = "/index.jsp";// 不处理登录的请求页面
	
	private static final String MAINPAGE = "/odm/main.jsp";

	private static final String LOGIN_ACTION = "/Login_login";// 不处理登录处理的Action

	private static final String VERTCODE = "/Login_makeImg";// 不处理获取验证码请求

	private static final String RELOGIN = "/odm/index.jsp";// 返回到登录页面

	private static final String ENDWITH_CSS = ".css";// CSS

	private static final String ENDWITH_JS = ".js";// JS

	private static final String ENDWITH_IMG_GIF = ".gif";// IMG

	private static final String ENDWITH_IMG_PNG = ".png";// IMG

	private static final String ENDWITH_IMG_JPG = ".jpg";// IMG
	
	private static final String ENDWITH_DOC = ".doc";// DOC

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain filterChain) {
		HttpServletRequest httpReq = (HttpServletRequest) req;
		HttpServletResponse httpRes = (HttpServletResponse) res;
		try {
			httpReq.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		httpRes.setCharacterEncoding("UTF-8");

		HttpSession session = httpReq.getSession(false);
		String reqUrl = httpReq.getServletPath();
		try {
			if (reqUrl.equals(lOGIN_PAGE) || reqUrl.equals(VERTCODE)
					|| reqUrl.equals(LOGIN_ACTION)
					|| reqUrl.endsWith(ENDWITH_CSS)
					|| reqUrl.endsWith(ENDWITH_JS)
					|| reqUrl.endsWith(ENDWITH_IMG_GIF)
					|| reqUrl.endsWith(ENDWITH_IMG_JPG)
					|| reqUrl.endsWith(ENDWITH_IMG_PNG)
					|| reqUrl.endsWith(ENDWITH_DOC)) {
				filterChain.doFilter(req, res);
				return;
			} else {
				User user = null;
				if (session != null && session.getAttribute("user") != null) {
					user = (User) session.getAttribute("user");
				}
				if (user == null) {
					httpRes.sendRedirect(RELOGIN);
					return;
				}
				else
				{
					String quanxian = "";
					if(user.getQuanxian() != null )
					{
						quanxian  = user.getQuanxian();
					}
				}
			}
			if(reqUrl.split("/").length > 2)
			{
				if(reqUrl.contains("My97DatePicker") || reqUrl.contains("print")
                        || reqUrl.contains("pwd.jsp") ||reqUrl.contains("BCPKJ_DO.jsp")
                        || reqUrl.contains("AddTypeNums.jsp") ||reqUrl.contains("CPKJ_DO.jsp"))
				{
				}
				else
				{
					httpRes.sendRedirect(MAINPAGE);
				}
			}
			//logger.info("请求地址:"+req+",响应地址:"+res);
			filterChain.doFilter(req, res);
		} catch (Exception e) {

		}

	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}
}
