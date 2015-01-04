package com.mftour.spring.web;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.util.EmailTemplate;
import com.mftour.spring.util.ReadWirtePropertis;

@Controller
@RequestMapping("/user")
public class userController {

	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/getuserbyName", method = { RequestMethod.POST,
			RequestMethod.GET }) 
	public String helloWorld(TUser user, Model model) throws Exception {

		TUser user1 = userService.getUserByAccount(user.getName());

		model.addAttribute("user1", user1);
		return "user-info-modify";

	}

	@RequestMapping(value = "/update", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String update(TUser user, Model model) throws Exception {

		userService.addOrUpdate(user);
		TUser user1 = userService.getUserByAccount(user.getName());

		model.addAttribute("user1", user1);
		return "user-info";
	}

	@RequestMapping(value = "/updatePasswordajax", method = RequestMethod.POST)
	public String updatePassword(
			@RequestParam("oldPassword") String oldPassword,
			@RequestParam("password") String password, Model model,
			HttpServletRequest request) throws Exception {
		TUser user = (TUser) request.getSession().getAttribute("userinfo");
		user.setPassword(password);
		userService.addOrUpdate(user);
		model.addAttribute("user1", user);
		return "success";
	}

	@RequestMapping(value = "/cancelUpdate", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String cancelUpdate(TUser user, Model model) throws Exception {

		TUser user1 = userService.getUserByAccount(user.getName());

		model.addAttribute("user1", user1);
		return "user-info";

	}

	@RequestMapping(value = "/query", method = RequestMethod.POST)
	@ResponseBody
	public String query(TUser user, Model model) throws Exception {

		TUser user1 = userService.getUserByAccount(user.getName());
		if (user1 != null) {

			return "success";
		}


		return "fail";
		
	}

	@RequestMapping(value = "/queryByEmail", method = RequestMethod.POST)
	@ResponseBody
	public String queryByEmail(TUser user, Model model) throws Exception {
		TUser user1 = userService.getUserByEmail(user.getEmail());
		if (user1 != null) {

			return "success";
		}
		return "fail";
	}

	@RequestMapping(value = "/findPassword", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String findPassword(@RequestParam("name") String name,
			@RequestParam("email") String email,
			HttpServletRequest request, Model model) throws Exception {
		try{
		TUser user = userService.getUserByAccount(name);
		Timestamp outDate = new Timestamp(System.currentTimeMillis() + 24*30 * 60 * 1000);
		request.getSession().setAttribute("outDate", outDate);
		model.addAttribute("email", email);
		com.mftour.spring.util.File f=ReadWirtePropertis.file();
		String basePath =f.getBasePath();
		String resetPassHref = basePath + "/user/reset?username="
				+ user.getName();
		String operate="提交找回密码的请求,请点击此链接重置您的密码";
		String title="中租宝—找回密码通知";
		EmailTemplate.SendMail(email, resetPassHref, operate, title);
    } catch (Exception e) {
		e.printStackTrace();
	}

		return "FindToMail";
	}



	@RequestMapping(value = "/reset", method = { RequestMethod.POST,RequestMethod.GET })
	public String reset(@RequestParam("username") String username, Model model,HttpServletRequest request){
		try {
			Timestamp outDate =(Timestamp)request.getSession().getAttribute("outDate");
			if(outDate.getTime()<= System.currentTimeMillis()){ //表示已经过期
	            request.setAttribute("msg", "链接已经过期,请重新申请找回密码.");
			}else{
			TUser user = (TUser) userService.getUserByAccount(username);
			model.addAttribute("answer", user.getAnswer());
			model.addAttribute("name", username);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "resetPassword";

	}

	@RequestMapping(value = "/checkAnswer", method = RequestMethod.POST)
	@ResponseBody
	public String checkAnswer(@RequestParam("name") String name,
			@RequestParam("answer") String answer) throws Exception {
		TUser user = (TUser) userService.getUserByAccount(name);
		if (answer.equals(user.getAnswer())) {
			return "success";
		}
		return "fail";

	}

	@RequestMapping(value = "/updatePassword", method = { RequestMethod.POST,RequestMethod.GET })
	public String updatePassword(@RequestParam("name") String name,@RequestParam("password") String password, Model model)throws Exception {
		TUser user = userService.getUserByAccount(name);
		user.setPassword(password);
		userService.addOrUpdate(user);
		return "login";

	}

	@RequestMapping(value = "/passwordProtection", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String passwordProtection(@RequestParam("answer") String answer,
			HttpServletRequest request) throws Exception {
		TUser user = (TUser) request.getSession().getAttribute("userinfo");
		user.setAnswer(answer);
		userService.addOrUpdate(user);
		return "success";
	}

}
