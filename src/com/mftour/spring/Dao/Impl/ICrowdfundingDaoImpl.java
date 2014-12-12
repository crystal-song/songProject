package com.mftour.spring.Dao.Impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.ICrowdfundingDao;
import com.mftour.spring.model.TCrowdfunding;
import com.mftour.spring.model.TCrowdfundingCommodity;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.util.Page;

@Repository("crowdfundingDao")
public class ICrowdfundingDaoImpl extends HibernateDaoSupport implements
		ICrowdfundingDao {

	@Override
	public List<TCrowdfunding> getCrowdfunding(Page page,
			TCrowdfunding crowdfunding) throws Exception {

		String countQuery = "select count(*) from TCrowdfunding crowdfunding";
		Map<String, Object> result = new HashMap<String, Object>(2);

		String hql = "from TCrowdfunding crowdfunding";
	
		StringBuffer sb = new StringBuffer();
		Map<String, Object> params = new HashMap<String, Object>();
	
		Query queryTotal = getSession().createQuery(countQuery + sb.toString());
		Query queryList = getSession()
		/* .createQuery(fullQuery + sb.toString() + orderString) */
		.createQuery(hql + sb.toString())
				.setFirstResult((page.getPageNo() - 1) * page.getPageSize())

				.setMaxResults(page.getPageSize());
		if (params != null && !params.isEmpty()) {
			Iterator<String> it = params.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				queryTotal.setParameter(key, params.get(key));
				queryList.setParameter(key, params.get(key));
			}
		}
		/* int total = ((Long) queryTotal.uniqueResult()).intValue(); */// ���������������������Long������intValue���������������Integer
		int total = ((Long) queryTotal.uniqueResult()).intValue();
		page.setTotalRecord(total);

		List list = queryList.list();
		result.put("total", total);
		result.put("rows", list);

		return list;

	

	}

	@Override
	public TCrowdfunding getCrowdfundingById(Long id) {
		return getHibernateTemplate().get(TCrowdfunding.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TCrowdfundingCommodity> queryTCrowdfundingCommodityByNumber(
			String projectNumber) throws Exception {
		String hq = "from TCrowdfundingCommodity crowdfundingCommodity where crowdfundingCommodity.projectNumber = :projectNumber";
		Query query = getSession().createQuery(hq);
		query.setParameter("projectNumber", projectNumber);
		return query.list();
	}

}
