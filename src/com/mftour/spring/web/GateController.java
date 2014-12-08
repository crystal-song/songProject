package com.mftour.spring.web;

import java.io.StringWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXB;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;

import com.mftour.spring.model.TBinding;
import com.mftour.spring.model.TBindingNotify;
import com.mftour.spring.model.TBindingSucceed;
import com.mftour.spring.model.TDrawMoney;
import com.mftour.spring.model.TDrawMoneyNotify;
import com.mftour.spring.model.TDrawMoneySucceed;
import com.mftour.spring.model.TEstablishmentNotify;
import com.mftour.spring.model.TEstablishmentRegistration;
import com.mftour.spring.model.TInterestRate;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TLoansucceed;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TRecharge;
import com.mftour.spring.model.TRechargeNotify;
import com.mftour.spring.model.TRechargeSucceed;
import com.mftour.spring.model.TRegisterNotify;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransNotice;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TTransferNotify;
import com.mftour.spring.model.TTransferSucceed;
import com.mftour.spring.model.TUser;
import com.mftour.spring.model.TYeePay;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.ITransNoticeService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.File;
import com.mftour.spring.util.HttpClientTest;
import com.mftour.spring.util.MailSenderInfo;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.SimpleMailSender;
/*import com.mftour.spring.util.ccc;*/
import com.yeepay.bha.example.bean.BHAAuthorization;
import com.yeepay.bha.example.bean.BHAEstablishmentRegistration;
import com.yeepay.bha.example.bean.BHAFeeModeEnum;
import com.yeepay.bha.example.bean.BHARechargeRequest;
import com.yeepay.bha.example.bean.BHARegisterRequest;
import com.yeepay.bha.example.bean.BHATransferRequest;
import com.yeepay.bha.example.bean.BHAWithdrawRequest;


























import com.yeepay.bha.example.bean.BHAbindingRequest;
import com.yeepay.g3.utils.security.cfca.SignUtil;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream; 
import java.io.FileNotFoundException; 
import java.io.FileOutputStream; 
import java.io.IOException; 
import java.io.InputStream; 
import java.io.PrintWriter; 
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder; 
import javax.xml.parsers.DocumentBuilderFactory; 
import javax.xml.parsers.ParserConfigurationException; 

import org.w3c.dom.Document; 
import org.w3c.dom.Element; 
import org.w3c.dom.Node; 
import org.w3c.dom.NodeList; 
import org.xml.sax.SAXException; 

@Controller
public class GateController  {
	
	private ServletContext servletContext = null;
	
	@Autowired
    private IGateService gateService;
	
	@Autowired
    private IUserService userService;
	
	@Autowired
    private IptopService ptopService;
	
	@Autowired
    private IProductService productService;
	
	@Autowired
	private ITransNoticeService transNoticeService;

	@RequestMapping(value="/gate/service")
	public String service(Model model,HttpServletRequest request) throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		Object o= request.getSession().getAttribute("name"); 
		String name=null;
		if(o!=null){
			 List<TRegisterYeePay> li= gateService.queryTRegisterYeePayByName(o.toString());
			 if(li != null && li.size()!=0){
				 TRegisterYeePay registerYeePay=li.get(0);
				  name= registerYeePay.getPlatformUserNo();
			 }else{
				 
				 TUser user=userService.getUserByAccount(o.toString());
					model.addAttribute("user", user);
				 return "register";
			 }
			 List<TEstablishmentRegistration> list= gateService.queryTEstablishmentRegistrationByName(o.toString());
			 if(list != null && list.size()!=0){
				 TEstablishmentRegistration establishmentRegistration=list.get(0);
				 name= establishmentRegistration.getPlatformUserNo();
			 }
		}      
		
		 String req="<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
	    			/*+"<request platformNo='10040011137'>"   */           
				     +"<request platformNo='10012415118'>"
	    			/*+"<platformUserNo>gg123456</platformUserNo> "*/
	    			+"<platformUserNo>"+name+"</platformUserNo> "
	                +"</request>";
		 model.addAttribute("req", req);
		String service="ACCOUNT_INFO";
		/*String host="http://qa.yeepay.com/member";*/
		 String host="https://member.yeepay.com/member";
		return  doService(host, req, service, model);
		/*return "payment/service";*/
		/*return "";*/
	}
	 
	@RequestMapping(value="/gate/doService")
	public String doService(String host, String req, String service, Model model) {

		return doSigns(req, host + "/bhaexter/bhaController", model, service);
	}
	public String doloan(String host, String req, String service, Model model) {

		return doloan(req, host + "/bhaexter/bhaController", model, service);
	}
	
	public String dobinding(String host, String req,  Model model) {

		return doSign(req, host + "/bha/toBindBankCard", model);
	}
	
	

	@RequestMapping(value="/gate/binding")
	public String binding(Model model,HttpServletRequest request) throws Exception {
		File f=ReadWirtePropertis.file();
	    System.out.println(f.getPlatformNo()); 
	    model.addAttribute("f", f);
		model.addAttribute("now", System.currentTimeMillis());
		Object o= request.getSession().getAttribute("name"); 
		String name=null;
		if(o!=null){
			 List<TRegisterYeePay> li= gateService.queryTRegisterYeePayByName(o.toString());
			 if(li != null && li.size()!=0){
				 TRegisterYeePay registerYeePay=li.get(0);
				  name= registerYeePay.getPlatformUserNo();
			 }
	           
		}
		/*Object o= request.getSession().getAttribute("name");*/ 
		model.addAttribute("name", name);
		/*return "payment/binding";*/
		return "yinhangka";
	}
	

	@RequestMapping(value="/gate/dobinding")
	public String dobinding(String host, BHAbindingRequest request, Model model,TBinding binding) throws Exception {
	
		gateService.addOrUpdateTBinding(binding);
		return doSign(request, host + "/bha/toBindBankCard", model );
	}
	
	
	@RequestMapping(value="/gate/userProject")
	public String userProject(Model model,HttpServletRequest request) throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		Object o= request.getSession().getAttribute("name"); 
		if(o!=null){
			 List<TTransferInfo> li=gateService.queryTTransferInfoByName(o.toString());
			 model.addAttribute("li", li);
		}
		
		return "wodexiangmu";
	}
	
	@RequestMapping(value="/gate/agreement")
	public String agreement(Model model,HttpServletRequest request) throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		Object o= request.getSession().getAttribute("name"); 
		if(o!=null){
			 List<TTransferInfo> li=gateService.queryTTransferInfoByName(o.toString());
			 model.addAttribute("li", li);
		}
		
		return "wodexiangmu";
	}
	
	
	
	
	@RequestMapping(value="/gate/authorization")
	public String authorization(Model model,TTransferInfo transferInfo) throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		model.addAttribute("transferInfo", transferInfo);
		 List<TRegisterYeePay> list=gateService.queryTRegisterYeePayByName(transferInfo.getPlatformUserNo());
		 if(list != null && list.size()!=0){
			 TRegisterYeePay registerYeePay=list.get(0);
			 model.addAttribute("registerYeePay", registerYeePay);
		 }
		 List<TProduct> li=productService.queryProductByNumber(transferInfo.getEnterpriseNumber());
		 List<TTransferInfo> list1= gateService.queryTTransferInfoByEnterpriseNumber(transferInfo.getEnterpriseNumber());
		 if(li != null && li.size()!=0){
			 TProduct product=li.get(0);
			 model.addAttribute("product", product);
		 }
		return "touzixieyi";
	}
	
	
	@RequestMapping(value="/gate/doAuthorization")
	public String doAuthorization(String host, BHAAuthorization request, Model model) throws Exception {
		
		
		
		return doSign(request, host + "/bha/toAuthorizeAutoRepayment", model );
	}
	
	@RequestMapping(value="/gate/repayment")
	public void repayment(Model model) throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		
		 /*String request="<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
	    			
				    +"<request platformNo='10040011137'>"
	    			
	    			+"<platformUserNo>"+"18975601645"+"</platformUserNo> "
	    			+"<requestNo>"+System.currentTimeMillis()+"</requestNo> "
	    			+"<orderNo>"+"1416170104284"+"</orderNo> "
	    			+"<properties>"
	    			+"<property name='name' value='value' />"
	    			+"</properties> "
	    			+"<repayments> "
	    			+"<repayment> "
	    			+"<paymentRequestNo>"+"1416170104284"+"</paymentRequestNo> "
	    			+"<targetUserNo>"+"gg123456"+"</targetUserNo> "
	    			+"<amount>"+"10"+"</amount> "
	    			+"<fee>"+"1"+"</fee> "
	    			+"</repayment>"
	    			+"</repayments>"
	    			+"<notifyUrl>"+"http://192.168.1.207:8080/spring3/gate/loanexam"+"</notifyUrl> "
	    			
	                +"</request>";
		 String host="http://qa.yeepay.com/member";*/
		
		
		String request="<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
				    +"<request platformNo='10040011137'>"
	    			+"<platformUserNo>"+"18975601645"+"</platformUserNo> "
	    			+"<requestNo>"+System.currentTimeMillis()+"</requestNo> "
	    			+"<orderNo>"+"1416170104284"+"</orderNo> "
	    			+"<repayments>"
	    			+"<repayment> "
	    			+"<paymentRequestNo>"+"1416170104284"+"</paymentRequestNo> "
	    			+"<targetUserNo>"+"gg123456"+"</targetUserNo> "
	    			+"<amount>"+"10"+"</amount> "
	    			+"<fee>"+"1"+"</fee> "
	    			+"</repayment>"
	    			+"</repayments>"
	    			+"<notifyUrl>"+"http://192.168.1.207:8080/spring3/gate/loanexam"+"</notifyUrl> "
	                +"</request>";
		
		 
		 
		 String pfx = servletContext.getRealPath("/WEB-INF/zhengshu.pfx");
		
			String s = request;
			s = s.replaceAll("[\\r\\n]", "");
			String service="AUTO_REPAYMENT";
			String host="http://qa.yeepay.com/member";
			
			 /*ccc.da(service,url,s);*/
			 HttpClientTest d=new HttpClientTest();
			         /* String resp=d.postForm( url, s, SignUtil.sign(s, pfx, "liukai123"));*/
			 String resp=d.postForm(service, host + "/bhaexter/bhaController", s, SignUtil.sign(s, pfx, "liukai123"));
		               System.out.println("dddddd"+resp);
		 
		              /* return "bangding_ok";*/
		/* return doSign(request, host + "/bha/toRepayment", model,"" );*/
		 
	}
	
	
	
	
	/*@RequestMapping(value="/gate/binding")
	public void binding(Model model,HttpServletRequest request) throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		Object o= request.getSession().getAttribute("name"); 
		 TRegisterYeePay registerYeePay1= gateService.queryTRegisterYeePayByName(o.toString()).get(0);
		           String name= registerYeePay1.getPlatformUserNo();
		 String req="<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
	    			+"<request platformNo='10040011137'>"
	    			+"<requestNo>"+System.currentTimeMillis()+"</requestNo> "
	    			+"<notifyUrl>"+"http://192.168.1.207:8080/spring3/gate/loanexam"+"</notifyUrl> "
	    			+"<callbackUrl>"+"http://192.168.1.207:8080/spring3/gate/loanexam"+"</callbackUrl> "
	    			+"<platformUserNo>"+name+"</platformUserNo> "
	    			+"<platformUserNo>"+"q459384843"+"</platformUserNo> "
	                +"</request>";
		 
		
		 String host="http://qa.yeepay.com/member";
		 dobinding( host,  req,  model);
		
		return "payment/service";
	}*/
	
	
	@RequestMapping(value="/gate/drawMoney")
	public String drawMoney(Model model,HttpServletRequest request) throws Exception {
		File f=ReadWirtePropertis.file();
	    System.out.println(f.getPlatformNo()); 
	    model.addAttribute("f", f);
		model.addAttribute("now", System.currentTimeMillis());
		Object o= request.getSession().getAttribute("name"); 
		if(o!=null){
		 List<TRegisterYeePay> li= gateService.queryTRegisterYeePayByName(o.toString());
		 if(li != null && li.size()!=0){
			 TRegisterYeePay registerYeePay=li.get(0);
			 model.addAttribute("registerYeePay", registerYeePay.getPlatformUserNo());
			 model.addAttribute("feeMode", BHAFeeModeEnum.USER);
		 }
		 List<TEstablishmentRegistration> list=gateService.queryTEstablishmentRegistrationByNumber(o.toString());
		 if(list != null && list.size()!=0){
	
			 TEstablishmentRegistration registerYeePay = list.get(0);
			 model.addAttribute("registerYeePay",  registerYeePay.getPlatformUserNo());
			 model.addAttribute("feeMode", BHAFeeModeEnum.PLATFORM);
		 }
		}
		/* String req="<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
	    			+"<request platformNo='10040011137'>"
	    			+"<requestNo>"+System.currentTimeMillis()+"</requestNo> "
	    			+"<notifyUrl>"+"http://192.168.1.207:8080/spring3/gate/loanexam"+"</notifyUrl> "
	    			+"<callbackUrl>"+"http://192.168.1.207:8080/spring3/gate/loanexam"+"</callbackUrl> "
	    			+"<platformUserNo>"+name+"</platformUserNo> "
	                +"</request>";
		 
		
		 
		 String service="toBindBankCard";
		 String host="http://qa.yeepay.com/member";*/
		/* dobinding( host,  req,  service, model);*/
		
		/*return "payment/drawMoney";*/
		return "tixian";
	}
	

	@RequestMapping(value="/gate/dodrawMoney")
	public String dodrawMoney(String host,BHAWithdrawRequest request, Model model,TDrawMoney drawMoney) throws Exception {
		Date dt = new Date();   
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
	    
	    drawMoney.setTransDate(sdf.format(dt).toString());
		gateService.addOrUpdateTDrawMoney(drawMoney);
		return doSign(request, host + "/bha/toWithdraw", model );
	}
	 
	 @RequestMapping(value="/gate/loan")
		public String loan(Model model,HttpServletRequest request) throws Exception {
			model.addAttribute("now", System.currentTimeMillis());
			Object o= request.getSession().getAttribute("name"); 
			 TRegisterYeePay registerYeePay1= gateService.queryTRegisterYeePayByName(o.toString()).get(0);
			           String name= registerYeePay1.getPlatformUserNo();
			 String req="<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
		    			+"<request platformNo='10040011137'>"
		    			/*+"<platformUserNo>gg123456</platformUserNo> "*/
		    			+"<orderNo>"+name+"</orderNo> "
		    			+"<requestNo>"+name+"</requestNo> "
		    			+"<fee>"+name+"</fee> "
		    			+"<transfer>"+name+"</transfer> "
		    			+"<requestNo>"+name+"</requestNo> "
		    			+"<transferAmount>"+name+"</transferAmount> "
		    			+"<sourceUserType>"+name+"</sourceUserType> "
		    			+"<sourcePlatformUserNo>"+name+"</sourcePlatformUserNo> "
		    			+"<targetUserType>"+name+"</targetUserType> "
		                +"</request>";
			 model.addAttribute("req", req);
			
			return "payment/service";
		}
	 

	
	
	@RequestMapping(method = {RequestMethod.POST, RequestMethod.GET})
	public String helloWorld(Model model,HttpServletRequest request) throws Exception {
		
	
		/*return "news_add";*/
		/*return "ptop/p2b_add";*/
		return "payment/register";
		/*return "indexs";*/
	}
	
	@RequestMapping(value="/gate/register")
	public String register(Model model,HttpServletRequest request) throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		Object o= request.getSession().getAttribute("name"); 
		if(o!=null){
			TUser user=userService.getUserByAccount(o.toString());
			model.addAttribute("user", user);
			/*return "payment/register";*/
			 File f=ReadWirtePropertis.file();
			    System.out.println(f.getPlatformNo()); 
			    model.addAttribute("f", f);
			return "register";
		}
		return "login";
	}
	
	
	/*@RequestMapping(value="/gate/exam")
	public String exam(Model model, String resp, String sign) {
		System.out.println("dddddddddddddddddddd");
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);
		return "payment/exam";
	}*/
	
	//
	@RequestMapping(value="/gate/doRegister")
	public String doRegister(String host, BHARegisterRequest request, Model model,TRegisterYeePay  registerYeePay) throws Exception {
		System.out.println("dddddddddddddddddddd"+registerYeePay.getPlatformUserNo());
		 List<TRegisterYeePay> li=gateService.queryTRegisterYeePayByName(registerYeePay.getPlatformUserNo());
		 if(li != null && li.size()!=0){
			 TRegisterYeePay registerYeePay1 = li.get(0);
			 registerYeePay1.setRequestNo(registerYeePay.getRequestNo());
			 registerYeePay1.setIdCardNo(registerYeePay.getIdCardNo());
			 registerYeePay1.setMobile(registerYeePay.getMobile());
			 registerYeePay1.setPlatformUserNo(registerYeePay.getPlatformUserNo());
			 registerYeePay1.setEmail(registerYeePay.getEmail());
			 registerYeePay1.setPlatformNo(registerYeePay.getPlatformNo());
			 registerYeePay1.setPlatformUserNo(registerYeePay.getPlatformUserNo());
			 registerYeePay1.setIdCardType(registerYeePay.getIdCardType());
			 registerYeePay1.setRealName(registerYeePay.getRealName());
			 gateService.addOrUpdateRegisterYeePay(registerYeePay1);
		 }else{
			 gateService.addOrUpdateRegisterYeePay(registerYeePay);
		 }
		 
		
		 TUser user=userService.getUserByAccount(registerYeePay.getPlatformUserNo());

		        user.setRealName(registerYeePay.getRealName());
		        user.setPhone(registerYeePay.getMobile());
		        user.setIdentityCard(registerYeePay.getIdCardNo());
		        userService.addOrUpdate(user);
		
		return doSign(request, host + "/bha/toRegister", model );
	}
	
	@RequestMapping(value="/gate/recharge",method = {RequestMethod.POST, RequestMethod.GET})
	public String recharge(Model model,HttpServletRequest request)throws Exception {
		 File f=ReadWirtePropertis.file();
		    System.out.println(f.getPlatformNo()); 
		    model.addAttribute("f", f);
		model.addAttribute("now", System.currentTimeMillis());
		Object o= request.getSession().getAttribute("name");
		 if(o!=null){
		
			 List<TRegisterYeePay> li= gateService.queryTRegisterYeePayByName(o.toString());
			 List<TRegisterNotify> list= gateService.queryTRegisterNotifyByName(o.toString());
 		 /* System.out.println(registerYeePay1.getPlatformUserNo()+"sssssssss"+o.toString());*/
			 if(li != null && li.size()!=0){
				 TRegisterYeePay registerYeePay1=li.get(0);
				 System.out.println("dddddddd"+registerYeePay1.getPlatformUserNo());
				 System.out.println("dddddddd"+registerYeePay1.getCode());
				 if(list!=null && list.size()!=0){
 		 /* if(registerYeePay1.getPlatformUserNo()!=null&&registerYeePay1.getCode().equals("1")){*/
			      if(li.get(0).getCode().equals("1")||list.get(0).getCode().equals("1")){
	        	  model.addAttribute("registerYeePay1", registerYeePay1);
	        	  return "chongzhi";
 		  /* }*/}
				 }
			 }else{
				 TUser user=userService.getUserByAccount(o.toString());
					model.addAttribute("user", user);
 			 return "register";
 		       
		 }
 		  }
		 TUser user=userService.getUserByAccount(o.toString());
			model.addAttribute("user", user);
			/*return "payment/register";*/
			return "register";
	}
	
	@RequestMapping(value="/gate/doRecharge")
	public String doRecharge(String host, BHARechargeRequest request, Model model,TRecharge recharge) throws Exception {
		Date dt = new Date();   
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
	    
	    recharge.setTime(sdf.format(dt).toString());
		gateService.addOrUpdateTRecharge(recharge);
		return doSign(request, host + "/bha/toRecharge", model);
	}
	
	@RequestMapping(value="/gate/withdraw")
	public String withdraw(Model model) {
		model.addAttribute("now", System.currentTimeMillis());
		return "gate/withdraw";
	}
	
	@RequestMapping(value="/gate/doWithdraw")
	public String doWithdraw(String host, BHAWithdrawRequest request, Model model) {
	
		return doSign(request, host + "/bha/toWithdraw", model);
	}
	
	
	
	@RequestMapping(value="/gate/transfer")
	public String Transfer(Model model,HttpServletRequest request,String buyAmount,TProduct product) throws Exception {
		File f=ReadWirtePropertis.file();
	    System.out.println(f.getPlatformNo()); 
	    model.addAttribute("f", f);
		Object o= request.getSession().getAttribute("name");
		if(o==null){
			return "login";
		}
		List<TProduct> list=productService.queryProductByNumber(product.getEnterpriseNumber());
		             if(list != null && list.size()!=0){
		            	 TProduct Product=list.get(0);
		            	   if(Product.getBuyType()==null)   
		            	   return "xianxia";
		             }
		
		 List<TRegisterYeePay> li= gateService.queryTRegisterYeePayByName(o.toString());
		 List<TRegisterNotify> lis= gateService.queryTRegisterNotifyByName(o.toString());
		/* if(li != null && li.size()!=0){
			 TUser user=userService.getUserByAccount(o.toString());
				model.addAttribute("user", user);
				TRegisterYeePay registerYeePay= li.get(0);
			 return "register";	 
		 }else*/ 
		 
		 if(li != null && li.size()!=0&&lis != null && lis.size()!=0){
			   
		 if(li.get(0).getCode().equals("1")||lis.get(0).getCode().equals("1")){
			 TRegisterYeePay registerYeePay1=li.get(0);
		System.out.println("ddddd"+buyAmount);
		model.addAttribute("registerYeePay1", registerYeePay1);
		model.addAttribute("buyAmount", buyAmount);
		model.addAttribute("product", product);
		model.addAttribute("now", System.currentTimeMillis());
		return "touzicheck";
			 }
		 }else if(li != null && li.size()!=0){
				 TUser user=userService.getUserByAccount(o.toString());
					model.addAttribute("user", user);
					model.addAttribute("now", System.currentTimeMillis());
					TRegisterYeePay registerYeePay= li.get(0);
				 return "register";
			 }
		 
		 TUser user=userService.getUserByAccount(o.toString());
			model.addAttribute("user", user);
			model.addAttribute("now", System.currentTimeMillis());
		 return "register";
		/*return "payment/transfer";*/
	}
	
	@RequestMapping(value="/gate/doTransfer")
	public String doTransfer(String host, BHATransferRequest request, Model model,TTransferInfo TtransferInfo,HttpServletRequest request1) throws Exception {
		int a=0;
		int b=0;
		 List<TInterestRate> li=ptopService.queryTInterestRateByNumber(TtransferInfo.getEnterpriseNumber());
		 System.out.println("rrrrrrrrrrrrrrrrrrrrrrrr"+TtransferInfo.getEnterpriseNumber());
		     int paymentAmount= Integer.parseInt(TtransferInfo.getPaymentAmount());
			for(int i=0;i<li.size();i++){
				if(i<li.size()-1){
				 a=li.get(i).getStartMoney();
				 b=li.get(i+1).getStartMoney();
				}else{
					a=li.get(i).getStartMoney();
				}   b=li.get(i).getHighestMoney();
				if(a<=paymentAmount&&paymentAmount<b){
					/*Double StartInterestRate=li.get(i).getStartInterestRate();*/
					/*int  MoneyIncrease=li.get(i).getMoneyIncrease();
					int  StartMoney= li.get(i).getStartMoney();*/
					/*Double InterestRateIncrease= li.get(i).getInterestRateIncrease();*/
					/*int c=(paymentAmount- StartMoney)/MoneyIncrease;*/
					/*Double d=c*InterestRateIncrease;*/
					/*Double interestRate= StartInterestRate+d;*/
				
					Double StartInterest=li.get(i).getStartInterestRate();
					System.out.println("aaaaaaaaaaaaaaa"+StartInterest);
					TtransferInfo.setInterestRate(StartInterest);
				}
			}
		
			//添加交易时间
			String transDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			TtransferInfo.setTransDate(transDate);
		
			/*List<TProduct> list=productService.queryProductByNumber(TtransferInfo.getEnterpriseNumber());
			TProduct product=list.get(0);*/
			gateService.addOrUpdateTTransferInfo(TtransferInfo);
			
			
			
			
			 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			 System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			 Object o= request1.getSession().getAttribute("name"); 
			 TInvestmentInfo investmentInfo=new TInvestmentInfo();
			 if(o!=null){
				 List<TRegisterYeePay> list=gateService.queryTRegisterYeePayByName(o.toString());
				 if(list != null && list.size()!=0){
					 investmentInfo.setIdentityCard(list.get(0).getIdCardNo());
				 }
			 }
			 investmentInfo.setRequestNo(request.getRequestNo());
			 investmentInfo.setWriteTime(df.format(new Date()));
			 investmentInfo.setInvestmentAmount(Double.parseDouble(TtransferInfo.getPaymentAmount()));
			 investmentInfo.setEnterpriseNumber(TtransferInfo.getEnterpriseNumber());
			 investmentInfo.setState("0");
			 investmentInfo.setInvestor(TtransferInfo.getPlatformUserNo());
		         ptopService.addOrUpdateInvestmentInfo(investmentInfo);
			
			
		    List<TProduct> lis= productService.queryProductByNumber(TtransferInfo.getEnterpriseNumber());
	         TProduct t=lis.get(0);
	          
	            Double RealityMoney=t.getRealityMoney();
	            System.out.println("vvvvvvvvvv"+investmentInfo.getInvestmentAmount()+"vvvvvvvvvvvvvvvv"+RealityMoney);
	            if(RealityMoney==null||RealityMoney==0.0){
	            	Double money = Double.parseDouble(TtransferInfo.getPaymentAmount());
	            	t.setRealityMoney(money);
	            	t.setFinancingProgress(money/t.getFinancingMoney()*100/10000);
	            }else{
	            	/*Double  money=RealityMoney+investmentInfo.getInvestmentAmount();
	            	t.setRealityMoney(money);
	            	t.setFinancingProgress(money/t.getFinancingMoney()*100);*/
	            	
	            	Double d=ptopService.querySum(TtransferInfo.getEnterpriseNumber());
	            	t.setRealityMoney(d);
	            	t.setFinancingProgress(d/t.getFinancingMoney()*100/10000);
	            }
	            
	            System.out.println("vvvvvvvvvvvvvvvvvvvvvvvvvv");
	            
	           ptopService.addOrUpdate(t);	
			
			
			
			
			/*model.addAttribute("now", System.currentTimeMillis());*/
			/* String req="<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
		    			+"<request platformNo='10040011137'>"
		    			+"<platformUserNo>gg123456</platformUserNo> "
		    			+"<orderNo>"+TtransferInfo.getOrderNo()+"</orderNo> "
		    			+"<requestNo>"+System.currentTimeMillis()+"</requestNo> "
		    			+"<fee>"+1+"</fee> "
		    			+"<transfer>"+name+"</transfer> "
		    			+"<requestNo>"+name+"</requestNo> "
		    			+"<transferAmount>"+name+"</transferAmount> "
		    			+"<sourceUserType>"+name+"</sourceUserType> "
		    			+"<sourcePlatformUserNo>"+name+"</sourcePlatformUserNo> "
		    			+"<targetUserType>"+name+"</targetUserType> "
		                +"</request>";*/
			
			
			
		 
		/*  int PaymentAmount= Integer.parseInt(TtransferInfo.getPaymentAmount());
		if(PaymentAmount>100&&PaymentAmount<200){
			TtransferInfo.setInterestRate(7.0);
		}if(PaymentAmount>200&&PaymentAmount<300){
			TtransferInfo.setInterestRate(7.1);
		}if(PaymentAmount>300&&PaymentAmount<400){
			TtransferInfo.setInterestRate(7.2);
		}if(PaymentAmount>400&&PaymentAmount<500){
			TtransferInfo.setInterestRate(7.4);
		}if(PaymentAmount>500&&PaymentAmount<600){
			TtransferInfo.setInterestRate(7.5);
		}if(PaymentAmount>600&&PaymentAmount<700){
			TtransferInfo.setInterestRate(7.6);
		}if(PaymentAmount>700&&PaymentAmount<800){
			TtransferInfo.setInterestRate(7.7);
		}if(PaymentAmount>800&&PaymentAmount<900){
			TtransferInfo.setInterestRate(7.8);
		}if(PaymentAmount>900&&PaymentAmount<1000){
			TtransferInfo.setInterestRate(7.8);
		}if(PaymentAmount>1000&&PaymentAmount<2000){
			TtransferInfo.setInterestRate(8.0);
		}if(PaymentAmount>2000&&PaymentAmount<3000){
			TtransferInfo.setInterestRate(8.1);
		}if(PaymentAmount>3000&&PaymentAmount<4000){
			TtransferInfo.setInterestRate(8.2);
		}if(PaymentAmount>4000&&PaymentAmount<5000){
			TtransferInfo.setInterestRate(8.3);
		}if(PaymentAmount>5000&&PaymentAmount<6000){
			TtransferInfo.setInterestRate(8.4);
		}if(PaymentAmount>6000&&PaymentAmount<7000){
			TtransferInfo.setInterestRate(8.5);
		}if(PaymentAmount>7000&&PaymentAmount<8000){
			TtransferInfo.setInterestRate(8.6);
		}if(PaymentAmount>8000&&PaymentAmount<9000){
			TtransferInfo.setInterestRate(8.7);
		}if(PaymentAmount>9000&&PaymentAmount<10000){
			TtransferInfo.setInterestRate(8.8);
		}if(PaymentAmount>10000&&PaymentAmount<20000){
			TtransferInfo.setInterestRate(9.0);
		}if(PaymentAmount>20000&&PaymentAmount<30000){
			TtransferInfo.setInterestRate(9.1);
		}if(PaymentAmount>30000&&PaymentAmount<40000){
			TtransferInfo.setInterestRate(9.2);
		}if(PaymentAmount>40000&&PaymentAmount<50000){
			TtransferInfo.setInterestRate(9.3);
		}if(PaymentAmount>50000&&PaymentAmount<60000){
			TtransferInfo.setInterestRate(9.4);
		}if(PaymentAmount>60000&&PaymentAmount<70000){
			TtransferInfo.setInterestRate(9.5);
		}if(PaymentAmount>70000&&PaymentAmount<80000){
			TtransferInfo.setInterestRate(9.6);
		}if(PaymentAmount>80000&&PaymentAmount<90000){
			TtransferInfo.setInterestRate(9.7);
		}if(PaymentAmount>90000&&PaymentAmount<100000){
			TtransferInfo.setInterestRate(9.8);
		}if(PaymentAmount>100000&&PaymentAmount<200000){
			TtransferInfo.setInterestRate(10.0);
		}if(PaymentAmount>200000&&PaymentAmount<300000){
			TtransferInfo.setInterestRate(10.1);
		}if(PaymentAmount>300000&&PaymentAmount<400000){
			TtransferInfo.setInterestRate(10.2);
		}if(PaymentAmount>400000&&PaymentAmount<500000){
			TtransferInfo.setInterestRate(10.3);
		}if(PaymentAmount>500000&&PaymentAmount<600000){
			TtransferInfo.setInterestRate(10.4);
		}if(PaymentAmount>600000&&PaymentAmount<700000){
			TtransferInfo.setInterestRate(10.5);
		}if(PaymentAmount>700000&&PaymentAmount<800000){
			TtransferInfo.setInterestRate(10.6);
		}if(PaymentAmount>800000&&PaymentAmount<900000){
			TtransferInfo.setInterestRate(10.7);
		}if(PaymentAmount>900000&&PaymentAmount<100000){
			TtransferInfo.setInterestRate(10.8);
		}*/
			
			
		
		return doSign(request, host + "/bha/toTransfer", model);
	}
	
	
	
	@RequestMapping(value="/gate/establishmentRegistration")
	public String EstablishmentRegistration(Model model,HttpServletRequest request) throws Exception {
		
	
		model.addAttribute("now", System.currentTimeMillis());
		return "payment/establishmentRegistration";
		/*return "payment/transfer";*/
	}
	
	@RequestMapping(value="/gate/doEstablishmentRegistration")
	public String doEstablishmentRegistration(String host, Model model,BHAEstablishmentRegistration  request, TEstablishmentRegistration establishmentRegistration) throws Exception {
		
		gateService.addOrUpdateTEstablishmentRegistration(establishmentRegistration);
	    System.out.println("ddddddddddddddddddd"+establishmentRegistration.getTaxNo());
		return doSign(request, host + "/bha/toEnterpriseRegister", model );
	}
	
	
	@RequestMapping(value="/gate/examEstablishmentRegistration", method = {RequestMethod.POST, RequestMethod.GET})
	public String examEstablishmentRegistration(Model model, String resp, String sign,HttpServletRequest request)throws Exception {
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq");
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);
		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		  
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		     
		      InputStream iStream=new ByteArrayInputStream(resp.getBytes());
		     Document dm=db.parse(iStream);
		      
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("response");
		     
		      TEstablishmentNotify establishmentNotify=new TEstablishmentNotify();
		      
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		  
		    	  }
		    	  
		    	 
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		  establishmentNotify.setService(p.item(1).getTextContent());
		    		  
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		  establishmentNotify.setRequestNo(p.item(3).getTextContent());
		    		  
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		  establishmentNotify.setCode(p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		  establishmentNotify.setDescription(p.item(7).getTextContent());
		    		  
		    	  }
		    	  
		      }  
		      gateService.addOrUpdateTEstablishmentNotify(establishmentNotify);
		      TEstablishmentRegistration establishmentRegistration= gateService.queryTEstablishmentRegistrationByNumber(establishmentNotify.getRequestNo()).get(0);
		      establishmentRegistration.setCode( establishmentNotify.getCode());
		      gateService.addOrUpdateTEstablishmentRegistration(establishmentRegistration);
		  } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	        } finally {
	        }
		    	  
		
		
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq");
		return "payment/establishmentRegistration";
	
	}
	
	
	@RequestMapping(value="/gate/exam", method = {RequestMethod.POST, RequestMethod.GET})
	public String exam(Model model, String resp, String sign,HttpServletRequest request)throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq");
		
		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		  
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		     
		      InputStream iStream=new ByteArrayInputStream(resp.getBytes());
		     Document dm=db.parse(iStream);
		      
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("response");
		     
		      TYeePay YeePay=new TYeePay();
		      
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		  
		    	  }
		    	  
		    	 
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		  YeePay.setService(p.item(1).getTextContent());
		    		  
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		  YeePay.setRequestNo(p.item(3).getTextContent());
		    		  
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		  YeePay.setCode(p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		  YeePay.setDescription(p.item(7).getTextContent());
		    		  
		    	  }
		    	  
		      }  
		    	  
		    	  
		    	  gateService.addOrUpdate(YeePay);
		    	  /*TRegisterYeePay registerYeePay=new TRegisterYeePay();*/
		    	 
		    	 TRegisterYeePay registerYeePay= gateService.queryTRegisterYeePayByNumber(YeePay.getRequestNo()).get(0);
		    	 registerYeePay.setCode(YeePay.getCode());
		    	    gateService.addOrUpdateRegisterYeePay(registerYeePay);
		    	   
		    	   /* Object o= request.getSession().getAttribute("name");
		    	  System.out.println("aaaaaaaaaaaaa"+o.toString());*/
		    	 
		    		  TRegisterYeePay registerYeePay1= gateService.queryTRegisterYeePayByName(registerYeePay.getPlatformUserNo()).get(0);
		    		 /* System.out.println(registerYeePay1.getPlatformUserNo()+"sssssssss"+o.toString());*/
		    		  model.addAttribute("now", System.currentTimeMillis());
		    		  System.out.println("ddddddddddddddd"+registerYeePay1.getPlatformUserNo()+"ddddddddd"+registerYeePay1.getCode());
		    		  /*if(registerYeePay1.getPlatformUserNo()!=null&&registerYeePay1.getCode().equals("1")){
			        	  model.addAttribute("registerYeePay1", registerYeePay1);*/
			        	  return "zhuce";
			         /* }else if(registerYeePay1.getCode()!="1"){
			        	  
			        	  return "register";
			          }
			     */
		    	  
		    	 
		    	  
		         
		      
		      
		        } catch (Exception e) {
		            // TODO: handle exception
		            e.printStackTrace();
		        } finally {
		        }
		    
		
		
		
		
		
		
		/*String a="<?xml version='1.0' encoding='UTF-8'?>"
		+"<employees>"
		+"<employee>"
		+"<name>ddviplinux</name>"
		+"<sex>m</sex>"
		+"<age>30</age>"
		+"</employee>"
		+"</employees>";
		
		System.out.println("xxxxxxxxx"+a);
		
		
	
			try { 
				System.out.println("解ddddddddddddddddddd1"); 
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance(); 
			System.out.println("解ccccccccccccccccccccccc2"); 
			DocumentBuilder db = dbf.newDocumentBuilder(); 
			System.out.println("解ccccccccccccccccccccccc3"); 
			Document document = db.parse(a); 
			System.out.println("解ccccccccccccccccccccccc4"); 
			NodeList employees = document.getChildNodes(); 
			System.out.println("解ccccccccccccccccccccccc5"); 
			for (int i = 0; i < employees.getLength(); i++) { 
				System.out.println("解ssssssssssssssssssss6"); 
			Node employee = employees.item(i); 
			System.out.println(employee.getNodeName() 
					+ ":" + employee.getTextContent()); 
			NodeList employeeInfo = employee.getChildNodes(); 
			
			} 
			System.out.println("解析完毕"); 
			} catch (FileNotFoundException e) { 
			System.out.println(e.getMessage()); 
			} catch (ParserConfigurationException e) { 
			System.out.println(e.getMessage()); 
			} catch (SAXException e) { 
			System.out.println(e.getMessage()); 
			} catch (IOException e) { 
			System.out.println(e.getMessage()); 
			} */
			 
			 
		
		
		  
		/*return "payment/exam";*/
		  
		return "register";
	}
	
	
	
	
	@RequestMapping(value="/gate/examRecharge", method = {RequestMethod.POST, RequestMethod.GET})
	public String examRecharge(Model model, String resp, String sign,HttpServletRequest request)throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq");
		
		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		  
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		     
		      InputStream iStream=new ByteArrayInputStream(resp.getBytes());
		     Document dm=db.parse(iStream);
		      
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("response");
		     
		      TRechargeSucceed rechargeSucceed=new TRechargeSucceed();
		      
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		  
		    	  }
		    	  
		    	 
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		 /* YeePay.setService(p.item(1).getTextContent());*/
		    		  rechargeSucceed.setService(p.item(1).getTextContent());
		
		    		  
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		 /* YeePay.setRequestNo(p.item(3).getTextContent());*/
		    		  rechargeSucceed.setRequestNo(p.item(3).getTextContent());
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		 /* YeePay.setCode(p.item(5).getTextContent());*/
		    		  rechargeSucceed.setCode(p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		 /* YeePay.setDescription(p.item(7).getTextContent());*/
		    		  rechargeSucceed.setDescription(p.item(7).getTextContent());
		    		  
		    	  }
		    	  
		      }  
		    	  
		    	  
		    	  gateService.addOrUpdateTRechargeSucceed(rechargeSucceed);;
		    	  /*TRegisterYeePay registerYeePay=new TRegisterYeePay();*/
		    	 
		    	  //充值成功后发送邮件
		    	  TRecharge recharge=gateService.queryTRechargeByRequestNo(rechargeSucceed.getRequestNo()).get(0);
		    	  TUser user=(TUser)request.getSession().getAttribute("userinfo");
		    	  TTransNotice transnotice=transNoticeService.queryTransNoticeByName(user.getName()).get(0);
		    	  List list=transNoticeService.queryTransNoticeByNameAndtypes(user.getName(), "充值", "邮件通知");
		    	  if(transnotice!=null){
		    	  if(list.size()!=0){
		    		  boolean flag = false;
		    		// 这个类主要是设置邮件
		    			MailSenderInfo mailInfo = new MailSenderInfo();
		    			mailInfo.setMailServerHost("smtp.ptobchina.com");
		    			mailInfo.setMailServerPort("25");
		    			mailInfo.setValidate(true);
		    			mailInfo.setUserName("cs@ptobchina.com");
		    			mailInfo.setPassword("12qwaszx");
		    			mailInfo.setFromAddress("cs@ptobchina.com");
		    			mailInfo.setToAddress(user.getEmail());
		    			mailInfo.setSubject("中租宝-充值成功"); // 设置邮箱标题
		    			String mainjsp = "http://www.ptobchina.com/wel";
		    			String msgContent = "亲爱的用户"
		    					+ user.getName()
		    					+ "，您好，<br/><br/>"
		    					+ "您在"
		    					+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		    			.format(new Date())
		    			+ "充值成功！<br/><br/>"
		    			+ "订单编号："+recharge.getRequestNo()+"<br/><br/>"
		    			+ "充值金额："+recharge.getAmount()+"元<br/><br/>"
		    			+ "中租宝   <a href=" + mainjsp
		    			+ "><font color='green'>http://www.ptobchina.com/</font></a>"
		    			+ "<br/><br/>" + "此为自动发送邮件，请勿直接回复！";
		    			mailInfo.setContent(msgContent); //
		    			// 这个类主要来发送邮件
		    			SimpleMailSender sms = new SimpleMailSender();
		    			// sms.sendTextMail(mailInfo);//发送文体格式
		    			flag = sms.sendHtmlMail(mailInfo);// 发送html格式
		    			if (flag != true) {
		    				mailInfo.setUserName("no-reply@ptobchina.com");
		    				mailInfo.setPassword("12qwaszx");// 您的邮箱密码
		    				mailInfo.setFromAddress("no-reply@ptobchina.com");
		    				flag = sms.sendHtmlMail(mailInfo);
		    			}
		    	  }
		    	   
		    	  }
		    	  if(transnotice==null){
		    			  boolean flag = false;
		    			  // 这个类主要是设置邮件
		    			  MailSenderInfo mailInfo = new MailSenderInfo();
		    			  mailInfo.setMailServerHost("smtp.ptobchina.com");
		    			  mailInfo.setMailServerPort("25");
		    			  mailInfo.setValidate(true);
		    			  mailInfo.setUserName("cs@ptobchina.com");
		    			  mailInfo.setPassword("12qwaszx");
		    			  mailInfo.setFromAddress("cs@ptobchina.com");
		    			  mailInfo.setToAddress(user.getEmail());
		    			  mailInfo.setSubject("中租宝-充值成功"); // 设置邮箱标题
		    			  String mainjsp = "http://www.ptobchina.com/wel";
		    			  String msgContent = "亲爱的用户"
		    					  + user.getName()
		    					  + "，您好，<br/><br/>"
		    					  + "您在"
		    					  + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		    			  .format(new Date())
		    			  + "充值成功！<br/><br/>"
		    			  + "订单编号："+recharge.getRequestNo()+"<br/><br/>"
		    			  + "充值金额："+recharge.getAmount()+"元<br/><br/>"
		    			  + "中租宝   <a href=" + mainjsp
		    			  + "><font color='green'>http://www.ptobchina.com/</font></a>"
		    			  + "<br/><br/>" + "此为自动发送邮件，请勿直接回复！";
		    			  mailInfo.setContent(msgContent); //
		    			  // 这个类主要来发送邮件
		    			  SimpleMailSender sms = new SimpleMailSender();
		    			  // sms.sendTextMail(mailInfo);//发送文体格式
		    			  flag = sms.sendHtmlMail(mailInfo);// 发送html格式
		    			  if (flag != true) {
		    				  mailInfo.setUserName("no-reply@ptobchina.com");
		    				  mailInfo.setPassword("12qwaszx");// 您的邮箱密码
		    				  mailInfo.setFromAddress("no-reply@ptobchina.com");
		    				  flag = sms.sendHtmlMail(mailInfo);
		    			  }
		    		
		    	  }
		    	  
		    	 
		  
		         
		      
		      
		        } catch (Exception e) {
		            // TODO: handle exception
		            e.printStackTrace();
		        } finally {
		        }
		   
	
		  
		return "chongzhi_ok";
	}
	
	
	
	
	@RequestMapping(value="/gate/transferSucceed", method = {RequestMethod.POST, RequestMethod.GET})
	public String transferSucceed(Model model, String resp, String sign,HttpServletRequest request)throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);
		System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzz");
		
		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		  
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		     
		      InputStream iStream=new ByteArrayInputStream(resp.getBytes());
		     Document dm=db.parse(iStream);
		      
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("response");
		     
		      TTransferSucceed TTransferSucceed=new TTransferSucceed();
		      
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		 
		    	  }
		    	  
		    	 
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		  TTransferSucceed.setService(p.item(1).getTextContent());
		    		  
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		  TTransferSucceed.setRequestNo(p.item(3).getTextContent());
		    		  
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		  TTransferSucceed.setCode(p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		  TTransferSucceed.setDescription(p.item(7).getTextContent());
		    		  
		    	  }
		    	  
		      }  
		      List<TInvestmentInfo> li=gateService.queryTInvestmentInfoByName(TTransferSucceed.getRequestNo());
		      if(li != null && li.size()!=0){
		    	  TInvestmentInfo investmentInfo = li.get(0);
		    	  investmentInfo.setCode(TTransferSucceed.getCode());
		    	  ptopService.addOrUpdateInvestmentInfo(investmentInfo);
		    	   
		      }
		      gateService.addOrUpdateTTransferSucceed(TTransferSucceed);
		      TTransferInfo transferInfo = gateService.queryTTransferInfoByNumber(TTransferSucceed.getRequestNo()).get(0);
		      transferInfo.setCode(TTransferSucceed.getCode());
		      gateService.addOrUpdateTTransferInfo(transferInfo);
		      model.addAttribute("transferInfo", transferInfo);
		    	  
		    
		      
		    	 
		      
		     /* List<TProduct> list=productService.queryProductByNumber(transferInfo.getEnterpriseNumber());
				TProduct product=list.get(0);
				model.addAttribute("now", System.currentTimeMillis());
				 System.out.println("dddddddddddddddddddd"+transferInfo.getPlatformUserNo());
				 System.out.println("dddddddddddddddddddd"+transferInfo.getTransferAmount());
			
				 String req="<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
			    			+"<request platformNo='10040011137'>"
						 +"<request platformNo='10012415118'>"
			    			+"<platformUserNo>gg123456</platformUserNo> "
			    			+"<orderNo>"+transferInfo.getOrderNo()+"</orderNo> "
			    			+"<requestNo>"+System.currentTimeMillis()+"</requestNo> "
			    			+"<fee>"+"fee"+"</fee> "
			    			+"<transfers>"
			    			+"<transfer>"
			    			+"<requestNo>"+transferInfo.getRequestNo()+"</requestNo> "
			    			+"<transferAmount>"+transferInfo.getPaymentAmount()+"</transferAmount> "
			    			+"<sourceUserType>"+"MEMBER"+"</sourceUserType> "
			    			+"<sourcePlatformUserNo>"+transferInfo.getPlatformUserNo()+"</sourcePlatformUserNo> "
			    			+"<targetUserType>"+"MEMBER"+"</targetUserType> "
			    			+"<targetPlatformUserNo>"+product.getTargetPlatformUserNo()+"</targetPlatformUserNo> "
			    			+"<targetPlatformUserNo>"+"601522539"+"</targetPlatformUserNo> "
			    			+"</transfer>"
			    			+"</transfers>"
			    			+"<notifyUrl>"+"http://192.168.1.207:8080/spring3/gate/loanexam"+"</notifyUrl> "
			                +"</request>";
		       String service="LOAN";
			   String host="http://qa.yeepay.com/member";	
		    	   String host="https://member.yeepay.com/member";	
		    	  
		       doloan(host, req,service, model);*/
				
		    		 
		    		
		    		
		      
		      
		        } catch (Exception e) {
		            // TODO: handle exception
		            e.printStackTrace();
		        } finally {
		        }
		   
		
		  
		/*return "payment/exam";*/
		  return "buy_ok";
		  
		/*return "chong";*/
	}

	
	
	
	
	@RequestMapping(value="/gate/bindingSucceed", method = {RequestMethod.POST, RequestMethod.GET})
	public String binding(Model model, String resp, String sign,HttpServletRequest request)throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq");
		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
         
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      System.out.println("eeeeeeeeeee");
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		     
		      InputStream iStream=new ByteArrayInputStream(resp.getBytes("UTF-8"));
		     Document dm=db.parse(iStream);
		     System.out.println("ssssssssssssss"+resp);
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("response");
		      System.out.println("qqqqqqqqqqqqq");
		      TBindingSucceed bindingSucceed=new TBindingSucceed();
		      System.out.println("wwwwwwwwwwwwwww");
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		 
		    	  }
		    	  
		    	 
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		  bindingSucceed.setService(p.item(1).getTextContent());
		    		  System.out.println("ddddddd"+p.item(1).getTextContent());
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		  bindingSucceed.setPlatformNo(p.item(3).getTextContent());
		    		  System.out.println("ddddddd"+p.item(3).getTextContent());
		    		  
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		  bindingSucceed.setCode(p.item(5).getTextContent());
		    		  System.out.println("ddddddd"+p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		  bindingSucceed.setDescription(p.item(7).getTextContent());
		    		  System.out.println("ddddddd"+p.item(7).getTextContent());
		    		  
		    	  } 
		    	  
		      }  
		      
		      gateService.addOrUpdateTBindingSucceed(bindingSucceed);
		  
		  } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	        } finally {
	        }
		
		 
		
		/*return "payment/binding";*/
		  return "bangding_ok";
	}
		
	
	
	@RequestMapping(value="/gate/loanexam", method = {RequestMethod.POST, RequestMethod.GET})
	public String loanexam(Model model, String notify, String sign)throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq"+notify);
		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
         
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      System.out.println("eeeeeeeeeee");
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		     
		      InputStream iStream=new ByteArrayInputStream(notify.getBytes("UTF-8"));
		     Document dm=db.parse(iStream);
		     System.out.println("oooooooooooooooooooooooo"+notify);
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("response");
		      System.out.println("qqqqqqqqqqqqq");
		      TBindingSucceed bindingSucceed=new TBindingSucceed();
		      System.out.println("wwwwwwwwwwwwwww");
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		 
		    	  }
		    	  
		    	 
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		  /*bindingSucceed.setService(p.item(1).getTextContent());*/
		    		  System.out.println("ddddddd"+p.item(1).getTextContent());
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		/*  bindingSucceed.setPlatformNo(p.item(3).getTextContent());*/
		    		  System.out.println("ddddddd"+p.item(3).getTextContent());
		    		  
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		/*  bindingSucceed.setCode(p.item(5).getTextContent());*/
		    		  System.out.println("ddddddd"+p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		 /* bindingSucceed.setDescription(p.item(7).getTextContent());*/
		    		  System.out.println("ddddddd"+p.item(7).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(9).getNodeName()!=null&&p.item(9).getTextContent()!=null){
		    		 /* bindingSucceed.setDescription(p.item(9).getTextContent());*/
		    		  System.out.println("ddddddd"+p.item(9).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(11).getNodeName()!=null&&p.item(11).getTextContent()!=null){
		    		/*  bindingSucceed.setDescription(p.item(11).getTextContent());*/
		    		  System.out.println("ddddddd"+p.item(11).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(13).getNodeName()!=null&&p.item(13).getTextContent()!=null){
		    		 /* bindingSucceed.setDescription(p.item(13).getTextContent());*/
		    		  System.out.println("ddddddd"+p.item(13).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(15).getNodeName()!=null&&p.item(15).getTextContent()!=null){
		    		 /* bindingSucceed.setDescription(p.item(15).getTextContent());*/
		    		  System.out.println("ddddddd"+p.item(15).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(17).getNodeName()!=null&&p.item(17).getTextContent()!=null){
		    		/*  bindingSucceed.setDescription(p.item(17).getTextContent());*/
		    		  System.out.println("ddddddd"+p.item(17).getTextContent());
		    		  
		    	  } 
		    	  
		    	 
		    	  
		      }  
		      
		      gateService.addOrUpdateTBindingSucceed(bindingSucceed);
		  
		  } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	        } finally {
	        }
		
		
		
		return "payment/binding";
	}
		
	
	
	
	
	
	
	@RequestMapping(value="/gate/registerNotify", method = {RequestMethod.POST, RequestMethod.GET})
	public String registerNotify( String notify, String sign,Model model)throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);
		System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"+notify);
		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
         
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      System.out.println("eeeeeeeeeee");
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		     
		      InputStream iStream=new ByteArrayInputStream(notify.getBytes("UTF-8"));
		     Document dm=db.parse(iStream);
		     System.out.println("oooooooooooooooooooooooo"+notify);
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("notify");
		      System.out.println("qqqqqqqqqqqqq");
		      TRegisterNotify registerNotify=new TRegisterNotify();
		      System.out.println("wwwwwwwwwwwwwww");
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		 
		    	  }
		    	
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		  registerNotify.setRequestNo(p.item(1).getTextContent());
		    		 
		    		  System.out.println("ddddddd"+p.item(1).getTextContent());
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		  registerNotify.setPlatformNo(p.item(3).getTextContent());
		    		  System.out.println("ddddddd"+p.item(3).getTextContent());
		    		  
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		  registerNotify.setBizType(p.item(5).getTextContent());
		    		  System.out.println("ddddddd"+p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		  registerNotify.setCode(p.item(7).getTextContent());
		    		  System.out.println("ddddddd"+p.item(7).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(9).getNodeName()!=null&&p.item(9).getTextContent()!=null){
		    		  registerNotify.setMessage(p.item(9).getTextContent());
		    		  System.out.println("ddddddd"+p.item(9).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(11).getNodeName()!=null&&p.item(11).getTextContent()!=null){
		    		  registerNotify.setPlatformUserNo(p.item(11).getTextContent());
		    		  System.out.println("ddddddd"+p.item(11).getTextContent());
		    		  
		    	  } 
		    	 
		    	
		    	   /* <requestNo>1417974396427</requestNo>
		    	    <platformNo>10040011137</platformNo>
		    	    <bizType>REGISTER</bizType>
		    	    <code>1</code>
		    	    <message>注册成功</message>
		    	    <platformUserNo>cccccc</platformUserNo>*/
		    	  
		    	 
		    	  
		      }  
		      gateService.addOrUpdateTRegisterNotify(registerNotify);
		      
		      /*gateService.addOrUpdateTTransferNotify(transferNotify);*/
		  
		  } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	        } finally {
	        }
		
		
		
		return "payment/binding";
	}
	
	
	
	
	
	
	@RequestMapping(value="/gate/rechargeNotify", method = {RequestMethod.POST, RequestMethod.GET})
	public String rechargeNotify( String notify, String sign,Model model)throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);
		System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"+notify);
		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
         
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      System.out.println("eeeeeeeeeee");
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		     
		      InputStream iStream=new ByteArrayInputStream(notify.getBytes("UTF-8"));
		     Document dm=db.parse(iStream);
		     System.out.println("oooooooooooooooooooooooo"+notify);
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("notify");
		      System.out.println("qqqqqqqqqqqqq");
		      TRechargeNotify rechargeNotify=new TRechargeNotify();
		      System.out.println("wwwwwwwwwwwwwww");
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		 
		    	  }
		    	
		    	  
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		  rechargeNotify.setRequestNo(p.item(1).getTextContent());
		    		  System.out.println("ddddddd"+p.item(1).getTextContent());
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		  rechargeNotify.setPlatformNo(p.item(3).getTextContent());
		    		  System.out.println("ddddddd"+p.item(3).getTextContent());
		    		  
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		  rechargeNotify.setBizType(p.item(5).getTextContent());
		    		  System.out.println("ddddddd"+p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		  rechargeNotify.setCode(p.item(7).getTextContent());
		    		  System.out.println("ddddddd"+p.item(7).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(9).getNodeName()!=null&&p.item(9).getTextContent()!=null){
		    		  rechargeNotify.setMessage(p.item(9).getTextContent());
		    		  System.out.println("ddddddd"+p.item(9).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(11).getNodeName()!=null&&p.item(11).getTextContent()!=null){
		    		  rechargeNotify.setPlatformUserNo(p.item(11).getTextContent());
		    		  System.out.println("ddddddd"+p.item(11).getTextContent());
		    		  
		    	  } 
		    	
		    	
		    	
		    	  
		    	 
		    	  
		      }  
		      
		      gateService.addOrUpdateTRechargeNotify(rechargeNotify);
		      
		      /*gateService.addOrUpdateTTransferNotify(transferNotify);*/
		  
		  } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	        } finally {
	        }
		
		
		
		return "payment/binding";
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="/gate/transferNotify", method = {RequestMethod.POST, RequestMethod.GET})
	public String transferNotify( String notify, String sign,Model model)throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);
		System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"+notify);
		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
         
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      System.out.println("eeeeeeeeeee");
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		     
		      InputStream iStream=new ByteArrayInputStream(notify.getBytes("UTF-8"));
		     Document dm=db.parse(iStream);
		     System.out.println("oooooooooooooooooooooooo"+notify);
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("notify");
		      System.out.println("qqqqqqqqqqqqq");
		      TTransferNotify transferNotify=new TTransferNotify();
		      System.out.println("wwwwwwwwwwwwwww");
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		 
		    	  }
		    	
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		  transferNotify.setPlatformNo(p.item(1).getTextContent());
		    		  System.out.println("ddddddd"+p.item(1).getTextContent());
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		  transferNotify.setBizType(p.item(3).getTextContent());
		    		  System.out.println("ddddddd"+p.item(3).getTextContent());
		    		  
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		  transferNotify.setCode(p.item(5).getTextContent());
		    		  System.out.println("ddddddd"+p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		  transferNotify.setMessage(p.item(7).getTextContent());
		    		  System.out.println("ddddddd"+p.item(7).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(9).getNodeName()!=null&&p.item(9).getTextContent()!=null){
		    		  transferNotify.setRequestNo(p.item(9).getTextContent());
		    		  System.out.println("ddddddd"+p.item(9).getTextContent());
		    		  
		    	  } 
		    	
		    	
		    	
		    	  
		    	 
		    	  
		      }  
		      
		      gateService.addOrUpdateTTransferNotify(transferNotify);
		      
		      /*gateService.addOrUpdateTTransferNotify(transferNotify);*/
		  
		  } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	        } finally {
	        }
		
		
		
		return "payment/binding";
	}

	
	@RequestMapping(value="/gate/bindingNotify", method = {RequestMethod.POST, RequestMethod.GET})
	public String bindingNotify(Model model, String notify, String sign,HttpServletRequest request)throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq"+notify);
		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
         
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      System.out.println("eeeeeeeeeee");
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		     
		      InputStream iStream=new ByteArrayInputStream(notify.getBytes("UTF-8"));
		     Document dm=db.parse(iStream);
		     System.out.println("oooooooooooooooooooooooo"+notify);
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("notify");
		      System.out.println("qqqqqqqqqqqqq");
		      TBindingNotify bindingNotify=new TBindingNotify();
		      System.out.println("wwwwwwwwwwwwwww");
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		 
		    	  }
		    	  
		    	 
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		  bindingNotify.setRequestNo(p.item(1).getTextContent());
		    		  System.out.println("ddddddd"+p.item(1).getTextContent());
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		  bindingNotify.setPlatformNo(p.item(3).getTextContent());
		    		  System.out.println("ddddddd"+p.item(3).getTextContent());
		    		  
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		  bindingNotify.setBizType(p.item(5).getTextContent());
		    		  System.out.println("ddddddd"+p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		  bindingNotify.setCode(p.item(7).getTextContent());
		    		  System.out.println("ddddddd"+p.item(7).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(9).getNodeName()!=null&&p.item(9).getTextContent()!=null){
		    		  bindingNotify.setMessage(p.item(9).getTextContent());
		    		  System.out.println("ddddddd"+p.item(9).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(11).getNodeName()!=null&&p.item(11).getTextContent()!=null){
		    		  bindingNotify.setPlatformUserNo(p.item(11).getTextContent());
		    		  System.out.println("ddddddd"+p.item(11).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(13).getNodeName()!=null&&p.item(13).getTextContent()!=null){
		    		  bindingNotify.setBankCardNo(p.item(13).getTextContent());
		    		  System.out.println("ddddddd"+p.item(13).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(15).getNodeName()!=null&&p.item(15).getTextContent()!=null){
		    		  bindingNotify.setCardStatus(p.item(15).getTextContent());
		    		  System.out.println("ddddddd"+p.item(15).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(17).getNodeName()!=null&&p.item(17).getTextContent()!=null){
		    		  bindingNotify.setBank(p.item(17).getTextContent());
		    		  System.out.println("ddddddd"+p.item(17).getTextContent());
		    		  
		    	  } 
		    	  
		    	  
	
		    	  
		      }  
		      
		      gateService.addOrUpdateTBindingNotify(bindingNotify);
		  
		  } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	        }
		return "payment/binding";
	}
	
	
	
	
	@RequestMapping(value="/gate/drawMoneyNotify", method = {RequestMethod.POST, RequestMethod.GET})
	public String drawMoneyNotify(Model model, String notify, String sign,HttpServletRequest request)throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq"+notify);
		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
         
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      System.out.println("eeeeeeeeeee");
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		     
		      InputStream iStream=new ByteArrayInputStream(notify.getBytes("UTF-8"));
		     Document dm=db.parse(iStream);
		     System.out.println("oooooooooooooooooooooooo"+notify);
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("notify");
		      System.out.println("qqqqqqqqqqqqq");
		      TDrawMoneyNotify drawMoneyNotify=new TDrawMoneyNotify();
		      System.out.println("wwwwwwwwwwwwwww");
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		 
		    	  }
		    	  
		    	 
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		  drawMoneyNotify.setPlatformNo(p.item(1).getTextContent());
		    		  System.out.println("ddddddd"+p.item(1).getTextContent());
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		  drawMoneyNotify.setBizType(p.item(3).getTextContent());
		    		  System.out.println("ddddddd"+p.item(3).getTextContent());
		    		  
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		  drawMoneyNotify.setCode(p.item(5).getTextContent());
		    		  System.out.println("ddddddd"+p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		  drawMoneyNotify.setMessage(p.item(7).getTextContent());
		    		  System.out.println("ddddddd"+p.item(7).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(9).getNodeName()!=null&&p.item(9).getTextContent()!=null){
		    		  drawMoneyNotify.setRequestNo(p.item(9).getTextContent());
		    		  System.out.println("ddddddd"+p.item(9).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(11).getNodeName()!=null&&p.item(11).getTextContent()!=null){
		    		  drawMoneyNotify.setPlatformUserNo(p.item(11).getTextContent());
		    		  System.out.println("ddddddd"+p.item(11).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(13).getNodeName()!=null&&p.item(13).getTextContent()!=null){
		    		  drawMoneyNotify.setCardNo(p.item(13).getTextContent());
		    		  System.out.println("ddddddd"+p.item(13).getTextContent());
		    		  
		    	  } 
		    	  if(p.item(15).getNodeName()!=null&&p.item(15).getTextContent()!=null){
		    		  drawMoneyNotify.setBank(p.item(15).getTextContent());
		    		  System.out.println("ddddddd"+p.item(15).getTextContent());
		    		  
		    	  } 
		    	
		    	  
		    	 
	
		    	  
		      }  
		      
		      gateService.addOrUpdateTDrawMoneyNotify(drawMoneyNotify);
		  
		  } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	        }
		return "payment/binding";
	}
	
	
	
		
	
	@RequestMapping(value="/gate/drawMoneySucceed", method = {RequestMethod.POST, RequestMethod.GET})
	public String drawMoneySucceed(Model model, String resp, String sign,HttpServletRequest request)throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq");
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
         
		  try {
		            
		      //    通过 解析器 工厂 创建 一个 解析 器 
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      System.out.println("eeeeeeeeeee");
		      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
		      TDrawMoneySucceed drawMoneySucceed =new TDrawMoneySucceed();
		      InputStream iStream=new ByteArrayInputStream(resp.getBytes("UTF-8"));
		     Document dm=db.parse(iStream);
		     System.out.println("ssssssssssssss"+resp);
		      //得到 所有 person节点 
		      NodeList persons=dm.getElementsByTagName("response");
		      System.out.println("qqqqqqqqqqqqq");
		     /* TBindingSucceed bindingSucceed=new TBindingSucceed();*/
		      System.out.println("wwwwwwwwwwwwwww");
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  Node e= p.item(j);
		    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
		    		 
		    	  }
		    	  
		    	 
		    	  
		    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
		    		  drawMoneySucceed.setService(p.item(1).getTextContent());
		    		  System.out.println("ddddddd"+p.item(1).getTextContent());
		    	  }
		    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
		    		  drawMoneySucceed.setRequestNo(p.item(3).getTextContent());
		    		  System.out.println("ddddddd"+p.item(3).getTextContent());
		    		  
		    	  }
		    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
		    		  drawMoneySucceed.setCode(p.item(5).getTextContent());
		    		  System.out.println("ddddddd"+p.item(5).getTextContent());
		    		  
		    	  }
		    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
		    		  drawMoneySucceed.setDescription(p.item(7).getTextContent());
		    		  System.out.println("ddddddd"+p.item(7).getTextContent());
		    		  
		    	  } 
		    	  
		      }  
		      gateService.addOrUpdateTDrawMoneySucceed(drawMoneySucceed);
		      
		      
		      //提现成功后发送邮件
	    	  TDrawMoney drawmoney=gateService.queryTDrawMoneyByRequestNo(drawMoneySucceed.getRequestNo()).get(0);
	    	  TUser user=(TUser)request.getSession().getAttribute("userinfo");
	    	  TTransNotice transnotice=transNoticeService.queryTransNoticeByName(user.getName()).get(0);
	    	  List list=transNoticeService.queryTransNoticeByNameAndtypes(user.getName(), "提现", "邮件通知");
	    	  if(transnotice!=null){
	    	  if(list.size()!=0){
	    		  boolean flag = false;
	    		// 这个类主要是设置邮件
	    			MailSenderInfo mailInfo = new MailSenderInfo();
	    			mailInfo.setMailServerHost("smtp.ptobchina.com");
	    			mailInfo.setMailServerPort("25");
	    			mailInfo.setValidate(true);
	    			mailInfo.setUserName("cs@ptobchina.com");
	    			mailInfo.setPassword("12qwaszx");
	    			mailInfo.setFromAddress("cs@ptobchina.com");
	    			mailInfo.setToAddress(user.getEmail());
	    			mailInfo.setSubject("中租宝-提现成功"); // 设置邮箱标题
	    			String mainjsp = "http://www.ptobchina.com/wel";
	    			String msgContent = "亲爱的用户"
	    					+ user.getName()
	    					+ "，您好，<br/><br/>"
	    					+ "您在"
	    					+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
	    			.format(new Date())
	    			+ "提现成功！<br/><br/>"
	    			+ "订单编号："+drawmoney.getRequestNo()+"<br/><br/>"
	    			+ "提现金额："+drawmoney.getAmount()+"元<br/><br/>"
	    			+ "中租宝   <a href=" + mainjsp
	    			+ "><font color='green'>http://www.ptobchina.com/</font></a>"
	    			+ "<br/><br/>" + "此为自动发送邮件，请勿直接回复！";
	    			mailInfo.setContent(msgContent); //
	    			// 这个类主要来发送邮件
	    			SimpleMailSender sms = new SimpleMailSender();
	    			// sms.sendTextMail(mailInfo);//发送文体格式
	    			flag = sms.sendHtmlMail(mailInfo);// 发送html格式
	    			if (flag != true) {
	    				mailInfo.setUserName("no-reply@ptobchina.com");
	    				mailInfo.setPassword("12qwaszx");// 您的邮箱密码
	    				mailInfo.setFromAddress("no-reply@ptobchina.com");
	    				flag = sms.sendHtmlMail(mailInfo);
	    			}
	    	  }
	    	   
	    	  }
	    	  if(transnotice==null){
	    			  boolean flag = false;
	    			  // 这个类主要是设置邮件
	    			  MailSenderInfo mailInfo = new MailSenderInfo();
		    			mailInfo.setMailServerHost("smtp.ptobchina.com");
		    			mailInfo.setMailServerPort("25");
		    			mailInfo.setValidate(true);
		    			mailInfo.setUserName("cs@ptobchina.com");
		    			mailInfo.setPassword("12qwaszx");
		    			mailInfo.setFromAddress("cs@ptobchina.com");
		    			mailInfo.setToAddress(user.getEmail());
		    			mailInfo.setSubject("中租宝-提现成功"); // 设置邮箱标题
		    			String mainjsp = "http://www.ptobchina.com/wel";
		    			String msgContent = "亲爱的用户"
		    					+ user.getName()
		    					+ "，您好，<br/><br/>"
		    					+ "您在"
		    					+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		    			.format(new Date())
		    			+ "提现成功！<br/><br/>"
		    			+ "订单编号："+drawmoney.getRequestNo()+"<br/><br/>"
		    			+ "提现金额："+drawmoney.getAmount()+"元<br/><br/>"
		    			+ "中租宝   <a href=" + mainjsp
		    			+ "><font color='green'>http://www.ptobchina.com/</font></a>"
		    			+ "<br/><br/>" + "此为自动发送邮件，请勿直接回复！";
		    			mailInfo.setContent(msgContent); //
		    			// 这个类主要来发送邮件
		    			SimpleMailSender sms = new SimpleMailSender();
		    			// sms.sendTextMail(mailInfo);//发送文体格式
		    			flag = sms.sendHtmlMail(mailInfo);// 发送html格式
		    			if (flag != true) {
		    				mailInfo.setUserName("no-reply@ptobchina.com");
		    				mailInfo.setPassword("12qwaszx");// 您的邮箱密码
		    				mailInfo.setFromAddress("no-reply@ptobchina.com");
		    				flag = sms.sendHtmlMail(mailInfo);
		    			}
	    		
	    	  }
	    	  
	    	 
		      
		     /* gateService.addOrUpdateTBindingSucceed(bindingSucceed);*/
		  
		  } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	        } finally {
	        }
		
		
		
		/*return "payment/drawMoney";*/
		/*return "bangding_ok";*/
		  return "tixian_ok";
	
	}
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	private String doSign(String xml, String url, Model model, String service) {
		System.out.println("ssssssssssssss");
		String pfx = servletContext.getRealPath("/WEB-INF/zhengshu.pfx");
		System.out.println("wwwwwwwwwwwwwwwwwww1"+xml);
		String s = xml;
		s = s.replaceAll("[\\r\\n]", "");
		
		System.out.println("wwwwwwwwwwwwwwwwwww1"+s);
		System.out.println("wwwwwwwwwwwwwwwwwww2"+service);
		System.out.println("wwwwwwwwwwwwwwwwwww3"+url);
		model.addAttribute("service", service);
		model.addAttribute("url", url);
		model.addAttribute("req", s);
		model.addAttribute("sign", SignUtil.sign(s, pfx, "liukai123"));
		/*model.addAttribute("sign","ddd");*/
		System.out.println("wwwwwwwwwwwwwwwwwww");
		System.out.println("url"+url);
		 /*ccc.da(service,url,s);*/
		/* HttpClientTest d=new HttpClientTest();
		 String resp= d.postForm(service, url, s);
		 System.out.println("ffffffffffffffff"+resp);*/
		return "post";
		/*return "payment/post";*/
	}
	
	private String doSigns(String xml, String url, Model model, String service) {
		System.out.println("ssssssssssssss");
		String pfx = servletContext.getRealPath("/WEB-INF/zhengshu.pfx");
		System.out.println("wwwwwwwwwwwwwwwwwww1"+xml);
		String s = xml;
		s = s.replaceAll("[\\r\\n]", "");
		
		System.out.println("wwwwwwwwwwwwwwwwwww1"+s);
		System.out.println("wwwwwwwwwwwwwwwwwww2"+service);
		System.out.println("wwwwwwwwwwwwwwwwwww3"+url);
		model.addAttribute("service", service);
		model.addAttribute("url", url);
		model.addAttribute("req", s);
		model.addAttribute("sign", SignUtil.sign(s, pfx, "liukai123"));
		/*model.addAttribute("sign","ddd");*/
		System.out.println("wwwwwwwwwwwwwwwwwww");
		System.out.println("url"+url);
		 /*ccc.da(service,url,s);*/
		 HttpClientTest d=new HttpClientTest();
		          String resp=d.postForm(service, url, s, SignUtil.sign(s, pfx, "liukai123"));
		          
		          System.out.println("yyyyyyyyyyyyyyyy"+resp);   
		          System.out.println("yyyyyyyyyyyyyyyy"+resp);    
		    
		          
		          DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		          System.out.println("yyyyyyyyyyyyyyyy"+resp);
				  try {
				            
				      //    通过 解析器 工厂 创建 一个 解析 器 
				      DocumentBuilder db=dbf.newDocumentBuilder();
				      System.out.println("eeeeeeeeeee");
				      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
				     
				      InputStream iStream=new ByteArrayInputStream(resp.getBytes("UTF-8"));
				     Document dm=db.parse(iStream);
				     System.out.println("ssssssssssssss");
				      //得到 所有 person节点 
				      NodeList persons=dm.getElementsByTagName("response");
				      System.out.println("qqqqqqqqqqqqq");
				      TTransferSucceed TTransferSucceed=new TTransferSucceed();
				      System.out.println("wwwwwwwwwwwwwww");
				      for(int i=0;i<persons.getLength();i++){
				          
				    	  Element personElement = (Element)persons.item(i);
				    	  
				    	  NodeList p=personElement.getChildNodes();
				    	  for(int j=0;j<p.getLength();j++){
				    		  Node e= p.item(j);
				    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
				    		 
				    	  }
				    	  
				    	 
				    	  
				    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
				    		  /*TTransferSucceed.setService(p.item(1).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(1).getTextContent());
				    	  }
				    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
				    		 /* TTransferSucceed.setRequestNo(p.item(3).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(3).getTextContent());
				    		  
				    	  }
				    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
				    		 /* TTransferSucceed.setCode(p.item(5).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(5).getTextContent());
				    		  
				    	  }
				    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
				    		 /* TTransferSucceed.setDescription(p.item(7).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(7).getTextContent());
				    		  
				    	  } if(p.item(9).getNodeName()!=null&&p.item(9).getTextContent()!=null){
				    		 /* TTransferSucceed.setDescription(p.item(7).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(9).getTextContent());
				    		  model.addAttribute("balance", p.item(9).getTextContent());
				    		  
				    	  } if(p.item(11).getNodeName()!=null&&p.item(11).getTextContent()!=null){
				    		 /* TTransferSucceed.setDescription(p.item(7).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(11).getTextContent());
				    		  model.addAttribute("availableAmount", p.item(11).getTextContent());
				    		  
				    	  }if(p.item(13).getNodeName()!=null&&p.item(13).getTextContent()!=null){
				    		 /* TTransferSucceed.setDescription(p.item(7).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(13).getTextContent());
				    		  model.addAttribute("freezeAmount", p.item(13).getTextContent());
				    		  
				    	  }
				    	  
				      }  
				  
				  } catch (Exception e) {
			            // TODO: handle exception
			            e.printStackTrace();
			        } finally {
			        }
		          
		return "zichan";
	}
	
	
	private String doloan(String xml, String url, Model model, String service) {
		System.out.println("ssssssssssssss");
		String pfx = servletContext.getRealPath("/WEB-INF/zhengshu.pfx");
		System.out.println("wwwwwwwwwwwwwwwwwww1"+xml);
		String s = xml;
		s = s.replaceAll("[\\r\\n]", "");
		
		System.out.println("wwwwwwwwwwwwwwwwwww1"+s);
		System.out.println("wwwwwwwwwwwwwwwwwww2"+service);
		System.out.println("wwwwwwwwwwwwwwwwwww3"+url);
		model.addAttribute("service", service);
		model.addAttribute("url", url);
		model.addAttribute("req", s);
		model.addAttribute("sign", SignUtil.sign(s, pfx, "liukai123"));
		/*model.addAttribute("sign","ddd");*/
		System.out.println("wwwwwwwwwwwwwwwwwww");
		System.out.println("url"+url);
		 /*ccc.da(service,url,s);*/
		 HttpClientTest d=new HttpClientTest();
		          String resp=d.postForm(service, url, s,SignUtil.sign(s, pfx, "liukai123"));
		          DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		          System.out.println("rrrrrrrrrrrrrrrrrrr"+resp);
				  try {
				            
				      //    通过 解析器 工厂 创建 一个 解析 器 
				      DocumentBuilder db=dbf.newDocumentBuilder();
				      System.out.println("eeeeeeeeeee");
				      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
				     
				      InputStream iStream=new ByteArrayInputStream(resp.getBytes("UTF-8"));
				     Document dm=db.parse(iStream);
				     System.out.println("ssssssssssssss");
				      //得到 所有 person节点 
				      NodeList persons=dm.getElementsByTagName("response");
				      System.out.println("qqqqqqqqqqqqq");
				      TLoansucceed loansucceed=new TLoansucceed();
				      System.out.println("wwwwwwwwwwwwwww");
				      for(int i=0;i<persons.getLength();i++){
				          
				    	  Element personElement = (Element)persons.item(i);
				    	  
				    	  NodeList p=personElement.getChildNodes();
				    	  for(int j=0;j<p.getLength();j++){
				    		  Node e= p.item(j);
				    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
				    		 
				    	  }
				    	  
				    	 
				    	  
				    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
				    		 /* TTransferSucceed.setCode(p.item(1).getTextContent());*/
				    		  System.out.println("ddddddd123"+p.item(1).getTextContent());
				    	  }
				    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
				    		 /* TTransferSucceed.setCode(p.item(3).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(3).getTextContent());
				    		  
				    	  }
				    	/*  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
				    		  TTransferSucceed.setCode(p.item(5).getTextContent());
				    		  System.out.println("ddddddd"+p.item(5).getTextContent());
				    		  
				    	  }
				    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
				    		  TTransferSucceed.setDescription(p.item(7).getTextContent());
				    		  System.out.println("ddddddd"+p.item(7).getTextContent());
				    		  
				    	  } if(p.item(9).getNodeName()!=null&&p.item(9).getTextContent()!=null){
				    		  TTransferSucceed.setDescription(p.item(7).getTextContent());
				    		  System.out.println("ddddddd"+p.item(9).getTextContent());
				    		  model.addAttribute("balance", p.item(9).getTextContent());
				    		  
				    	  } if(p.item(11).getNodeName()!=null&&p.item(11).getTextContent()!=null){
				    		  TTransferSucceed.setDescription(p.item(7).getTextContent());
				    		  System.out.println("ddddddd"+p.item(11).getTextContent());
				    		  model.addAttribute("availableAmount", p.item(11).getTextContent());
				    		  
				    	  }if(p.item(13).getNodeName()!=null&&p.item(13).getTextContent()!=null){
				    		  TTransferSucceed.setDescription(p.item(7).getTextContent());
				    		  System.out.println("ddddddd"+p.item(13).getTextContent());
				    		  model.addAttribute("freezeAmount", p.item(13).getTextContent());
				    		  
				    	  }*/
				    	  
				      }  
				     
				  
				  } catch (Exception e) {
			            // TODO: handle exception
			            e.printStackTrace();
			        } finally {
			        }
				  return "post";
		          
	}
	
	
	private String dobinding(String xml, String url, Model model, String service) {
		System.out.println("ssssssssssssss");
		String pfx = servletContext.getRealPath("/WEB-INF/zhengshu.pfx");
		System.out.println("wwwwwwwwwwwwwwwwwww1"+xml);
		String s = xml;
		s = s.replaceAll("[\\r\\n]", "");
		
		System.out.println("wwwwwwwwwwwwwwwwwww1"+s);
		System.out.println("wwwwwwwwwwwwwwwwwww2"+service);
		System.out.println("wwwwwwwwwwwwwwwwwww3"+url);
		model.addAttribute("service", service);
		model.addAttribute("url", url);
		model.addAttribute("req", s);
		model.addAttribute("sign", SignUtil.sign(s, pfx, "liukai123"));
		/*model.addAttribute("sign","ddd");*/
		System.out.println("wwwwwwwwwwwwwwwwwww");
		System.out.println("url"+url);
		 /*ccc.da(service,url,s);*/
		 HttpClientTest d=new HttpClientTest();
		          String resp=d.postForm(service, url, s,SignUtil.sign(s, pfx, "liukai123"));
		          DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		          System.out.println("yyyyyyyyyyyyyyyy"+resp);
				  try {
				            
				      //    通过 解析器 工厂 创建 一个 解析 器 
				      DocumentBuilder db=dbf.newDocumentBuilder();
				      System.out.println("eeeeeeeeeee");
				      //告诉 改 解析器 去 解析 那个 文件 -->dom树 
				     
				      InputStream iStream=new ByteArrayInputStream(resp.getBytes("UTF-8"));
				     Document dm=db.parse(iStream);
				     System.out.println("ssssssssssssss");
				      //得到 所有 person节点 
				      NodeList persons=dm.getElementsByTagName("response");
				      System.out.println("qqqqqqqqqqqqq");
				      TTransferSucceed TTransferSucceed=new TTransferSucceed();
				      System.out.println("wwwwwwwwwwwwwww");
				      for(int i=0;i<persons.getLength();i++){
				          
				    	  Element personElement = (Element)persons.item(i);
				    	  
				    	  NodeList p=personElement.getChildNodes();
				    	  for(int j=0;j<p.getLength();j++){
				    		  Node e= p.item(j);
				    		  System.out.println("wwwwwww="+e.getNodeName()+"wwwwwww"+e.getTextContent());
				    		 
				    	  }
				    	  
				    	 
				    	  
				    	  if(p.item(1).getNodeName()!=null&&p.item(1).getTextContent()!=null){
				    		  /*TTransferSucceed.setService(p.item(1).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(1).getTextContent());
				    	  }
				    	  if(p.item(3).getNodeName()!=null&&p.item(3).getTextContent()!=null){
				    		 /* TTransferSucceed.setRequestNo(p.item(3).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(3).getTextContent());
				    		  
				    	  }
				    	  if(p.item(5).getNodeName()!=null&&p.item(5).getTextContent()!=null){
				    		 /* TTransferSucceed.setCode(p.item(5).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(5).getTextContent());
				    		  
				    	  }
				    	  if(p.item(7).getNodeName()!=null&&p.item(7).getTextContent()!=null){
				    		 /* TTransferSucceed.setDescription(p.item(7).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(7).getTextContent());
				    		  
				    	  } if(p.item(9).getNodeName()!=null&&p.item(9).getTextContent()!=null){
				    		 /* TTransferSucceed.setDescription(p.item(7).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(9).getTextContent());
				    		  model.addAttribute("balance", p.item(9).getTextContent());
				    		  
				    	  } if(p.item(11).getNodeName()!=null&&p.item(11).getTextContent()!=null){
				    		 /* TTransferSucceed.setDescription(p.item(7).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(11).getTextContent());
				    		  model.addAttribute("availableAmount", p.item(11).getTextContent());
				    		  
				    	  }if(p.item(13).getNodeName()!=null&&p.item(13).getTextContent()!=null){
				    		 /* TTransferSucceed.setDescription(p.item(7).getTextContent());*/
				    		  System.out.println("ddddddd"+p.item(13).getTextContent());
				    		  model.addAttribute("freezeAmount", p.item(13).getTextContent());
				    		  
				    	  }
				    	  
				      }  
				  
				  } catch (Exception e) {
			            // TODO: handle exception
			            e.printStackTrace();
			        } finally {
			        }
				return resp;
		          
	}
	
	
	
	private String doSign(Object obj, String url, Model model ) {
		System.out.println("cccccccccccccccccc"+url);
		StringWriter w = new StringWriter();
		JAXB.marshal(obj, w);
		/*System.out.println("eeeeeeeeeeeeeeee"+w.toString());*/
		return doSign(w.toString(), url, model, "");
	}
}
