package com.mftour.spring.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.IptopDao;
import com.mftour.spring.model.Communal;
import com.mftour.spring.model.TAdministrator;
import com.mftour.spring.model.TChannel;
import com.mftour.spring.model.TInterestRate;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.util.Page;

@Repository("ptopDao")
public class IPtopDaoImpl extends HibernateDaoSupport implements IptopDao {

	@Override
	public void addOrUpdate(TProduct tproduct) throws Exception {
		getHibernateTemplate().saveOrUpdate(tproduct);

	}
	@Override
	public void addOrUpdate(Communal communal) throws Exception {
		getHibernateTemplate().saveOrUpdate(communal);
		
	}
	public List<TProduct> queryHotproject(){
		String hql="from TProduct product where product.enterpriseNumber in(select communal.valuess from Communal communal where keyss='hotProject')";
		Query query=getSession().createQuery(hql);
		return query.list();
	}
	public List<Communal> queryHotprojectFromCommunal() throws Exception{
		String hql="from Communal communal where keyss='hotProject')";
		Query query=getSession().createQuery(hql);
		return query.list();
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
	@SuppressWarnings("unchecked")
	public List<TInvestmentInfo> queryInvestmentInfoByNumber(Page page,String Number) {
		String hql = "from TInvestmentInfo investmentInfo where investmentInfo.enterpriseNumber = :name  and  investmentInfo.state = :state and investmentInfo.code=1";
		Query query = getSession().createQuery(hql);
		query.setParameter("name", Number);
		query.setParameter("state", "0");
		page.setTotalRecord(query.list().size());
		query.setFirstResult((page.getPageNo() - 1) * page.getPageSize());
		query.setMaxResults(page.getPageSize());
		return query.list();
	}
	@SuppressWarnings("unchecked")
	public List<TTransferInfo> queryTransferInfoByNumber(Page page,String Number) {
		String hql = "from TTransferInfo transferInfo where transferInfo.enterpriseNumber = :name  and transferInfo.paymentAmount>=200 and transferInfo.code=1";
		Query query = getSession().createQuery(hql);
		query.setParameter("name", Number);
		page.setTotalRecord(query.list().size());
		query.setFirstResult((page.getPageNo() - 1) * page.getPageSize());
		query.setMaxResults(page.getPageSize());
		return query.list();
	}

	@Override
	public void deleteTInvestmentInfo(Long id) throws Exception {
		TInvestmentInfo investmentInfo = getHibernateTemplate().get(
				TInvestmentInfo.class, id);
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
		String hql = "from TNews news order by time desc";
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
		String hql = "from TNews news where news.channel = :channel  order by news.time desc";
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
		TNews news = getHibernateTemplate().get(TNews.class, id);
		getHibernateTemplate().delete(news);

	}

	@Override
	public void deleteTChannel(Long id) throws Exception {
		TChannel channel = getHibernateTemplate().get(TChannel.class, id);
		getHibernateTemplate().delete(channel);

	}

	@Override
	public List<TNews> getNewsbyRecommend() throws Exception {
		/*
		 * String hql =
		 * "from TNews news where news.state = :state order by news.time desc";
		 * Query query = getSession().createQuery(hql);
		 * query.setParameter("state", "1");
		 */

		String hql = "from TNews news where news.state = :state order by news.time desc";
		Query query = getSession().createQuery(hql);
		query.setParameter("state", "0");

		return query.list();
	}


	@Override
	public List<TNews> getNewsbyTime() throws Exception {
		String hql = "from TNews news where news.state = :state and news.channel = :channel  order by news.time desc";
		Query query = getSession().createQuery(hql);
		query.setParameter("state", "1");
		query.setParameter("channel", "新闻报道");
		query.setMaxResults(6);
		return query.list();
	}

	@Override
	public List<TNews> getWebsiteNoticeByChannel() throws Exception {
		String hql = "from TNews news where news.state = :state and news.channel = :channel  order by news.time desc";
		Query query = getSession().createQuery(hql);
		query.setParameter("state", "1");
		query.setParameter("channel", "网站公告");
		query.setMaxResults(6);
		return query.list();
	}

	@Override
	public List<TNews> getRepaymentNoticeByChannel() throws Exception {
		String hql = "from TNews news where news.state = :state and news.channel = :channel  order by news.time desc";
		Query query = getSession().createQuery(hql);
		query.setParameter("state", "1");
		query.setParameter("channel", "还款公告");
		query.setMaxResults(6);
		return query.list();
	}

	@Override
	public TInvestmentInfo queryTInvestmentInfo(Long id) throws Exception {
		return getHibernateTemplate().get(TInvestmentInfo.class, id);

	}

	@Override
	public Double querySum(String number) throws Exception {

		String hql = "select sum(investmentAmount)  from  TInvestmentInfo  where enterpriseNumber = :number  and  state = :state and code=1";
		Query query = getSession().createQuery(hql);
		query.setParameter("number", number);
		query.setParameter("state", "0");
		Double d = (Double) query.list().get(0);
	
		return d;
	}

	@Override
	public void addOrUpdateTInterestRate(TInterestRate InterestRate)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(InterestRate);

	}

	@Override
	public List<TInterestRate> queryTInterestRateByNumber(String Number) {
		String hql = "from TInterestRate interestRate where interestRate.enterpriseNumber = :enterpriseNumber";
		Query query = getSession().createQuery(hql);
		query.setParameter("enterpriseNumber", Number);

		return query.list();
	}
	public TRegisterYeePay queryYeePayByplatUserNo(String targetPlatformUserNo) {
		String hql = "from TRegisterYeePay registeryeepay where registeryeepay.platformUserNo=:targetPlatformUserNo and registeryeepay.code=1";
		Query query = getSession().createQuery(hql);
		query.setParameter("targetPlatformUserNo", targetPlatformUserNo);
		return (TRegisterYeePay)query.uniqueResult();
	}
}
