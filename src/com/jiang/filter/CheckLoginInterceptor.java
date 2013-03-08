package com.jiang.filter;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.jiang.action.LoginAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 拦截器 拦截没有登录的用户
 * 
 * @author  AbstractInterceptor 抽象类
 */
public class CheckLoginInterceptor extends AbstractInterceptor {
	public static ActionContext ctx;
	public static Map sessionMap = null;
	private Logger log = Logger.getLogger(CheckLoginInterceptor.class);
	String task = "userLogin";

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		ctx = actionInvocation.getInvocationContext();
	
		sessionMap = actionInvocation.getInvocationContext().getSession();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(ServletActionContext.HTTP_REQUEST);
		String user_session_key = "user";// 默认的key
		// not to intercepted on loginAction
		Object action = actionInvocation.getAction();
		String returnStr = "relogin";
		if (action instanceof LoginAction) {
			actionInvocation.invoke();
			return returnStr;
		} else {
			// check session
			@SuppressWarnings("unused")
			Object okk = sessionMap.get(user_session_key);
			// if userName already login
			if (okk != null) {
				actionInvocation.invoke();
			} else {// no login
				return returnStr;
			}
		}
		return null;
	}

}


