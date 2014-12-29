package com.mftour.spring.logic;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.mftour.spring.model.Rewards;
import com.mftour.spring.model.TUser;
import com.mftour.spring.rest.bean.AccountResponse;
import com.mftour.spring.rest.bean.Page;
import com.mftour.spring.rest.bean.Response;
import com.mftour.spring.util.File;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.Rest;

public class Account {

	private static final File f = ReadWirtePropertis.file();
	private static final Logger logger = LoggerFactory
			.getLogger(YeePay.class);
	private static Rest rest = new Rest();
	
	//获取帐号信息
	public static AccountResponse getAccount(String name) {
		try {
			String s = rest.getRestful("/rest/account/get-by-id/"+name);
			AccountResponse r = JSON.parseObject(s, AccountResponse.class);
			
			return r;
		} catch (Exception e) {
			logger.error("error "+ e);
			return new AccountResponse();
		}

	}
	
	//获取优惠券分页
	public static Page<Rewards> getRewardsPage(String username, int page, String catlog) {
		try {
			
			String s = rest.getRestful("/rest/reward/get-page-by-user-name/"+username +"/"+ Integer.toString(page)+"/"+catlog);
			@SuppressWarnings("unchecked")
			Page<Rewards> r = JSON.parseObject(s, Page.class);
			
			return r;
		} catch (Exception e) {
			logger.error("error "+ e);
			return new Page<Rewards>();
		}
	
	}


	//获取优惠券分页
	public static Page<TUser> getRefsPage(String id ,int page) {
		try {

			String s = rest.getRestful("/rest/user/ref-page-list/"+id +"/"+ Integer.toString(page)+"");
			@SuppressWarnings("unchecked")
			Page<TUser> r = JSON.parseObject(s, Page.class);

			return r;
		} catch (Exception e) {
			logger.error("error "+ e);
			return new Page<TUser>();
		}

	}
}
