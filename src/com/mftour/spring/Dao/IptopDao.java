package com.mftour.spring.Dao;

import java.util.List;

import com.mftour.spring.model.TAdministrator;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TProduct;

public interface IptopDao {
	
	public void addOrUpdate(TProduct tproduct) throws Exception;
	
	public List getAdministratorByAccount(String account) throws Exception;
	
	public void addOrUpdateInvestmentInfo(TInvestmentInfo investmentInfo) throws Exception;
	
     public List<TInvestmentInfo> queryInvestmentInfoByNumber(String Number);
     
     public void deleteTInvestmentInfo(Long id) throws Exception;

}
