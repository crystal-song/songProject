package com.mftour.spring.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.IptopDao;
import com.mftour.spring.model.TAdministrator;
import com.mftour.spring.model.TChannel;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TNews;
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

	@Override
	public void addOrUpdateTNews(TNews news) throws Exception {
		getHibernateTemplate().saveOrUpdate(news);
		
	}

	@Override
	public void addOrUpdateTChannel(TChannel channel) throws Exception {
		getHibernateTemplate().saveOrUpdate(channel);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TChannel> getChannel() throws Exception {
		String hql = "from TChannel channel";
		Query query = getSession().createQuery(hql);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TNews> getNews() throws Exception {
		String hql = "from TNews news";
		Query query = getSession().createQuery(hql);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TChannel> getChannelById(Long id) {
		
		String hql = "from TChannel channel where channel.id = :id";
		Query query = getSession().createQuery(hql);
		query.setParameter("id", id);
	
		return query.list();
	
	
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TNews> getNewsByName(String name) {
		String hql = "from TNews news where news.channel = :channel";
		Query query = getSession().createQuery(hql);
		query.setParameter("channel", name);
	
		return query.list();
	}

	@Override
	public TNews getTNewsById(Long id) {
		
		return getHibernateTemplate().get(TNews.class, id);
	}

	@Override
	public void deleteNews(Long id) throws Exception {
		TNews news =  getHibernateTemplate().get(TNews.class, id);
		getHibernateTemplate().delete(news);
		
	}

	@Override
	public void deleteTChannel(Long id) throws Exception {
		TChannel channel =  getHibernateTemplate().get(TChannel.class, id);
		getHibernateTemplate().delete(channel);
		
	}

	@Override
	public List<TNews> getNewsbyRecommend() throws Exception {
		/*String hql = "from TNews news where news.state = :state order by news.time desc";
		Query query = getSession().createQuery(hql);
		query.setParameter("state", "1");*/
		
		
		String hql = "from TNews news where news.state = :state order by news.time desc";
		Query query = getSession().createQuery(hql);
		query.setParameter("state", "0");
	
		return query.list();
	}
	
	
	
    
	
	
	

	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	

}
