package com.mftour.spring.web;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IUserService;
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
		/* System.out.println(user1.getName()+"www"+user1.getPassword()); */

		return "fail";
		/* return "user/chpasswd"; */

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
			@RequestParam("validatecode") String validatecode,
			HttpServletRequest request, Model model) throws Exception {
		try{
		TUser user = userService.getUserByAccount(name);
		// 获取验证码的值
		String random = (String) request.getSession().getAttribute("random");
		if (!random.equals(validatecode)) {
			request.setAttribute("error", "输入的验证码不正确！");
			return "forget";
		}
		
		Timestamp outDate = new Timestamp(System.currentTimeMillis() + 24*30 * 60 * 1000);
		request.getSession().setAttribute("outDate", outDate);
		model.addAttribute("user1", user);
		com.mftour.spring.util.File f=ReadWirtePropertis.file();
		String basePath =f.getBasePath();
		String resetPassHref = basePath + "user/reset?username="
				+ user.getName();
		String mainjsp = "http://www.ptobchina.com/wel";
		
		String htmlContent = "亲爱的用户"
				+ user.getName()
				+ "，您好，<br/><br/>"
				+ "您在"
				+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		.format(new Date())
		+ "提交找回密码的请求,请点击此链接重置您的密码<br/><br/>"
		+ "<a href="
		+ resetPassHref
		+ "><font color='green'>http://www.ptobchina.com/user/reset?username="
		+ user.getName() + "&checkcode=gfe3r4245hdasr43t90dcscdsvf</font></a><br/><br/>"
		+ "(如果无法点击该URL链接地址，请将它复制并粘帖到浏览器的地址输入框，然后单击回车即可。)<br/><br/>"
		+ "(该链接在24小时内有效，24小时后请重新获取。)<br/><br/>"
		+ "中租宝   <a href=" + mainjsp
		+ "><font color='green'>http://www.ptobchina.com/</font></a>"
		+ "<br/><br/>" + "此为自动发送邮件，请勿直接回复！";
		 String url = "https://sendcloud.sohu.com/webapi/mail.send.xml";
	        HttpClient httpclient = new DefaultHttpClient();
	        HttpPost httpost = new HttpPost(url);

	        List nvps = new ArrayList();
	        nvps.add(new BasicNameValuePair("api_user", "ptobchina_test_U1BqG6")); //# 使用api_user和api_key进行验证
	        nvps.add(new BasicNameValuePair("api_key", "xkP8cQXYryMAyKBe"));
	        nvps.add(new BasicNameValuePair("from", "cs@ptobchina.com")); //# 发信人，用正确邮件地址替代
	        nvps.add(new BasicNameValuePair("to", user.getEmail()));// # 收件人地址，用正确邮件地址替代，多个地址用';'分隔
	        nvps.add(new BasicNameValuePair("subject", "中租宝—找回密码通知"));
	        nvps.add(new BasicNameValuePair("html",htmlContent ));
	        httpost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));

	        HttpResponse response = httpclient.execute(httpost);

	        if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) { // 正常返回
	            System.out.println(EntityUtils.toString(response.getEntity()));
	        } else {
	            System.err.println("error");
	        }
    } catch (Exception e) {
		e.printStackTrace();
	}

		return "FindToMail";
	}



	@RequestMapping(value = "/reset", method = { RequestMethod.POST,RequestMethod.GET })
	public String reset(@RequestParam("username") String username, Model model,HttpServletRequest request)
			throws Exception {
		Timestamp outDate =(Timestamp)request.getSession().getAttribute("outDate");
		System.out.println("aaaaaa"+outDate.getTime()+"bbbbbbb"+System.currentTimeMillis());
		if(outDate.getTime()<= System.currentTimeMillis()){ //表示已经过期
            request.setAttribute("msg", "链接已经过期,请重新申请找回密码.");
		}else{
		TUser user = (TUser) userService.getUserByAccount(username);
		model.addAttribute("answer", user.getAnswer());
		model.addAttribute("name", username);
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
