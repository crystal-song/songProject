package com.mftour.spring.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IUserService;


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
	public String cancelUpdate(TUser user, Model model ) throws Exception {
		
	      
	       TUser user1 = userService.getUserByAccount(user.getName());
	
	model.addAttribute("user1", user1);
	   return "user-info";

	    
		
	}
	
	

}
