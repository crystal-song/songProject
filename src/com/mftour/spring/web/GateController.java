package com.mftour.spring.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXB;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

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
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TRecharge;
import com.mftour.spring.model.TRechargeNotify;
import com.mftour.spring.model.TRechargeSucceed;
import com.mftour.spring.model.TRegisterNotify;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransRecord;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TTransferNotify;
import com.mftour.spring.model.TTransferSucceed;
import com.mftour.spring.model.TUser;
import com.mftour.spring.model.TYeePay;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.ITransNoticeService;
import com.mftour.spring.service.ITransRecordService;
import com.mftour.spring.service.IUserService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.File;
import com.mftour.spring.util.HttpClientTest;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.Xml;
import com.yeepay.bha.example.bean.BHAAuthorization;
import com.yeepay.bha.example.bean.BHAEstablishmentRegistration;
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

	@Autowired
	private IProductService productService;

	@Autowired
	private ITransNoticeService transNoticeService;
	@Autowired
	private ITransRecordService transRecordService;

	@RequestMapping(value = "/gate/service")
	public String service(Model model, HttpServletRequest request)
			throws Exception {
		model.addAttribute("now", System.currentTimeMillis());

		String platformNo = f.getPlatformNo();

		model.addAttribute("f", f);
		Object o = request.getSession().getAttribute("name");
		String name = null;
		if (o != null) {
			List<TRegisterYeePay> li = gateService.queryTRegisterYeePayByName(o
					.toString());

			if (li != null && li.size() != 0) {
				TRegisterYeePay registerYeePay = li.get(0);
				name = registerYeePay.getPlatformUserNo();
			} else {

				TUser user = userService.getUserByAccount(o.toString());
				model.addAttribute("user", user);
				return "register";
			}
			List<TEstablishmentRegistration> list = gateService
					.queryTEstablishmentRegistrationByName(o.toString());
			if (list != null && list.size() != 0) {
				TEstablishmentRegistration establishmentRegistration = list
						.get(0);
				name = establishmentRegistration.getPlatformUserNo();
			}
		}

		String req = "<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
		/* +"<request platformNo='10040011137'>" */
		+ "<request platformNo='" + platformNo + "'>"
		/* +"<platformUserNo>gg123456</platformUserNo> " */
		+ "<platformUserNo>" + name + "</platformUserNo> " + "</request>";
		model.addAttribute("req", req);
		String service = "ACCOUNT_INFO";

		String host = f.getOnSubmit();
		return doService(host, req, service, model);

	}

	@RequestMapping(value = "/gate/info")
	public String info(Model model, HttpServletRequest request)
			throws Exception {

		String req = "<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
				+ "<request platformNo='10012415118'>" + "<date>"
				+ "2014-12-05" + "</date> " + "</request>";

		String service = "RECONCILIATION";
		/* String host="http://qa.yeepay.com/member"; */
		String host = "https://member.yeepay.com/member";

		return doinfo(host, req, service, model);

	}

	public String doinfo(String host, String req, String service, Model model) {

		return doSigns(req, f.getUrl() + "/bhaexter/bhaController", model,
				service);
	}

	@RequestMapping(value = "/gate/doService")
	public String doService(String host, String req, String service, Model model) {

		return doSigns(req, host + "/bhaexter/bhaController", model, service);
	}


	public String dobinding(String host, String req, Model model) {

		return doSign(req, host + "/bha/toBindBankCard", model);
	}

	@RequestMapping(value = "/gate/binding")
	public String binding(Model model, HttpServletRequest request)
			throws Exception {
		File f = ReadWirtePropertis.file();

		model.addAttribute("f", f);
		model.addAttribute("now", System.currentTimeMillis());
		Object o = request.getSession().getAttribute("name");
		String name = null;
		if (o != null) {
			List<TRegisterYeePay> li = gateService.queryTRegisterYeePayByName(o
					.toString());
			if (li != null && li.size() != 0) {
				TRegisterYeePay registerYeePay = li.get(0);
				name = registerYeePay.getPlatformUserNo();
			}

		}
		/* Object o= request.getSession().getAttribute("name"); */
		model.addAttribute("name", name);
		/* return "payment/binding"; */
		return "yinhangka";
	}

	@RequestMapping(value = "/gate/dobinding")
	public String dobinding(String host, BHAbindingRequest request,
			Model model, TBinding binding) throws Exception {

		gateService.addOrUpdateTBinding(binding);
		return doSign(request, host + "/bha/toBindBankCard", model);
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

		}

		return "wodexiangmu";
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

	@RequestMapping(value = "/gate/doAuthorization")
	public String doAuthorization(String host, BHAAuthorization request,
			Model model) throws Exception {

		return doSign(request, host + "/bha/toAuthorizeAutoRepayment", model);
	}

	@RequestMapping(value = "/gate/drawMoney")
	public String drawMoney(Model model, HttpServletRequest request)
			throws Exception {
		File f = ReadWirtePropertis.file();
		model.addAttribute("f", f);
		model.addAttribute("now", System.currentTimeMillis());
		Object o = request.getSession().getAttribute("name");
		if (o != null) {
			List<TRegisterYeePay> li = gateService.queryTRegisterYeePayByName(o
					.toString());
			if (li != null && li.size() != 0) {
				TRegisterYeePay registerYeePay = li.get(0);
				model.addAttribute("registerYeePay",
						registerYeePay.getPlatformUserNo());
				model.addAttribute("feeMode", BHAFeeModeEnum.USER);
			}
			List<TEstablishmentRegistration> list = gateService
					.queryTEstablishmentRegistrationByNumber(o.toString());
			if (list != null && list.size() != 0) {

				TEstablishmentRegistration registerYeePay = list.get(0);
				model.addAttribute("registerYeePay",
						registerYeePay.getPlatformUserNo());
				model.addAttribute("feeMode", BHAFeeModeEnum.PLATFORM);
			}
		}

		return "tixian";
	}

	@RequestMapping(value = "/gate/dodrawMoney")
	public String dodrawMoney(String host, BHAWithdrawRequest request,
			Model model, TDrawMoney drawMoney) throws Exception {
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		drawMoney.setTransDate(sdf.format(dt).toString());
		gateService.addOrUpdateTDrawMoney(drawMoney);
		return doSign(request, host + "/bha/toWithdraw", model);
	}


	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET })
	public String helloWorld(Model model, HttpServletRequest request)
			throws Exception {

		/* return "news_add"; */
		/* return "ptop/p2b_add"; */
		return "payment/register";
		/* return "indexs"; */
	}

	@RequestMapping(value = "/gate/register")
	public String register(Model model, HttpServletRequest request)
			throws Exception {
		model.addAttribute("now", System.currentTimeMillis());
		Object o = request.getSession().getAttribute("name");
		if (o != null) {
			TUser user = userService.getUserByAccount(o.toString());
			model.addAttribute("user", user);
			/* return "payment/register"; */
			File f = ReadWirtePropertis.file();

			model.addAttribute("f", f);
			return "register";
		}
		return "login";
	}

	@RequestMapping(value = "/gate/doRegister")
	public String doRegister(String host, BHARegisterRequest request,
			Model model, TRegisterYeePay registerYeePay) throws Exception {

		List<TRegisterYeePay> li = gateService
				.queryTRegisterYeePayByName(registerYeePay.getPlatformUserNo());
		if (li != null && li.size() != 0) {
			TRegisterYeePay registerYeePay1 = li.get(0);
			registerYeePay1.setRequestNo(registerYeePay.getRequestNo());
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
			gateService.addOrUpdateRegisterYeePay(registerYeePay);
		}

		TUser user = userService.getUserByAccount(registerYeePay
				.getPlatformUserNo());

		user.setRealName(registerYeePay.getRealName());
		user.setPhone(registerYeePay.getMobile());
		user.setIdentityCard(registerYeePay.getIdCardNo());
		userService.addOrUpdate(user);

		return doSign(request, host + "/bha/toRegister", model);
	}

	@RequestMapping(value = "/gate/recharge", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String recharge(Model model, HttpServletRequest request)
			throws Exception {

		model.addAttribute("f", f);
		model.addAttribute("now", System.currentTimeMillis());
		Object o = request.getSession().getAttribute("name");
		if (o == null) {
			return "login";
		}
		TRegisterYeePay registerYeePay1 = null;
		if (o != null) {

			List<TRegisterYeePay> li = gateService.queryTRegisterYeePayByName(o
					.toString());
			List<TRegisterNotify> list = gateService
					.queryTRegisterNotifyByName(o.toString());

			if (li != null && li.size() != 0) {
				registerYeePay1 = li.get(0);
				String code = li.get(0).getCode();
				if (code != null && code.equals("1")) {

					model.addAttribute("registerYeePay1", registerYeePay1);
					return "chongzhi";
				}
			}
			if (list != null && list.size() != 0) {
				String code = list.get(0).getCode();
				if (code != null && code.equals("1")) {

					if (li != null && li.size() != 0) {
						registerYeePay1 = li.get(0);
						model.addAttribute("registerYeePay1", registerYeePay1);
						return "chongzhi";
					}
				}
			}
		}
		TUser user = userService.getUserByAccount(o.toString());
		model.addAttribute("user", user);

		return "register";
	}

	@RequestMapping(value = "/gate/doRecharge")
	public String doRecharge(String host, BHARechargeRequest request,
			Model model, TRecharge recharge) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		recharge.setTime(sdf.format(new Date()).toString());
		gateService.addOrUpdateTRecharge(recharge);
		return doSign(request, host + "/bha/toRecharge", model);
	}

	@RequestMapping(value = "/gate/withdraw")
	public String withdraw(Model model) {
		model.addAttribute("now", System.currentTimeMillis());
		return "gate/withdraw";
	}

	@RequestMapping(value = "/gate/doWithdraw")
	public String doWithdraw(String host, BHAWithdrawRequest request,
			Model model) {

		return doSign(request, host + "/bha/toWithdraw", model);
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

		List<TProduct> list=productService.queryProductByNumber(product.getEnterpriseNumber());
		             if(list != null && list.size()!=0){
		            	 TProduct Product=list.get(0);
		            	   if(Product.getBuyType()==null)   
		            	   return "xianxia";
		             }
		
		 List<TRegisterYeePay> li= gateService.queryTRegisterYeePayByName(o.toString());
		 List<TRegisterNotify> lis= gateService.queryTRegisterNotifyByName(o.toString());
	
		 
		 if(li!=null&& li.size()!=0){
			 String code=li.get(0).getCode();
		
		 if(list!=null && list.size()>0 &&  code!=null&&code.equals("1")){
			 TRegisterYeePay registerYeePay1=li.get(0);
			
				model.addAttribute("registerYeePay1", registerYeePay1);
				model.addAttribute("buyAmount", buyAmount);
				model.addAttribute("targetPlatformUserNo", list.get(0).getTargetPlatformUserNo());
				model.addAttribute("product", product);

				model.addAttribute("registerYeePay1", registerYeePay1);
				model.addAttribute("buyAmount", buyAmount);
				model.addAttribute("targetPlatformUserNo", list.get(0)
						.getTargetPlatformUserNo());
				model.addAttribute("product", product);

				model.addAttribute("now", System.currentTimeMillis());
				return "touzicheck";
			}
		} else if (lis != null && lis.size() != 0) {
			TRegisterYeePay registerYeePay1 = li.get(0);

			model.addAttribute("registerYeePay1", registerYeePay1);
			model.addAttribute("buyAmount", buyAmount);
			model.addAttribute("targetPlatformUserNo", list.get(0)
					.getTargetPlatformUserNo());
			model.addAttribute("product", product);

			model.addAttribute("now", System.currentTimeMillis());
			return "touzicheck";

		} else if (li != null && li.size() != 0) {
			TUser user = userService.getUserByAccount(o.toString());
			model.addAttribute("user", user);
			model.addAttribute("now", System.currentTimeMillis());

			return "register";
		}

		TUser user = userService.getUserByAccount(o.toString());
		model.addAttribute("user", user);

		model.addAttribute("now", System.currentTimeMillis());
		return "register";
		/* return "payment/transfer"; */
	}

	@RequestMapping(value = "/gate/doTransfer")
	public String doTransfer(String host, BHATransferRequest request,
			Model model, TTransferInfo TtransferInfo,
			HttpServletRequest request1) throws Exception {
		int a = 0;
		int b = 0;
		List<TInterestRate> li = ptopService
				.queryTInterestRateByNumber(TtransferInfo.getEnterpriseNumber());

		int paymentAmount = Integer.parseInt(TtransferInfo.getPaymentAmount());
		for (int i = 0; i < li.size(); i++) {
			if (i < li.size() - 1) {
				a = li.get(i).getStartMoney();
				b = li.get(i + 1).getStartMoney();
			} else {
				a = li.get(i).getStartMoney();
			}
			b = li.get(i).getHighestMoney();
			if (a <= paymentAmount && paymentAmount < b) {

				Double StartInterest = li.get(i).getStartInterestRate();

				TtransferInfo.setInterestRate(StartInterest);
			}
		}

		String transDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date());
		TtransferInfo.setTransDate(transDate);

		List<TProduct> list1 = productService
				.queryProductByNumber(TtransferInfo.getEnterpriseNumber());
		if (list1 != null && list1.size() != 0) {
			TProduct product = list1.get(0);
			TtransferInfo.setFinancingPeriod(product.getFinancingPeriod());
		}

		gateService.addOrUpdateTTransferInfo(TtransferInfo);

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Object o = request1.getSession().getAttribute("name");
		TInvestmentInfo investmentInfo = new TInvestmentInfo();
		if (o != null) {
			List<TRegisterYeePay> list = gateService
					.queryTRegisterYeePayByName(o.toString());
			if (list != null && list.size() != 0) {
				investmentInfo.setIdentityCard(list.get(0).getIdCardNo());
			}
		}
		investmentInfo.setRequestNo(request.getRequestNo());
		investmentInfo.setWriteTime(df.format(new Date()));
		investmentInfo.setInvestmentAmount(Double.parseDouble(TtransferInfo
				.getPaymentAmount()));
		investmentInfo.setEnterpriseNumber(TtransferInfo.getEnterpriseNumber());
		investmentInfo.setState("0");
		investmentInfo.setInvestor(TtransferInfo.getPlatformUserNo());
		ptopService.addOrUpdateInvestmentInfo(investmentInfo);

		List<TProduct> lis = productService.queryProductByNumber(TtransferInfo
				.getEnterpriseNumber());
		TProduct t = lis.get(0);

		Double RealityMoney = t.getRealityMoney();

		if (RealityMoney == null || RealityMoney == 0.0) {
			Double money = Double.parseDouble(TtransferInfo.getPaymentAmount());
			t.setRealityMoney(money);
			t.setFinancingProgress(money / t.getFinancingMoney() * 100 / 10000);
		} else {
			/*
			 * Double money=RealityMoney+investmentInfo.getInvestmentAmount();
			 * t.setRealityMoney(money);
			 * t.setFinancingProgress(money/t.getFinancingMoney()*100);
			 */

			Double d = ptopService
					.querySum(TtransferInfo.getEnterpriseNumber());
			t.setRealityMoney(d);
			t.setFinancingProgress(d / t.getFinancingMoney() * 100 / 10000);
		}

		ptopService.addOrUpdate(t);

		return doSign(request, host + "/bha/toTransfer", model);
	}

	@RequestMapping(value = "/gate/establishmentRegistration")
	public String EstablishmentRegistration(Model model,
			HttpServletRequest request) throws Exception {

		model.addAttribute("now", System.currentTimeMillis());
		return "payment/establishmentRegistration";
		/* return "payment/transfer"; */
	}

	@RequestMapping(value = "/gate/doEstablishmentRegistration")
	public String doEstablishmentRegistration(String host, Model model,
			BHAEstablishmentRegistration request,
			TEstablishmentRegistration establishmentRegistration)
			throws Exception {

		gateService
				.addOrUpdateTEstablishmentRegistration(establishmentRegistration);

		return doSign(request, host + "/bha/toEnterpriseRegister", model);
	}

	@RequestMapping(value = "/gate/examEstablishmentRegistration", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String examEstablishmentRegistration(Model model, String resp,
			String sign, HttpServletRequest request) throws Exception {

		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);

		
		 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		  
		  try {
		            
		      DocumentBuilder db=dbf.newDocumentBuilder();
		      
		     
		      InputStream iStream=new ByteArrayInputStream(resp.getBytes());
		     Document dm=db.parse(iStream);
		      
		      NodeList persons=dm.getElementsByTagName("response");
		     
		      TEstablishmentNotify establishmentNotify=new TEstablishmentNotify();
		      
		      for(int i=0;i<persons.getLength();i++){
		          
		    	  Element personElement = (Element)persons.item(i);
		    	  
		    	  NodeList p=personElement.getChildNodes();
		    	  for(int j=0;j<p.getLength();j++){
		    		  p.item(j);
		    		 
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
		    	  
		return "payment/establishmentRegistration";

	}

	@RequestMapping(value = "/gate/exam", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String exam(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {

			DocumentBuilder db = dbf.newDocumentBuilder();

			InputStream iStream = new ByteArrayInputStream(resp.getBytes());
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("response");

			TYeePay YeePay = new TYeePay();

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

				}

				if (p.item(1).getNodeName() != null
						&& p.item(1).getTextContent() != null) {
					YeePay.setService(p.item(1).getTextContent());

				}
				if (p.item(3).getNodeName() != null
						&& p.item(3).getTextContent() != null) {
					YeePay.setRequestNo(p.item(3).getTextContent());

				}
				if (p.item(5).getNodeName() != null
						&& p.item(5).getTextContent() != null) {
					YeePay.setCode(p.item(5).getTextContent());

				}
				if (p.item(7).getNodeName() != null
						&& p.item(7).getTextContent() != null) {
					YeePay.setDescription(p.item(7).getTextContent());

				}

			}

			gateService.addOrUpdate(YeePay);
			/* TRegisterYeePay registerYeePay=new TRegisterYeePay(); */

			TRegisterYeePay registerYeePay = gateService
					.queryTRegisterYeePayByNumber(YeePay.getRequestNo()).get(0);
			registerYeePay.setCode(YeePay.getCode());
			gateService.addOrUpdateRegisterYeePay(registerYeePay);

			model.addAttribute("now", System.currentTimeMillis());

			return "zhuce";

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
		}

		return "register";
	}

	@RequestMapping(value = "/gate/examRecharge", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String examRecharge(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {
			DocumentBuilder db = dbf.newDocumentBuilder();

			InputStream iStream = new ByteArrayInputStream(resp.getBytes());
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("response");

			TRechargeSucceed rechargeSucceed = new TRechargeSucceed();

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

				}

				if (p.item(1).getNodeName() != null
						&& p.item(1).getTextContent() != null) {
					/* YeePay.setService(p.item(1).getTextContent()); */
					rechargeSucceed.setService(p.item(1).getTextContent());

				}
				if (p.item(3).getNodeName() != null
						&& p.item(3).getTextContent() != null) {
					/* YeePay.setRequestNo(p.item(3).getTextContent()); */
					rechargeSucceed.setRequestNo(p.item(3).getTextContent());
				}
				if (p.item(5).getNodeName() != null
						&& p.item(5).getTextContent() != null) {
					/* YeePay.setCode(p.item(5).getTextContent()); */
					rechargeSucceed.setCode(p.item(5).getTextContent());

				}
				if (p.item(7).getNodeName() != null
						&& p.item(7).getTextContent() != null) {
					/* YeePay.setDescription(p.item(7).getTextContent()); */
					rechargeSucceed.setDescription(p.item(7).getTextContent());

				}

			}

			gateService.addOrUpdateTRechargeSucceed(rechargeSucceed);
			/* TRegisterYeePay registerYeePay=new TRegisterYeePay(); */

			TRecharge recharge = gateService.queryTRechargeByRequestNo(
					rechargeSucceed.getRequestNo()).get(0);
			TTransRecord transrecord = new TTransRecord(
					recharge.getPlatformUserNo(), recharge.getRequestNo(),
					recharge.getTime(), "", recharge.getAmount(), "充值");
			transRecordService.addOrUpdate(transrecord);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
		}

		return "chongzhi_ok";
	}

	@RequestMapping(value = "/gate/transferSucceed", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String transferSucceed(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {

			DocumentBuilder db = dbf.newDocumentBuilder();

			InputStream iStream = new ByteArrayInputStream(resp.getBytes());
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("response");

			TTransferSucceed TTransferSucceed = new TTransferSucceed();

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

				}

				if (p.item(1).getNodeName() != null
						&& p.item(1).getTextContent() != null) {
					TTransferSucceed.setService(p.item(1).getTextContent());

				}
				if (p.item(3).getNodeName() != null
						&& p.item(3).getTextContent() != null) {
					TTransferSucceed.setRequestNo(p.item(3).getTextContent());

				}
				if (p.item(5).getNodeName() != null
						&& p.item(5).getTextContent() != null) {
					TTransferSucceed.setCode(p.item(5).getTextContent());

				}
				if (p.item(7).getNodeName() != null
						&& p.item(7).getTextContent() != null) {
					TTransferSucceed.setDescription(p.item(7).getTextContent());

				}

			}
			List<TInvestmentInfo> li = gateService
					.queryTInvestmentInfoByName(TTransferSucceed.getRequestNo());
			if (li != null && li.size() != 0) {
				TInvestmentInfo investmentInfo = li.get(0);
				investmentInfo.setCode(TTransferSucceed.getCode());
				ptopService.addOrUpdateInvestmentInfo(investmentInfo);

			}
			gateService.addOrUpdateTTransferSucceed(TTransferSucceed);
			TTransferInfo transferInfo = gateService
					.queryTTransferInfoByNumber(TTransferSucceed.getRequestNo())
					.get(0);
			transferInfo.setCode(TTransferSucceed.getCode());
			gateService.addOrUpdateTTransferInfo(transferInfo);
			model.addAttribute("transferInfo", transferInfo);

			TTransRecord transrecord = new TTransRecord(
					transferInfo.getPlatformUserNo(),
					transferInfo.getRequestNo(), transferInfo.getTransDate(),
					transferInfo.getProjectName(),
					transferInfo.getPaymentAmount(), "投资");
			transRecordService.addOrUpdate(transrecord);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
		}

		return "buy_ok";

	}

	@RequestMapping(value = "/gate/bindingSucceed", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String binding(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {

			DocumentBuilder db = dbf.newDocumentBuilder();

			InputStream iStream = new ByteArrayInputStream(
					resp.getBytes("UTF-8"));
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("response");

			TBindingSucceed bindingSucceed = new TBindingSucceed();

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

				}

				if (p.item(1).getNodeName() != null
						&& p.item(1).getTextContent() != null) {
					bindingSucceed.setService(p.item(1).getTextContent());

				}
				if (p.item(3).getNodeName() != null
						&& p.item(3).getTextContent() != null) {
					bindingSucceed.setPlatformNo(p.item(3).getTextContent());

				}
				if (p.item(5).getNodeName() != null
						&& p.item(5).getTextContent() != null) {
					bindingSucceed.setCode(p.item(5).getTextContent());

				}
				if (p.item(7).getNodeName() != null
						&& p.item(7).getTextContent() != null) {
					bindingSucceed.setDescription(p.item(7).getTextContent());

				}

			}

			gateService.addOrUpdateTBindingSucceed(bindingSucceed);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
		}

		/* return "payment/binding"; */
		return "bangding_ok";
	}

	@RequestMapping(value = "/gate/loanexam", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String loanexam(Model model, String notify, String sign)
			throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {

			DocumentBuilder db = dbf.newDocumentBuilder();

			InputStream iStream = new ByteArrayInputStream(
					notify.getBytes("UTF-8"));
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("response");

			TBindingSucceed bindingSucceed = new TBindingSucceed();

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

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

	@RequestMapping(value = "/gate/registerNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String registerNotify(String notify, String sign, Model model)
			throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {

			DocumentBuilder db = dbf.newDocumentBuilder();

			InputStream iStream = new ByteArrayInputStream(
					notify.getBytes("UTF-8"));
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("notify");

			TRegisterNotify registerNotify = new TRegisterNotify();

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

				}

				if (p.item(1).getNodeName() != null
						&& p.item(1).getTextContent() != null) {
					registerNotify.setRequestNo(p.item(1).getTextContent());

				}
				if (p.item(3).getNodeName() != null
						&& p.item(3).getTextContent() != null) {
					registerNotify.setPlatformNo(p.item(3).getTextContent());

				}
				if (p.item(5).getNodeName() != null
						&& p.item(5).getTextContent() != null) {
					registerNotify.setBizType(p.item(5).getTextContent());
				}
				if (p.item(7).getNodeName() != null
						&& p.item(7).getTextContent() != null) {
					registerNotify.setCode(p.item(7).getTextContent());

				}
				if (p.item(9).getNodeName() != null
						&& p.item(9).getTextContent() != null) {
					registerNotify.setMessage(p.item(9).getTextContent());

				}
				if (p.item(11).getNodeName() != null
						&& p.item(11).getTextContent() != null) {
					registerNotify.setPlatformUserNo(p.item(11)
							.getTextContent());

				}

			}
			gateService.addOrUpdateTRegisterNotify(registerNotify);

			/* gateService.addOrUpdateTTransferNotify(transferNotify); */

		} catch (Exception e) {
			// TODO: handle exception
			logger.error("error "+ e);
		} finally {
		}

		return "payment/binding";
	}

	
	@RequestMapping(value = "/gate/loanNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String loanNotify(String notify, String sign, Model model)
			throws Exception {

		try {

	        Map<String, Object> m = Xml.Dom2Map(notify);
	        if(m.get("code").equals("1")){
	        	
	        }else{
	            logger.error("error loan "+ m.get("description"));
	        	
	        }
			return "success";
			
		} catch (Exception e) {
			logger.error("error "+ e);
			return "error";
		}

	}

	
	@RequestMapping(value = "/gate/rechargeNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String rechargeNotify(String notify, String sign, Model model)
			throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {

			DocumentBuilder db = dbf.newDocumentBuilder();

			InputStream iStream = new ByteArrayInputStream(
					notify.getBytes("UTF-8"));
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("notify");

			TRechargeNotify rechargeNotify = new TRechargeNotify();

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

				}

				if (p.item(1).getNodeName() != null
						&& p.item(1).getTextContent() != null) {
					rechargeNotify.setRequestNo(p.item(1).getTextContent());

				}
				if (p.item(3).getNodeName() != null
						&& p.item(3).getTextContent() != null) {
					rechargeNotify.setPlatformNo(p.item(3).getTextContent());

				}
				if (p.item(5).getNodeName() != null
						&& p.item(5).getTextContent() != null) {
					rechargeNotify.setBizType(p.item(5).getTextContent());

				}
				if (p.item(7).getNodeName() != null
						&& p.item(7).getTextContent() != null) {
					rechargeNotify.setCode(p.item(7).getTextContent());

				}
				if (p.item(9).getNodeName() != null
						&& p.item(9).getTextContent() != null) {
					rechargeNotify.setMessage(p.item(9).getTextContent());

				}
				if (p.item(11).getNodeName() != null
						&& p.item(11).getTextContent() != null) {
					rechargeNotify.setPlatformUserNo(p.item(11)
							.getTextContent());

				}

			}

			gateService.addOrUpdateTRechargeNotify(rechargeNotify);

			/* gateService.addOrUpdateTTransferNotify(transferNotify); */

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
		}

		return "payment/binding";
	}

	@RequestMapping(value = "/gate/transferNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String transferNotify(String notify, String sign, Model model)
			throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {

			DocumentBuilder db = dbf.newDocumentBuilder();

			InputStream iStream = new ByteArrayInputStream(
					notify.getBytes("UTF-8"));
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("notify");

			TTransferNotify transferNotify = new TTransferNotify();

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

				}

				if (p.item(1).getNodeName() != null
						&& p.item(1).getTextContent() != null) {
					transferNotify.setPlatformNo(p.item(1).getTextContent());

				}
				if (p.item(3).getNodeName() != null
						&& p.item(3).getTextContent() != null) {
					transferNotify.setBizType(p.item(3).getTextContent());

				}
				if (p.item(5).getNodeName() != null
						&& p.item(5).getTextContent() != null) {
					transferNotify.setCode(p.item(5).getTextContent());

				}
				if (p.item(7).getNodeName() != null
						&& p.item(7).getTextContent() != null) {
					transferNotify.setMessage(p.item(7).getTextContent());

				}
				if (p.item(9).getNodeName() != null
						&& p.item(9).getTextContent() != null) {
					transferNotify.setRequestNo(p.item(9).getTextContent());

				}

			}

			gateService.addOrUpdateTTransferNotify(transferNotify);

			/* gateService.addOrUpdateTTransferNotify(transferNotify); */

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
		}

		return "payment/binding";
	}

	@RequestMapping(value = "/gate/bindingNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String bindingNotify(Model model, String notify, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {

			DocumentBuilder db = dbf.newDocumentBuilder();

			InputStream iStream = new ByteArrayInputStream(
					notify.getBytes("UTF-8"));
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("notify");

			TBindingNotify bindingNotify = new TBindingNotify();

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

				}

				if (p.item(1).getNodeName() != null
						&& p.item(1).getTextContent() != null) {
					bindingNotify.setRequestNo(p.item(1).getTextContent());

				}
				if (p.item(3).getNodeName() != null
						&& p.item(3).getTextContent() != null) {
					bindingNotify.setPlatformNo(p.item(3).getTextContent());

				}
				if (p.item(5).getNodeName() != null
						&& p.item(5).getTextContent() != null) {
					bindingNotify.setBizType(p.item(5).getTextContent());

				}
				if (p.item(7).getNodeName() != null
						&& p.item(7).getTextContent() != null) {
					bindingNotify.setCode(p.item(7).getTextContent());

				}
				if (p.item(9).getNodeName() != null
						&& p.item(9).getTextContent() != null) {
					bindingNotify.setMessage(p.item(9).getTextContent());

				}
				if (p.item(11).getNodeName() != null
						&& p.item(11).getTextContent() != null) {
					bindingNotify
							.setPlatformUserNo(p.item(11).getTextContent());

				}
				if (p.item(13).getNodeName() != null
						&& p.item(13).getTextContent() != null) {
					bindingNotify.setBankCardNo(p.item(13).getTextContent());

				}
				if (p.item(15).getNodeName() != null
						&& p.item(15).getTextContent() != null) {
					bindingNotify.setCardStatus(p.item(15).getTextContent());

				}
				if (p.item(17).getNodeName() != null
						&& p.item(17).getTextContent() != null) {
					bindingNotify.setBank(p.item(17).getTextContent());

				}

			}

			gateService.addOrUpdateTBindingNotify(bindingNotify);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "payment/binding";
	}

	@RequestMapping(value = "/gate/drawMoneyNotify", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String drawMoneyNotify(Model model, String notify, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("notify", notify);
		model.addAttribute("sign", sign);

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {
			DocumentBuilder db = dbf.newDocumentBuilder();

			InputStream iStream = new ByteArrayInputStream(
					notify.getBytes("UTF-8"));
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("notify");

			TDrawMoneyNotify drawMoneyNotify = new TDrawMoneyNotify();

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

				}

				if (p.item(1).getNodeName() != null
						&& p.item(1).getTextContent() != null) {
					drawMoneyNotify.setPlatformNo(p.item(1).getTextContent());

				}
				if (p.item(3).getNodeName() != null
						&& p.item(3).getTextContent() != null) {
					drawMoneyNotify.setBizType(p.item(3).getTextContent());

				}
				if (p.item(5).getNodeName() != null
						&& p.item(5).getTextContent() != null) {
					drawMoneyNotify.setCode(p.item(5).getTextContent());

				}
				if (p.item(7).getNodeName() != null
						&& p.item(7).getTextContent() != null) {
					drawMoneyNotify.setMessage(p.item(7).getTextContent());

				}
				if (p.item(9).getNodeName() != null
						&& p.item(9).getTextContent() != null) {
					drawMoneyNotify.setRequestNo(p.item(9).getTextContent());

				}
				if (p.item(11).getNodeName() != null
						&& p.item(11).getTextContent() != null) {
					drawMoneyNotify.setPlatformUserNo(p.item(11)
							.getTextContent());

				}
				if (p.item(13).getNodeName() != null
						&& p.item(13).getTextContent() != null) {
					drawMoneyNotify.setCardNo(p.item(13).getTextContent());

				}
				if (p.item(15).getNodeName() != null
						&& p.item(15).getTextContent() != null) {
					drawMoneyNotify.setBank(p.item(15).getTextContent());

				}

			}

			gateService.addOrUpdateTDrawMoneyNotify(drawMoneyNotify);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "payment/binding";
	}

	@RequestMapping(value = "/gate/drawMoneySucceed", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String drawMoneySucceed(Model model, String resp, String sign,
			HttpServletRequest request) throws Exception {
		model.addAttribute("resp", resp);
		model.addAttribute("sign", sign);

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {

			DocumentBuilder db = dbf.newDocumentBuilder();

			TDrawMoneySucceed drawMoneySucceed = new TDrawMoneySucceed();
			InputStream iStream = new ByteArrayInputStream(
					resp.getBytes("UTF-8"));
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("response");

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

				}

				if (p.item(1).getNodeName() != null
						&& p.item(1).getTextContent() != null) {
					drawMoneySucceed.setService(p.item(1).getTextContent());

				}
				if (p.item(3).getNodeName() != null
						&& p.item(3).getTextContent() != null) {
					drawMoneySucceed.setRequestNo(p.item(3).getTextContent());

				}
				if (p.item(5).getNodeName() != null
						&& p.item(5).getTextContent() != null) {
					drawMoneySucceed.setCode(p.item(5).getTextContent());

				}
				if (p.item(7).getNodeName() != null
						&& p.item(7).getTextContent() != null) {
					drawMoneySucceed.setDescription(p.item(7).getTextContent());

				}

			}
			gateService.addOrUpdateTDrawMoneySucceed(drawMoneySucceed);

			TDrawMoney drawmoney = gateService.queryTDrawMoneyByRequestNo(
					drawMoneySucceed.getRequestNo()).get(0);
			userService.getUserByAccount(drawmoney.getPlatformUserNo());

			TTransRecord transrecord = new TTransRecord(
					drawmoney.getPlatformUserNo(), drawmoney.getRequestNo(),
					drawmoney.getTransDate(), "", drawmoney.getAmount(),
					"提现");
			transRecordService.addOrUpdate(transrecord);

			/* gateService.addOrUpdateTBindingSucceed(bindingSucceed); */

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
		}

		/* return "payment/drawMoney"; */
		/* return "bangding_ok"; */
		return "tixian_ok";

	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	private String doSign(String xml, String url, Model model, String service) {

		String pfx = servletContext.getRealPath("/WEB-INF/zhengshu.pfx");

		String s = xml;
		s = s.replaceAll("[\\r\\n]", "");

		model.addAttribute("service", service);
		model.addAttribute("url", url);
		model.addAttribute("req", s);
		model.addAttribute("sign", SignUtil.sign(s, pfx, "liukai123"));

		return "post";

	}

	private String doSigns(String xml, String url, Model model, String service) {

		String pfx = servletContext.getRealPath("/WEB-INF/zhengshu.pfx");

		String s = xml;
		s = s.replaceAll("[\\r\\n]", "");

		model.addAttribute("service", service);
		model.addAttribute("url", url);
		model.addAttribute("req", s);
		model.addAttribute("sign", SignUtil.sign(s, pfx, "liukai123"));

		HttpClientTest d = new HttpClientTest();
		String resp = d.postForm(service, url, s,
				SignUtil.sign(s, pfx, "liukai123"));

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {

			DocumentBuilder db = dbf.newDocumentBuilder();

			InputStream iStream = new ByteArrayInputStream(
					resp.getBytes("UTF-8"));
			Document dm = db.parse(iStream);

			NodeList persons = dm.getElementsByTagName("response");

			for (int i = 0; i < persons.getLength(); i++) {

				Element personElement = (Element) persons.item(i);

				NodeList p = personElement.getChildNodes();
				for (int j = 0; j < p.getLength(); j++) {
					p.item(j);

				}

				if (p.item(9).getNodeName() != null
						&& p.item(9).getTextContent() != null) {

					model.addAttribute("balance", p.item(9).getTextContent());

				}
				if (p.item(11).getNodeName() != null
						&& p.item(11).getTextContent() != null) {

					model.addAttribute("availableAmount", p.item(11)
							.getTextContent());

				}
				if (p.item(13).getNodeName() != null
						&& p.item(13).getTextContent() != null) {

					model.addAttribute("freezeAmount", p.item(13)
							.getTextContent());

				}

			}

		} catch (Exception e) {
			logger.info(e.getMessage());
		}

		return "zichan";
	}

	private String doSign(Object obj, String url, Model model) {

		StringWriter w = new StringWriter();
		JAXB.marshal(obj, w);

		return doSign(w.toString(), url, model, "");
	}
}
