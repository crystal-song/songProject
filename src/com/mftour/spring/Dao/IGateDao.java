	package com.mftour.spring.Dao;

import java.util.List;

import com.mftour.spring.model.TBinding;
import com.mftour.spring.model.TBindingSucceed;
import com.mftour.spring.model.TDrawMoney;
import com.mftour.spring.model.TDrawMoneySucceed;
import com.mftour.spring.model.TEstablishmentNotify;
import com.mftour.spring.model.TEstablishmentRegistration;
import com.mftour.spring.model.TLoansucceed;
import com.mftour.spring.model.TRecharge;
import com.mftour.spring.model.TRechargeSucceed;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TTransferSucceed;
import com.mftour.spring.model.TYeePay;

public interface IGateDao {
	
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
	 
		public List<TTransferInfo> queryAllTransRecord(String platformUserNo)
				throws Exception;
		public List<TDrawMoney> DrawMonetAllTransRecord(String platformUserNo)
				throws Exception;
		public List<TRecharge> RechargeAllTransRecord(String platformUserNo)
				throws Exception;
		public List AllTransRecord(int pageNo, String platformUserNo)
				throws Exception;
	 
	