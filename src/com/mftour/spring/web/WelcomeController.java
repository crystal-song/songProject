package com.mftour.spring.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.util.Constants;
import com.mftour.spring.util.Env;
import com.mftour.spring.util.MailSenderInfo;
import com.mftour.spring.util.SimpleMailSender;
import com.sms.webservice.client.SmsReturnObj;
import com.sms.webservice.client.SmsWebClient;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/*
 * 不需要实现任何接口，也不需要继承任何的类，也不需要任何 Servlet API
 */
@Controller
@RequestMapping("/welcome")
// 将Model中属性名为Constants.USER_INFO_SESSION的属性放到Session属性列表中，以便这个属性可以跨请求访问
@SessionAttributes(Constants.USER_INFO_SESSION)
public class WelcomeController {

	@Autowired
	private IUserService userService;

	@Autowired
	private IGateService gateService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String helloWorld(TUser user, Model model,
			@RequestParam("name") String username,
			@RequestParam("password") String password) throws Exception {

		TUser user1 = userService.getUserByAccount(user.getName());

		if (user1 != null) {
			if (user1.getPassword().equals(user.getPassword())) {
				model.addAttribute("name", user.getName());
				return "success";
			}
		}
		return "fail";
		/* return "user/chpasswd"; */

	}

	@RequestMapping(value = "/logout", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String logout(HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("name");
		return "login";
	}

	

	@RequestMapping(value = "/regEmail", method = RequestMethod.POST)
	public String regEemail(TUser user, Model model, HttpServletRequest request)
			throws Exception {
		try {
			user.setRegState("f");
			userService.addOrUpdate(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		    String SENDCLOUD_SMTP_HOST = "smtpcloud.sohu.com";
		    int SENDCLOUD_SMTP_PORT = 25;
		    Properties props = System.getProperties();
	        props.setProperty("mail.transport.protocol", "smtp");
	        props.put("mail.smtp.host", SENDCLOUD_SMTP_HOST);
	        props.put("mail.smtp.port", SENDCLOUD_SMTP_PORT);
	        props.setProperty("mail.smtp.auth", "true");
	        props.put("mail.smtp.connectiontimeout", 180);
	        props.put("mail.smtp.timeout", 600);

	        props.setProperty("mail.mime.encodefilename", "true");

	        // 使用api_user和api_key进行验证
	        final String apiUser = "ptobchina_test_U1BqG6";
	        final String apiKey = "xkP8cQXYryMAyKBe";

	        Session mailSession = Session.getInstance(props, new Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(apiUser, apiKey);
	            }
	        });

	        Transport transport = mailSession.getTransport();
	        MimeMessage message = new MimeMessage(mailSession);
	        Multipart multipart = new MimeMultipart("alternative");
	        
	        Timestamp outDate = new Timestamp(System.currentTimeMillis() + 24*30 * 60 * 1000);
			request.getSession().setAttribute("outDate1", outDate);
			model.addAttribute("user1", user);
	        // 添加html形式的邮件正文
	        BodyPart part1 = new MimeBodyPart();
	        part1.setHeader("Content-Type", "text/html;charset=UTF-8");
	        part1.setHeader("Content-Transfer-Encoding", "base64");
	        String path = request.getContextPath();
			String basePath = request.getScheme() + "://" + request.getServerName()
					+ ":" + request.getServerPort() + path + "/";
			String resetPassHref = basePath + "welcome/register?username="
					+ user.getName();
			String mainjsp = "http://www.ptobchina.com/wel";

	        String htmlContent = "亲爱的用户"
					+ user.getName()
					+ "，您好，<br/><br/>"
					+ "您在"
					+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
							.format(new Date())
					+ "注册中租宝帐号，请点击以下链接完成注册：<br/><br/>"
					+ "<a href="
					+ resetPassHref
					+ "><font color='green'>http://www.ptobchina.com/welcome/register?username="
					+ user.getName() + "&checkcode=gfe3r4245hdasr43t90dcscdsvf</font></a><br/><br/>"
					+ "(如果无法点击该URL链接地址，请将它复制并粘帖到浏览器的地址输入框，然后单击回车即可。)<br/><br/>"
					+ "(该链接在24小时内有效，24小时后请重新获取。)<br/><br/>"
					+ "中租宝   <a href=" + mainjsp
					+ "><font color='green'>http://www.ptobchina.com/</font></a>"
					+ "<br/><br/>" + "此为自动发送邮件，请勿直接回复！";
	        part1.setContent(htmlContent, "text/html;charset=UTF-8");
	        multipart.addBodyPart(part1);
	        message.setContent(multipart);

	        // 发信人，用正确邮件地址替代 
	        message.setFrom(new InternetAddress("cs@ptobchina.com", "管理员", "UTF-8"));
	        // 收件人地址，用正确邮件地址替代
	        message.addRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
	        // 邮件主题
	        message.setSubject("中租宝—用户注册确认", "UTF-8");

	        // 连接sendcloud服务器，发送邮件
	        transport.connect();
	        transport.sendMessage(message, message.getRecipients(RecipientType.TO));
	        transport.close();

		return "reg_email";
	}

	@RequestMapping(value = "/emailVerification", method = RequestMethod.POST)
	public String emailVerification(@RequestParam("mail") String mail,
			Model model, HttpServletRequest request) throws Exception {
		boolean flag = false;
		String username = (String) request.getSession().getAttribute("name");
		TUser user = userService.getUserByAccount(username);
		user.setEmail(mail);
		userService.addOrUpdate(user);
		
		 String SENDCLOUD_SMTP_HOST = "smtpcloud.sohu.com";
		    int SENDCLOUD_SMTP_PORT = 25;
		    Properties props = System.getProperties();
	        props.setProperty("mail.transport.protocol", "smtp");
	        props.put("mail.smtp.host", SENDCLOUD_SMTP_HOST);
	        props.put("mail.smtp.port", SENDCLOUD_SMTP_PORT);
	        props.setProperty("mail.smtp.auth", "true");
	        props.put("mail.smtp.connectiontimeout", 180);
	        props.put("mail.smtp.timeout", 600);

	        props.setProperty("mail.mime.encodefilename", "true");

	        // 使用api_user和api_key进行验证
	        final String apiUser = "ptobchina_test_U1BqG6";
	        final String apiKey = "xkP8cQXYryMAyKBe";

	        Session mailSession = Session.getInstance(props, new Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(apiUser, apiKey);
	            }
	        });

	        Transport transport = mailSession.getTransport();
	        MimeMessage message = new MimeMessage(mailSession);
	        Multipart multipart = new MimeMultipart("alternative");
	        
	        Timestamp outDate = new Timestamp(System.currentTimeMillis() + 24*30 * 60 * 1000);
			request.getSession().setAttribute("outDate1", outDate);
			model.addAttribute("user1", user);
	        // 添加html形式的邮件正文
	        BodyPart part1 = new MimeBodyPart();
	        part1.setHeader("Content-Type", "text/html;charset=UTF-8");
	        part1.setHeader("Content-Transfer-Encoding", "base64");
	        String path = request.getContextPath();
			String basePath = request.getScheme() + "://" + request.getServerName()
					+ ":" + request.getServerPort() + path + "/";
			String resetPassHref = basePath + "welcome/register?username="
					+ user.getName();
			String mainjsp = "http://www.ptobchina.com/wel";

	        String htmlContent = "亲爱的用户"
					+ user.getName()
					+ "，您好，<br/><br/>"
					+ "您在"
					+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
							.format(new Date())
					+ "进行邮箱认证，请点击以下链接完成认证：<br/><br/>"
					+ "<a href="
					+ resetPassHref
					+ "><font color='green'>http://www.ptobchina.com/welcome/register?username="
					+ user.getName() + "&checkcode=gfe3r4245hdasr43t90dcscdsvf</font></a><br/><br/>"
					+ "(如果无法点击该URL链接地址，请将它复制并粘帖到浏览器的地址输入框，然后单击回车即可。)<br/><br/>"
					+ "(该链接在24小时内有效，24小时后请重新获取。)<br/><br/>"
					+ "中租宝   <a href=" + mainjsp
					+ "><font color='green'>http://www.ptobchina.com/</font></a>"
					+ "<br/><br/>" + "此为自动发送邮件，请勿直接回复！";
	        part1.setContent(htmlContent, "text/html;charset=UTF-8");
	        multipart.addBodyPart(part1);
	        message.setContent(multipart);

	        // 发信人，用正确邮件地址替代 
	        message.setFrom(new InternetAddress("cs@ptobchina.com", "管理员", "UTF-8"));
	        // 收件人地址，用正确邮件地址替代
	        message.addRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
	        // 邮件主题
	        message.setSubject("中租宝—邮箱认证", "UTF-8");

	        // 连接sendcloud服务器，发送邮件
	        transport.connect();
	        transport.sendMessage(message, message.getRecipients(RecipientType.TO));
	        transport.close();


		return "reg_email";
	}

	@RequestMapping(value = "/register", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String register(@RequestParam("username") String username,
			Model model,HttpServletRequest request) throws Exception {
		Timestamp outDate =(Timestamp)request.getSession().getAttribute("outDate1");
		System.out.println("outDate"+outDate);
		System.out.println("aaaaaa"+outDate.getTime()+"bbbbbbb"+System.currentTimeMillis());
		if(outDate.getTime()<= System.currentTimeMillis()){ //表示已经过期
            request.setAttribute("msg", "链接已经过期,请重新做认证！");
		}else{
		TUser user = userService.getUserByAccount(username);
		user.setRegState("s");
		userService.addOrUpdate(user);
		model.addAttribute("regState", user.getRegState());
		}
		return "reg_success";
	}

	@RequestMapping(value = "/session", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String Session(Model model, TUser user, HttpServletRequest request)
			throws Exception {
		request.getSession().setAttribute("name", user.getName());
		TUser user1 = userService.getUserByAccount(user.getName());
		request.getSession().setAttribute("userinfo", user1);
		model.addAttribute("user1", user1);
		List<TRegisterYeePay> li = gateService
				.queryTRegisterYeePayByName(user1.getName());
		if (li != null && li.size() != 0) {
			TRegisterYeePay registerYeePay1 = li.get(0);
			model.addAttribute("registerYeePay1", registerYeePay1);
		}
		// TRegisterYeePay registerYeePay1=
		// gateService.queryTRegisterYeePayByName(user1.getName()).get(0);
		// model.addAttribute("registerYeePay1", registerYeePay1);
		return "user-info";
	}

	@RequestMapping(value = "/queryUser", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String queryUser(Model model, TUser user) throws Exception {

		TUser user1 = userService.getUserByAccount(user.getName());
		if (user1 != null) {
			return "success";
		}
		//
		return "fail";
	}

	@RequestMapping(value = "/identityCardVerification", method = RequestMethod.POST)
	public String identityCardVerification(TUser user,
			@RequestParam MultipartFile[] myfiles, HttpServletRequest request) {
		String realPath = request.getSession().getServletContext()
				.getRealPath("/images/identityCardPic");
		System.out.println("ddddddddddd" + realPath);
		try {
			TUser user1 = userService.getUserByAccount(user.getName());
			user1.setRealName(user.getRealName());
			user1.setIdentityCard(user.getIdentityCard());
			user1.setIdentityCardPic1(myfiles[0].getOriginalFilename());
			user1.setIdentityCardPic2(myfiles[1].getOriginalFilename());
			userService.addOrUpdate(user1);
			for (MultipartFile myfile : myfiles) {
				if (myfile.isEmpty()) {
					System.out.println("文件未上传");
				} else {
					System.out.println("文件长度: " + myfile.getSize());
					System.out.println("文件类型: " + myfile.getContentType());
					System.out.println("文件名称: " + myfile.getName());
					System.out.println("文件原名: " + myfile.getOriginalFilename());
					System.out
							.println("========================================");
					FileUtils.copyInputStreamToFile(myfile.getInputStream(),
							new File(realPath, myfile.getOriginalFilename()));
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "identityCard_success";
	}

	/**
	 * 验证手机短信是否发送成功
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/sms", method = RequestMethod.POST)
	public void sms(@RequestParam("jbPhone") String jbPhone,
			@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String result = "0";
		/** 手机号码 */
		/*
		 * String jbPhone = WebContextUtil.getRequest().getParameter("jbPhone");
		 *//** 短信验证码 */
		/*
		 * String code = WebContextUtil.getRequest().getParameter("code");
		 *//** 短信验证码存入session(session的默认失效时间30分钟) */
		/*
		 * WebContextUtil.getSession().setAttribute("code", code);
		 */
		/** 如何初始化失败返回 */
		request.getSession().setAttribute("code", code);
		if (!initClient()) {
			return;
		}
		/** 单个手机号发送短信的方法的参数准备 */
		// 手机号码
		String mobilephone = jbPhone;
		// 短信内容+随机生成的6位短信验证码
		String content = "根据中租宝公司的委托，特向您发送此条短信。您的验证码为:" + code;
		// 操作用户的ID
		Integer operId = Integer.parseInt(Env.getInstance().getProperty(
				"operId"));
		// 定时发送的的发送时间(缺省为空，如果即时发送，填空)
		String tosend_time = "";
		// 应用系统的短信ID，用户查询该短信的状态报告(缺省为0，即不需查询短信的状态报告)
		int sms_id = 0;
		// 黑名单过滤(0：不需要黑名单过滤，1：需要黑名单过滤，缺省为0)
		short backlist_filter = 0;
		// 禁止语过滤(0：不需要禁止语过滤，1：需要禁止语过滤，缺省为0)
		short fbdword_filter = 0;
		// 优先级(值越大优先级越高，0：普通，1,：优先，2：最高，缺省为0)
		short priority = 0;
		// 短信有效时间(格式为：YYYY-MM-DD HH:mm:ss目前为空)
		String valid_time = "";
		/** 发送短信之前先统计一个已经发送的短信条数 */
		TUser user = (TUser) request.getSession().getAttribute("userinfo");
		int messageCount = userService.findAllRecord(mobilephone);
		System.out.println("已发短信条数为：" + messageCount);
		if (messageCount < 5) {
			/** 单个手机号发送短信 */
			if (!sendMessage(mobilephone, content, operId, tosend_time, sms_id,
					backlist_filter, fbdword_filter, priority, valid_time)) {
				result = "0";// 失败
			} else {
				result = "1";// 成功
				/** 发送一条短信，记录一条短信记录，为了方便之后的统计短信发送次数 */
				user.setPhone(mobilephone);// 手机号码
				user.setCaptcha(code);// 短信验证码
				user.setSendTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(new Date()));// 短信发送时间
				user.setMessageCount(messageCount + 1);
				userService.addOrUpdate(user);
			}
		} else {
			System.out.println("该手机号码今天发送验证码过多");
			result = "2";// 一个手机号码最多发送3条短信验证码
		}
		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.write(result.toString());
	}

	/**
	 * WebService客户端初始化
	 * 
	 */
	public static boolean initClient() {
		/**
		 * 判断客户端是否已经初始化
		 */
		if (!SmsWebClient.enable()) {
			int ret = 0;
			try {
				ret = SmsWebClient.init("url", "userName", "passWord");
				if (ret == -1 || !SmsWebClient.enable()) {
					System.out.println("短信平台接口初始化失败！");
					return false;
				}
				System.out.println("短信平台接口初始化成功！" + ret + "----------");
			} catch (Exception ex) {
				ex.printStackTrace();
				System.out.println("短信平台接口初始化过程中异常！");
			}
		}
		return true;
	}

	/**
	 * 单个手机号码发送
	 * 
	 * @param mobilephone
	 *            手机号
	 * @param content
	 *            短信内容
	 * @param operId
	 *            操作用户的ID
	 * @param tosend_time
	 *            定时发送的发送时间
	 * @param sms_id
	 *            应用系统的短信ID
	 * @param backlist_filter
	 *            黑名单过滤
	 * @param fbdword_filter
	 *            禁止语过滤
	 * @param priority
	 *            优先级
	 * @param valid_time
	 *            短信有效时间
	 */
	public static boolean sendMessage(java.lang.String mobilephone,
			java.lang.String content, int operId, java.lang.String tosend_time,
			int sms_id, short backlist_filter, short fbdword_filter,
			short priority, java.lang.String valid_time) {
		// 单个手机号码发送
		try {
			SmsReturnObj retObj = SmsWebClient.webSendMessage(mobilephone,
					content, operId, tosend_time, sms_id, backlist_filter,
					fbdword_filter, priority, valid_time);
			if (retObj.getReturnCode() != 1) {
				System.out.println("短信发送失败，原因为：" + retObj.getReturnMsg());
				return false;
			} else {
				System.out.println("短信发送成功！返回结果为：" + retObj.getReturnMsg());
				return true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("短信发送过程发生异常!");
		}
		return true;
	}

	@RequestMapping(value = "/smsCheckCode", method = RequestMethod.POST)
	public String smsCheckCode(
			@RequestParam("SmsCheckCode") String SmsCheckCode,
			HttpServletRequest request) {
		String code = (String) request.getSession().getAttribute("code");
		if (code.equals(SmsCheckCode)) {
			return "success";
		}
		return "fail";
	}

	@RequestMapping(value = "/phoneVerification", method = RequestMethod.POST)
	public String phoneVerification() {

		return "PhoneVerification_success";
	}

	/*
	 * @RequestMapping(value = "/regis" , method=RequestMethod.POST) public
	 * String register(TUser user, Model model) throws Exception {
	 * if(user.getName()!=null&&user.getName()!=""&&user.getPassword()!=null);
	 * try {
	 * 
	 * userService.addOrUpdate(user); } catch (Exception e) {
	 * e.printStackTrace();
	 * 
	 * throw e; }
	 * 
	 * 
	 * return null; }
	 */
}
