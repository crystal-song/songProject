package com.mftour.spring.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MyHandlerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		/*String url = request.getScheme() + "://";
		url += request.getHeader("host");*/
	       String	   url = request.getRequestURI();
		if (request.getQueryString() != null)
			url += "?" + request.getQueryString();
		if(!url.equals("/welcome/login")&&!url.equals("/welcome/logout")&&!url.equals("/welcome/session"))
		request.getSession().setAttribute("url", url);
		System.out.println(url);
		return true;
	}

}
