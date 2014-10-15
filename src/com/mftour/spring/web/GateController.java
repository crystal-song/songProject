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

import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TUser;
import com.mftour.spring.model.TYeePay;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.ccc;
import com.yeepay.bha.example.bean.BHARechargeRequest;
import com.yeepay.bha.example.bean.BHARegisterRequest;
import com.yeepay.bha.example.bean.BHATransferRequest;
import com.yeepay.bha.example.bean.BHAWithdrawRequest;






















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
	
	/*private ServletContext servletContext = null;*/
	
	@Autowired
    private IGateService gateService;
	
	@Autowired
    private IUserService userService;
	
	@RequestMapping(value="/gate/service")
	public String service(Model model) {
		model.addAttribute("now", System.currentTimeMillis());
		
		
		 String req="<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
	    			+"<response platformNo='10040011137'>"
	    			+"<platformUserNo>18975601645</platformUserNo> "
	                +"</response>";
		 model.addAttribute("req", req);
		
		return "payment/service";
	}
	
	@RequestMapping(value="/gate/doService")
	public String doService(String host, String req, String service, Model model) {

		return doSign(req, host + "/bhaexter/bhaController", model, service);
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
		
		TUser user=userService.getUserByAccount(o.toString());
		model.addAttribute("user", user);
		/*return "payment/register";*/
		return "register";
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
		
		  TRegisterYeePay registerYeePay1= gateService.queryTRegisterYeePayByName(o.toString()).get(0);
 		 /* System.out.println(registerYeePay1.getPlatformUserNo()+"sssssssss"+o.toString());*/
 		
 		  if(registerYeePay1.getPlatformUserNo()!=null&&registerYeePay1.getCode().equals("1")){
	        	  model.addAttribute("registerYeePay1", registerYeePay1);
	        	  return "chongzhi";
 		  }
		System.out.println(o.toString());
		/*return "payment/recharge";*/
		return "chongzhi";
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
	public String Transfer(Model model,HttpServletRequest request,String paymentAmount) throws Exception {
		Object o= request.getSession().getAttribute("name");
		 TRegisterYeePay registerYeePay1= gateService.queryTRegisterYeePayByName(o.toString()).get(0);
		System.out.println("ddddd"+paymentAmount);
		model.addAttribute("registerYeePay1", registerYeePay1);
		model.addAttribute("now", System.currentTimeMillis());
		return "tixiancheck";
	}
	
	@RequestMapping(value="/gate/doTransfer")
	public String doTransfer(String host, BHATransferRequest request, Model model) {
	
		return doSign(request, host + "/bha/toTransfer", model);
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
		  
		return "chong";
	}

	/*@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}*/
	
	private String doSign(String xml, String url, Model model, String service) {
		System.out.println("ssssssssssssss");
		/*String pfx = servletContext.getRealPath("/WEB-INF/bha.pfx");*/

		String s = xml;
		s = s.replaceAll("[\\r\\n]", "");
		
		System.out.println("wwwwwwwwwwwwwwwwwww1"+s);
		System.out.println("wwwwwwwwwwwwwwwwwww2"+service);
		System.out.println("wwwwwwwwwwwwwwwwwww3"+url);
		model.addAttribute("service", service);
		model.addAttribute("url", url);
		model.addAttribute("req", s);
		/*model.addAttribute("sign", SignUtil.sign(s, pfx, "123qwe"));*/
		model.addAttribute("sign","ddd");
		System.out.println("wwwwwwwwwwwwwwwwwww");
		 ccc.da(service,url,s);
		return "post";
	}
	
	private String doSign(Object obj, String url, Model model ) {
		System.out.println("cccccccccccccccccc");
		StringWriter w = new StringWriter();
		JAXB.marshal(obj, w);
		/*System.out.println("eeeeeeeeeeeeeeee"+w.toString());*/
		return doSign(w.toString(), url, model, "");
	}
}
