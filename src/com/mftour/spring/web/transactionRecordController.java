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
				List<TTransferInfo> list1=gateService.queryAllTransRecord(user.getName());
				System.out.println("投资所有的交易记录"+list1.size());
				List list11=new ArrayList();
				for(TTransferInfo transferInfo:list1){
					java.util.Date date = myFormatter.parse(myFormatter.format(new Date()));
				    java.util.Date mydate = myFormatter.parse(transferInfo.getTransDate());
				    day = Math.abs((date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000));
				    if(day<=7){
				    	list11.add(transferInfo);
				    }
				}
				System.out.println("投资七天交易记录数："+list11.size());
				model.addAttribute("list11", list11);
				//提现七天交易记录
				List<TDrawMoney> list2=gateService.DrawMonetAllTransRecord(user.getName());
				List list22=new ArrayList();
				for(TDrawMoney drawMoney:list2){
					java.util.Date date = myFormatter.parse(myFormatter.format(new Date()));
					java.util.Date mydate = myFormatter.parse(drawMoney.getTransDate());
					day = Math.abs((date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000));
					if(day<=7){
						list22.add(drawMoney);
					}
				}
				System.out.println("提现七天交易记录记录数："+list22.size());
				model.addAttribute("list22", list22);
				//充值七天交易记录
				List<TRecharge> list3=gateService.RechargeAllTransRecord(user.getName());
				List list33=new ArrayList();
				for(TRecharge recharge:list3){
					java.util.Date date = myFormatter.parse(myFormatter.format(new Date()));
					java.util.Date mydate = myFormatter.parse(recharge.getTime());
					day = Math.abs((date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000));
					if(day<=7){
						list22.add(recharge);
					}
				}
				System.out.println("充值七天交易记录数："+list33.size());
				model.addAttribute("list33", list33);
				
			}
			/*end*/
			
			
			/*start*/
			if("onemonth_all".equals(time_type)){
				//投资一个月交易记录
				List<TTransferInfo> list1=gateService.queryAllTransRecord(user.getName());
				List list11=new ArrayList();
				for(TTransferInfo transferInfo:list1){
					java.util.Date date = myFormatter.parse(myFormatter.format(new Date()));
					java.util.Date mydate = myFormatter.parse(transferInfo.getTransDate());
					day = Math.abs((date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000));
					if(day<=30){
						list11.add(transferInfo);
					}
				}
				model.addAttribute("list11", list11);
				//提现一个月交易记录
				List<TDrawMoney> list2=gateService.DrawMonetAllTransRecord(user.getName());
				List list22=new ArrayList();
				for(TDrawMoney drawMoney:list2){
					java.util.Date date = myFormatter.parse(myFormatter.format(new Date()));
					java.util.Date mydate = myFormatter.parse(drawMoney.getTransDate());
					day = Math.abs((date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000));
					if(day<=7){
						list22.add(drawMoney);
					}
				}
				model.addAttribute("list22", list22);
				//充值一个月交易记录
				List<TRecharge> list3=gateService.RechargeAllTransRecord(user.getName());
				List list33=new ArrayList();
				for(TRecharge recharge:list3){
					java.util.Date date = myFormatter.parse(myFormatter.format(new Date()));
					java.util.Date mydate = myFormatter.parse(recharge.getTime());
					day = Math.abs((date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000));
					if(day<=7){
						list22.add(recharge);
					}
				}
				model.addAttribute("list33", list33);
				
			}
			/*end*/
			
			
			/*start*/
			if("threemonth_all".equals(time_type)){
				//投资三个月交易记录
				List<TTransferInfo> list1=gateService.queryAllTransRecord(user.getName());
				List list11=new ArrayList();
				for(TTransferInfo transferInfo:list1){
					java.util.Date date = myFormatter.parse(myFormatter.format(new Date()));
					java.util.Date mydate = myFormatter.parse(transferInfo.getTransDate());
					day = Math.abs((date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000));
					if(day<=90){
						list11.add(transferInfo);
					}
				}
				model.addAttribute("list11", list11);
				//提现三个月交易记录
				List<TDrawMoney> list2=gateService.DrawMonetAllTransRecord(user.getName());
				List list22=new ArrayList();
				for(TDrawMoney drawMoney:list2){
					java.util.Date date = myFormatter.parse(myFormatter.format(new Date()));
					java.util.Date mydate = myFormatter.parse(drawMoney.getTransDate());
					day = Math.abs((date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000));
					if(day<=90){
						list22.add(drawMoney);
					}
				}
				model.addAttribute("list22", list22);
				//充值三个月交易记录
				List<TRecharge> list3=gateService.RechargeAllTransRecord(user.getName());
				List list33=new ArrayList();
				for(TRecharge recharge:list3){
					java.util.Date date = myFormatter.parse(myFormatter.format(new Date()));
					java.util.Date mydate = myFormatter.parse(recharge.getTime());
					day = Math.abs((date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000));
					if(day<=90){
						list22.add(recharge);
					}
				}
				model.addAttribute("list33", list33);
				
			}
			/*end*/
			
			
			/*start*/
			if("all_all".equals(time_type)){
				//投资全部的交易记录
				List<TTransferInfo> list11=gateService.queryAllTransRecord(user.getName());
				model.addAttribute("list11", list11);
				//提现全部的交易记录
				List<TDrawMoney> list22=gateService.DrawMonetAllTransRecord(user.getName());
				model.addAttribute("list22", list22);
				//充值全部的交易记录
				List<TRecharge> list33=gateService.RechargeAllTransRecord(user.getName());
				model.addAttribute("list33", list33);
				
			}
			/*end*/
			
			/*start*/
			if("recharge_all".equals(time_type)){
				//充值全部的交易记录
				List<TRecharge> list33=gateService.RechargeAllTransRecord(user.getName());
				model.addAttribute("list33", list33);
				
			}
			/*end*/
			
			/*start*/
			if("transferinfo_all".equals(time_type)){
				//投资全部的交易记录
				List<TTransferInfo> list11=gateService.queryAllTransRecord(user.getName());
				System.out.println("ttttttttttttttttt"+list11.size());
				model.addAttribute("list11", list11);
			}
			/*end*/
			
			/*start*/
			if("drawmoney_all".equals(time_type)){
				//提现全部的交易记录
				List<TDrawMoney> list22=gateService.DrawMonetAllTransRecord(user.getName());
				model.addAttribute("list22", list22);
			}
			/*end*/
			
			
			model.addAttribute("page", page);
			
			} catch (Exception e) {
					e.printStackTrace();
				
			}
			
			return "jiaoyi";
		}
}
