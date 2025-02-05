package com.mftour.spring.web;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.mftour.spring.logic.YeePay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.model.Communal;
import com.mftour.spring.model.TAdministrator;
import com.mftour.spring.model.TChannel;
import com.mftour.spring.model.TInterestRate;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.rest.bean.Response;
import com.mftour.spring.rest.bean.ResponseReward;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.ISystemLogService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.File;
import com.mftour.spring.util.Page;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.Rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/Login")
public class AdminController {
	private static final Logger logger = LoggerFactory
			.getLogger(AdminController.class);

	private static final File f = ReadWirtePropertis.file();
	private Rest rest = new Rest();
	@Autowired
	private IptopService ptopService;

	@Autowired
	private IProductService productService;

	@Autowired
	private ISystemLogService systemLogService;

	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET })
	public String helloWorld(Model model, HttpServletRequest request)
			throws Exception {

		return "ptop/login";

	}

	

	@RequestMapping(value = "/session", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String Session(Model model, @RequestParam("token") String token,@RequestParam("name") String name,
			HttpServletRequest request) throws Exception {
		String res = rest.getRestful("/rest/valid-login-token/"+token+"/"+name);
		Response resBean =  JSON.parseObject(res, Response.class);
		if (resBean.isSuccess()) {
			request.getSession().setAttribute("restouthost", f.getRestOutHost());
			request.getSession().setAttribute("admin", name);
			return "ptop/p2b_add";
		}else{
			return "redirect:"+f.getRestOutHost()+"/admin";
		} 

	}

	@RequestMapping(value = "/loanProduct", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String loanProduct(@RequestParam("id") int id,
			@RequestParam("enterpriceNumber") String enterpriceNumber,
			Model model, TProduct product, HttpServletRequest request)
			throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			boolean b = YeePay.doLoan(id, enterpriceNumber);
			List<TProduct> product1 = productService
					.queryProductByNumber(enterpriceNumber);
			if (b) {
				return "success";
			} else {

				return "error";

			}
		} catch (Exception e) {

			logger.info("error" + e);
			return "error";
		}

	}

	@RequestMapping(value = "/addproduct", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String addproduct(Model model, TProduct product,
			@RequestParam("financeTimes") String financeTime,
			@RequestParam("repaymentTimes") String repaymentTime,
			HttpServletRequest request) throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			product.setFinanceTime(Timestamp.valueOf(financeTime));
			product.setRepaymentTime(Timestamp.valueOf(repaymentTime));
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String hot = request.getParameter("hot");
			product.setReleaseTime(df.format(new Date()));
			if (hot != null && hot.equals("1")) {
				Communal communal = ptopService.queryHotprojectFromCommunal()
						.get(0);
				communal.setValuess(product.getEnterpriseNumber());
				ptopService.addOrUpdate(communal);
			}
			if (product.getPlatformFee() == null) {
				product.setPlatformFee((float) 0);
			}
			if (product.getMargin() == null) {
				product.setMargin((float) 0);
			}
			if (product.getProjectStatus() == null) {
				product.setProjectStatus(1);// 预热中
			}
			ptopService.addOrUpdate(product);

			model.addAttribute("mes", "操作成功");
			systemLogService.saveSystemLog(request, "后台信息", "添加产品", 1);

		} catch (Exception e) {
			e.printStackTrace();
			systemLogService.saveSystemLog(request, "后台信息", "添加产品", 0);
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		/* model.addAttribute("name",user.getName()); */

		// request.getSession().setAttribute("users", username);
		return "ptop/p2b_add";
	}

	@RequestMapping(value = "/queryproduct", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String queryproduct(Model model, TProduct product,
			HttpServletRequest request) throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			List<TProduct> list = productService.queryProduct(product);
			model.addAttribute("list", list);

			/* model.addAttribute("mes", "操作成功"); */
			systemLogService.saveSystemLog(request, "后台信息", "查询产品", 1);

		} catch (Exception e) {
			e.printStackTrace();
			systemLogService.saveSystemLog(request, "后台信息", "查询产品", 0);
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		/* model.addAttribute("name",user.getName()); */

		// request.getSession().setAttribute("users", username);
		return "ptop/p2b_manage";
	}

	@RequestMapping(value = "/getProductByid", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getProductByid(@RequestParam("id") Long id, Model model,
			TProduct product, HttpServletRequest request) throws Exception {
		Object o = request.getSession().getAttribute("admin");
		if (o==null){
			return "error";
		}
		TProduct product1 = productService.getProductById(id);

		List<TInvestmentInfo> list = ptopService
				.queryInvestmentInfoByNumber(product1.getEnterpriseNumber());
		model.addAttribute("list", list);
		model.addAttribute("product1", product1);
		systemLogService.saveSystemLog(request, "后台信息", "查询产品通过id", 1);
		return "ptop/p2b_update";

	}

	@RequestMapping(value = "/investmentinfo", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String investmentinfo(Model model, HttpServletRequest request,
			TInvestmentInfo investmentInfo) throws Exception {

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		investmentInfo.setWriteTime(df.format(new Date()));
		;
		
		Object o = request.getSession().getAttribute("admin");
		if (o==null){
			return "error";
		}
		investmentInfo.setAdministratorName(o.toString());
		investmentInfo.setCode("1");
		ptopService.addOrUpdateInvestmentInfo(investmentInfo);
		List<TProduct> lis = productService.queryProductByNumber(investmentInfo
				.getEnterpriseNumber());
		TProduct t = lis.get(0);

		Double RealityMoney = t.getRealityMoney();

		if (RealityMoney == null || RealityMoney == 0.0) {
			t.setRealityMoney(investmentInfo.getInvestmentAmount());
			t.setFinancingProgress(investmentInfo.getInvestmentAmount()
					/ t.getFinancingMoney());
		} else {
			/*
			 * Double money=RealityMoney+investmentInfo.getInvestmentAmount();
			 * t.setRealityMoney(money);
			 * t.setFinancingProgress(money/t.getFinancingMoney()*100);
			 */

			Double d = ptopService.querySum(investmentInfo
					.getEnterpriseNumber());
			t.setRealityMoney(d);
			t.setFinancingProgress(d / t.getFinancingMoney());
		}

		ptopService.addOrUpdate(t);

		List<TInvestmentInfo> list = ptopService
				.queryInvestmentInfoByNumber(investmentInfo
						.getEnterpriseNumber());
		model.addAttribute("list", list);
		List<TProduct> li = productService.queryProductByNumber(investmentInfo
				.getEnterpriseNumber());
		model.addAttribute("product1", li.get(0));

		return "ptop/p2b_update";

	}

	@RequestMapping(value = "/deleteproduct", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String deleteproduct(Model model, TProduct product,
			@RequestParam("id") Long id, HttpServletRequest request)
			throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			productService.deleteProduct(id);
			List<TProduct> list = productService.queryProduct(product);
			model.addAttribute("list", list);
			systemLogService.saveSystemLog(request, "后台信息", "删除产品", 1);

		} catch (Exception e) {
			logger.error("err" + e);
			systemLogService.saveSystemLog(request, "后台信息", "删除产品", 0);
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		return "ptop/p2b_manage";
	}

	@Transactional
	@RequestMapping(value = "/deleteTInvestmentInfo", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String deleteTInvestmentInfo(Model model,
			TInvestmentInfo TInvestmentInfo, @RequestParam("id") Long id,
			@RequestParam("enterpriseNumber") String enterpriseNumber,
			HttpServletRequest request) throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			TInvestmentInfo investmentInfo = ptopService
					.queryTInvestmentInfo(id);
			List<TProduct> list1 = productService
					.queryProductByNumber(investmentInfo.getEnterpriseNumber());
			TProduct product = list1.get(0);
			Double realityMoney = product.getRealityMoney();

			Double investmentAmount = investmentInfo.getInvestmentAmount();
			Double r = realityMoney - investmentAmount;
			Double t = r / product.getFinancingMoney();
			product.setFinancingProgress(t);
			product.setRealityMoney(r);
			ptopService.addOrUpdate(product);

			ptopService.deleteTInvestmentInfo(id);

			List<TInvestmentInfo> list = ptopService
					.queryInvestmentInfoByNumber(enterpriseNumber);
			model.addAttribute("list", list);
			List<TProduct> li = productService
					.queryProductByNumber(enterpriseNumber);
			model.addAttribute("product1", li.get(0));

			systemLogService.saveSystemLog(request, "后台信息", "删除投资信息", 1);

			/* model.addAttribute("mes", "操作成功"); */

		} catch (Exception e) {

			logger.error("err" + e);
			systemLogService.saveSystemLog(request, "后台信息", "删除投资信息", 0);
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		/* model.addAttribute("name",user.getName()); */

		// request.getSession().setAttribute("users", username);
		return "ptop/p2b_update";
	}

	@RequestMapping(value = "/updateProduct", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String updateProduct(@RequestParam("id") Long id, Model model,
			TProduct product, HttpServletRequest request) throws Exception {
		Object o = request.getSession().getAttribute("admin");
		if (o==null){
			return "error";
		}
		TProduct product1 = productService.getProductById(id);
		List<Communal> list = ptopService
				.queryCommunalByEnterpriseNumber(product1.getEnterpriseNumber());
		if (list != null && list.size() > 0) {
			model.addAttribute("ishotproject", "true");
		}
		model.addAttribute("product1", product1);
		systemLogService.saveSystemLog(request, "后台信息", "更新产品", 1);
		return "ptop/p2b_modify";

	}

	@RequestMapping(value = "/addnews", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String allnews(Model model, HttpServletRequest request, TNews news)
			throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

			news.setTime(df.format(new Date()));
			ptopService.addOrUpdateTNews(news);

			List<TChannel> list1 = ptopService.getChannel();
			model.addAttribute("list1", list1);
			model.addAttribute("news", "操作成功");
			systemLogService.saveSystemLog(request, "后台信息", "添加新闻", 1);
		} catch (Exception e) {
			e.printStackTrace();
			systemLogService.saveSystemLog(request, "后台信息", "添加新闻失败", 1);

			throw e;
		}

		return "ptop/news_add";

	}

	@RequestMapping(value = "/channelManage", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String channelManage(Model model, TChannel channel,
			HttpServletRequest request) throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			List<TChannel> list = ptopService.getChannel();

			model.addAttribute("list", list);
			systemLogService.saveSystemLog(request, "后台信息", "频道管理", 1);

		} catch (Exception e) {

			logger.error("err" + e);
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		return "ptop/channel_manage";

	}

	@RequestMapping(value = "/getNews", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getNews(Model model, TNews news, HttpServletRequest request)
			throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			List<TNews> list = ptopService.getNews();
			List<TChannel> list1 = ptopService.getChannel();

			model.addAttribute("list", list);
			model.addAttribute("list1", list1);

			systemLogService.saveSystemLog(request, "后台信息", "获得新闻", 1);
		} catch (Exception e) {
			e.printStackTrace();
			systemLogService.saveSystemLog(request, "后台信息", "获得新闻", 0);
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		return "ptop/news_manage";

	}

	@RequestMapping(value = "/allchannel", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String allchannel(Model model, TChannel channel,
			HttpServletRequest request) throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

			channel.setTime(df.format(new Date()));

			ptopService.addOrUpdateTChannel(channel);
			List<TChannel> list = ptopService.getChannel();
			model.addAttribute("list", list);

			systemLogService.saveSystemLog(request, "后台信息", "添加频道", 1);
		} catch (Exception e) {

			logger.error("err" + e);
			systemLogService.saveSystemLog(request, "后台信息", "添加频道", 0);
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		return "ptop/channel_manage";

	}

	@RequestMapping(value = "/getNewsbychannel", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getNewsbychannel(Model model, TChannel channel,
			HttpServletRequest request) throws Exception {

		List<TNews> list;

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			if (channel.getId() == 0) {
				list = ptopService.getNews();

			} else {
				List<TChannel> li = ptopService.getChannelById(channel.getId());
				list = ptopService.getNewsByName(li.get(0).getName());

			}

			List<TChannel> list1 = ptopService.getChannel();

			model.addAttribute("list", list);

			model.addAttribute("list1", list1);
			systemLogService.saveSystemLog(request, "后台信息", "查询新闻通过频道", 1);

		} catch (Exception e) {

			logger.error("err" + e);
			systemLogService.saveSystemLog(request, "后台信息", "查询新闻通过频道", 0);
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		return "ptop/news_manage";

	}

	@RequestMapping(value = "/getChannel", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getChannel(Model model, TChannel channel,
			HttpServletRequest request) throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			List<TChannel> list1 = ptopService.getChannel();

			model.addAttribute("list1", list1);

			systemLogService.saveSystemLog(request, "后台信息", "获得频道", 1);
		} catch (Exception e) {
			e.printStackTrace();
			systemLogService.saveSystemLog(request, "后台信息", "获得频道", 0);
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		return "ptop/news_add";

	}

	@RequestMapping(value = "/updateNewsbyId", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String updateNews(Model model, TNews news, HttpServletRequest request)
			throws Exception {

		try {

			TNews news1 = ptopService.getTNewsById(news.getId());

			model.addAttribute("news1", news1);

			List<TChannel> list1 = ptopService.getChannel();

			model.addAttribute("list1", list1);
			systemLogService.saveSystemLog(request, "后台信息", "修改新闻", 1);
		} catch (Exception e) {

			logger.error("err" + e);
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		return "ptop/news_modify";

	}

	@RequestMapping(value = "/deleteNewsbyId", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String deleteNews(Model model, TNews news, HttpServletRequest request)
			throws Exception {

		try {

			ptopService.deleteNews(news.getId());
			List<TNews> list = ptopService.getNews();
			List<TChannel> list1 = ptopService.getChannel();

			model.addAttribute("list", list);
			model.addAttribute("list1", list1);
			systemLogService.saveSystemLog(request, "后台信息", "删除新闻", 1);
		} catch (Exception e) {

			logger.error("err" + e);
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		return "ptop/news_manage";

	}

	@RequestMapping(value = "/deleteChannelbyId", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String deleteChanne(Model model, TChannel channel,
			HttpServletRequest request) throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			ptopService.deleteTChannel(channel.getId());

			List<TChannel> list = ptopService.getChannel();

			model.addAttribute("list", list);
			systemLogService.saveSystemLog(request, "后台信息", "删除频道", 1);
		} catch (Exception e) {
			e.printStackTrace();
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		return "ptop/channel_manage";

	}

	@RequestMapping(value = "/deleteInterestRate", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String deleteInterestRate(Model model, @RequestParam("id") long id,
			@RequestParam("enterpriseNumber") String enterpriseNumber,
			HttpServletRequest request) throws Exception {

		try {
			Object o = request.getSession().getAttribute("admin");
			if (o==null){
				return "error";
			}
			ptopService.deleteInterestRate(id);
			systemLogService.saveSystemLog(request, "后台信息", "删除阶梯利率", 1);
			List<TInterestRate> li = ptopService
					.queryTInterestRateByNumber(enterpriseNumber);
			model.addAttribute("li", li);

			TProduct product1 = productService.queryProductByNumber(
					enterpriseNumber).get(0);
			model.addAttribute("product1", product1);

		} catch (Exception e) {
			e.printStackTrace();
			/* map.put("mes", "操作失败"); */
			throw e;
		}

		return "ptop/p2b_income";

	}

	@RequestMapping(value = "/addyield", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String addyield(@RequestParam("id") Long id, Model model,
			TProduct product, HttpServletRequest request) throws Exception {

		TProduct product1 = productService.getProductById(id);
		List<TInterestRate> li = ptopService
				.queryTInterestRateByNumber(product1.getEnterpriseNumber());
		model.addAttribute("li", li);
		model.addAttribute("product1", product1);

		return "ptop/p2b_income";

	}

	@RequestMapping(value = "/saveInterestRate", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String saveInterestRate(Model model, TInterestRate InterestRate,
			HttpServletRequest request) throws Exception {
		Object o = request.getSession().getAttribute("admin");
		if (o==null){
			return "error";
		}
		ptopService.addOrUpdateTInterestRate(InterestRate);

		List<TInterestRate> li = ptopService
				.queryTInterestRateByNumber(InterestRate.getEnterpriseNumber());
		model.addAttribute("li", li);

		model.addAttribute("ms", "添加成功");
		TProduct product1 = productService.queryProductByNumber(
				InterestRate.getEnterpriseNumber()).get(0);
		model.addAttribute("product1", product1);

		return "ptop/p2b_income";

	}

	@RequestMapping(value = "/checkRegyee", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String checkRegyee(
			@RequestParam("targetPlatformUserNo") String targetPlatformUserNo) {
		if (ptopService.queryYeePayByplatUserNo(targetPlatformUserNo) != null) {
			return "success";
		}
		return "fail";
	}

	@RequestMapping(value = "/checkRate", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String checkRate(
			@RequestParam("enterpriseNumber") String enterpriseNumber) {
		List list = ptopService.queryTInterestRateByNumber(enterpriseNumber);
		if (list != null && list.size() != 0) {
			return "success";
		}
		return "fail";
	}

	@RequestMapping(value = "/queryTransRecord", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String queryTransRecord(
			@RequestParam("id") Long id,
			Model model,
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			TProduct product, HttpServletRequest request) throws Exception {
		Object o = request.getSession().getAttribute("admin");
		if (o==null){
			return "error";
		}
		Page page = Page.newBuilder(pageNo, pageSize, "queryTransRecord");
		TProduct product1 = productService.getProductById(id);
		if (product1.getBuyType() == null) {
			List<TInvestmentInfo> listoffline = ptopService
					.queryInvestmentInfoByNumber(page,
							product1.getEnterpriseNumber());
			model.addAttribute("listoffline", listoffline);
		}
		if (product1.getBuyType() != null) {
			List<TTransferInfo> listonline = new ArrayList<TTransferInfo>();
			listonline = ptopService.queryTransferInfoByNumber(page,
					product1.getEnterpriseNumber());
			model.addAttribute("listonline", listonline);

		}
		model.addAttribute("product1", product1);
		model.addAttribute("page", page);

		return "ptop/p2b_transRecord";

	}
}