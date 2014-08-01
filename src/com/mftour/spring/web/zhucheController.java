package com.mftour.spring.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IProductService;

@Controller
@RequestMapping("/wel")

public class zhucheController {
	
	@Autowired
    private IProductService productService;
	
	@RequestMapping(method = {RequestMethod.POST, RequestMethod.GET})
	public String helloWorld(Model model) throws Exception {
		int recommendType=1;
		List<TProduct> list=productService.queryProductByType(recommendType);
		
		model.addAttribute("list", list);
	
		
		return "index";
	}
	
	

}
