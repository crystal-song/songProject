package com.mftour.spring.web;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.mftour.spring.model.TInterestRate;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.EmailTemplate;
import com.mftour.spring.util.File;
import com.mftour.spring.util.Page;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.Rest;

@Controller
@RequestMapping("/m")
public class WeixinController {
	private static final Logger logger = LoggerFactory
			.getLogger(WeixinController.class);
	@Autowired
	private IUserService userService;
	@Autowired
	private IProductService productService;
	@Autowired
	private IptopService ptopService;
	@RequestMapping(value = "/getCode", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getCode(HttpServletRequest request) throws Exception {
		String code=request.getParameter("code");
		String state=request.getParameter("state");
		String path=request.getParameter("path");
		request.getSession().setAttribute("code", code);
		 if(state.equals("binding")){
				return "/m/login";
			}
		Oauth2Token oauth2Token=CommonUtil.getOauth2Token(code);
		if(oauth2Token==null){
			return "404";
		}
		TUser user=userService.getUserByopenId(oauth2Token.getOpenId());
		if(user!=null){
			request.getSession().setAttribute("name", user.getName()); 
			request.getSession().setAttribute("userinfo", user);
		}else{
			if(!path.equals("/welcome/reg"))
				return "/m/login";
			}
			if(state.equals("123")){
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
		Page page = Page.newBuilder(pageNo, pageSize, "getProductByid");
		TProduct product1 = productService.getProductById(id);
		if(product1!=null&&product1.isLine()==false){
			return "404";
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
		if (o!=null){
			Accounts account = userService.getAccountByName(o.toString());
			model.addAttribute("account",account);
		}
		model.addAttribute("product1", product1);
		model.addAttribute("currTime",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		model.addAttribute("page", page);
		model.addAttribute("now", System.currentTimeMillis());
		return "m/touzixiangxi";
		

	}
}
