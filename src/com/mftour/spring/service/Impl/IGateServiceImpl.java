
package com.mftour.spring.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.ICrowdfundingDao;
import com.mftour.spring.Dao.IGateDao;
import com.mftour.spring.model.TBinding;
import com.mftour.spring.model.TBindingNotify;
import com.mftour.spring.model.TBindingSucceed;
import com.mftour.spring.model.TDrawMoney;
import com.mftour.spring.model.TDrawMoneyNotify;
import com.mftour.spring.model.TDrawMoneySucceed;
import com.mftour.spring.model.TEstablishmentNotify;
import com.mftour.spring.model.TEstablishmentRegistration;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TLoansucceed;
import com.mftour.spring.model.TRecharge;
import com.mftour.spring.model.TRechargeNotify;
import com.mftour.spring.model.TRechargeSucceed;
import com.mftour.spring.model.TRegisterNotify;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TTransferNotify;
import com.mftour.spring.model.TTransferSucceed;
import com.mftour.spring.model.TYeePay;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.util.Page;

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


	@Override
	public void addOrUpdateTTransferSucceed(TTransferSucceed transferSucceed)
			throws Exception {
			gateDao.addOrUpdateTTransferSucceed(transferSucceed);
		
	}


	@Override
	public void addOrUpdateTTransferInfo(TTransferInfo TTransferInfo)
			throws Exception {
		gateDao.addOrUpdateTTransferInfo(TTransferInfo);
		
	}


	@Override
	public List<TTransferInfo> queryTTransferInfoByNumber(String Number)
			throws Exception {
		return gateDao.queryTTransferInfoByNumber(Number);


	}
	public List queryAllTransRecord(Page page,String sql,Object[] para)
			throws Exception {
		return gateDao.queryAllTransRecord(page,sql,para);

	}

	public List<TRecharge> RechargeAllTransRecord(Page page,String platformUserNo)throws Exception{
		return gateDao.RechargeAllTransRecord(page,platformUserNo);
	}
	@Override
	public void addOrUpdateTEstablishmentRegistration(
			TEstablishmentRegistration establishmentRegistration)
			throws Exception {
		gateDao.addOrUpdateTEstablishmentRegistration(establishmentRegistration);
		
	}


	@Override
	public void addOrUpdateTEstablishmentNotify(
			TEstablishmentNotify establishmentNotify) throws Exception {
		gateDao.addOrUpdateTEstablishmentNotify(establishmentNotify);
		
	}


	@Override
	public List<TEstablishmentRegistration> queryTEstablishmentRegistrationByNumber(
			String Number) throws Exception {
		
		return gateDao.queryTEstablishmentRegistrationByNumber(Number);
	}


	@Override
	public void addOrUpdateTBindingSucceed(TBindingSucceed bindingSucceed)
			throws Exception {
		gateDao.addOrUpdateTBindingSucceed(bindingSucceed);
		
	}


	@Override
	public void addOrUpdateTBinding(TBinding binding) throws Exception {
		gateDao.addOrUpdateTBinding(binding);
		
	}


	@Override
	public List<TEstablishmentRegistration> queryTEstablishmentRegistrationByName(
			String name) throws Exception {
		return gateDao.queryTEstablishmentRegistrationByName(name);
	}


	@Override
	public void addOrUpdateTDrawMoney(TDrawMoney drawMoney) throws Exception {
		gateDao.addOrUpdateTDrawMoney(drawMoney);
		
	}


	@Override
	public void addOrUpdateTDrawMoneySucceed(TDrawMoneySucceed drawMoneySucceed)
			throws Exception {
		gateDao.addOrUpdateTDrawMoneySucceed(drawMoneySucceed);
		
	}


	@Override
	public void addOrUpdateTLoansucceed(TLoansucceed loansucceed)
			throws Exception {
		gateDao.addOrUpdateTLoansucceed(loansucceed);
		
	}


	@Override
	public void addOrUpdateTRecharge(TRecharge recharge) throws Exception {
		gateDao.addOrUpdateTRecharge(recharge);
		
	}


	@Override
	public void addOrUpdateTRechargeSucceed(TRechargeSucceed rechargeSucceed)
			throws Exception {
		gateDao.addOrUpdateTRechargeSucceed(rechargeSucceed);
		
	}
	
	


	@Override
	public List<TTransferInfo> queryTTransferInfoByEnterpriseNumber(
			TTransferInfo transferInfo) throws Exception {
		return gateDao.queryTTransferInfoByEnterpriseNumber(transferInfo);
		 
	}


	@Override
	public List<TTransferInfo> queryTTransferInfoByName(String name)
			throws Exception {
		return 	gateDao.queryTTransferInfoByName(name);
		
	}


	@Override
	public List<TInvestmentInfo> queryTInvestmentInfoByName(String name)
			throws Exception {
		return gateDao.queryTInvestmentInfoByName(name);
		 
	}
	
	public List<TDrawMoney> queryTDrawMoneyByRequestNo(String requestno)
			throws Exception{
		return gateDao.queryTDrawMoneyByRequestNo(requestno);
	}


	@Override
	public void addOrUpdateTRegisterNotify(TRegisterNotify registerNotify)
			throws Exception {
		  gateDao.addOrUpdateTRegisterNotify(registerNotify);
		
	}


	@Override
	public List<TRegisterNotify> queryTRegisterNotifyByName(String name)
			throws Exception {
		return  gateDao.queryTRegisterNotifyByName(name);
		
	}


	@Override
	public void addOrUpdateTRechargeNotify(TRechargeNotify rechargeNotify)
			throws Exception {
		  gateDao.addOrUpdateTRechargeNotify(rechargeNotify);
		
	}


	@Override
	public void addOrUpdateTBindingNotify(TBindingNotify bindingNotify)
			throws Exception {
		gateDao.addOrUpdateTBindingNotify(bindingNotify);
		
	}


	@Override
	public void addOrUpdateTTransferNotify(TTransferNotify transferNotify)
			throws Exception {
		gateDao.addOrUpdateTTransferNotify(transferNotify);
		
	}


	@Override
	public void addOrUpdateTDrawMoneyNotify(TDrawMoneyNotify drawMoneyNotify)
			throws Exception {
		gateDao.addOrUpdateTDrawMoneyNotify(drawMoneyNotify);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
	
}