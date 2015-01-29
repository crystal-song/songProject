package com.mftour.spring.web;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	private static final Logger logger = LoggerFactory
			.getLogger(AccountController.class);
	private static final File f = ReadWirtePropertis.file();

	@RequestMapping(value = "/loanProduct", method = { RequestMethod.GET,
			RequestMethod.POST }) 
	public String loanProduct(
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			Model model,HttpServletRequest request) {
		try {
			String username=(String)request.getSession().getAttribute("name");
			if(username==null){
				return "login";
			}
			Page page = Page.newBuilder(pageNo, pageSize, "loanProduct");
			List<TProduct> list = productService
					.queryProductByTargetPlatformUserNo(page, username);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			return "myLoan";
		} catch (Exception e) {
			logger.error("error" + e);
			return "error";
		}

	}
	
	@RequestMapping(value = "/loanManage", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String loanManage(
			@RequestParam("enterpriseNumber") String enterpriseNumber,
			Model model,HttpServletRequest request) {
		try {
			String username=(String)request.getSession().getAttribute("name");
			if(username==null){
				return "login";
			}
			List<TProduct> list = productService
					.queryProductByNumber(enterpriseNumber);
			if (list != null && list.size() > 0) {
				model.addAttribute("product", list.get(0));
			}
			List<ProductRepays> productrepaysList = productService
					.queryProductRepaysByNumber(enterpriseNumber);
			model.addAttribute("productrepaysList", productrepaysList);
			return "loanOrder";
		} catch (Exception e) {
			logger.error("error" + e);
			return "error";
		}
		
	}

	@RequestMapping(value = "/loanDetail", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String loanDetail(
			@RequestParam("enterpriseNumber") String enterpriseNumber,
			@RequestParam("id") int id, @RequestParam("period") int period,
			Model model, HttpServletRequest request) {
		try {
			String username=(String)request.getSession().getAttribute("name");
			if(username==null){
				return "login";
			}
			List<TProduct> list = productService
					.queryProductByNumber(enterpriseNumber);
			if (list != null && list.size() > 0) {
				model.addAttribute("product", list.get(0));
			}
			ProductRepays productrepay = productService
					.queryProductRepaysByid(id);
			model.addAttribute("productrepay", productrepay);

			// 查询账户余额
			Accounts account = userService.getAccountByName(username);
			model.addAttribute("avaliableMoney", account.getAvailableMoney());
			List<UserRepays> userrepaysList = productService
					.queryUserRepaysByPeriod(period, enterpriseNumber);
			double total = 0;
			for (UserRepays userrepay : userrepaysList) {
				total = userrepay.getAmount().add(userrepay.getInterest())
						.doubleValue()+total;
			}
			model.addAttribute("userrepaysList", userrepaysList);
			model.addAttribute("total", total);
			return "loanDetail";
		} catch (Exception e) {
			logger.error("error" + e);
			return "error";
		}
		
	}
}
