package com.mftour.spring.Dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.IProductDao;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.util.Page;


@Repository("product")
public class IProductDaoImpl  extends HibernateDaoSupport  implements  IProductDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<TProduct> getProduct(Page page) throws Exception {
		
		
		
		String countQuery = "select count(*) from TProduct TProduct";
		Map<String, Object> result = new HashMap<String, Object>(2);
		/*String countQuery = "select count(*) from THotel thotel";
		String fullQuery = "select new map(thotel as thotel, thotel.id as uid) from THotel thotel";*/
		
		String hql = "from TProduct ";
		// 这里需要用new map()，jquery easyui datagrid有一个小bug，必须把idField单独列出来，要不然不能多选
		/*String orderString = "";
		if (StringUtils.isNotBlank(dgm.getSort())) {
			orderString = " order by " + dgm.getSort() + " " + dgm.getOrder(); // 排序
		}*/
		// 增加条件
		/*StringBuffer sb = new StringBuffer();
		Map<String, Object> params = new HashMap<String, Object>();*/
		/*if (thotel != null) {

			if (StringUtils.isNotBlank(thotel.getName())) {

				// sb.append(" and user.name like :userName");
				// params.put("userName", "%"+user.getName()+"%");
				if (params.size() > 0) {
					sb.append(" and");
				} else {
					sb.append(" where");
				}
				sb.append(" thotel.name like :name");
				params.put("name", "%" + thotel.getName() + "%");
			}
			if (StringUtils.isNotBlank(thotel.getBdName())) {
				// sb.append(" and user.name like :userName");
				// params.put("userName", "%"+user.getName()+"%");
				if (params.size() > 0) {
					sb.append(" and");
				} else {
					sb.append(" where");
				}
				sb.append(" thotel.bdName = :bdName");
				params.put("bdName", thotel.getBdName());

			}
			if (StringUtils.isNotBlank(thotel.getAddress())) {
				// sb.append(" and user.name like :userName");
				// params.put("userName", "%"+user.getName()+"%");
				if (params.size() > 0) {
					sb.append(" and");
				} else {
					sb.append(" where");
				}
				sb.append(" thotel.address like :address");
				params.put("address", "%" + thotel.getAddress() + "%");
			}

			if (thotel.getRoomCount() != null && thotel.getRoomCount() > 0) {
				// sb.append(" and user.name like :userName");
				// params.put("userName", "%"+user.getName()+"%");
				if (params.size() > 0) {
					sb.append(" and");
				} else {
					sb.append(" where");
				}
				sb.append(" thotel.roomCount = :roomCount");
				params.put("roomCount", thotel.getRoomCount());
			}

		}*/

		// 查询总数可以用getHibernateTemplate()，我下面用的是createQuery
		// Hibernate的动态条件查询用DetachedCriteria是一个比较好的解决
		// List totalList = getHibernateTemplate().findByNamedParam(countQuery,
		// params.keySet().toArray(new String[0]), params.values().toArray());
		// int total = ((Long)totalList.iterator().next()).intValue();

		/*Query queryTotal = getSession().createQuery(countQuery + sb.toString());*/
		Query queryTotal = getSession().createQuery(countQuery);
		Query queryList = getSession()
				/*.createQuery(fullQuery + sb.toString() + orderString)*/
				.createQuery(hql)
				.setFirstResult((page.getPageNo() - 1) * page.getPageSize())
				
				.setMaxResults(page.getPageSize());
		/*if (params != null && !params.isEmpty()) {
			Iterator<String> it = params.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				queryTotal.setParameter(key, params.get(key));
				queryList.setParameter(key, params.get(key));
			}
		}
		int total = ((Long) queryTotal.uniqueResult()).intValue();*/ // 这里必须先转成Long再取intValue，不能转成Integer
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
	public TProduct getProductById(Long id) {
		
		return getHibernateTemplate().get(TProduct.class, id);
	}

	
	
	
	
}
