package com.mftour.spring.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.service.IptopService;

@Controller
@RequestMapping("/wel")
public class zhucheController {

	@Autowired
	private IptopService ptopService;

	@Autowired
	private IProductService productService;

	@Autowired
	private IUserService userService;

	@Autowired
	private IGateService gateService;

	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET })
	public String helloWorld(Model model) throws Exception {
		int recommendType = 1;
		List<TProduct> list = productService.queryProductByType(recommendType);
		List productList=new ArrayList();
		for(TProduct product:list){
			if(product.getFinanceTime()!=null){
			long financeTime=product.getFinanceTime().getTime();
			long currTime=System.currentTimeMillis();
			if(currTime>=financeTime&&product.getProjectStatus()==1){
				product.setProjectStatus(2);//设置项目状态为融资中
			}
			}
			if(product.getFinancingProgress()>=1){
				product.setProjectStatus(3);//已满标
			}
			if(product.isLoaned()==true){
				product.setProjectStatus(4);//还款中
			}
			ptopService.addOrUpdate(product);
			productList.add(product);
		}
		model.addAttribute("list", productList);
		List<TProduct> hotlist=ptopService.queryHotproject();
		if(hotlist!=null){
		TProduct hot=hotlist.get(0);
		model.addAttribute("t", hot);
		}
		List<TNews> list1 = ptopService.getNewsbyTime();
		model.addAttribute("list1", list1);

		List<TNews> list2 = ptopService.getWebsiteNoticeByChannel();
		model.addAttribute("list2", list2);

		List<TNews> list3 = ptopService.getRepaymentNoticeByChannel();
		model.addAttribute("list3", list3);
		model.addAttribute("now", System.currentTimeMillis());
		return "index";
	}

	@RequestMapping(value = "/account", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String account(Model model, HttpServletRequest request)
			throws Exception {
		Object o = request.getSession().getAttribute("name");

		if (o != null) {
	
			TUser user1 = userService.getUserByAccount(o.toString());
		

			List<TRegisterYeePay> li = gateService
					.queryTRegisterYeePayByName(user1.getName());
			if (li != null && li.size() != 0) {
				TRegisterYeePay registerYeePay1 = li.get(0);
				model.addAttribute("registerYeePay1", registerYeePay1);
			}

			model.addAttribute("user1", user1);
			return "user-info";

		}

		return "login";
	}

	@RequestMapping(value = "/help", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String help(Model model) throws Exception {

		return "help";
	}
	
	@RequestMapping(value = "/index",method = {RequestMethod.POST, RequestMethod.GET})
	public String index(Model model) throws Exception {
		
		return "Newproduction/index";
	}
	
	@RequestMapping(value = "/indexs",method = {RequestMethod.POST, RequestMethod.GET})
	public String indexs(Model model) throws Exception {
		
		return "Newproduction/index01";
	}

}
