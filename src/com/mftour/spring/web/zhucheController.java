package com.mftour.spring.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.IptopService;

@Controller
@RequestMapping("/wel")

public class zhucheController {
	
	@Autowired
    private IptopService ptopService;
	
	@Autowired
    private IProductService productService;
	
	@RequestMapping(method = {RequestMethod.POST, RequestMethod.GET})
	public String helloWorld(Model model) throws Exception {
		int recommendType=1;
		List<TProduct> list=productService.queryProductByType(recommendType);
		
		model.addAttribute("list", list);
		
		/*List<TNews> list1=ptopService.getNewsbyRecommend();
		model.addAttribute("list1", list1);*/
		      
		List<TNews> list1=ptopService.getNewsbyTime();
		model.addAttribute("list1", list1);
		
		List<TNews> list2=ptopService.getWebsiteNoticeByChannel();
		model.addAttribute("list2", list2);
		
		List<TNews> list3=ptopService.getRepaymentNoticeByChannel();
		model.addAttribute("list3", list3);

		
		return "index";
	}
	
	

}
