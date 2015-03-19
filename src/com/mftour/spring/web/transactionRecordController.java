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

import com.mftour.spring.model.TTransRecord;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.util.Page;

@Controller
@RequestMapping("/transRecord")
public class transactionRecordController {
	@Autowired
	private IGateService gateService;
	//查询交易记录（订单编号（orderNo）、时间()、交易类型(充值、提现、投资（notifyUrl）)、交易详情(投资｛项目名称(projectName)｝)、金额（paymentAmount））
		@SuppressWarnings("deprecation")
		@RequestMapping(value="/queryTransRecord",method={RequestMethod.POST,RequestMethod.GET})
		public String queryTransRecode(@RequestParam("time") String time,@RequestParam("type") String type,Model model,
				@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
				@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
				HttpServletRequest request){
			try {
				String sessiontime=(String) request.getSession().getAttribute("time");
				String sessiontype=(String) request.getSession().getAttribute("type");
				TUser user=(TUser)request.getSession().getAttribute("userinfo");
				Page page = Page.newBuilder(pageNo, pageSize, "queryTransRecord");
				
			   /*start*/
			if(user==null){
				return "login";
			}
				
			if("all".equals(time)){
				time=sessiontime;
			}
			if("all".equals(type)){
				type=sessiontype;
			}
			request.getSession().setAttribute("time", time);
			request.getSession().setAttribute("type", type);
			String sql="SELECT * FROM transrecord a where a.userName=?";
			StringBuffer sb = new StringBuffer(sql);
			List paramlist=new ArrayList();
			paramlist.add(user.getName());
			if(!"typeall".equals(type)&&!"timeall".equals(time)){
				sql+=" and TO_DAYS( NOW( ) )-TO_DAYS(a.transDate)<=? and a.type=? ORDER BY a.transDate DESC ";
				paramlist.add(time);
				paramlist.add(type);
			}
			if("typeall".equals(type)&&!"timeall".equals(time)){
				sql+=" and TO_DAYS( NOW( ) )-TO_DAYS(a.transDate)<=? ORDER BY a.transDate DESC ";
				paramlist.add(time);
				}
			if(!"typeall".equals(type)&&"timeall".equals(time)){
				sql+=" and a.type=? ORDER BY a.transDate DESC ";
				paramlist.add(type);
				}
			if("typeall".equals(type)&&"timeall".equals(time)){
				sql+="  and a.type not like '放款'  ORDER BY a.transDate DESC ";
			}
			List<TTransRecord> transRecordList=gateService.queryAllTransRecord(page,sql,paramlist.toArray());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			
			
			for(TTransRecord transrecord:transRecordList){
		      	transrecord.setTransDate(sdf.format(sdf.parse(transrecord.getTransDate()) ));
			}
			model.addAttribute("transRecordList", transRecordList);
			model.addAttribute("recordsize", transRecordList.size());
			model.addAttribute("page", page);
			} catch (Exception e) {
					e.printStackTrace();
				
			}
			
			return "accounts/jiaoyi";
		}
}
