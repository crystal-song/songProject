package com.mftour.spring.Dao.Impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.ISystemLogDao;
import com.mftour.spring.model.TSystemLog;

@Repository("systemLogDao")
public class ISystemLogDaoImpl  extends HibernateDaoSupport  implements ISystemLogDao {

	@Override
	public void saveSystemLog(TSystemLog systemLog) {
		
		 try {
			 	getHibernateTemplate().saveOrUpdate(systemLog);

	        } catch (Exception e) {
	            e.printStackTrace();
	         
	        }
		
	}
	
	
	

}
