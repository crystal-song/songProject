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
	public List<TTransNotice> queryTransNoticeByNameAndtype(String username,String type)
			throws Exception{
		String hql="from TTransNotice transnotice where transnotice.userName=:userName and transnotice.type=:type";
		Query query = getSession().createQuery(hql);
		query.setParameter("userName", username);
		query.setParameter("type", type);
		return query.list();
	}
	public List<TTransNotice> queryTransNoticeByNameAndtypes(String username,String type,String noticeType)
			throws Exception{
		String hql="from TTransNotice transnotice where transnotice.userName=:userName and transnotice.type=:type and transnotice.noticeType=:noticeType";
		Query query = getSession().createQuery(hql);
		query.setParameter("userName", username);
		query.setParameter("type", type);
		query.setParameter("noticeType", noticeType);
		return query.list();
	}
	public void delTransNoticeByName(String username){
		String hql="delete from TTransNotice transnotice where transnotice.userName=:userName";
		Query query = getSession().createQuery(hql);
		query.setParameter("userName", username);
		query.executeUpdate();
	}
}
