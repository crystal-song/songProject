package com.mftour.spring.Dao.Impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.IProductDao;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.util.Page;

import org.apache.commons.lang.StringUtils;

@Repository("product")
public class IProductDaoImpl extends HibernateDaoSupport implements IProductDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<TProduct> getProduct(Page page, TProduct product)
			throws Exception {
		Double YearIncome1 = 10.0;
		Double YearIncome2 = 15.0;
		Double YearIncome3 = 20.0;

		int FinancingPeriod1 = 3;
		int FinancingPeriod2 = 6;
		int FinancingPeriod3 = 12;

		int FinancingMoney1 = 200;
		int FinancingMoney2 = 500;
		int FinancingMoney3 = 1000;

		Double FinancingProgress1 = 50.0;
		Double FinancingProgress2 = 80.0;

		int projectStatus1 = 1;
		int projectStatus2 = 2;
		int projectStatus3 = 3;
		int projectStatus4 = 4;

		String countQuery = "select count(*) from TProduct product";
		Map<String, Object> result = new HashMap<String, Object>(2);
		/*
		 * String countQuery = "select count(*) from THotel thotel"; String
		 * fullQuery =
		 * "select new map(thotel as thotel, thotel.id as uid) from THotel thotel"
		 * ;
		 */

		String hql = "from TProduct product";
		/*
		 * String hql =
		 * "select new map(product as product) from TProduct product";
		 */
		// 这里需要用new map()，jquery easyui datagrid有一个小bug，必须把idField单独列出来，要不然不能多选
		/*
		 * String orderString = ""; if (StringUtils.isNotBlank(dgm.getSort())) {
		 * orderString = " order by " + dgm.getSort() + " " + dgm.getOrder(); //
		 * 排序 }
		 */
		// 增加条件
		StringBuffer sb = new StringBuffer();
		Map<String, Object> params = new HashMap<String, Object>();
		if (product != null) {

			if (product.getYearIncome() != null && product.getYearIncome() != 1) {
				/*
				 * int YearIncome1=10; int YearIncome2=15; int YearIncome3=20;
				 */

				// sb.append(" and user.name like :userName");
				// params.put("userName", "%"+user.getName()+"%");
				if (params.size() > 0) {
					sb.append(" and");
				} else {
					sb.append(" where");
				}

				if (product.getYearIncome() == 10) {

					sb.append(" product.yearIncome < :YearIncome1");
					params.put("YearIncome1", YearIncome1);
				}
				if (product.getYearIncome() == 15) {

					sb.append(" product.yearIncome >= :YearIncome1 and product.yearIncome < :YearIncome2 ");
					params.put("YearIncome1", YearIncome1);
					params.put("YearIncome2", YearIncome2);
				}
				if (product.getYearIncome() == 20) {

					sb.append(" product.yearIncome >= :YearIncome2 and product.yearIncome < :YearIncome3 ");
					params.put("YearIncome2", YearIncome2);
					params.put("YearIncome3", YearIncome3);
				}

			}

			if (product.getFinancingPeriod() != null
					&& product.getFinancingPeriod() != 1) {
				// sb.append(" and user.name like :userName");
				// params.put("userName", "%"+user.getName()+"%");

				/*
				 * int FinancingPeriod1=60; int FinancingPeriod2=180; int
				 * FinancingPeriod3=360;
				 */

				if (params.size() > 0) {
					sb.append(" and");
				} else {
					sb.append(" where");
				}

				if (product.getFinancingPeriod() == 3) {

					sb.append(" product.financingPeriod < :FinancingPeriod");
					params.put("FinancingPeriod", FinancingPeriod1);
				}

				if (product.getFinancingPeriod() == 6) {

					sb.append(" product.financingPeriod >= :FinancingPeriod  and  product.financingPeriod <= :FinancingPeriod2 ");
					params.put("FinancingPeriod", FinancingPeriod1);
					params.put("FinancingPeriod2", FinancingPeriod2);

				}

				if (product.getFinancingPeriod() == 12) {

					sb.append(" product.financingPeriod >= :FinancingPeriod2  and  product.financingPeriod <= :FinancingPeriod3 ");
					params.put("FinancingPeriod2", FinancingPeriod2);
					params.put("FinancingPeriod3", FinancingPeriod3);

				}

				if (product.getFinancingPeriod() == 24) {

					sb.append(" product.financingPeriod >= :FinancingPeriod3");
					params.put("FinancingPeriod3", FinancingPeriod3);

				}

			}

			if (product.getFinancingMoney() != null
					&& product.getFinancingMoney() != 1) {
				/*
				 * int FinancingMoney1=200; int FinancingMoney2=500; int
				 * FinancingMoney3=1000;
				 */

				// sb.append(" and user.name like :userName");
				// params.put("userName", "%"+user.getName()+"%");
				if (params.size() > 0) {
					sb.append(" and");
				} else {
					sb.append(" where");
				}

				if (product.getFinancingMoney() == 200) {

					sb.append(" product.financingMoney < :FinancingMoney");
					params.put("FinancingMoney", FinancingMoney1);
				}

				if (product.getFinancingMoney() == 500) {

					sb.append(" product.financingMoney >= :FinancingMoney  and  product.financingMoney < :FinancingMoney2 ");
					params.put("FinancingMoney", FinancingMoney1);
					params.put("FinancingMoney2", FinancingMoney2);
				}

				if (product.getFinancingMoney() == 1000) {

					sb.append(" product.financingMoney >= :FinancingMoney2  and  product.financingMoney < :FinancingMoney3 ");
					params.put("FinancingMoney2", FinancingMoney2);
					params.put("FinancingMoney3", FinancingMoney3);
				}

				if (product.getFinancingMoney() == 2000) {

					sb.append(" product.financingMoney >= :FinancingMoney3 ");
					params.put("FinancingMoney3", FinancingMoney3);

				}

			}

			if (product.getFinancingProgress() != null
					&& product.getFinancingProgress() != 1) {

				/*
				 * int FinancingProgress1=50; int FinancingProgress2=80;
				 */

				// sb.append(" and user.name like :userName");
				// params.put("userName", "%"+user.getName()+"%");
				if (params.size() > 0) {
					sb.append(" and");
				} else {
					sb.append(" where");
				}

				if (product.getFinancingProgress() == 50) {

					sb.append(" product.financingProgress < :FinancingProgress ");
					params.put("FinancingProgress", FinancingProgress1);
				}

				if (product.getFinancingProgress() == 80) {

					sb.append(" product.financingProgress >= :FinancingProgress and  product.financingProgress < :FinancingProgress2 ");
					params.put("FinancingProgress", FinancingProgress1);
					params.put("FinancingProgress2", FinancingProgress2);
				}

				if (product.getFinancingProgress() == 100) {

					sb.append(" product.financingProgress >= :FinancingProgress2  ");
					params.put("FinancingProgress2", FinancingProgress2);

				}
			}

			if (product.getProjectStatus() != null
					&& product.getProjectStatus() != 1) {

				/*
				 * int projectStatus1=1; int projectStatus2=2; int
				 * projectStatus3=3;
				 */

				// sb.append(" and user.name like :userName");
				// params.put("userName", "%"+user.getName()+"%");
				if (params.size() > 0) {
					sb.append(" and");
				} else {
					sb.append(" where");
				}

				/*
				 * if(product.getProjectStatus()==1){
				 * 
				 * 
				 * sb.append(" product.projectStatus = :projectStatus1 ");
				 * params.put("projectStatus1", projectStatus1); }
				 */

				if (product.getProjectStatus() == 2) {

					sb.append(" product.projectStatus = :projectStatus2 ");
					params.put("projectStatus2", projectStatus2);
				}

				if (product.getProjectStatus() == 3) {

					sb.append(" product.projectStatus = :projectStatus3 ");
					params.put("projectStatus3", projectStatus3);
				}

				if (product.getProjectStatus() == 4) {

					sb.append(" product.projectStatus = :projectStatus4 ");
					params.put("projectStatus4", projectStatus4);
				}
			}
			if (params.size() > 0) {
				sb.append(" and product.existType = 0 ");

			} else {
				sb.append(" where product.existType = 0 ");
			}

		}

		// 查询总数可以用getHibernateTemplate()，我下面用的是createQuery
		// Hibernate的动态条件查询用DetachedCriteria是一个比较好的解决
		// List totalList = getHibernateTemplate().findByNamedParam(countQuery,
		// params.keySet().toArray(new String[0]), params.values().toArray());
		// int total = ((Long)totalList.iterator().next()).intValue();

		/*
		 * Query queryTotal = getSession().createQuery(countQuery +
		 * sb.toString());
		 */
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
		/* int total = ((Long) queryTotal.uniqueResult()).intValue(); */// 这里必须先转成Long再取intValue，不能转成Integer
		int total = ((Long) queryTotal.uniqueResult()).intValue();
		page.setTotalRecord(total);

		List list = queryList.list();
		result.put("total", total);
		result.put("rows", list);

		return list;

		// TODO Auto-generated method stub
		/*
		 * String hql = "from TProduct ";
		 * 
		 * if(page!=null){
		 * 
		 * } Query query = getSession().createQuery(hql);
		 * 
		 * List li= query.list(); System.out.print("dddddddddddddddd"); return
		 * li;
		 */

	}

	@Override
	public TProduct getProductById(Long id) {

		return getHibernateTemplate().get(TProduct.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TProduct> queryProductByType(Integer type) {
		String hql = "from TProduct tproduct where tproduct.recommendType = :recommendType and  tproduct.existType = :existType   order by tproduct.releaseTime desc";
		Query query = getSession().createQuery(hql);
		query.setParameter("recommendType", type);
		query.setParameter("existType", "0");
		query.setMaxResults(4);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TProduct> queryProduct(TProduct product) throws Exception {
		if (product.getProjectName() == null || product.getProjectName() == "") {
			String hql = "from TProduct product where product.existType = :existType";
			Query query = getSession().createQuery(hql);
			query.setParameter("existType", "0");
			return query.list();

		}

		String hq = "from TProduct product where product.projectName like :projectName and product.existType = :existType ";
		Query query = getSession().createQuery(hq);
		query.setParameter("projectName", "%" + product.getProjectName() + "%");
		query.setParameter("existType", "0");
		return query.list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TProduct> queryProductByNumber(String enterpriseNumber)
			throws Exception {
		String hq = "from TProduct product where product.enterpriseNumber = :enterpriseNumber";
		Query query = getSession().createQuery(hq);
		query.setParameter("enterpriseNumber", enterpriseNumber);
		return query.list();
	}

	@Override
	public void deleteProduct(Long id) throws Exception {
		TProduct Product = getHibernateTemplate().get(TProduct.class, id);
		Product.setExistType("1");
		getHibernateTemplate().saveOrUpdate(Product);

	}

}
