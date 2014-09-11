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
public class ICrowdfundingDaoImpl  extends HibernateDaoSupport  implements  ICrowdfundingDao {

	@Override
	public List<TCrowdfunding> getCrowdfunding(Page page,
			TCrowdfunding crowdfunding) throws Exception {
		
		
		
		String countQuery = "select count(*) from TCrowdfunding crowdfunding";
		Map<String, Object> result = new HashMap<String, Object>(2);
		/*String countQuery = "select count(*) from THotel thotel";
		String fullQuery = "select new map(thotel as thotel, thotel.id as uid) from THotel thotel";*/
		
	 	String hql = "from TCrowdfunding crowdfunding";
		/*String hql = "select new map(product as product) from TProduct product";*/
		// 这里需要用new map()，jquery easyui datagrid有一个小bug，必须把idField单独列出来，要不然不能多选
		/*String orderString = "";
		if (StringUtils.isNotBlank(dgm.getSort())) {
			orderString = " order by " + dgm.getSort() + " " + dgm.getOrder(); // 排序
		}*/
		// 增加条件
		StringBuffer sb = new StringBuffer();
		Map<String, Object> params = new HashMap<String, Object>();
		/*if (product != null) {
			
			
			if(product.getYearIncome() !=null && product.getYearIncome()!=1){
             int YearIncome1=10;
             int YearIncome2=15;
             int YearIncome3=20;
          
           
				
				// sb.append(" and user.name like :userName");
				// params.put("userName", "%"+user.getName()+"%");
				if (params.size() > 0) {
					sb.append(" and");
				} else {
					sb.append(" where");
				}
				
				if(product.getYearIncome()==10){
					
				sb.append(" product.yearIncome < :YearIncome1");
				params.put("YearIncome1", YearIncome1);
				}
                if(product.getYearIncome()==15){
				
				sb.append(" product.yearIncome >= :YearIncome1 and product.yearIncome < :YearIncome2 ");
				params.put("YearIncome1", YearIncome1);
				params.put("YearIncome2", YearIncome2);
				}
                if(product.getYearIncome()==20){
    				
    		     sb.append(" product.yearIncome >= :YearIncome2 and product.yearIncome < :YearIncome3 ");
    			params.put("YearIncome2", YearIncome2);
    		    params.put("YearIncome3", YearIncome3);
    				}
				
			}
			
			
              

		}
*/
		// 查询总数可以用getHibernateTemplate()，我下面用的是createQuery
		// Hibernate的动态条件查询用DetachedCriteria是一个比较好的解决
		// List totalList = getHibernateTemplate().findByNamedParam(countQuery,
		// params.keySet().toArray(new String[0]), params.values().toArray());
		// int total = ((Long)totalList.iterator().next()).intValue();

		/*Query queryTotal = getSession().createQuery(countQuery + sb.toString());*/
		Query queryTotal = getSession().createQuery(countQuery + sb.toString());
		Query queryList = getSession()
				/*.createQuery(fullQuery + sb.toString() + orderString)*/
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
		/*int total = ((Long) queryTotal.uniqueResult()).intValue();*/ // 这里必须先转成Long再取intValue，不能转成Integer
		int total = ((Long) queryTotal.uniqueResult()).intValue();
		page.setTotalRecord(total);
		
		List list = queryList.list();
		result.put("total", total);
		result.put("rows", list);

		return list;
		
		
		
		
		
		// TODO Auto-generated method stub
		/*String hql = "from TProduct ";
		
		if(page!=null){
			
		}
		Query query = getSession().createQuery(hql);
		
		List li= query.list();
		System.out.print("dddddddddddddddd");
		 return li;*/
		
	
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
