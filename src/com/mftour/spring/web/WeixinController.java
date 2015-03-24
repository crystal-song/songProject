package com.mftour.spring.web;

import java.net.URL;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.util.EmailTemplate;
import com.mftour.spring.util.File;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.Rest;

@Controller
@RequestMapping("/M")
public class WeixinController {
	private static final Logger logger = LoggerFactory
			.getLogger(WeixinController.class);
	@Autowired
	private IUserService userService;
	@RequestMapping(value = "/getCode", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getCode(HttpServletRequest request) throws Exception {
		String code=request.getParameter("code");
		String state=request.getParameter("state");
		request.getSession().setAttribute("code", code);
		Oauth2Token oauth2Token=CommonUtil.getOauth2Token(code);
		TUser user=userService.getUserByopenId(oauth2Token.getOpenId());
		if(state.equals("binding")||user==null){
			return "/m/login";
		}
		if(state.equals("assert")&&user!=null){
			request.getSession().setAttribute("name", user.getName());
			request.getSession().setAttribute("userinfo", user);
			return "redirect:/gate/service";
		}
		return "/m/reg";
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

				String resetPassHref =basePath+ "/M/register?username="+ userInfo.getName()+"&checkcode="+userInfo.getRandomCode();

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
}
