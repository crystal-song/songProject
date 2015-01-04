package com.mftour.spring.util;

import com.mftour.spring.model.TUser;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA. User: Administrator Date: 13-11-27 Time: 下午5:34
 */
public class ServletUtils {

	public static TUser getUser(HttpServletRequest request) {
		return (TUser) request.getSession().getAttribute(
				Constants.USER_INFO_SESSION);
	}
}
