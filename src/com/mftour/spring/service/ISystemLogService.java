package com.mftour.spring.service;

import javax.servlet.http.HttpServletRequest;



public interface ISystemLogService {
	
	public void saveSystemLog(HttpServletRequest request, String logModule,String logDescribe,int logType);

}
