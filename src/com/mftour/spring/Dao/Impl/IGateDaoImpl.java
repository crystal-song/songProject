package com.mftour.spring.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.IGateDao;
import com.mftour.spring.model.TEstablishmentNotify;
import com.mftour.spring.model.TEstablishmentRegistration;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TTransferSucceed;
import com.mftour.spring.model.TYeePay;

@Repository("gateDao")
public class IGateDaoImpl  extends HibernateDaoSupport  implements  IGateDao {

	@Override
	public void addOrUpdate(TYeePay YeePay) throws Exception {
		
		getHibernateTemplate().saveOrUpdate(YeePay);
	}

	@Override
	public void addOrUpdateRegisterYeePay(TRegisterYeePay registerYeePay)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(registerYeePay);
		
	}

	@Override
	public List<TRegisterYeePay> queryTRegisterYeePayByName(String name)
			throws Exception {
		String hq = "from TRegisterYeePay registerYeePay where registerYeePay.platformUserNo = :platformUserNo";
		Query query = getSession().createQuery(hq);
		query.setParameter("platformUserNo", name);
		return query.list();
	}

	@Override
	public List<TRegisterYeePay> queryTRegisterYeePayByNumber(String Number)
			throws Exception {
		String hq = "from TRegisterYeePay registerYeePay where registerYeePay.requestNo = :requestNo";
		Query query = getSession().createQuery(hq);
		query.setParameter("requestNo", Number);
		return query.list();
	}

	@Override
	public void addOrUpdateTTransferSucceed(TTransferSucceed transferSucceed)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(transferSucceed);
		
	}

	@Override
	public void addOrUpdateTTransferInfo(TTransferInfo TTransferInfo)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(TTransferInfo);
		
	}

	@Override
	public List<TTransferInfo> queryTTransferInfoByNumber(String Number)
			throws Exception {
		String hq = "from TTransferInfo transferInfo where transferInfo.requestNo = :requestNo";
		Query query = getSession().createQuery(hq);
		query.setParameter("requestNo", Number);
		return query.list();
	}

	@Override
	public void addOrUpdateTEstablishmentRegistration(
			TEstablishmentRegistration establishmentRegistration)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(establishmentRegistration);
		
	}

	@Override
	public void addOrUpdateTEstablishmentNotify(
			TEstablishmentNotify establishmentNotify) throws Exception {
		getHibernateTemplate().saveOrUpdate(establishmentNotify);
		
	}

	@Override
	public List<TEstablishmentRegistration> queryTEstablishmentRegistrationByNumber(
			String Number) throws Exception {
		String hq = "from TEstablishmentRegistration establishmentRegistration where establishmentRegistration.requestNo = :requestNo";
		Query query = getSession().createQuery(hq);
		query.setParameter("requestNo", Number);
		return query.list();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
		
		
	}


