package com.mftour.spring.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.IGateDao;
import com.mftour.spring.model.TRegisterYeePay;
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
	
	
	
	
	

	
		
		
	}


