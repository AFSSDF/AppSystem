package cn.appsys.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.appsys.pojo.BackendUser;
import cn.appsys.pojo.DevUser;
import cn.appsys.tools.Constants;

public class SysInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String requestUrl = request.getRequestURI();
		if (requestUrl.indexOf("login") == -1) {
			if (requestUrl.indexOf("backend") != -1) {
				BackendUser backendUser = (BackendUser) session.getAttribute(Constants.BACKEND_USER_SESSION);
				if (null == backendUser) {
					response.sendRedirect(request.getContextPath() + "/403.jsp");
					return false;
				}
			} else if (requestUrl.indexOf("dev") != -1) {
				DevUser devUser = (DevUser) session.getAttribute(Constants.DEV_USER_SESSION);
				if (null == devUser) {
					response.sendRedirect(request.getContextPath() + "/403.jsp");
					return false;
				}
			}
		}
		return true;
	}
}
