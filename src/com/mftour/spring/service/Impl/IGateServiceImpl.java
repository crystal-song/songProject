package com.mftour.spring.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.ICrowdfundingDao;
import com.mftour.spring.Dao.IGateDao;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TYeePay;
import com.mftour.spring.service.IGateService;

@Service("gateService")
public class IGateServiceImpl  implements  IGateService {

	
	@Autowired
    private IGateDao gateDao;
	
	
	@Override
	public void addOrUpdate(TYeePay YeePay) throws Exception {
		gateDao.addOrUpdate(YeePay);
		
	}


	@Override
	public void addOrUpdateRegisterYeePay(TRegisterYeePay registerYeePay)
			throws Exception {
		gateDao.addOrUpdateRegisterYeePay(registerYeePay);
		
	}


	@Override
	public List<TRegisterYeePay> queryTRegisterYeePayByName(String name)
			throws Exception {
		
		return gateDao.queryTRegisterYeePayByName(name);
	}


	@Override
	public List<TRegisterYeePay> queryTRegisterYeePayByNumber(String Number)
			throws Exception {
		
		return gateDao.queryTRegisterYeePayByNumber(Number);
	}
	
	
	
	
	

}
