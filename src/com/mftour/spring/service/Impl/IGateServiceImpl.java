package com.mftour.spring.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.ICrowdfundingDao;
import com.mftour.spring.Dao.IGateDao;
import com.mftour.spring.model.TEstablishmentNotify;
import com.mftour.spring.model.TEstablishmentRegistration;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TTransferSucceed;
import com.mftour.spring.model.TYeePay;
import com.mftour.spring.service.IGateService;
import com.mftour.spring.util.Page;

@Service("gateService")
public class IGateServiceImpl implements IGateService {

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
	public List<TTransferInfo> queryAllTransRecord(Page page,String platformUserNo)
			throws Exception {
		return gateDao.queryAllTransRecord(page,platformUserNo);
		
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

}
