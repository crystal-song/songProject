package com.mftour.spring.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mftour.spring.model.TChannel;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.service.IGuaranteeService;
import com.mftour.spring.service.IptopService;

@Controller                                 
@RequestMapping("/guarantee")
public class guaranteeController {
	
	
	@Autowired
    private IGuaranteeService guaranteeService;
	
	@Autowired
    private IptopService ptopService;
	
	
	@RequestMapping(value = "/getchannel", method = {RequestMethod.POST, RequestMethod.GET})
	public String getchannel(
			Model model
			) throws Exception {
		
		List<TChannel> list=guaranteeService.getTChannel();
	/*	List<TNews> list1=ptopService.getNews();*/
		 
		 model.addAttribute("list", list);
	/*	 model.addAttribute("list1", list1);*/
	   
		 
	
		  
		
		
		return "baozhang";
		
	}
	

	@RequestMapping(value = "/getlist", method = {RequestMethod.POST, RequestMethod.GET})
	public String getlist(
			Model model,
			TChannel channel) throws Exception {
		
		List<TChannel> list=guaranteeService.getTChannel();
		
		 model.addAttribute("list", list);
	   
		
		List<TChannel> li=ptopService.getChannelById(channel.getId());
		List<TNews> list1=ptopService.getNewsByName(li.get(0).getName());
		
		 model.addAttribute("list1", list1);
	   
		 
	
		  
		
		
		return "baozhang";
		
	}
	
	
	@RequestMapping(value = "/getTNewsById", method = {RequestMethod.POST, RequestMethod.GET})
	public String getTNewsById(
			Model model,
			TNews news) throws Exception {
		
		List<TChannel> list=guaranteeService.getTChannel();
		
		 model.addAttribute("list", list);
		
		TNews news1=ptopService.getTNewsById(news.getId());
		
		 model.addAttribute("news", news1);
	   
		  
		
		return "newxiangqing";
		
	}
	
	
	@RequestMapping(value = "/getNewslist", method = {RequestMethod.POST, RequestMethod.GET})
	public String getNewslist(
			Model model,
			TNews news) throws Exception {
		
		List<TChannel> list=guaranteeService.getTChannel();
		
		 model.addAttribute("list", list);
	   
		
		
		List<TNews> list1=ptopService.getNewsByName(news.getChannel());
		
		 model.addAttribute("list1", list1);
	   
		 
	
		  
		
		
		return "baozhang";
		
	}
	
	
	
}
