package com.mftour.spring.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mftour.spring.model.TDrawMoney;
import com.mftour.spring.model.TRecharge;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TUser;
import com.mftour.spring.model.TransactionRecord;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.util.Page;

@Controller
@RequestMapping("/transRecord")
public class transactionRecordController {
	@Autowired
	private IGateService gateService;
	//查询交易记录（订单编号（orderNo）、时间()、交易类型(充值、提现、投资（notifyUrl）)、交易详情(投资｛项目名称(projectName)｝)、金额（paymentAmount））
		@RequestMapping(value="/queryTransRecord",method={RequestMethod.POST,RequestMethod.GET})
		public String queryTransRecode(@RequestParam("time_type") String time_type,Model model,
				@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
				@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
				HttpServletRequest request){
			try {
				TUser user=(TUser)request.getSession().getAttribute("userinfo");
				Page page = Page.newBuilder(pageNo, pageSize, "queryTransRecord");
				SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			    long day = 0;
			   /*start*/
			if("seven_all".equals(time_type)){
				//投资七天交易记录
			String sql="SELECT a.callbackUrl,a.transferAmount,a.orderNo,a.transDate as t ,a.projectName FROM transferinfo a where a.platformUserNo=? and (a.transDate between date_sub(now(),interval 1 WEEK) and now()) "
						+ "union all SELECT b.callbackUrl,b.amount,b.requestNo,b.transDate as t ,b.id from drawmoney b where b.platformUserNo=? and (b.transDate BETWEEN DATE_SUB(NOW(),INTERVAL 1 WEEK) and NOW()) union ALL "
						+"select c.callbackUrl,c.amount,c.requestNo,c.time as t,c.id from recharge c  WHERE c.platformUserNo=? and (c.time  BETWEEN DATE_SUB(NOW(),INTERVAL 1 WEEK) and NOW()) ORDER BY t ASC";
				List<Object[]> list1=gateService.queryAllTransRecord(page,sql,user.getName());
				List list11=new ArrayList();
				for(Object[] obj:list1){
					TransactionRecord transrecord=new TransactionRecord();
					transrecord.setCallbackUrl(obj[0].toString());
					transrecord.setTransferAmount(obj[1].toString());
					transrecord.setOrderNo(obj[2].toString());
					transrecord.setTransDate(obj[3].toString());
					transrecord.setProjectName(obj[4].toString());
					list11.add(transrecord);
				}
				model.addAttribute("list11", list11);
				model.addAttribute("recordsize", list11.size());
				model.addAttribute("time_type", "seven_all");
			
			}
			/*end*/
			
			
			/*start*/
			if("onemonth_all".equals(time_type)){
				//投资一个月交易记录
				String sql="SELECT a.callbackUrl,a.transferAmount,a.orderNo,a.transDate as t ,a.projectName FROM transferinfo a where a.platformUserNo=? and (a.transDate between date_sub(now(),interval 1 month) and now()) "
						+ "union all SELECT b.callbackUrl,b.amount,b.requestNo,b.transDate as t ,b.id from drawmoney b where b.platformUserNo=? and (b.transDate BETWEEN DATE_SUB(NOW(),INTERVAL 1 MONTH) and NOW()) union ALL "
						+"select c.callbackUrl,c.amount,c.requestNo,c.time as t,c.id from recharge c  WHERE c.platformUserNo=? and (c.time  BETWEEN DATE_SUB(NOW(),INTERVAL 1 MONTH) and NOW()) ORDER BY t ASC";
				List<Object[]> list1=gateService.queryAllTransRecord(page,sql,user.getName());
				List list11=new ArrayList();
				System.out.println("投资所有的交易记录"+list1.size());
				for(Object[] obj:list1){
					TransactionRecord transrecord=new TransactionRecord();
					transrecord.setCallbackUrl(obj[0].toString());
					transrecord.setTransferAmount(obj[1].toString());
					transrecord.setOrderNo(obj[2].toString());
					transrecord.setTransDate(obj[3].toString());
					transrecord.setProjectName(obj[4].toString());
					list11.add(transrecord);
				}
				model.addAttribute("list11", list11);
				model.addAttribute("recordsize", list11.size());
				model.addAttribute("time_type", "onemonth_all");
			}
			/*end*/
			
			
			/*start*/
			if("threemonth_all".equals(time_type)){
				//投资三个月交易记录
				String sql="SELECT a.callbackUrl,a.transferAmount,a.orderNo,a.transDate as t ,a.projectName FROM transferinfo a where a.platformUserNo=? and (a.transDate between date_sub(now(),interval 3 month) and now()) "
						+ "union all SELECT b.callbackUrl,b.amount,b.requestNo,b.transDate as t ,b.id from drawmoney b where b.platformUserNo=? and (b.transDate BETWEEN DATE_SUB(NOW(),INTERVAL 3 MONTH) and NOW()) union ALL "
						+"select c.callbackUrl,c.amount,c.requestNo,c.time as t,c.id from recharge c  WHERE c.platformUserNo=? and (c.time  BETWEEN DATE_SUB(NOW(),INTERVAL 3 MONTH) and NOW()) ORDER BY t ASC";
				List<Object[]> list1=gateService.queryAllTransRecord(page,sql,user.getName());
				List list11=new ArrayList();
				System.out.println("投资所有的交易记录"+list1.size());
				for(Object[] obj:list1){
					TransactionRecord transrecord=new TransactionRecord();
					transrecord.setCallbackUrl(obj[0].toString());
					transrecord.setTransferAmount(obj[1].toString());
					transrecord.setOrderNo(obj[2].toString());
					transrecord.setTransDate(obj[3].toString());
					transrecord.setProjectName(obj[4].toString());
					list11.add(transrecord);
				}
				model.addAttribute("list11", list11);
				model.addAttribute("recordsize", list11.size());
				model.addAttribute("time_type", "threemonth_all");
			}
			/*end*/
			
			
			/*start*/
			if("all_all".equals(time_type)){
				String sql="SELECT a.callbackUrl,a.transferAmount,a.orderNo,a.transDate as t ,a.projectName FROM transferinfo a where a.platformUserNo=?"
						+ "union all SELECT b.callbackUrl,b.amount,b.requestNo,b.transDate as t ,b.id from drawmoney b where b.platformUserNo=? union ALL "
						+"select c.callbackUrl,c.amount,c.requestNo,c.time as t,c.id from recharge c  WHERE c.platformUserNo=?  ORDER BY t ASC";
				List<Object[]> list1=gateService.queryAllTransRecord(page,sql,user.getName());
				List list11=new ArrayList();
				System.out.println("投资所有的交易记录"+list1.size());
				for(Object[] obj:list1){
					TransactionRecord transrecord=new TransactionRecord();
					transrecord.setCallbackUrl(obj[0].toString());
					transrecord.setTransferAmount(obj[1].toString());
					transrecord.setOrderNo(obj[2].toString());
					transrecord.setTransDate(obj[3].toString());
					transrecord.setProjectName(obj[4].toString());
					list11.add(transrecord);
				}
				model.addAttribute("list11", list11);
				model.addAttribute("recordsize", list11.size());
				model.addAttribute("time_type", "all_all");
				
			}
			/*end*/
			
		/*	start*/
			if("recharge_all".equals(time_type)){
				//充值全部的交易记录
				List<TRecharge> list11=gateService.RechargeAllTransRecord(page,user.getName());
				model.addAttribute("list1", list11);
				model.addAttribute("recordsize", list11.size());
				model.addAttribute("time_type", "recharge_all");
				
			}
			/*end*/
			
			/*start*/
			if("transferinfo_all".equals(time_type)){
				//投资全部的交易记录
				List<TTransferInfo> list11=gateService.AllTransRecord(page,user.getName());
				model.addAttribute("list2", list11);
				model.addAttribute("recordsize", list11.size());
				model.addAttribute("time_type", "transferinfo_all");
			}
			/*end*/
			
			/*start*/
			if("drawmoney_all".equals(time_type)){
				//提现全部的交易记录
				List<TDrawMoney> list11=gateService.DrawMonetAllTransRecord(page,user.getName());
				model.addAttribute("list3", list11);
				model.addAttribute("recordsize", list11.size());
				model.addAttribute("time_type", "drawmoney_all");
			}
			/*end*/
			
			
			model.addAttribute("page", page);
			
			} catch (Exception e) {
					e.printStackTrace();
				
			}
			
			return "jiaoyi";
		}
}
