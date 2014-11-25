package com.mftour.spring.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.IGuaranteeDao;
import com.mftour.spring.model.TChannel;

@Repository("guaranteeDao")
public class IGuaranteeDaoImpl extends HibernateDaoSupport implements
		IGuaranteeDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<TChannel> getTChannel() throws Exception {
		String hql = "from TChannel channel";
		Query query = getSession().createQuery(hql);
		return query.list();
	}

}
