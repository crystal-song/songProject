package com.mftour.spring.service;

import java.util.List;

import com.mftour.spring.model.TAdministrator;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TProduct;


public interface IptopService {
	
	
	public void addOrUpdate(TProduct tproduct) throws Exception;
	
	public TAdministrator getAdministratorByAccount(String account) throws Exception;
	
	public void addOrUpdateInvestmentInfo(TInvestmentInfo investmentInfo) throws Exception;
	
	 public List<TInvestmentInfo> queryInvestmentInfoByNumber(String Number);
	 
	 public void deleteTInvestmentInfo(Long id) throws Exception;
	 
	 

}
