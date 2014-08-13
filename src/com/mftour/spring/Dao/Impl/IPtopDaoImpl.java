package com.mftour.spring.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.IptopDao;
import com.mftour.spring.model.TAdministrator;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TProduct;


@Repository("ptopDao")
public class IPtopDaoImpl  extends HibernateDaoSupport  implements IptopDao {

	@Override
	public void addOrUpdate(TProduct tproduct) throws Exception {
		getHibernateTemplate().saveOrUpdate(tproduct);
		
		
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List getAdministratorByAccount(String account) throws Exception {
		String hql = "from TAdministrator administrator where administrator.name = :name";
		Query query = getSession().createQuery(hql);
		query.setParameter("name", account);
		return query.list();
	}

	@Override
	public void addOrUpdateInvestmentInfo(TInvestmentInfo investmentInfo)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(investmentInfo);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TInvestmentInfo> queryInvestmentInfoByNumber(String Number) {
		String hql = "from TInvestmentInfo investmentInfo where investmentInfo.enterpriseNumber = :name  and  investmentInfo.state = :state";
		Query query = getSession().createQuery(hql);
		query.setParameter("name", Number);
		query.setParameter("state", "0");
		return query.list();
	}

	@Override
	public void deleteTInvestmentInfo(Long id) throws Exception {
		TInvestmentInfo investmentInfo = getHibernateTemplate().get(TInvestmentInfo.class, id);
		investmentInfo.setState("1");
		getHibernateTemplate().saveOrUpdate(investmentInfo);
	}
	
	
	

	
	
	
	
	
	
	

}
