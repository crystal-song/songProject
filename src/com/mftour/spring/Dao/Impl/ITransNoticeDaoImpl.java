package com.mftour.spring.Dao.Impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.ICrowdfundingDao;
import com.mftour.spring.Dao.ITransNoticeDao;
import com.mftour.spring.model.TCrowdfunding;
import com.mftour.spring.model.TCrowdfundingCommodity;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransNotice;
import com.mftour.spring.model.TYeePay;
import com.mftour.spring.util.Page;

@Repository("transNoticeDao")
public class ITransNoticeDaoImpl extends HibernateDaoSupport implements
		ITransNoticeDao {

	@Override
	public void addOrUpdate(TTransNotice transnotice) throws Exception {
		
		getHibernateTemplate().saveOrUpdate(transnotice);
	}
	@Override
	public List<TTransNotice> queryTransNoticeByName(String username)
			throws Exception {
		String hq = "from TTransNotice transnotice where transnotice.userName=:userName";
		Query query = getSession().createQuery(hq);
		query.setParameter("userName", username);
		return query.list();
	}
}
