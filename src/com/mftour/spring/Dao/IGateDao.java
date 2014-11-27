package com.mftour.spring.Dao;

import java.util.List;

import com.mftour.spring.model.TDrawMoney;
import com.mftour.spring.model.TEstablishmentNotify;
import com.mftour.spring.model.TEstablishmentRegistration;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TTransferSucceed;
import com.mftour.spring.model.TYeePay;
import com.mftour.spring.util.Page;

public interface IGateDao {

	public void addOrUpdate(TYeePay YeePay) throws Exception;

	public void addOrUpdateRegisterYeePay(TRegisterYeePay registerYeePay)
			throws Exception;

	public List<TRegisterYeePay> queryTRegisterYeePayByName(String name)
			throws Exception;

	public List<TRegisterYeePay> queryTRegisterYeePayByNumber(String Number)
			throws Exception;

	public void addOrUpdateTTransferSucceed(TTransferSucceed transferSucceed)
			throws Exception;

	public void addOrUpdateTTransferInfo(TTransferInfo TTransferInfo)
			throws Exception;

	public List<TTransferInfo> queryTTransferInfoByNumber(String Number)
			throws Exception;
	public List<TTransferInfo> queryAllTransRecord(Page page,String platformUserNo)throws Exception;
	public List<TDrawMoney> DrawMonetAllTransRecord(Page page,String platformUserNo)throws Exception;
	public void addOrUpdateTEstablishmentRegistration(
			TEstablishmentRegistration establishmentRegistration)
			throws Exception;

	public void addOrUpdateTEstablishmentNotify(
			TEstablishmentNotify establishmentNotify) throws Exception;

	public List<TEstablishmentRegistration> queryTEstablishmentRegistrationByNumber(
			String Number) throws Exception;

}
