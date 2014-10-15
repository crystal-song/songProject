package com.mftour.spring.Dao.Impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.ICollectMoneyDao;
import com.mftour.spring.model.TCrowdfunding;


@Repository("collectMoneyDao")
public class ICollectMoneyDaoImpl  extends HibernateDaoSupport  implements ICollectMoneyDao {

	@Override
	public void addOrUpdate(TCrowdfunding crowdfunding) throws Exception {
		getHibernateTemplate().saveOrUpdate(crowdfunding);
		
	}
	
	
	

}
