	package com.mftour.spring.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.IGateDao;
import com.mftour.spring.model.TBinding;
import com.mftour.spring.model.TBindingNotify;
import com.mftour.spring.model.TBindingSucceed;
import com.mftour.spring.model.TDrawMoney;
import com.mftour.spring.model.TDrawMoneyNotify;
import com.mftour.spring.model.TDrawMoneySucceed;
import com.mftour.spring.model.TEstablishmentNotify;
import com.mftour.spring.model.TEstablishmentRegistration;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TLoansucceed;
import com.mftour.spring.model.TRecharge;
import com.mftour.spring.model.TRechargeNotify;
import com.mftour.spring.model.TRechargeSucceed;
import com.mftour.spring.model.TRegisterNotify;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransRecord;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TTransferNotify;
import com.mftour.spring.model.TTransferSucceed;
import com.mftour.spring.model.TYeePay;
import com.mftour.spring.util.Page;

@Repository("gateDao")
public class IGateDaoImpl  extends HibernateDaoSupport  implements  IGateDao {

	@Override
	public void addOrUpdate(TYeePay YeePay) throws Exception {
		
		getHibernateTemplate().saveOrUpdate(YeePay);
	}

	@Override
	public void addOrUpdateRegisterYeePay(TRegisterYeePay registerYeePay)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(registerYeePay);
		
	}

	@Override
	public List<TRegisterYeePay> queryTRegisterYeePayByName(String name)
			throws Exception {
		String hq = "from TRegisterYeePay registerYeePay where registerYeePay.platformUserNo = :platformUserNo ";
		Query query = getSession().createQuery(hq);
		query.setParameter("platformUserNo", name);
		return query.list();
	}

	@Override
	public List<TRegisterYeePay> queryTRegisterYeePayByNumber(String Number)
			throws Exception {
		String hq = "from TRegisterYeePay registerYeePay where registerYeePay.requestNo = :requestNo";
		Query query = getSession().createQuery(hq);
		query.setParameter("requestNo", Number);
		return query.list();
	}

	@Override
	public void addOrUpdateTTransferSucceed(TTransferSucceed transferSucceed)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(transferSucceed);
		
	}

	@Override
	public void addOrUpdateTTransferInfo(TTransferInfo TTransferInfo)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(TTransferInfo);
		
	}
	
	

	@Override
	public List<TTransferInfo> queryTTransferInfoByEnterpriseNumber(
			TTransferInfo transferInfo) throws Exception {
		String hq = "from TTransferInfo transferInfo where transferInfo.enterpriseNumber = :enterpriseNumber and transferInfo.transDate= :transDate";
		Query query = getSession().createQuery(hq);
		query.setParameter("enterpriseNumber", transferInfo.getEnterpriseNumber());
		query.setParameter("transDate", transferInfo.getTransDate());
		return query.list();
	}

	@Override
	public List<TTransferInfo> queryTTransferInfoByNumber(String Number)
			throws Exception {
		String hq = "from TTransferInfo transferInfo where transferInfo.requestNo = :requestNo";
		Query query = getSession().createQuery(hq);
		query.setParameter("requestNo", Number);
		return query.list();
	}

	@Override
	public void addOrUpdateTEstablishmentRegistration(
			TEstablishmentRegistration establishmentRegistration)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(establishmentRegistration);
		
	}

	@Override
	public void addOrUpdateTEstablishmentNotify(
			TEstablishmentNotify establishmentNotify) throws Exception {
		getHibernateTemplate().saveOrUpdate(establishmentNotify);
		
	}

	@Override
	public List<TEstablishmentRegistration> queryTEstablishmentRegistrationByNumber(
			String Number) throws Exception {
		String hq = "from TEstablishmentRegistration establishmentRegistration where establishmentRegistration.platformUserNo = :platformUserNo";
		Query query = getSession().createQuery(hq);
		query.setParameter("platformUserNo", Number);
		return query.list();
	}

	@Override
	public void addOrUpdateTBindingSucceed(TBindingSucceed bindingSucceed)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(bindingSucceed);
		
	}

	@Override
	public void addOrUpdateTBinding(TBinding binding) throws Exception {
		getHibernateTemplate().saveOrUpdate(binding);
		
	}

	@Override
	public List<TEstablishmentRegistration> queryTEstablishmentRegistrationByName(
			String name) throws Exception {
		String hq = "from TEstablishmentRegistration establishmentRegistration where establishmentRegistration.platformUserNo = :platformUserNo";
		Query query = getSession().createQuery(hq);
		query.setParameter("platformUserNo", name);
		return query.list();
	}

	@Override
	public void addOrUpdateTDrawMoney(TDrawMoney drawMoney) throws Exception {
		getHibernateTemplate().saveOrUpdate(drawMoney);
		
	}

	@Override
	public void addOrUpdateTDrawMoneySucceed(TDrawMoneySucceed drawMoneySucceed)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(drawMoneySucceed);
		
	}

	@Override
	public void addOrUpdateTLoansucceed(TLoansucceed loansucceed)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(loansucceed);
		
	}

	@Override
	public void addOrUpdateTRecharge(TRecharge recharge) throws Exception {
		getHibernateTemplate().saveOrUpdate(recharge);
		
	}

	@Override
	public void addOrUpdateTRechargeSucceed(TRechargeSucceed rechargeSucceed)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(rechargeSucceed);
		
	}
	
	public List<TTransRecord> queryAllTransRecord(Page page,String sql,Object[] para)throws Exception {
		Query query = getSession().createSQLQuery(sql).addEntity(TTransRecord.class);
		if(para!=null){
			for(int i=0;i<para.length;i++){
				query.setParameter(i, para[i]);
			}
		}
		page.setTotalRecord(query.list().size());
		query.setFirstResult((page.getPageNo() - 1) * page.getPageSize());
		query.setMaxResults(page.getPageSize());
		return query.list();
	}
	public List<TDrawMoney> DrawMonetAllTransRecord(Page page,String platformUserNo)throws Exception {
		String hq = "from TDrawMoney drawMoney where drawMoney.platformUserNo=:platformUserNo  and drawMoney.requestNo in(select t.requestNo from TDrawMoneySucceed t)  order by drawMoney.transDate desc";
		Query query = getSession().createQuery(hq);
		query.setParameter("platformUserNo", platformUserNo);
		page.setTotalRecord(query.list().size());
		query.setFirstResult((page.getPageNo() - 1) * page.getPageSize());
		query.setMaxResults(page.getPageSize());
		return query.list();
	}
	public List<TRecharge> RechargeAllTransRecord(Page page,String platformUserNo)throws Exception{
		String hq = "from TRecharge Recharge where Recharge.platformUserNo=:platformUserNo  and Recharge.requestNo in(select t.requestNo from TRechargeSucceed t) order by Recharge.time desc";
		Query query = getSession().createQuery(hq);
		query.setParameter("platformUserNo", platformUserNo);
		page.setTotalRecord(query.list().size());
		query.setFirstResult((page.getPageNo() - 1) * page.getPageSize());
		query.setMaxResults(page.getPageSize());
		return query.list();
	}
	public List  AllTransRecord(Page page,String platformUserNo)throws Exception{
		String hq = "from TTransferInfo transferInfo where transferInfo.platformUserNo=:platformUserNo  and transferInfo.requestNo in(select t.requestNo from TTransferSucceed t) order by transferInfo.transDate desc";
		Query query = getSession().createQuery(hq);
		query.setParameter("platformUserNo", platformUserNo);
		page.setTotalRecord(query.list().size());
		query.setFirstResult((page.getPageNo() - 1) * page.getPageSize());
		query.setMaxResults(page.getPageSize());
		return query.list();
	}

	@Override
	public List<TTransferInfo> queryTTransferInfoByName(String name)
			throws Exception {
		String hq = "from TTransferInfo transferInfo where transferInfo.platformUserNo=:platformUserNo and transferInfo.code=:code order by transferInfo.transDate desc";
		Query query = getSession().createQuery(hq);
		query.setParameter("platformUserNo",  name);
		query.setParameter("code", "1");
		return query.list();
	}

	public List<TRecharge> queryTRechargeByRequestNo(String requestno)
			throws Exception {
		String hq = "from TRecharge recharge where recharge.requestNo=:requestNo";
		Query query = getSession().createQuery(hq);
		query.setParameter("requestNo",  requestno);
		return query.list();
	}

	@Override
	public List<TInvestmentInfo> queryTInvestmentInfoByName(String name)
			throws Exception {
		String hq = "from TInvestmentInfo investmentInfo where investmentInfo.requestNo = :requestNo";
		Query query = getSession().createQuery(hq);
		query.setParameter("requestNo",  name);
		return query.list();
	}
	public List<TDrawMoney> queryTDrawMoneyByRequestNo(String requestno)
			throws Exception{
		String hq="from TDrawMoney drawmoney where drawmoney.requestNo=:requestNo";
		Query query = getSession().createQuery(hq);
		query.setParameter("requestNo",  requestno);
		return query.list();
	}

	@Override
	public void addOrUpdateTRegisterNotify(TRegisterNotify registerNotify)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(registerNotify);
		
	}

	@Override
	public List<TRegisterNotify> queryTRegisterNotifyByName(String name){
		
	String hq="from TRegisterNotify registerNotify where registerNotify.platformUserNo=:platformUserNo";
	Query query = getSession().createQuery(hq);
	query.setParameter("platformUserNo",  name);
	return query.list();
	}

	@Override
	public void addOrUpdateTRechargeNotify(TRechargeNotify rechargeNotify)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(rechargeNotify);
		
	}

	@Override
	public void addOrUpdateTBindingNotify(TBindingNotify bindingNotify)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(bindingNotify);
		
	}

	@Override
	public void addOrUpdateTTransferNotify(TTransferNotify transferNotify)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(transferNotify);
		
	}

	@Override
	public void addOrUpdateTDrawMoneyNotify(TDrawMoneyNotify drawMoneyNotify)
			throws Exception {
		getHibernateTemplate().saveOrUpdate(drawMoneyNotify);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
	