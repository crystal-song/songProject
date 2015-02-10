package com.mftour.spring.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.mftour.spring.logic.YeePay;
import com.mftour.spring.rest.bean.Campasigns;
import com.mftour.spring.model.TCrowdfunding;
import com.mftour.spring.model.TCrowdfundingCommodity;
import com.mftour.spring.service.ICrowdfundingService;
import com.mftour.spring.util.File;
import com.mftour.spring.rest.bean.Page;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.Rest;

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
		
		@SuppressWarnings("unchecked")
		Page<Campasigns> heros = JSON.parseObject(s, Page.class);

		model.addAttribute("heros", heros);

	

		return "hero/index";

	}

	@RequestMapping(value = "/get-by-id", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String getProductByid(@RequestParam("id") Long id, Model model) throws Exception {

	String s = rest.getRestful("/rest/get-data-detail/campaigns/"+id);
		
		Campasigns hero = JSON.parseObject(s, Campasigns.class);
		model.addAttribute("hero", hero);	

		return "production-jianjie";

	}

}
