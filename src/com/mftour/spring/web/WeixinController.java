package com.mftour.spring.web;

import java.io.StringWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXB;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.easy.social.req.bean.Oauth2Token;
import com.easy.social.util.CommonUtil;
import com.mftour.spring.base.JsonBaseBean;
import com.mftour.spring.model.Accounts;
import com.mftour.spring.model.Rewards;
import com.mftour.spring.model.TInterestRate;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TRegisterNotify;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TUser;
import com.mftour.spring.rest.bean.ResponseReward;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.EmailTemplate;
import com.mftour.spring.util.File;
import com.mftour.spring.util.Page;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.Rest;
import com.mftour.spring.util.Xml;
import com.yeepay.bha.example.bean.BHATransferRequest;
import com.yeepay.g3.utils.security.cfca.SignUtil;

@Controller
@RequestMapping("/m")
public class WeixinController {
	private static final Logger logger = LoggerFactory
			.getLogger(WeixinController.class);
	private static final File f = ReadWirtePropertis.file();
	private Rest rest = new Rest();
	private String notifyUrl= f.getNotifyUrl() + "/m/notify";
	@Autowired
	private IUserService userService;
	@Autowired
	private IProductService productService;
	@Autowired
	private IptopService ptopService;
	@Autowired
	private IGateService gateService;
	private String doSign(String xml, String url, Model model, String service) {

		String pfx = f.getYeepayCfaFile();

		String s = xml;
		s = s.replaceAll("[\\r\\n]", "");

		model.addAttribute("service", service);
		model.addAttribute("url", url);
		model.addAttribute("req", s);
		model.addAttribute("sign", SignUtil.sign(s, pfx, "liukai123"));

		return "/m/post";

	}

	private String doSign(Object obj, String url, Model model) {

		StringWriter w = new StringWriter();
		JAXB.marshal(obj, w);
		return doSign(w.toString(), url, model, "");
	}
	@RequestMapping(value = "/notify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String transferNotify(String notify, String sign, Model model)
			throws Exception {
		try {
			Thread.sleep(10000);
			Map<String, Object> m = Xml.Dom2Map(notify);
			Rest rest = new Rest();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("request-no", m.get("requestNo"));
			
			map.put("code", m.get("code"));
			map.put("response-xml", notify);
			if (m.get("code").equals("1")) {
				String s = rest.postRestful("/rest/yeepay/update-success", map);
				JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
				return "accounts/chongzhi_ok";

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
	public String getRemortIP(HttpServletRequest request) {
		if (request.getHeader("x-forwarded-for") == null) {
			return request.getRemoteAddr();
		}
		return request.getHeader("x-forwarded-for");
	}
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
	@RequestMapping(value = "/getCode", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getCode(HttpServletRequest request) throws Exception {
		String code=request.getParameter("code");
		String state=request.getParameter("state");
		String path=request.getParameter("path");
		request.getSession().setAttribute("code", code);
		 if("binding".equals(state)){
				return "/m/login";
			}
		Oauth2Token oauth2Token=CommonUtil.getOauth2Token(code);
		if(oauth2Token==null){
			return "/m/404";
		}
		TUser user=userService.getUserByopenId(oauth2Token.getOpenId());
		if(user!=null){
			request.getSession().setAttribute("name", user.getName()); 
			request.getSession().setAttribute("userinfo", user);
		}else{
			if(!"/welcome/reg".equals(path))
				return "/m/login";
			}
			if("123".equals(state)){
				return "redirect:"+path;
			}
		JSONObject	jsonObject = JSONObject.fromObject(state);
		  java.util.Iterator iterator=jsonObject.keys();
		  boolean flag=false;
		  while (iterator.hasNext()) {  
		        String key = iterator.next().toString();  
		        String value = jsonObject.getString(key);  
		        	if(!flag){
		        		path+="?"+key+"="+value;
		        		flag=true;
		        	}else{
		        		path+="&"+key+"="+value;
		        	}
		    }  
		return "redirect:"+path;
	}
	@RequestMapping(value = "/session", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String Session(Model model, TUser user, HttpServletResponse response,HttpServletRequest request)
			throws Exception {
          HttpSession session=request.getSession();
		session.setAttribute("name", user.getName());
		TUser user1 = userService.getUserByAccount(user.getName());
		String code=(String) session.getAttribute("code");
		Oauth2Token oauth2Token=CommonUtil.getOauth2Token(code);
		user1.setOpenId(oauth2Token.getOpenId());
		userService.addOrUpdate(user1);
		request.getSession().setAttribute("userinfo", user1);
		return "/m/bindingSuccess";
		
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String helloWorld(TUser user, Model model,
			@RequestParam("name") String username,
			@RequestParam("password") String password) throws Exception {
		Rest rest = new Rest();
		String s = rest.getRestful("/rest/user/login/"+username+"/"+password);
		JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
		if (r.isSuccess()){
			return "success";
		}else{
			return "fail";
		}
	}

	@RequestMapping(value = "/regEmail", method = RequestMethod.POST)
	public String regEemail(TUser user, Model model, HttpServletRequest request){
		try {
			     HttpSession session=request.getSession();
				String code=(String) session.getAttribute("code");
				Oauth2Token oauth2Token=CommonUtil.getOauth2Token(code);
				user.setOpenId(oauth2Token.getOpenId());
			Rest rest = new Rest();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("username", user.getName());
			map.put("password", user.getPassword());
			map.put("email", user.getEmail());
			map.put("ref", user.getRef());
			map.put("service-phone",user.getServicePhone());
			map.put("openId",user.getOpenId());
			String s = rest.postRestful("/rest/user/reg", map);
			JsonBaseBean r = JSON.parseObject(s, JsonBaseBean.class);
			if (r.isSuccess()){
				session.setAttribute("name", user.getName());
				TUser userInfo = userService.getUserByAccount(user.getName());
				request.getSession().setAttribute("userinfo", userInfo);
				File f=ReadWirtePropertis.file();
				String basePath =f.getBasePath();

				String resetPassHref =basePath+ "/m/register?username="+ userInfo.getName()+"&checkcode="+userInfo.getRandomCode();

				String operate="注册中租宝帐号，请点击以下链接完成注册";
				String title="中租宝—用户注册确认";
				String email=user.getEmail();
				EmailTemplate.SendMail(email, resetPassHref, operate, title);
			}else{
				return "error";
			}
	        } catch (Exception e) {
			    logger.error("error " +e);
				return "error";
			}

		return "/m/reg_email";
	}
	@RequestMapping(value = "/queryUser", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String queryUser(Model model, TUser user) throws Exception {

		if (userService.getUserByAccount(user.getName()) != null) {
			return "success";
		}
		//
		return "fail";
	}
	@RequestMapping(value = "/register", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String register(@RequestParam("username") String username,@RequestParam("checkcode") String checkcode,
			Model model,HttpServletRequest request) throws Exception {
		TUser user = userService.getUserByAccount(username);
		Timestamp outDate =user.getRegTime();

		Timestamp outDate1 = new Timestamp(System.currentTimeMillis() + 24*60 * 60 * 1000);
		if(outDate.getTime()<= outDate1.getTime()&&checkcode.equals(user.getRandomCode())){ //表示没有过期

			user.setRegState("s");
			userService.addOrUpdate(user);
		}else{

			request.setAttribute("msg", "链接已经过期,请重新做认证！");
		}
		model.addAttribute("regState", user.getRegState());
		return "/m/reg_success";
	}
	@RequestMapping(value = "/getProductByid", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getProductByid(@RequestParam("id") Long id, Model model,
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			TProduct product,HttpServletRequest request) throws Exception {
		File f = ReadWirtePropertis.file();
		model.addAttribute("f", f);
		Page page = Page.newBuilder(pageNo, pageSize, "getProductByid");
		TProduct product1 = productService.getProductById(id);
		if(product1!=null&&product1.isLine()==false){
			return "/m/404";
		}
		if(product1.getFinanceTime()!=null){
			long financeTime=product1.getFinanceTime().getTime();
			long currTime=System.currentTimeMillis();
			if(currTime>=financeTime&&product1.getProjectStatus()==1){
				product1.setProjectStatus(2);//设置项目状态为融资中
			}
			}
			if(product1.getFinancingProgress()>=1){
				product1.setProjectStatus(3);//已满标
			}
			if(product1.isLoaned()==true){
				product1.setProjectStatus(4);//还款中
			}
			ptopService.addOrUpdate(product1);
		if(product1.getBuyType()==null){
		List<TInvestmentInfo> listoffline = ptopService.queryInvestmentInfoByNumber(page,product1.getEnterpriseNumber());
		model.addAttribute("listoffline", listoffline);
		}
		if(product1.getBuyType()!=null){
		List<TTransferInfo> listonline = new ArrayList<TTransferInfo>();
		listonline = ptopService.queryTransferInfoByNumber(page,product1.getEnterpriseNumber());
		model.addAttribute("listonline", listonline);

		}
		List<TInterestRate> li = ptopService
				.queryTInterestRateByNumber(product1.getEnterpriseNumber());
		if (li != null && li.size() != 0) {
			model.addAttribute("li", li);
		}

		Object o = request.getSession().getAttribute("name");
		Accounts account = userService.getAccountByName(o.toString());
		model.addAttribute("account",account);
		model.addAttribute("targetPlatformUserNo",product1.getTargetPlatformUserNo());
		model.addAttribute("product1", product1);
		model.addAttribute("currTime",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		model.addAttribute("page", page);

			String s = rest.getRestful("/rest/reward/get-valid-by-user-id/"+ o.toString() + "/" +3000);
			ResponseReward r = JSON.parseObject(s, ResponseReward.class);
			if (!r.isSuccess()) {
				logger.error("error get reward ");
				return "/m/error";
			}

			Rewards reward = r.getReward();
			model.addAttribute("reward", reward);
		
		
			model.addAttribute("now", UUID.randomUUID().toString());
		
		return "/m/invest/touzixiangxi";
	}

	@RequestMapping(value = "/doTransfer")
	public String doTransfer(BHATransferRequest request, String rewardCheck,
			Model model, TTransferInfo TtransferInfo,
			HttpServletRequest request1) throws Exception {

		int paymentAmount =TtransferInfo.getPaymentAmount();

		List<TProduct> lis = productService.queryProductByNumber(TtransferInfo
				.getEnterpriseNumber());
		TProduct t = lis.get(0);
		Rest rest = new Rest();
		Object o = request1.getSession().getAttribute("name");
		
		if (o == null) {
			return "/m/login";
		}
		Accounts accounts = userService.getAccountByName(o.toString());
		if (paymentAmount < 200
				&& !getRemortIP(request1).equals("106.2.184.190")) {
			model.addAttribute("error", "非法操作");
			return "/invest/error";
		}
		if (t.getRealityMoney() + t.getReward() +   paymentAmount > t.getFinancingMoney() * 10000) {

			model.addAttribute("error", "投资金额超过可投资金额,请重试！");
			return "/invest/error";
		}
		request.setRequestNo(UUID.randomUUID().toString());
		request.setPlatformUserNo(o.toString());
		request.setOrderNo(t.getEnterpriseNumber());
		request.setPlatformUserNo(o.toString());
		request.setPlatformNo(f.getPlatformNo());
		request.setNotifyUrl(notifyUrl);
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
			return "/m/404";
		}
	}
	@RequestMapping(value = "/transferSucceed", method = {
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
				return "m/invest/buy_ok";

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
	@RequestMapping(value = "/checkPay", method = { RequestMethod.POST,
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
	
}
