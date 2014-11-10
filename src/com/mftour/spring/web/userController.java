package com.mftour.spring.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.util.MailSenderInfo;
import com.mftour.spring.util.SimpleMailSender;


@Controller
@RequestMapping("/user")
public class userController {
	
	@Autowired
    private IUserService userService;
	
	@RequestMapping(value = "/getuserbyName",  method = {RequestMethod.POST, RequestMethod.GET})
	public String helloWorld(TUser user, Model model ) throws Exception {
		
	TUser user1 = userService.getUserByAccount(user.getName());
	
	model.addAttribute("user1", user1);
	   return "user-info-modify";

	    
		
	}

	@RequestMapping(value = "/update",  method = {RequestMethod.POST, RequestMethod.GET})
	public String update(TUser user, Model model ) throws Exception {
		
	       userService.addOrUpdate(user);
	       TUser user1 = userService.getUserByAccount(user.getName());
	
	model.addAttribute("user1", user1);
	   return "user-info";

	    
		
	}
	
	
	@RequestMapping(value = "/cancelUpdate",  method = {RequestMethod.POST, RequestMethod.GET})
	public String cancelUpdate(TUser user, Model model) throws Exception {
		
	      
	       TUser user1 = userService.getUserByAccount(user.getName());
	
	model.addAttribute("user1", user1);
	   return "user-info";

	    
		
	}
	@RequestMapping(value = "/query", method=RequestMethod.POST)
	@ResponseBody
	public String query(TUser user, Model model) throws Exception {
	
	TUser user1 = userService.getUserByAccount(user.getName());
	   if(user1!=null){
		   
			   return "success";
	   }
	   /*System.out.println(user1.getName()+"www"+user1.getPassword());*/
	    
	   return "fail";
/*	    return "user/chpasswd";*/
	    
		
	}
	@RequestMapping(value = "/queryByEmail", method=RequestMethod.POST)
	@ResponseBody
	public String queryByEmail(TUser user, Model model) throws Exception {
		TUser user1 = userService.getUserByEmail(user.getEmail());
		   if(user1!=null){
			   
				   return "success";
		   }
		   return "fail";
	}
	
	@RequestMapping(value = "/findPassword",  method = {RequestMethod.POST, RequestMethod.GET})
	public String findPassword(@RequestParam("name") String name,@RequestParam("email") String email, @RequestParam("validatecode") String validatecode,HttpServletRequest request,Model model) throws Exception {
		boolean flag=false;
		TUser user = userService.getUserByAccount(name);
		//获取验证码的值
		String random =(String)request.getSession().getAttribute("random");
		if(!random.equals(validatecode)){
			request.setAttribute("error", "输入的验证码不正确！");
			return "forget";
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
		  mailInfo.setSubject("找回密码通知"); //设置邮箱标题
		  String path = request.getContextPath();
	      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	      String resetPassHref =  basePath+"user/reset?userName="+user.getName();
	      String mainjsp = "http://www.ptobchina.com/wel";

		  String msgContent = "亲爱的用户" + user.getName() + "，您好，<br/><br/>"
	              + "您在" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + "提交找回密码的请求。请点击此链接重置您的密码<br/><br/>"
	              + "<a href="+resetPassHref+"><font color='green'>http://www.ptobchina.com/user/reset?userName="+user.getName()+"</font></a><br/><br/>"
	              +"(如果无法点击该URL链接地址，请将它复制并粘帖到浏览器的地址输入框，然后单击回车即可。)<br/><br/>"
	              + "中租宝   <a href="+mainjsp+"><font color='green'>http://www.ptobchina.com/</font></a>" + "<br/><br/>"
	              + "此为自动发送邮件，请勿直接回复！";
		  mailInfo.setContent(msgContent); //
	         //这个类主要来发送邮件
		  SimpleMailSender sms = new SimpleMailSender();
	         // sms.sendTextMail(mailInfo);//发送文体格式 
	         flag= sms.sendHtmlMail(mailInfo);//发送html格式
	         if(flag!=true){
	        	 mailInfo.setUserName("no-reply@ptobchina.com"); 
	   		  mailInfo.setPassword("12qwaszx");//您的邮箱密码 
	   		  mailInfo.setFromAddress("no-reply@ptobchina.com"); 
	   		  flag=sms.sendHtmlMail(mailInfo);
	         }
	   
		   return "FindToMail";
	}
	
	@RequestMapping(value = "/reset",  method = {RequestMethod.POST, RequestMethod.GET})
	public String reset(@RequestParam("userName") String username,Model model) throws Exception {
		model.addAttribute("name", username);
		return "resetPassword";

	}
	@RequestMapping(value = "/updatePassword",  method = {RequestMethod.POST, RequestMethod.GET})
	public String updatePassword(@RequestParam("name") String name,@RequestParam("password") String password,Model model) throws Exception {
		TUser user = userService.getUserByAccount(name);
		user.setPassword(password);
		userService.addOrUpdate(user);
		return "login";
		
	}

}
