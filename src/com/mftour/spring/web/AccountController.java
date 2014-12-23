package com.mftour.spring.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mftour.spring.logic.Account;
import com.mftour.spring.model.Rewards;
import com.mftour.spring.model.TUser;
import com.mftour.spring.rest.bean.AccountResponse;
import com.mftour.spring.rest.bean.Page;


@Controller
@RequestMapping("/account")
public class AccountController {
	
	@RequestMapping(value = "/liquan", method = {RequestMethod.GET }) 
	public String liquan(TUser user, Model model, HttpServletRequest request, @RequestParam("page") int page, @RequestParam("catlog") String  catlog) throws Exception {
		
		Object o = request.getSession().getAttribute("name");
		if(o!=null){
			Page<Rewards> pages = Account.getRewardsPage(o.toString(), page, catlog);
			if (pages.isSuccess()){
				
				model.addAttribute("catlog",catlog);
				model.addAttribute("page", pages);
				model.addAttribute("list", pages.getList());
				return "liquan";
			}else{
				return "error";
			}			
		}else{
			return "login";
		}

	

	}



	@RequestMapping(value = "/tuijian", method = {RequestMethod.GET })
	public String tuijian(Model model, HttpServletRequest request) throws Exception {
		String page = request.getParameter("page");
		if (page == null){
			page = "1";
		}
		Object o = request.getSession().getAttribute("name");
		if (o!=null){
			Page<TUser> pages = Account.getRefsPage(o.toString(), Integer.parseInt(page));
			if (pages.isSuccess()){
				model.addAttribute("ref", request.getSession().getAttribute("ref"));
				model.addAttribute("username",o.toString());
				model.addAttribute("page", pages);
				model.addAttribute("list", pages.getList());
				return "tuijian";
			}else{
				return "error";
			}
		}else{
			return "login";
		}



	}
}
