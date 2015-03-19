package com.mftour.spring.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.mftour.spring.base.JsonBaseBean;
import com.mftour.spring.logic.YeePay;
import com.mftour.spring.rest.bean.Campasigns;
import com.mftour.spring.rest.bean.Page;
import com.mftour.spring.rest.bean.Reward;
import com.mftour.spring.rest.bean.Address;

import javax.servlet.http.HttpServletRequest;

import com.mftour.spring.util.File;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.Rest;
import com.mftour.spring.rest.bean.Payment;
@Controller
@RequestMapping("/hero")
public class HeroController {

	private static final File f = ReadWirtePropertis.file();
	private static final Logger logger = LoggerFactory
			.getLogger(YeePay.class);
	private static Rest rest = new Rest();

	@RequestMapping(value = "/all", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String allProduct(
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
			@RequestParam(value = "pageSize", required = false, defaultValue = "8") int pageSize,
			@RequestParam(value = "status", required = false, defaultValue = "0") String status,
			Model model) throws Exception {

		String s = rest.getRestful("/rest/get-zhongchou-by-page/"+pageNo+"/"+pageSize+"/"+status);
		model.addAttribute("status", status);
		@SuppressWarnings("unchecked")
		Page<Campasigns> heros = JSON.parseObject(s, Page.class);
	    if (heros.isSuccess()){
			model.addAttribute("heros", heros);
			return "hero/index";	
	    }	
	    else{
	    	return "500";
	    }
	


	}

	

	@RequestMapping(value = "/my", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String mylist(
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
			Model model, HttpServletRequest req) throws Exception {
		Object o = req.getSession().getAttribute("name");
		if (o == null) {
			return "login";
		}
		String s = rest.getRestful("/rest/get-payments-by-page/"+pageNo+"/"+o.toString());
		
		@SuppressWarnings("unchecked")
		Page<Payment> payments = JSON.parseObject(s, Page.class);
	    if (payments.isSuccess()){
			model.addAttribute("payments", payments);
			return "hero/list";	
	    }	
	    else{
	    	return "error";
	    }
	


	}
	
	@RequestMapping(value = "/add/address", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String addAddress(String province,String city,String name,String detail,String phone,String code,
			Model model, HttpServletRequest req) throws Exception {
		Object o = req.getSession().getAttribute("name");
		if (o == null) {
			return "login";
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("province", province);
		map.put("city", city);
		map.put("userid", o.toString());
		map.put("name", name);
		map.put("detail", detail);
		map.put("phone", phone);
		map.put("code", code);
	
		String s = rest.postRestful("/rest/address/add", map);
		return s;


	}
	
	@RequestMapping(value = "/del/address", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String addAddress(int id,
			Model model, HttpServletRequest req) throws Exception {
		Object o = req.getSession().getAttribute("name");
		if (o == null) {
			return "login";
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
	
		String s = rest.postRestful("/rest/address/del", map);
		return s;


	}
	@RequestMapping(value = "/get-by-id", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String getProductByid(@RequestParam("id") Long id, Model model) throws Exception {

	String s = rest.getRestful("/rest/get-hero-by-id/"+id);
	String rewardString = rest.getRestful("/rest/get-reward-by-heroid/"+id);
	@SuppressWarnings("unchecked")
	List<Reward>  rewards = JSON.parseObject(rewardString, ArrayList.class);
		Campasigns hero = JSON.parseObject(s, Campasigns.class);
				
		if(hero.isSuccess()){
			model.addAttribute("hero", hero);	
			model.addAttribute("rewards",rewards);
			return "hero/detail";
		}else{
			return "500";
		}

	}
	@RequestMapping(value = "/payment-by-id", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String paymentById(@RequestParam("id") Long id, Model model, HttpServletRequest req) throws Exception {
		Object o = req.getSession().getAttribute("name");
		if (o == null) {
			return "login";
		}

	String paymentRs = rest.getRestful("/rest/get-data-by-id/payments/"+id);

		Payment payment = JSON.parseObject(paymentRs, Payment.class);
				
	
			if(payment.getReward_id() != null){
				String rewardRs = rest.getRestful("/rest/get-data-by-id/zhongchou_rewards/"+payment.getReward_id());
				Reward reward = JSON.parseObject(rewardRs, Reward.class);
				model.addAttribute("reward", reward);
			}	
			model.addAttribute("payment", payment);	
			return "hero/dingdan";
	
	}
	
	@RequestMapping(value = "/addr", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String addr( Model model, HttpServletRequest req) throws Exception {
		Object o = req.getSession().getAttribute("name");
		if (o == null) {
			return "login";
		}

		String addressRs = rest.getRestful("/rest/address/get-list-by-userid/"+o.toString());
		@SuppressWarnings("unchecked")
		List<Address> address =  JSON.parseObject(addressRs, ArrayList.class);
				
			model.addAttribute("address", address);	
			return "accounts/user/dizhi";
	
	}
	

	
	@RequestMapping(value = "/buy", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String buy(@RequestParam("id") Long id, Model model, HttpServletRequest req) throws Exception {
		Object o = req.getSession().getAttribute("name");
		if (o == null) {
			return "login";
		}
	String rewardid = req.getParameter("reward");
	String s = rest.getRestful("/rest/get-hero-by-id/"+id);
	String rewardsString = rest.getRestful("/rest/get-reward-by-heroid/"+id);
	String addressRs = rest.getRestful("/rest/address/get-list-by-userid/"+o.toString());
	@SuppressWarnings("unchecked")
	List<Address> address =  JSON.parseObject(addressRs, ArrayList.class);
	model.addAttribute("address", address);
	@SuppressWarnings("unchecked")
	List<Reward>  rewards = JSON.parseObject(rewardsString, ArrayList.class);
		Campasigns hero = JSON.parseObject(s, Campasigns.class);
				
		if(hero.isSuccess()){
			model.addAttribute("hero", hero);	
			if (rewardid!=null){
				String rewardString = rest.getRestful("/rest/get-data-by-id/zhongchou_rewards/"+rewardid);
					Reward reward = JSON.parseObject(rewardString, Reward.class);
					model.addAttribute("reward", reward);
				model.addAttribute("rewardid", Integer.parseInt(req.getParameter("reward")));
			}
			model.addAttribute("rewards",rewards);
			return "hero/buy";
		}else{
			return "500";
		}

	}
	

}
