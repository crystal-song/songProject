package com.mftour.spring.service;

import java.util.List;

import com.mftour.spring.model.TAdministrator;
import com.mftour.spring.model.TChannel;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.util.Page;


public interface IptopService {
	
	
	public void addOrUpdate(TProduct tproduct) throws Exception;
	
	public TAdministrator getAdministratorByAccount(String account) throws Exception;
	
	public void addOrUpdateInvestmentInfo(TInvestmentInfo investmentInfo) throws Exception;
	
	 public List<TInvestmentInfo> queryInvestmentInfoByNumber(String Number);
	 
	 public void deleteTInvestmentInfo(Long id) throws Exception;
	 
	 public void addOrUpdateTNews(TNews news) throws Exception;
	 
	 public void addOrUpdateTChannel(TChannel channel) throws Exception;
	 
	 public List<TChannel> getChannel()throws Exception;
	 
	 public List<TNews> getNews()throws Exception;
	 
	 public List<TChannel> getChannelById(Long id);
	 
	 public List<TNews> getNewsByName(String name);
	 
	 public TNews getTNewsById(Long id);
	 
	 public void deleteNews(Long id) throws Exception;
	 
	 public void deleteTChannel(Long id) throws Exception;
	 
	 public List<TNews> getNewsbyRecommend()throws Exception;
	 
	 

}