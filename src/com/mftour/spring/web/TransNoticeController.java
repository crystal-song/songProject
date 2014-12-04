package com.mftour.spring.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.model.TTransNotice;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.ITransNoticeService;


@Controller
@RequestMapping("/transnotice")
public class TransNoticeController  {
		
	@Autowired
    private ITransNoticeService transNoticeService;
	

	@RequestMapping(value="/add")
	@ResponseBody
	public String addTransNotice(@RequestParam("rechargeNoticeType") String rechargeNoticeType,@RequestParam("drawNoticeType") String drawNoticeType
			,@RequestParam("jiangliNoticeType") String jiangliNoticeType,HttpServletRequest request) throws Exception {
		TUser user=(TUser)request.getSession().getAttribute("userinfo");
		List<TTransNotice> list=transNoticeService.queryTransNoticeByName(user.getName());
		int i=list.size();
		System.out.println("lllllll"+i);
		if(i==0){
		TTransNotice transnotice=new TTransNotice(rechargeNoticeType,drawNoticeType,jiangliNoticeType,user.getName());
		transNoticeService.addOrUpdate(transnotice);
		}else{
			for(TTransNotice transnotice:list){
				transnotice.setRechargeNoticeType(rechargeNoticeType);
				transnotice.setDrawNoticeType(drawNoticeType);
				transnotice.setJiangliNoticeType(jiangliNoticeType);
				transNoticeService.addOrUpdate(transnotice);
			}
		}
		return "success";
	}
	
}
