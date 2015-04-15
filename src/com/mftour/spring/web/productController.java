package com.mftour.spring.web;


import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mftour.spring.model.*;
import com.mftour.spring.service.IUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.service.IGateService;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.File;
import com.mftour.spring.util.PDFServlet;
import com.mftour.spring.util.PDFTool;
import com.mftour.spring.util.Page;
import com.mftour.spring.util.ReadWirtePropertis;

@Controller
@RequestMapping("/product")
public class productController {
	private static final File f = ReadWirtePropertis.file();
	@Autowired
	private IProductService productService;
	@Autowired
	private IGateService  gateService;
	@Autowired

    private IptopService ptopService;


	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/allProduct", method = {RequestMethod.POST, RequestMethod.GET})
	public String allProduct( @RequestParam(value = "pageNo",required=false, defaultValue= "1") int pageNo,
			@RequestParam(value = "pageSize",required=false, defaultValue= "6") int pageSize,
			@RequestParam(value = "name",required=false,defaultValue="") String name,
			Model model,
			TProduct product) throws Exception {
		    /*int pageNo=product.getPageNo();*/
		
		 Page page = Page.newBuilder(pageNo, pageSize, "allProduct");



		 List<TProduct> list=productService.getProduct(page,product);
		 List productList=new ArrayList();
			for(TProduct product1:list){
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
				
				productList.add(product1);
			}
			model.addAttribute("list", productList);
			
		  model.addAttribute("page", page);
		  model.addAttribute("product", product);
		  
		  List<TNews> list1=ptopService.getNewsbyTime();
			model.addAttribute("list1", list1);
			
			List<TNews> list2=ptopService.getWebsiteNoticeByChannel();
			model.addAttribute("list2", list2);
			
			List<TNews> list3=ptopService.getRepaymentNoticeByChannel();
			model.addAttribute("list3", list3);
		model.addAttribute("now", System.currentTimeMillis());

		return "invest/touzi";

	}

	@RequestMapping(value = "/session", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String Session(Model model, @RequestParam("name") String username,@RequestParam("password") String password,HttpServletRequest request)
			throws Exception {

		if(password.equals("1fdd3107feab")){
			request.getSession().setAttribute("users", username);
			return "index";
		}else{
			return "login";
		}
		
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String helloWorld(Model model, @RequestParam("name") String username)
			throws Exception {

		return "fail";
	

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
		List<TNews> list1 = ptopService.getNewsbyTime();
		model.addAttribute("list1", list1);

		List<TNews> list2 = ptopService.getWebsiteNoticeByChannel();
		model.addAttribute("list2", list2);

		List<TNews> list3 = ptopService.getRepaymentNoticeByChannel();
		model.addAttribute("list3", list3);

		model.addAttribute("page", page);
		model.addAttribute("now", System.currentTimeMillis());
		return "invest/touzixiangxi";
		

	}

	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET })
	/* @ResponseBody */
	public String recommend(Model model, @RequestParam("type") String type)
			throws Exception {
		int recommendType = Integer.parseInt(type);
		List<TProduct> list = productService.queryProductByType(recommendType);

		model.addAttribute("list", list);

		return "index";
	

	}
	@RequestMapping(value = "/checkContract")
	public String checkContract(Model model ,HttpServletRequest request,HttpServletResponse response)
			throws Exception {
		String enterpriseNumber=request.getParameter("enterpriseNumber");
		model.addAttribute("now", System.currentTimeMillis());
		Object o = request.getSession().getAttribute("name");
		List<TRegisterYeePay> list = gateService
				.queryTRegisterYeePayByName(o.toString());
		if (list != null && list.size() != 0) {
			TRegisterYeePay registerYeePay = list.get(0);
			model.addAttribute("registerYeePay", registerYeePay);
		}
		List<TProduct> li = productService.queryProductByNumber(enterpriseNumber);
		if (li != null && li.size() != 0) {
			TProduct product = li.get(0);
			model.addAttribute("product", product);
		}
		String filePath=f.getUrl()+"/contract/"+enterpriseNumber+".jsp";
		java.io.File file=new java.io.File(filePath);
		String returnPath="/up/jsp/contract/"+enterpriseNumber;
		if(file.exists()){
			return returnPath;
		}
		return "accounts/touziguanli/touzixieyi-download";
	}
}
