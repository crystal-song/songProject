	package com.mftour.spring.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.ITransRecordDao;
import com.mftour.spring.model.TTransRecord;



@Repository("transRecordDao")
public class ITransRecordDaoImpl  extends HibernateDaoSupport  implements  ITransRecordDao {

	@Override
	public void addOrUpdate(TTransRecord transrecord) throws Exception {
		
		getHibernateTemplate().saveOrUpdate(transrecord);
	}


	
}
	