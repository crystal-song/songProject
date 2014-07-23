package com.mftour.spring.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.util.MapUtil;
import com.mftour.spring.util.Page;




@Controller
@RequestMapping("/product")
public class productController {
	
	@Autowired
    private IProductService productService;
	
	@RequestMapping(value = "/allProduct", method = {RequestMethod.POST, RequestMethod.GET})
	public String allProduct( @RequestParam(value = "pageNo",required=false, defaultValue= "1") int pageNo,
			@RequestParam(value = "pageSize",required=false, defaultValue= "4") int pageSize,
			@RequestParam(value = "name",required=false,defaultValue="") String name,
			Model model
			/*TProduct product*/) throws Exception {
		
		
		 Page page = Page.newBuilder(pageNo, pageSize, "allProduct");
		 
		 
			//加入分页元素
				/*if(null!=product){
					Map params=MapUtil.ConvertObjToMap(product);
					page.getParams().put("name",name);
				}*/
				
		 
		 List<TProduct> list=productService.getProduct(page);
		  
		  model.addAttribute("list", list);
		  model.addAttribute("page", page);
		
		return "touzi";
		
	}
	
	
	@RequestMapping(value = "/session", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String Session( Model model,@RequestParam("pageNo") String pageNo) throws Exception {
	
		
		
		 	 
		/*model.addAttribute("name",user.getName());*/ 
	     
//		request.getSession().setAttribute("users", username);
		return "index";
}
	
	
	
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	@ResponseBody
	public String helloWorld( Model model,@RequestParam("name") String username ) throws Exception {
		
		
		
	
	
	
	   /*System.out.println(user1.getName()+"www"+user1.getPassword());*/
	    
	   return "fail";
/*	    return "user/chpasswd";*/
	    
		
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/getProductByid", method = {RequestMethod.POST, RequestMethod.GET})
	public String getProductByid(@RequestParam("id") Long id,
			Model model,
			TProduct product) throws Exception {
		
		
	
		 
		TProduct product1= productService.getProductById(id);
		  
		 model.addAttribute("product1", product1);
		
		return "touzixiangxi";
		
	}


}
