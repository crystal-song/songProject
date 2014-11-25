package com.mftour.spring.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.IUserDao;
import com.mftour.spring.model.TUser;

@Repository("userDao")
public class IUserDaoImpl extends HibernateDaoSupport implements IUserDao {

	@SuppressWarnings("rawtypes")
	@Override
	public List getUserByAccount(String account) throws Exception {
		String hql = "from TUser user where user.name = :name";
		Query query = getSession().createQuery(hql);
		query.setParameter("name", account);
		return query.list();

	}

	@Override
	public List getUserByEmail(String email) throws Exception {
		String hql = "from TUser user where user.email = :email";
		Query query = getSession().createQuery(hql);
		query.setParameter("email", email);
		return query.list();

	}

	@Override
	public void addOrUpdate(TUser user) throws Exception {
		getHibernateTemplate().saveOrUpdate(user);

	}

	@Override
	public List<TUser> getName(String name) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public int finaAllRecord(String mobilephone) {
		String hql = "select user.messageCount from TUser user where user.phone=:mobilephone";
		Query query = getSession().createQuery(hql);
		query.setParameter("mobilephone", mobilephone);
		Number num = (Number) query.uniqueResult();
		return num.intValue();
	}

}
