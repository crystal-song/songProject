package com.mftour.spring.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.mftour.spring.model.TInterestRate;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.MapUtil;
import com.mftour.spring.util.Page;

@Controller
@RequestMapping("/product")
public class productController {

	@Autowired
	private IProductService productService;

	@Autowired

    private IptopService ptopService;
	
	@RequestMapping(value = "/allProduct", method = {RequestMethod.POST, RequestMethod.GET})
	public String allProduct( @RequestParam(value = "pageNo",required=false, defaultValue= "1") int pageNo,
			@RequestParam(value = "pageSize",required=false, defaultValue= "6") int pageSize,
			@RequestParam(value = "name",required=false,defaultValue="") String name,
			Model model,
			TProduct product) throws Exception {
		    /*int pageNo=product.getPageNo();*/
		
		 Page page = Page.newBuilder(pageNo, pageSize, "allProduct");
		
		 
		 
			//加入分页元素
				/*if(null!=product){
					Map params=MapUtil.ConvertObjToMap(product);
					page.getParams().put("name",name);
				}*/
				
		 
		 List<TProduct> list=productService.getProduct(page,product);
		 List productList=new ArrayList();
			for(TProduct product1:list){
				if(product1.getFinanceTime()!=null){
				long financeTime=new SimpleDateFormat("yyyy-MM-dd").parse(product1.getFinanceTime()).getTime();
				long currTime=System.currentTimeMillis();
				if(currTime>=financeTime&&product1.getProjectStatus()==1){
					product1.setProjectStatus(2);//设置项目状态为融资中
					ptopService.addOrUpdate(product1);
					
				}
				}
				productList.add(product1);
			}
			model.addAttribute("list", productList);
			
		  model.addAttribute("page", page);
		  model.addAttribute("product", product);
		  
		  List<TNews> list1=ptopService.getNewsbyTime();
			model.addAttribute("list1", list1);
			
			List<TNews> list2=ptopService.getWebsiteNoticeByChannel();
			model.addAttribute("list2", list2);
			
			List<TNews> list3=ptopService.getRepaymentNoticeByChannel();
			model.addAttribute("list3", list3);
		

		return "touzi";

	}

	@RequestMapping(value = "/session", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String Session(Model model, @RequestParam("pageNo") String pageNo)
			throws Exception {

		/* model.addAttribute("name",user.getName()); */

		// request.getSession().setAttribute("users", username);
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String helloWorld(Model model, @RequestParam("name") String username)
			throws Exception {

		return "fail";
	

	}

	@RequestMapping(value = "/getProductByid", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getProductByid(@RequestParam("id") Long id, Model model,
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			TProduct product) throws Exception {
		Page page = Page.newBuilder(pageNo, pageSize, "getProductByid");
		TProduct product1 = productService.getProductById(id);
		List<TInvestmentInfo> list = ptopService
				.queryInvestmentInfoByNumber(page,product1.getEnterpriseNumber());
		List<TInterestRate> li = ptopService
				.queryTInterestRateByNumber(product1.getEnterpriseNumber());
		if (li != null && li.size() != 0) {
			model.addAttribute("li", li);
			
		}

		model.addAttribute("product1", product1);
		model.addAttribute("list", list);

		List<TNews> list1 = ptopService.getNewsbyTime();
		model.addAttribute("list1", list1);

		List<TNews> list2 = ptopService.getWebsiteNoticeByChannel();
		model.addAttribute("list2", list2);

		List<TNews> list3 = ptopService.getRepaymentNoticeByChannel();
		model.addAttribute("list3", list3);

		model.addAttribute("page", page);
		return "touzixiangxi";
		/* return "payment/register"; */

	}

	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET })
	/* @ResponseBody */
	public String recommend(Model model, @RequestParam("type") String type)
			throws Exception {
		int recommendType = Integer.parseInt(type);
		List<TProduct> list = productService.queryProductByType(recommendType);

		model.addAttribute("list", list);

		return "index";
	

	}

}
