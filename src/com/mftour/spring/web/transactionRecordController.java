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

import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.util.Page;

@Controller
@RequestMapping("/transRecord")
public class transactionRecordController {
	@Autowired
	private IGateService gateService;
	//查询交易记录（订单编号（orderNo）、时间()、交易类型(充值(/gate/transferSucceed)、提现、投资（notifyUrl）)、交易详情(投资｛项目名称(projectName)｝)、金额（paymentAmount））
		@RequestMapping(value="/queryTransRecord",method={RequestMethod.POST,RequestMethod.GET})
		public String queryTransRecode(@RequestParam("time_type") String time_type,Model model,
				@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
				@RequestParam(value = "pageSize", required = false, defaultValue = "3") int pageSize,
				HttpServletRequest request){
			try {
				TUser user=(TUser)request.getSession().getAttribute("userinfo");
				Page page = Page.newBuilder(pageNo, pageSize, "queryTransRecord");
				List listall=new ArrayList();
				SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			    long day = 0;
			if("seven_all".equals(time_type)){
				List<TTransferInfo> list=gateService.queryAllTransRecord(page,user.getRealName());
				System.out.println("list.size="+list.size());
				for(TTransferInfo transferInfo:list){
					java.util.Date date = myFormatter.parse(myFormatter.format(new Date()));
				    java.util.Date mydate = myFormatter.parse(transferInfo.getTransDate());
				    day = Math.abs((date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000));
				    
				    	listall.add(transferInfo);
				  
				   /* if(day<=7){
				    	listall.add(transferInfo);
				    }*/
				}
				
			}
			model.addAttribute("page", page);
			model.addAttribute("list1", listall);
			} catch (Exception e) {
					e.printStackTrace();
				
			}
			
			
			/*try {
				List<TTransferInfo> list;
				list = gateService.queryAllTransRecord();
				model.addAttribute("list1", list);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			
			return "jiaoyi";
		}
}
