package com.mftour.spring.web;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.model.Accounts;
import com.mftour.spring.model.ProductRepays;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TUser;
import com.mftour.spring.model.UserRepays;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.util.File;
import com.mftour.spring.util.Page;
import com.mftour.spring.util.ReadWirtePropertis;

@Controller
@RequestMapping("/loan")
public class LoanController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IProductService productService;
	@Autowired
	private IGateService gateService;
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	private static final File f = ReadWirtePropertis.file();
	@RequestMapping(value = "/loanProduct", method = {RequestMethod.GET,RequestMethod.POST }) 
	public String loanProduct(@RequestParam(value = "pageNo",required=false, defaultValue= "1") int pageNo,
			@RequestParam(value = "pageSize",required=false, defaultValue= "3") int pageSize,@RequestParam("username" ) String username,Model model){
		try {
			 Page page = Page.newBuilder(pageNo, pageSize, "loanProduct");
			List<TProduct> list=productService.queryProductByTargetPlatformUserNo(page,username);
			model.addAttribute("list", list); 
			model.addAttribute("page", page); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "myLoan";
	}
	@RequestMapping(value = "/checkAvaliMoney", method = {RequestMethod.GET,RequestMethod.POST }) 
	@ResponseBody
	public String checkAavaliMoney(@RequestParam("total" ) double total,HttpServletRequest request){
		String username=(String)request.getSession().getAttribute("name");
	      Accounts account;
		try {
			account = userService.getAccountByName(username);
			  if(account.getAvailableMoney().doubleValue()>=total){
					return "success";
	} 
		} catch (Exception e) {
			e.printStackTrace();
		}
	  
		return "fail";
	}
	@RequestMapping(value = "/checkIsBorrow", method = {RequestMethod.GET,RequestMethod.POST }) 
	@ResponseBody
	public String checkIsBorrow(@RequestParam("username" ) String username){
		try {
			TUser user=userService.getUserByAccount(username);
			if(user.getIsborrow()==true){
						return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	@RequestMapping(value="/loanManage",method={RequestMethod.GET,RequestMethod.POST})
	public String loanManage(@RequestParam("enterpriseNumber" )String enterpriseNumber,Model model){
		try {
			List list=productService.queryProductByNumber(enterpriseNumber);
			if(list!=null&&list.size()>0){
			model.addAttribute("product", list.get(0));
			}
			List<ProductRepays> productrepaysList=productService.queryProductRepaysByNumber(enterpriseNumber);
			model.addAttribute("productrepaysList", productrepaysList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "loanOrder";
	}
	@RequestMapping(value="/loanDetail",method={RequestMethod.GET,RequestMethod.POST})
	public String loanDetail(@RequestParam("enterpriseNumber" )String enterpriseNumber,@RequestParam("id" ) int id,@RequestParam("period" ) int period,Model model,HttpServletRequest request){
		try {
			List<TProduct> list=productService.queryProductByNumber(enterpriseNumber);
			if(list!=null&&list.size()>0){
			model.addAttribute("product", list.get(0));
			}
			ProductRepays productrepay=productService.queryProductRepaysByid(id);
			model.addAttribute("productrepay", productrepay);
			
			//查询账户余额
			String username=(String)request.getSession().getAttribute("name");
			Accounts account=userService.getAccountByName(username);
			model.addAttribute("avaliableMoney", account.getAvailableMoney());
			List<UserRepays> userrepaysList=productService.queryUserRepaysByPeriod(period, enterpriseNumber);
			double total=0;
			for(UserRepays userrepay:userrepaysList){
				total+=userrepay.getAmount().add(userrepay.getInterest()).doubleValue();
			}
			model.addAttribute("userrepaysList", userrepaysList);
			model.addAttribute("total", total);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "loanDetail";
	}
}
