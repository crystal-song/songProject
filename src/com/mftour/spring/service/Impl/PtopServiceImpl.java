package com.mftour.spring.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.IProductDao;
import com.mftour.spring.Dao.IptopDao;
import com.mftour.spring.model.TAdministrator;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IptopService;


@Service("ptopService")
public class PtopServiceImpl  implements  IptopService  {
	
	
	@Autowired
	private IptopDao ptopDao;

	@Override
	public void addOrUpdate(TProduct tproduct) throws Exception {
		         ptopDao.addOrUpdate(tproduct);
		
	}

	

	@Override
	public TAdministrator getAdministratorByAccount(String account)
			throws Exception {
		List list= ptopDao.getAdministratorByAccount(account);
	             	
        
		 return list==null || list.size() == 0 ? null : (TAdministrator)list.get(0);
	}



	@Override
	public void addOrUpdateInvestmentInfo(TInvestmentInfo investmentInfo)
			throws Exception {
		
		     ptopDao.addOrUpdateInvestmentInfo(investmentInfo);
		  
		
	}



	@Override
	public List<TInvestmentInfo> queryInvestmentInfoByNumber(String Number) {
		return  ptopDao.queryInvestmentInfoByNumber(Number);
		
	}



	@Override
	public void deleteTInvestmentInfo(Long id) throws Exception {
		ptopDao.deleteTInvestmentInfo(id);
		
	}
	
	
	
	
	
	

	
	
}
