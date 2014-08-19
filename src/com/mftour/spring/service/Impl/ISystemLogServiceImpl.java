package com.mftour.spring.service.Impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.ISystemLogDao;
import com.mftour.spring.model.TSystemLog;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.ISystemLogService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.Common;
import com.mftour.spring.util.Constants;


@Service("systemLogService")
public class ISystemLogServiceImpl implements ISystemLogService {
	
	
	@Autowired
    private ISystemLogDao  systemLogDao;

	@Override
	public void saveSystemLog(HttpServletRequest request, String logModule,
			String logDescribe, int logType) {
		
TSystemLog syslLog=new TSystemLog();
		
		Date dt = new Date();   
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
	    syslLog.setLogCreatetime(sdf.format(dt).toString());//记录时间
	    syslLog.setLogIp(Common.getIpAddr(request));//获得客户端真实IP
	 //   syslLog.setLogIp("127.0.0.1");//获得客户端真实IP
		if(null!=request.getSession().getAttribute("Administrator"))
		{
			Object o=request.getSession().getAttribute("Administrator");
			syslLog.setLogInputusr(o.toString());//获得当前登录人
		}
		
		syslLog.setLogModule(logModule);//操作模块
		syslLog.setLogDescribe(logDescribe);//操作说明
		syslLog.setLogType(logType);//日志类型 
		try{
			systemLogDao.saveSystemLog(syslLog);;//记录到数据库
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
    
		

	

}
