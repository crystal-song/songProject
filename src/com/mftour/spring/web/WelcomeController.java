package com.mftour.spring.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.util.Constants;
import com.mftour.spring.util.MailSenderInfo;
import com.mftour.spring.util.SimpleMailSender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

/*
 * 不需要实现任何接口，也不需要继承任何的类，也不需要任何 Servlet API
 */
@Controller
@RequestMapping("/welcome")
//将Model中属性名为Constants.USER_INFO_SESSION的属性放到Session属性列表中，以便这个属性可以跨请求访问
@SessionAttributes(Constants.USER_INFO_SESSION)
public class WelcomeController {

	@Autowired
    private IUserService userService;
	
	@Autowired
    private IGateService gateService;
  
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	@ResponseBody
	public String helloWorld(TUser user, Model model,@RequestParam("name") String username,@RequestParam("password") String password ) throws Exception {
		
		
		
	TUser user1 = userService.getUserByAccount(user.getName());
	
	   if(user1!=null){
		   if(user1.getPassword().equals(user.getPassword())){
			   model.addAttribute("name", user.getName()); 
			   return "success";
		   }
	   }
	   return "fail";
/*	    return "user/chpasswd";*/
	    
		
	}
	@RequestMapping(value = "/logout",  method = {RequestMethod.POST, RequestMethod.GET})
	public String logout(HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("name");
		return "login";
	}
	
	@RequestMapping(value = "/regEmail", method=RequestMethod.POST)
	public String regEemail(TUser user, Model model,HttpServletRequest request) throws Exception {
		boolean flag=false;
			if(user.getName()!=null&&user.getName()!=""&&user.getPassword()!=null); 
			try {
				user.setRegState("f");
				userService.addOrUpdate(user);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			model.addAttribute("user1", user);
	         //这个类主要是设置邮件
		  MailSenderInfo mailInfo = new MailSenderInfo(); 
		  mailInfo.setMailServerHost("smtp.ptobchina.com"); 
		  mailInfo.setMailServerPort("25"); 
		  mailInfo.setValidate(true);  
		  mailInfo.setUserName("cs@ptobchina.com"); 
		  mailInfo.setPassword("12qwaszx");//您的邮箱密码 
		  mailInfo.setFromAddress("cs@ptobchina.com"); 
		  mailInfo.setToAddress(user.getEmail()); 
		  mailInfo.setSubject("中租宝-用户注册确认邮件"); //设置邮箱标题
		  String path = request.getContextPath();
	      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	      String resetPassHref =  basePath+"welcome/register?username="+user.getName();
	      String mainjsp = "http://www.ptobchina.com/wel";

		  String msgContent = "亲爱的用户" + user.getName() + "，您好，<br/><br/>"
	              + "您在" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + "注册中租宝帐号，请点击以下链接完成注册：<br/><br/>"
	              + "<a href="+resetPassHref+"><font color='green'>http://www.ptobchina.com/welcome/register?username="+user.getName()+"</font></a><br/><br/>"
	              +"(如果无法点击该URL链接地址，请将它复制并粘帖到浏览器的地址输入框，然后单击回车即可。)<br/><br/>"
	              + "中租宝   <a href="+mainjsp+"><font color='green'>http://www.ptobchina.com/</font></a>" + "<br/><br/>"
	              + "此为自动发送邮件，请勿直接回复！";
		  mailInfo.setContent(msgContent); //
	         //这个类主要来发送邮件
		  SimpleMailSender sms = new SimpleMailSender();
	         // sms.sendTextMail(mailInfo);//发送文体格式  
	         flag= sms.sendHtmlMail(mailInfo);//发送html格式
	         System.out.println("assssssssssss"+flag);
	         if(flag!=true){
	        	 mailInfo.setUserName("no-reply@ptobchina.com"); 
	        	 mailInfo.setPassword("12qwaszx");//您的邮箱密码 
	        	 mailInfo.setFromAddress("no-reply@ptobchina.com"); 
	        	 flag=sms.sendHtmlMail(mailInfo);
	         }
	
	return "reg_email";
}
	@RequestMapping(value = "/register", method = {RequestMethod.POST, RequestMethod.GET})
	public String register(@RequestParam("username") String username,Model model) throws Exception {
		TUser user = userService.getUserByAccount(username);
		user.setRegState("s");
		userService.addOrUpdate(user);
		model.addAttribute("regState", user.getRegState());
		return "reg_success";
	}
	
	
	@RequestMapping(value = "/session", method = {RequestMethod.POST, RequestMethod.GET})
	public String Session( Model model,TUser user,HttpServletRequest request) throws Exception {
		request.getSession().setAttribute("name",user.getName()); 
		TUser user1 = userService.getUserByAccount(user.getName());
		model.addAttribute("user1", user1); 
	
		TRegisterYeePay registerYeePay1= gateService.queryTRegisterYeePayByName(user1.getName()).get(0); 
		model.addAttribute("registerYeePay1", registerYeePay1);
//		request.getSession().setAttribute("users", username);
		return "user-info";
}
	    
		
	@RequestMapping(value = "/queryUser", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String queryUser( Model model,TUser user) throws Exception {
	
		TUser user1 = userService.getUserByAccount(user.getName());
	            if(user1!=null){ 
	            	  return "success";
	            }
//		      
		return "fail"; 
}
	
	
	
	
	
	/*@RequestMapping(value = "/regis" , method=RequestMethod.POST)
	public String register(TUser user, Model model) throws Exception {
		     if(user.getName()!=null&&user.getName()!=""&&user.getPassword()!=null); 
		     try {
		    	 
		     userService.addOrUpdate(user);
		       } catch (Exception e) {
		            e.printStackTrace();
		           
		            throw e;
		        }
		     
		    
		return null;
}
	*/
}
	
