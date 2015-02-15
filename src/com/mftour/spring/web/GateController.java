package com.mftour.spring.web;


import java.io.StringWriter;
import java.math.BigDecimal;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXB;
import com.alibaba.fastjson.JSON;
import com.mftour.spring.base.JsonBaseBean;
import com.mftour.spring.logic.YeePay;
import com.mftour.spring.model.*;
import com.mftour.spring.rest.bean.Campasigns;
import com.mftour.spring.rest.bean.Response;
import com.mftour.spring.rest.bean.ResponseReward;
import com.mftour.spring.rest.bean.Reward;
import com.mftour.spring.rest.bean.Yeepay;
import com.mftour.spring.rest.bean.YeepayAccountInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.logic.Account;
import com.mftour.spring.rest.bean.AccountResponse;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.ITransNoticeService;
import com.mftour.spring.service.ITransRecordService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.File;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.Rest;
import com.mftour.spring.util.Xml;
import com.yeepay.bha.example.bean.BHAFeeModeEnum;
import com.yeepay.bha.example.bean.BHARechargeRequest;
import com.yeepay.bha.example.bean.BHARegisterRequest;
import com.yeepay.bha.example.bean.BHATransferRequest;
import com.yeepay.bha.example.bean.BHAWithdrawRequest;
import com.yeepay.bha.example.bean.BHAbindingRequest;
import com.yeepay.g3.utils.security.cfca.SignUtil;

@Controller
public class GateController {
	private static final Logger logger = LoggerFactory
			.getLogger(GateController.class);
	private static final File f = ReadWirtePropertis.file();
	private ServletContext servletContext = null;

	@Autowired
	private IGateService gateService;

	@Autowired
	private IUserService userService;

	@Autowired
	private IptopService ptopService;

	private Rest rest = new Rest();
	@Autowired
	private IProductService productService;

	@Autowired
	private ITransNoticeService transNoticeService;
	@Autowired
	private ITransRecordService transRecordService;

	boolean isYeepay(String userName) throws Exception {
		boolean b = false;
		List<TRegisterYeePay> li = gateService
				.queryTRegisterYeePayByName(userName);
		List<TRegisterNotify> list = gateService
				.queryTRegisterNotifyByName(userName);

		if (li != null && li.size() != 0) {
			String code = li.get(0).getCode();
			if (code != null && code.equals("1")) {

				b = true;
			}
		}
		if (list != null && list.size() != 0) {
			String code = list.get(0).getCode();
			if (code != null && code.equals("1")) {

				if (li != null && li.size() != 0) {
					b = true;
				}
			}
		}
		return b;
	}

	private String doSign(String xml, String url, Model model, String service) {

		String pfx = f.getYeepayCfaFile();

		String s = xml;
		s = s.replaceAll("[\\r\\n]", "");

		model.addAttribute("service", service);
		model.addAttribute("url", url);
		model.addAttribute("req", s);
		model.addAttribute("sign", SignUtil.sign(s, pfx, "liukai123"));

		return "post";

	}

	private String doSign(Object obj, String url, Model model) {

		StringWriter w = new StringWriter();
		JAXB.marshal(obj, w);
		return doSign(w.toString(), url, model, "");
	}

	@RequestMapping(value = "/gate/service")
	public String service(Model model, HttpServletRequest request)
			throws Exception {

		Object o = request.getSession().getAttribute("name");

		if (o != null) {
			model.addAttribute("f", f);
			List<TRegisterYeePay> li = gateService.queryTRegisterYeePayByName(o
					.toString());

			if (li != null && li.size() > 0) {
				AccountResponse account = Account.getAccount(o.toString());
				if (account.isSuccess()) {
					Date currDate = new Date();
					List avaliableRewards = gateService.queryAvaliableRewards(
							o.toString(), currDate);
					if (avaliableRewards != null) {
						model.addAttribute("count", avaliableRewards.size());
					} else {
						model.addAttribute("count", 0);
					}
					model.addAttribute("account", account.getAccount());
					return "zichan";
				} else {
					return "error";
				}
			} else {

				TUser user = userService.getUserByAccount(o.toString());
				model.addAttribute("user", user);
				return "register";
			}

		} else {
			return "login";
		}

	}

	@RequestMapping(value = "/gate/dobinding")
	public String dobinding(String host, BHAbindingRequest request,
			Model model, TBinding binding) throws Exception {
		StringWriter w = new StringWriter();
		JAXB.marshal(request, w);
		request.setRequestNo(UUID.randomUUID().toString());
		request.setPlatformNo(f.getPlatformNo());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("request-no", request.getRequestNo());
		map.put("service", "toBindBankCard");
		map.put("username", request.getPlatformUserNo());
		map.put("request-xml", w.toString());
		String s = rest.postRestful("/rest/yeepay/create", map);
		JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
		if (r.isSuccess()) {
			return doSign(request, f.getOnSubmit() + "/bha/toBindBankCard",
					model);
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/gate/userProject")
	public String userProject(Model model, HttpServletRequest request)
			throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		Object o = request.getSession().getAttribute("name");

		if (o != null) {
			List<TTransferInfo> li = gateService.queryTTransferInfoByName(o
					.toString());
			model.addAttribute("li", li);
			return "wodexiangmu";
		} else {
			return "login";
		}

	}

	@RequestMapping(value = "/gate/agreement")
	public String agreement(Model model, HttpServletRequest request)
			throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		Object o = request.getSession().getAttribute("name");
		if (o != null) {
			List<TTransferInfo> li = gateService.queryTTransferInfoByName(o
					.toString());
			model.addAttribute("li", li);
		}

		return "wodexiangmu";
	}

	@RequestMapping(value = "/gate/authorization")
	public String authorization(Model model, TTransferInfo transferInfo)
			throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		model.addAttribute("transferInfo", transferInfo);
		List<TRegisterYeePay> list = gateService
				.queryTRegisterYeePayByName(transferInfo.getPlatformUserNo());
		if (list != null && list.size() != 0) {
			TRegisterYeePay registerYeePay = list.get(0);
			model.addAttribute("registerYeePay", registerYeePay);
		}
		List<TProduct> li = productService.queryProductByNumber(transferInfo
				.getEnterpriseNumber());
		List<TTransferInfo> list1 = gateService
				.queryTTransferInfoByEnterpriseNumber(transferInfo);
		if (li != null && li.size() != 0) {
			TProduct product = li.get(0);
			TTransferInfo transferInfo1 = list1.get(0);

			model.addAttribute("product", product);
			model.addAttribute("transferInfo1", transferInfo1);
		}
		return "touzixieyi";
	}

	@RequestMapping(value = "/gate/drawMoney")
	public String drawMoney(Model model, HttpServletRequest request)
			throws Exception {
		File f = ReadWirtePropertis.file();
		model.addAttribute("f", f);
		Object o = request.getSession().getAttribute("name");
		if (o != null) {
			List<TRegisterYeePay> li = gateService.queryTRegisterYeePayByName(o
					.toString());
			if (li != null && li.size() != 0) {
				model.addAttribute("feeMode", BHAFeeModeEnum.USER);
			}
			List<TEstablishmentRegistration> list = gateService
					.queryTEstablishmentRegistrationByNumber(o.toString());
			if (list != null && list.size() != 0) {
				model.addAttribute("feeMode", BHAFeeModeEnum.PLATFORM);
			}
		} else {
			return "login";
		}
		if (!isYeepay(o.toString())) {
			return "register";
		}
		YeepayAccountInfo yeepayAccount;
		Accounts accounts = userService.getAccountByName(o.toString());
		if (accounts.getYeepayBindcardIsok()) {
			yeepayAccount = new YeepayAccountInfo();
			yeepayAccount.setCardStatus("VERIFIED");
			yeepayAccount.setCardNo(accounts.getYeepayBindcardCardno());
			yeepayAccount.setBank(accounts.getYeepayBindcardBank());
		} else {

			yeepayAccount = YeePay.getAccountInfo(o.toString());
		}
		model.addAttribute("yeepay", yeepayAccount);
		model.addAttribute("name", o.toString());
		if (yeepayAccount.getCardStatus() != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bank", yeepayAccount.getBank());
			map.put("cardStatus", yeepayAccount.getCardStatus());
			map.put("bankCardNo", yeepayAccount.getCardNo());
			map.put("username", o.toString());
			rest.postRestful("/rest/account/update", map);
		}
		model.addAttribute("account", accounts);
		return "tixian";
	}

	@RequestMapping(value = "/gate/dodrawMoney")
	public String dodrawMoney(BHAWithdrawRequest request, Model model)
			throws Exception {

		StringWriter w = new StringWriter();
		JAXB.marshal(request, w);
		request.setRequestNo(UUID.randomUUID().toString());
		request.setPlatformNo(f.getPlatformNo());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("request-no", request.getRequestNo());
		map.put("service", "toWithdraw");

		map.put("username", request.getPlatformUserNo());
		map.put("amount", request.getAmount());

		map.put("request-xml", w.toString());
		String s = rest.postRestful("/rest/yeepay/create", map);
		JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
		if (r.isSuccess()) {

			return doSign(request, f.getOnSubmit() + "/bha/toWithdraw", model);
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/gate/register")
	public String register(Model model, HttpServletRequest request)
			throws Exception {
		Object o = request.getSession().getAttribute("name");
		if (o != null) {
			TUser user = userService.getUserByAccount(o.toString());
			model.addAttribute("user", user);
			File f = ReadWirtePropertis.file();

			model.addAttribute("f", f);
			return "register";
		}
		return "login";
	}

	@RequestMapping(value = "/gate/doRegister")
	public String doRegister(BHARegisterRequest request, Model model,
			TRegisterYeePay registerYeePay) throws Exception {

		List<TRegisterYeePay> li = gateService
				.queryTRegisterYeePayByName(registerYeePay.getPlatformUserNo());
		String uuid = UUID.randomUUID().toString();
		request.setRequestNo(uuid);
		if (li != null && li.size() != 0) {

			TRegisterYeePay registerYeePay1 = li.get(0);
			registerYeePay1.setRequestNo(uuid);
			registerYeePay1.setIdCardNo(registerYeePay.getIdCardNo());
			registerYeePay1.setMobile(registerYeePay.getMobile());
			registerYeePay1.setPlatformUserNo(registerYeePay
					.getPlatformUserNo());
			registerYeePay1.setEmail(registerYeePay.getEmail());
			registerYeePay1.setPlatformNo(registerYeePay.getPlatformNo());
			registerYeePay1.setPlatformUserNo(registerYeePay
					.getPlatformUserNo());
			registerYeePay1.setIdCardType(registerYeePay.getIdCardType());
			registerYeePay1.setRealName(registerYeePay.getRealName());
			gateService.addOrUpdateRegisterYeePay(registerYeePay1);
		} else {
			registerYeePay.setRequestNo(uuid);
			gateService.addOrUpdateRegisterYeePay(registerYeePay);
		}

		TUser user = userService.getUserByAccount(registerYeePay
				.getPlatformUserNo());

		user.setRealName(registerYeePay.getRealName());
		user.setPhone(registerYeePay.getMobile());
		user.setIdentityCard(registerYeePay.getIdCardNo());
		userService.addOrUpdate(user);
		request.setPlatformNo(f.getPlatformNo());
		return doSign(request, f.getOnSubmit() + "/bha/toRegister", model);
	}

	@RequestMapping(value = "/gate/recharge", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String recharge(Model model, HttpServletRequest request)
			throws Exception {

		model.addAttribute("f", f);
		Object o = request.getSession().getAttribute("name");
		if (o == null) {
			return "login";
		}
		boolean b = false;
		if (o != null) {

			b = isYeepay(o.toString());
		}

		Accounts accounts = userService.getAccountByName(o.toString());
		model.addAttribute("account", accounts);
		TUser user = userService.getUserByAccount(o.toString());
		model.addAttribute("user", user);
		if (b) {

			return "chongzhi";
		} else {

			return "register";
		}
	}

	@RequestMapping(value = "/gate/doRecharge")
	public String doRecharge(String host, BHARechargeRequest request,
			Model model, TRecharge recharge, HttpServletRequest request1)
			throws Exception {
		Object o = request1.getSession().getAttribute("name");
		if (o == null) {
			return "login";
		} else {
			request.setPlatformUserNo(o.toString());
		}
		request.setRequestNo(UUID.randomUUID().toString());
		Rest rest = new Rest();
		StringWriter w = new StringWriter();
		JAXB.marshal(request, w);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("request-no", request.getRequestNo());
		map.put("service", "toRecharge");
		map.put("username", o.toString());
		map.put("amount", request.getAmount());
		map.put("request-xml", w.toString());
		String s = rest.postRestful("/rest/yeepay/create", map);
		JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
		if (r.isSuccess()) {
			return doSign(request, host + "/bha/toRecharge", model);

		} else {
			return "error";
		}
	}

	public String getRemortIP(HttpServletRequest request) {
		if (request.getHeader("x-forwarded-for") == null) {
			return request.getRemoteAddr();
		}
		return request.getHeader("x-forwarded-for");
	}

	@RequestMapping(value = "/gate/doRepayment")
	public String doRepayment(String id, Model model, int period,
			HttpServletRequest request) throws Exception {

		String requestNo = UUID.randomUUID().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("notifyurl", "/gate/repaymentNotify");
		map.put("callbackurl", "/gate/repaymentSucceed");
		map.put("period", period);
		map.put("requestno", requestNo);
		String s = rest.postRestful(
				"/rest/yeepay/xml/generate-do-repayment-xml", map);
		Response r = JSON.parseObject(s, Response.class);
		if (r.isSuccess()) {
			s = r.getResponse().replaceAll("[\\r\\n]", "");
			Rest rest = new Rest();
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("request-no", requestNo);
			m.put("period", period);
			m.put("service", "toRepayment");
			m.put("request-xml", s);
			m.put("project-id", id);
			String res = rest.postRestful("/rest/yeepay/create", m);
			JsonBaseBean rr = JSON.parseObject(res, JsonBaseBean.class);
			if (rr.isSuccess()) {
				return doSign(s, f.getOnSubmit() + "/bha/toRepayment", model,
						"");
			} else {
				return "error";
			}
		}

		return "error";
	}

	@RequestMapping(value = "/gate/doTransfer")
	public String doTransfer(BHATransferRequest request, String rewardCheck,
			Model model, TTransferInfo TtransferInfo,
			HttpServletRequest request1) throws Exception {

		int paymentAmount = Integer.parseInt(TtransferInfo.getPaymentAmount());

		List<TProduct> lis = productService.queryProductByNumber(TtransferInfo
				.getEnterpriseNumber());
		TProduct t = lis.get(0);
		if (t.isLine() == false) {
			return "redirect:/product/allProduct";
		}
		Rest rest = new Rest();
		Object o = request1.getSession().getAttribute("name");
		if (o == null) {
			return "login";
		}
		if (paymentAmount < 200
				&& !getRemortIP(request1).equals("106.2.184.190")) {
			model.addAttribute("error", "非法操作");
			return "/gate/transfer";
		}
		if (t.getRealityMoney() + paymentAmount > t.getFinancingMoney() * 10000) {

			model.addAttribute("error", "非法操作");
			return "/gate/transfer";
		}
		request.setRequestNo(UUID.randomUUID().toString());
		request.setPlatformUserNo(o.toString());
		request.setOrderNo(t.getEnterpriseNumber());
		request.setPlatformUserNo(o.toString());
		request.setPlatformNo(f.getPlatformNo());

		Map<String, Object> map = new HashMap<String, Object>();
		if (rewardCheck != null && rewardCheck.equals("on")
				&& paymentAmount >= 3000) {
			request.setPaymentAmount(String.valueOf(paymentAmount - 50));
			map.put("amount", paymentAmount - 50);
			map.put("reward", "50");
		} else {
			map.put("reward", "0");
			map.put("amount", paymentAmount);
		}

		StringWriter w = new StringWriter();
		JAXB.marshal(request, w);
		map.put("request-no", request.getRequestNo());
		map.put("service", "toTransfer");
		map.put("username", o.toString());

		map.put("project-name", t.getProjectName());
		map.put("project-id", t.getEnterpriseNumber());

		request.setOrderNo(t.getEnterpriseNumber());
		map.put("request-xml", w.toString());
		String s = rest.postRestful("/rest/yeepay/create", map);
		JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
		if (r.isSuccess()) {
			return doSign(request, f.getOnSubmit() + "/bha/toTransfer", model);
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/gate/dobuy",method = {
			RequestMethod.POST})
	public String doBuy(BHATransferRequest request,String heroid,Float delivery_price,
			Float amount,Float rewardamount,String name,String rewardid,String addressid,
			Model model,
			HttpServletRequest req){
		try{
			Object o = req.getSession().getAttribute("name");
			if (o == null) {
				return "login";
			}
			if (amount ==null ||  rewardamount !=null ){
				amount = 0.0f;
			}
			if (rewardamount ==null ){
				rewardamount = 0.0f;
			}
			if (delivery_price ==null ){
				delivery_price = 0.0f;
			}
			float paymentAmount = amount+delivery_price+rewardamount;
			String herors = rest.getRestful("/rest/get-hero-by-id/"+heroid);
			@SuppressWarnings("unchecked")
			Campasigns hero = JSON.parseObject(herors, Campasigns.class);
						
			String orderNo = "zhongzubaozhongchou-" + heroid;
			request.setRequestNo(UUID.randomUUID().toString());
			request.setPlatformUserNo(o.toString());
			request.setOrderNo(orderNo);
			request.setPlatformNo(f.getPlatformNo());
			request.setService("toTransfer");
			
			request.setTransferAmount(String.valueOf(paymentAmount));
			request.setTargetPlatformUserNo(hero.getOwner_id());
			request.setCallbackUrl(f.getCallbackUrl()+"/gate/buysuccess");
			request.setNotifyUrl(f.getCallbackUrl()+"/gate/buynotify");
			request.setPaymentAmount(String.valueOf(paymentAmount) );
			

			StringWriter w = new StringWriter();
			JAXB.marshal(request, w);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", request.getRequestNo());
			map.put("service", "buy");
			map.put("username", o.toString());
			map.put("reward", rewardamount);
			map.put("amount", paymentAmount);
			map.put("project-name", name);
			map.put("project-id", heroid);
			map.put("address-id", addressid);
			map.put("rewardid", rewardid);

			map.put("request-xml", w.toString());
			String s = rest.postRestful("/rest/yeepay/create", map);
			JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
			if (r.isSuccess()) {
				return doSign(request, f.getOnSubmit() + "/bha/toTransfer", model);
			} else {
				return "error";
			}
		}catch (Exception e) {
			// TODO: handle exception
			logger.error("error " + e);
			return "error";
		}
		
	}
	
	@RequestMapping(value = "/gate/transfer")
	public String Transfer(Model model, HttpServletRequest request,
			String buyAmount, TProduct product) throws Exception {
		File f = ReadWirtePropertis.file();
		model.addAttribute("f", f);
		Object o = request.getSession().getAttribute("name");
		if (o == null) {
			return "login";
		}

		if (Integer.parseInt(buyAmount) >= 3000) {

			Rest rest = new Rest();

			String s = rest.getRestful("/rest/reward/get-valid-by-user-id/"
					+ o.toString() + "/" + buyAmount);
			ResponseReward r = JSON.parseObject(s, ResponseReward.class);
			if (!r.isSuccess()) {
				logger.error("error get reward ");
				return "error";
			}

			Rewards reward = r.getReward();
			model.addAttribute("reward", reward);
		} else {
			model.addAttribute("reward", new Rewards());
		}
		List<TProduct> list = productService.queryProductByNumber(product
				.getEnterpriseNumber());
		if (list != null && list.size() != 0) {
			TProduct Product = list.get(0);
			if (Product.getBuyType() == null)
				return "xianxia";
		}

		if (isYeepay(o.toString())) {

			model.addAttribute("buyAmount", buyAmount);
			model.addAttribute("targetPlatformUserNo", list.get(0)
					.getTargetPlatformUserNo());
			if (list != null && list.size() != 0) {
				TProduct Product = list.get(0);
				model.addAttribute("product", Product);
			}
			List<TInterestRate> li = ptopService
					.queryTInterestRateByNumber(product.getEnterpriseNumber());
			if (li != null && li.size() != 0) {
				model.addAttribute("li", li);
			}

			return "touzicheck";
		} else {
			TUser user = userService.getUserByAccount(o.toString());
			model.addAttribute("user", user);

			model.addAttribute("now", UUID.randomUUID().toString());
			return "register";
		}

	}

	@RequestMapping(value = "/gate/exam", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String exam(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);

		try {

			Map<String, Object> m = Xml.Dom2Map(resp);
			if (m.get("code").equals("1")) {

				TRegisterYeePay registerYeePay = gateService
						.queryTRegisterYeePayByNumber(
								(String) m.get("requestNo")).get(0);
				registerYeePay.setCode("1");
				gateService.addOrUpdateRegisterYeePay(registerYeePay);

			} else {

				TRegisterYeePay registerYeePay = gateService
						.queryTRegisterYeePayByNumber(
								(String) m.get("requestNo")).get(0);
				registerYeePay.setCode("0");
				logger.error("error loan " + m.get("description"));

				return "error";
			}

			return "zhuce";

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error " + e);
			return "error";
		}

	}

	@RequestMapping(value = "/gate/registerNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String registerNotify(String notify, String sign, Model model)
			throws Exception {
		try {

			Map<String, Object> m = Xml.Dom2Map(notify);
			if (m.get("code").equals("1")) {

				TRegisterYeePay registerYeePay = gateService
						.queryTRegisterYeePayByNumber(
								(String) m.get("requestNo")).get(0);
				registerYeePay.setCode("1");
				gateService.addOrUpdateRegisterYeePay(registerYeePay);
				return "success";
			} else {

				TRegisterYeePay registerYeePay = gateService
						.queryTRegisterYeePayByNumber(
								(String) m.get("requestNo")).get(0);
				registerYeePay.setCode("0");
				logger.error("error loan " + m.get("description"));

				return "error";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error " + e + notify);
			return "error";
		}
	}

	@RequestMapping(value = "/gate/loanNotify", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String loanNotify(String notify, String sign, Model model)
			throws Exception {

		try {

			Map<String, Object> m = Xml.Dom2Map(notify);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "LOAN");
			map.put("code", m.get("code"));
			map.put("response-xml", notify);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				if (!r.isSuccess()) {
					logger.error("error loan " + m.get("requestNo"));
				}
				return "success";

			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error" + e);
			return "error";
		}
	}

	@RequestMapping(value = "/gate/checkPay", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String checkPay(@RequestParam("amount") int amount,
			@RequestParam("id") String id, HttpServletRequest request)
			throws Exception {

		try {

			Object o = request.getSession().getAttribute("name");
			if (o == null) {
				return "请登录";
			}
			BigDecimal bamount = new BigDecimal(amount);
			Accounts accounts = userService.getAccountByName(o.toString());
			int bool = accounts.getAvailableMoney().compareTo(bamount);
			if (bool < 0) {
				return "您的可用余额不足";
			}
			List<TProduct> lis = productService.queryProductByNumber(id);
			TProduct t = lis.get(0);
			if (t.isLine() == false) {
				return "redirect:/product/allProduct";
			}
			if (t.getRealityMoney() + amount > t.getFinancingMoney() * 10000) {
				return "投资金额不能超过可投资金额";
			} else {
				return "success";
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error" + e);
			return "服务器错误";
		}
	}

	@RequestMapping(value = "/gate/examRecharge", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String examRecharge(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);

		try {

			Map<String, Object> m = Xml.Dom2Map(resp);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "toRecharge");
			map.put("code", m.get("code"));

			map.put("response-xml", resp);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				return "chongzhi_ok";

			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error " + e);
			return "error";
		}

	}

	@RequestMapping(value = "/gate/rechargeNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String rechargeNotify(String notify, String sign, Model model)
			throws Exception {

		try {
			Thread.sleep(5000);

			Map<String, Object> m = Xml.Dom2Map(notify);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "toRecharge");
			map.put("code", m.get("code"));
			map.put("response-xml", notify);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				return "chongzhi_ok";

			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error" + e);
			return "error";
		}

	}

	@RequestMapping(value = "/gate/repaymentSucceed", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String repaymentSSucceed(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);
		try {
			Map<String, Object> m = Xml.Dom2Map(resp);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "toRepayment");
			map.put("code", m.get("code"));
			map.put("response-xml", resp);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				Yeepays yeepays = gateService.queryYeepaysByNumber(
						m.get("requestNo").toString()).get(0);
				return "redirect:/loan/loanManage?enterpriseNumber="
						+ yeepays.getProjectId();

			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error" + e);
			return "error";
		}
	}

	@RequestMapping(value = "/gate/transferSucceed", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String transferSucceed(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);
		try {
			Map<String, Object> m = Xml.Dom2Map(resp);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "toTransfer");
			map.put("code", m.get("code"));
			map.put("response-xml", resp);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				TTransferInfo transferInfo = gateService
						.queryTTransferInfoByNumber(
								m.get("requestNo").toString()).get(0);
				model.addAttribute("transferInfo", transferInfo);
				return "buy_ok";

			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error" + e);
			return "error";
		}
	}
	
	@RequestMapping(value = "/gate/buysuccess", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String buysuccess(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {

		try {
			Map<String, Object> m = Xml.Dom2Map(resp);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "toTransfer");
			map.put("code", m.get("code"));
			map.put("response-xml", resp);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				String yeepayRes = rest.getRestful("/rest/get-yeepay-by-request-no/"+m.get("requestNo"));
				Yeepay yeepay = JSON.parseObject(yeepayRes, Yeepay.class);
				model.addAttribute("amount",yeepay.getAmount()+yeepay.getReward());
				return "/hero/zhifu_ok";

			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error" + e);
			return "error";
		}
	}
	
	@RequestMapping(value = "/gate/repaymentNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String repaymentNotify(String notify, String sign, Model model)
			throws Exception {
		try {
			Thread.sleep(5000);
			Map<String, Object> m = Xml.Dom2Map(notify);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "toRepayment");
			map.put("code", m.get("code"));
			map.put("response-xml", notify);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				return "repayment_ok";

			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error" + e);
			return "error";
		}
	}

	@RequestMapping(value = "/gate/transferNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String transferNotify(String notify, String sign, Model model)
			throws Exception {
		try {
			Thread.sleep(5000);
			Map<String, Object> m = Xml.Dom2Map(notify);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "toTransfer");
			map.put("code", m.get("code"));
			map.put("response-xml", notify);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				return "chongzhi_ok";

			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error" + e);
			return "error";
		}
	}

	@RequestMapping(value = "/gate/bindingSucceed", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String binding(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);

		try {

			Map<String, Object> m = Xml.Dom2Map(resp);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "BIND_BANK_CARD");
			map.put("code", m.get("code"));
			map.put("response-xml", resp);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				return "bangding_ok";
			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}

		} catch (Exception e) {
			logger.error("error " + resp + e);
		}
		return "bangding_ok";

	}

	@RequestMapping(value = "/gate/bindingNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String bindingNotify(Model model, String notify, String sign,
			HttpServletRequest request) throws Exception {

		try {

			Map<String, Object> m = Xml.Dom2Map(notify);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "BIND_BANK_CARD");
			map.put("code", m.get("code"));
			map.put("response-xml", notify);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				return "chongzhi_ok";

			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}
		} catch (Exception e) {

			logger.error("error " + notify + e);
		}
		return "payment/binding";
	}

	@RequestMapping(value = "/gate/drawMoneyNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String drawMoneyNotify(Model model, String notify, String sign,
			HttpServletRequest request) throws Exception {

		try {

			Thread.sleep(5000);
			Map<String, Object> m = Xml.Dom2Map(notify);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "toWithdraw");
			map.put("code", m.get("code"));
			map.put("response-xml", notify);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				return "success";

			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}
		} catch (Exception e) {
			logger.error("error" + e);
			return "error";
		}
	}

	@RequestMapping(value = "/gate/drawMoneySucceed", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String drawMoneySucceed(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);
		try {
			Map<String, Object> m = Xml.Dom2Map(resp);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			map.put("service", "toWithdraw");
			map.put("code", m.get("code"));
			map.put("response-xml", resp);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				return "tixian_ok";

			} else {
				rest.postRestful("/rest/yeepay/update-error", map);

				return "error";
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error" + e);
			return "error";
		}
	}
}
