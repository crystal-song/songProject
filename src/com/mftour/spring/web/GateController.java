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

import com.mftour.spring.model.TEstablishmentNotify;
import com.mftour.spring.model.TEstablishmentRegistration;
import com.mftour.spring.model.TInterestRate;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TTransferSucceed;
import com.mftour.spring.model.TUser;
import com.mftour.spring.model.TYeePay;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.HttpClientTest;
import com.mftour.spring.util.ccc;
import com.yeepay.bha.example.bean.BHAEstablishmentRegistration;
import com.yeepay.bha.example.bean.BHARechargeRequest;
import com.yeepay.bha.example.bean.BHARegisterRequest;
import com.yeepay.bha.example.bean.BHATransferRequest;
import com.yeepay.bha.example.bean.BHAWithdrawRequest;


























import com.yeepay.g3.utils.security.cfca.SignUtil;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream; 
import java.io.FileNotFoundException; 
import java.io.FileOutputStream; 
import java.io.IOException; 
import java.io.InputStream; 
import java.io.PrintWriter; 
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
	
	@RequestMapping(value="/gate/service")
	public String service(Model model,HttpServletRequest request) throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		Object o= request.getSession().getAttribute("name"); 
		 TRegisterYeePay registerYeePay1= gateService.queryTRegisterYeePayByName(o.toString()).get(0);
		           String name= registerYeePay1.getPlatformUserNo();
		 String req="<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
	    			+"<request platformNo='10040011137'>"
	    			/*+"<platformUserNo>gg123456</platformUserNo> "*/
	    			+"<platformUserNo>"+name+"</platformUserNo> "
	                +"</request>";
		 model.addAttribute("req", req);
		
		return "payment/service";
	}
	
	@RequestMapping(value="/gate/doService")
	public String doService(String host, String req, String service, Model model) {

		return doSigns(req, host + "/bhaexter/bhaController", model, service);
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
		gateService.addOrUpdateRegisterYeePay(registerYeePay);
		
		return doSign(request, host + "/bha/toRegister", model );
	}
	
	@RequestMapping(value="/gate/recharge",method = {RequestMethod.POST, RequestMethod.GET})
	public String recharge(Model model,HttpServletRequest request)throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		Object o= request.getSession().getAttribute("name");
		 if(o!=null){
		
			 List<TRegisterYeePay> li= gateService.queryTRegisterYeePayByName(o.toString());
 		 /* System.out.println(registerYeePay1.getPlatformUserNo()+"sssssssss"+o.toString());*/
			 if(li != null && li.size()!=0){
				 TRegisterYeePay registerYeePay1=li.get(0);
				 System.out.println("dddddddd"+registerYeePay1.getPlatformUserNo());
				 System.out.println("dddddddd"+registerYeePay1.getCode());
				 if(registerYeePay1.getCode()!=null){
 		  if(registerYeePay1.getPlatformUserNo()!=null&&registerYeePay1.getCode().equals("1")){
	        	  model.addAttribute("registerYeePay1", registerYeePay1);
	        	  return "chongzhi";
 		   }
				 }
			 }else{
 			 return "register";
 		 
		 }
 		  }
		 TUser user=userService.getUserByAccount(o.toString());
			model.addAttribute("user", user);
			/*return "payment/register";*/
			return "register";
	}
	
	@RequestMapping(value="/gate/doRecharge")
	public String doRecharge(String host, BHARechargeRequest request, Model model) {
		
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
		Object o= request.getSession().getAttribute("name");
		if(o==null){
			return "login";
		}
		 List<TRegisterYeePay> li= gateService.queryTRegisterYeePayByName(o.toString());
		 if(li != null && li.size()!=0){
			 TRegisterYeePay registerYeePay1=li.get(0);
		System.out.println("ddddd"+buyAmount);
		model.addAttribute("registerYeePay1", registerYeePay1);
		model.addAttribute("buyAmount", buyAmount);
		model.addAttribute("product", product);
		model.addAttribute("now", System.currentTimeMillis());
		return "touzicheck";
		 }
		 TUser user=userService.getUserByAccount(o.toString());
			model.addAttribute("user", user);
		 return "register";
		/*return "payment/transfer";*/
	}
	
	@RequestMapping(value="/gate/doTransfer")
	public String doTransfer(String host, BHATransferRequest request, Model model,TTransferInfo TtransferInfo) throws Exception {
		
		 List<TInterestRate> li=ptopService.queryTInterestRateByNumber(TtransferInfo.getEnterpriseNumber());
		     int paymentAmount= Integer.parseInt(TtransferInfo.getPaymentAmount());
			for(int i=0;i<li.size();i++){
				int a=li.get(i).getStartMoney();
				int b=li.get(i+1).getStartMoney();
				if(a<paymentAmount&&paymentAmount<b){
					Double StartInterestRate=li.get(i).getStartInterestRate();
					int  MoneyIncrease=li.get(i).getMoneyIncrease();
					int  StartMoney= li.get(i).getStartMoney();
					Double InterestRateIncrease= li.get(i).getInterestRateIncrease();
					int c=(paymentAmount- StartMoney)/MoneyIncrease;
					Double d=c*InterestRateIncrease;
					Double interestRate= StartInterestRate+d;
					TtransferInfo.setInterestRate(interestRate);
				}
			}
			
			gateService.addOrUpdateTTransferInfo(TtransferInfo);
		 
		  int PaymentAmount= Integer.parseInt(TtransferInfo.getPaymentAmount());
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
		}
		
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
		    		  if(registerYeePay1.getPlatformUserNo()!=null&&registerYeePay1.getCode().equals("1")){
			        	  model.addAttribute("registerYeePay1", registerYeePay1);
			        	  return "zhuce";
			          }else if(registerYeePay1.getCode()!="1"){
			        	  
			        	  return "register";
			          }
			     
		    	  
		    	 
		    	  
		         
		      
		      
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
		      gateService.addOrUpdateTTransferSucceed(TTransferSucceed);
		      TTransferInfo transferInfo = gateService.queryTTransferInfoByNumber(TTransferSucceed.getRequestNo()).get(0);
		      model.addAttribute("transferInfo", transferInfo);
		    	  
		    	 
		    		 
		    		
		    		
		      
		      
		        } catch (Exception e) {
		            // TODO: handle exception
		            e.printStackTrace();
		        } finally {
		        }
		   
		
		  
		/*return "payment/exam";*/
		  return "buy_ok";
		  
		/*return "chong";*/
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
		             d.postForm(service, url, s);*/
		return "post";
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
		          String resp=d.postForm(service, url, s);
		          
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
	
	private String doSign(Object obj, String url, Model model ) {
		System.out.println("cccccccccccccccccc"+url);
		StringWriter w = new StringWriter();
		JAXB.marshal(obj, w);
		/*System.out.println("eeeeeeeeeeeeeeee"+w.toString());*/
		return doSign(w.toString(), url, model, "");
	}
}
