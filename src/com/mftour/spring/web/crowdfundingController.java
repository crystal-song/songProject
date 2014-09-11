package com.mftour.spring.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mftour.spring.model.TCrowdfunding;
import com.mftour.spring.model.TCrowdfundingCommodity;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.service.ICrowdfundingService;
import com.mftour.spring.service.IGuaranteeService;
import com.mftour.spring.util.Page;


@Controller
@RequestMapping("/crowdfunding")
public class crowdfundingController {
	
	@Autowired
    private ICrowdfundingService crowdfundingService;
	
	
	@RequestMapping(value = "/allCrowdfunding", method = {RequestMethod.POST, RequestMethod.GET})
	public String allProduct( @RequestParam(value = "pageNo",required=false, defaultValue= "1") int pageNo,
			@RequestParam(value = "pageSize",required=false, defaultValue= "2") int pageSize,
			@RequestParam(value = "name",required=false,defaultValue="") String name,
			Model model,
			TCrowdfunding crowdfunding) throws Exception {
		    /*int pageNo=product.getPageNo();*/
		
		 Page page = Page.newBuilder(pageNo, pageSize, "allProduct");
		
		 
		 
			//加入分页元素
				/*if(null!=product){
					Map params=MapUtil.ConvertObjToMap(product);
					page.getParams().put("name",name);
				}*/
				
		 List<TCrowdfunding> list=crowdfundingService.getCrowdfunding(page, crowdfunding);
		   /* System.out.println("dddddddddddddddddddd"+list.get(3).getName());*/
		 
		 model.addAttribute("list", list);
		  model.addAttribute("page", page);
		  model.addAttribute("crowdfunding", crowdfunding);
		
		return "production-show";
		
	}
	
	

	@RequestMapping(value = "/getCrowdfundingByid", method = {RequestMethod.POST, RequestMethod.GET})
	public String getProductByid(@RequestParam("id") Long id,
			Model model,
			TCrowdfunding crowdfunding) throws Exception {
		
		
	
		 
		TCrowdfunding crowdfunding1= crowdfundingService.getCrowdfundingById(id);
		
		List<TCrowdfundingCommodity> list =crowdfundingService.queryTCrowdfundingCommodityByNumber(crowdfunding1.getProjectNumber());
		  
		 model.addAttribute("crowdfunding1", crowdfunding1);
		 
		 model.addAttribute("list", list);
		
		
		
		return "production-jianjie";
		
	}

}
