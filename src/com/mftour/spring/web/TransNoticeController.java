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
	public String addTransNotice(@RequestParam("noticeType1") String[] noticeType1,@RequestParam("noticeType2") String[] noticeType2
			,HttpServletRequest request) throws Exception {
	
		TUser user=(TUser)request.getSession().getAttribute("userinfo");
		List<TTransNotice> list=transNoticeService.queryTransNoticeByName(user.getName());
		
		int i=list.size();
	
		if(i==0){
			for(String reNoticeType:noticeType1){
				TTransNotice transnotice=new TTransNotice();
				transnotice.setType("充值");
				transnotice.setNoticeType(reNoticeType);
				transnotice.setUserName(user.getName());
				transNoticeService.addOrUpdate(transnotice);
			}
			for(String drawNoticeType:noticeType2){
				TTransNotice transnotice=new TTransNotice();
				transnotice.setType("提现");
				transnotice.setNoticeType(drawNoticeType);
				transnotice.setUserName(user.getName());
				transNoticeService.addOrUpdate(transnotice);
			}
		
		
		}else{
			transNoticeService.delTransNoticeByName(user.getName());
			for(String reNoticeType:noticeType1){
				TTransNotice transnotice=new TTransNotice();
				transnotice.setType("充值");
				transnotice.setNoticeType(reNoticeType);
				transnotice.setUserName(user.getName());
				transNoticeService.addOrUpdate(transnotice);
			}
			for(String drawNoticeType:noticeType2){
				TTransNotice transnotice=new TTransNotice();
				transnotice.setType("提现");
				transnotice.setNoticeType(drawNoticeType);
				transnotice.setUserName(user.getName());
				transNoticeService.addOrUpdate(transnotice);
			}
		}
		return "index";
	}
	
}
