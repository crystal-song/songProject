package com.mftour.spring.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mftour.spring.model.TUser;

@Controller
@RequestMapping("/wel")

public class zhucheController {
	
	@RequestMapping(method=RequestMethod.POST)
	public String helloWorld(TUser user, Model model) throws Exception {
		System.out.println("ddddddddddddddddddd");
		
		return null;
	}
	
	

}
