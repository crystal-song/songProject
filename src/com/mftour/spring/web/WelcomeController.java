package com.mftour.spring.web;

import javax.servlet.http.HttpServletRequest;

import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.util.Constants;

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
	
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String register(TUser user, Model model) throws Exception {
		
		
		 if(user.getName()!=null&&user.getName()!=""&&user.getPassword()!=null); 
	     try {
	    	 
	     userService.addOrUpdate(user);
	       } catch (Exception e) {
	            e.printStackTrace();
	           
	            throw e;
	        }
	     
	    
	return "index";
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
	
