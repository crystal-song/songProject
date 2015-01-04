
package com.mftour.spring.service;

import java.util.List;

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
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TRecharge;
import com.mftour.spring.model.TRechargeNotify;
import com.mftour.spring.model.TRechargeSucceed;
import com.mftour.spring.model.TRegisterNotify;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TTransferNotify;
import com.mftour.spring.model.TTransferSucceed;
import com.mftour.spring.model.TYeePay;
import com.mftour.spring.util.Page;

public interface IGateService {
	
	public void addOrUpdate(TYeePay YeePay) throws Exception;

	public void addOrUpdateRegisterYeePay(TRegisterYeePay registerYeePay) throws Exception;
	
	 public List<TRegisterYeePay> queryTRegisterYeePayByName(String name)throws Exception;
	 
	 public List<TRegisterYeePay> queryTRegisterYeePayByNumber(String Number)throws Exception;
	 
	 public void addOrUpdateTTransferSucceed(TTransferSucceed  transferSucceed ) throws Exception;
	 
	 public void addOrUpdateTTransferInfo(TTransferInfo  TTransferInfo) throws Exception;
	 
	 public List<TTransferInfo> queryTTransferInfoByNumber(String Number)throws Exception;
	 
	 public void addOrUpdateTEstablishmentRegistration(TEstablishmentRegistration establishmentRegistration) throws Exception;
	 
	 public void addOrUpdateTEstablishmentNotify(TEstablishmentNotify  establishmentNotify) throws Exception;
	 
	 public List<TEstablishmentRegistration> queryTEstablishmentRegistrationByNumber(String Number)throws Exception;
	 
	 public void addOrUpdateTBindingSucceed(TBindingSucceed bindingSucceed) throws Exception;
	 
	 public void addOrUpdateTBinding(TBinding binding) throws Exception;
	 
	 public List<TEstablishmentRegistration> queryTEstablishmentRegistrationByName(String name)throws Exception;
	 
	 public void addOrUpdateTDrawMoney(TDrawMoney drawMoney) throws Exception;
	 
	 public void addOrUpdateTDrawMoneySucceed(TDrawMoneySucceed drawMoneySucceed) throws Exception;
	 
	 public void addOrUpdateTLoansucceed(TLoansucceed loansucceed) throws Exception;
	 
	 public void addOrUpdateTRecharge(TRecharge recharge) throws Exception;
	 
	 public void addOrUpdateTRechargeSucceed(TRechargeSucceed rechargeSucceed) throws Exception;
	 
	 public List<TTransferInfo> queryTTransferInfoByName(String name)throws Exception;
	 
	 public List<TInvestmentInfo> queryTInvestmentInfoByName(String name)throws Exception;
	 
	 public List<TTransferInfo> queryTTransferInfoByEnterpriseNumber(TTransferInfo transferInfo)throws Exception;
	 
	 public void addOrUpdateTRegisterNotify(TRegisterNotify registerNotify) throws Exception;
	 
	 public List<TRegisterNotify> queryTRegisterNotifyByName(String name)throws Exception;
	 
	 public void addOrUpdateTRechargeNotify(TRechargeNotify rechargeNotify) throws Exception;
	 
	 public void addOrUpdateTBindingNotify(TBindingNotify bindingNotify) throws Exception;
	 
	 public void addOrUpdateTTransferNotify(TTransferNotify transferNotify) throws Exception;
	 
	 public void addOrUpdateTDrawMoneyNotify(TDrawMoneyNotify drawMoneyNotify) throws Exception;
	 
	 
	 
	 
	 public List queryAllTransRecord(Page page,String sql,Object[] para)
				throws Exception;
}