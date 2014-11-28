	package com.mftour.spring.Dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.mftour.spring.Dao.IGateDao;
import com.mftour.spring.model.TBinding;
import com.mftour.spring.model.TBindingSucceed;
import com.mftour.spring.model.TDrawMoney;
import com.mftour.spring.model.TDrawMoneySucceed;
import com.mftour.spring.model.TEstablishmentNotify;
import com.mftour.spring.model.TEstablishmentRegistration;
import com.mftour.spring.model.TLoansucceed;
import com.mftour.spring.model.TRecharge;
import com.mftour.spring.model.TRechargeSucceed;
import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TTransferInfo;
import com.mftour.spring.model.TTransferSucceed;
import com.mftour.spring.model.TYeePay;

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
		String hq = "from TRegisterYeePay registerYeePay where registerYeePay.platformUserNo = :platformUserNo";
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
	
	public List<TTransferInfo> queryAllTransRecord(String platformUserNo)throws Exception {
		String hq = "from TTransferInfo transferInfo where transferInfo.platformUserNo=:platformUserNo order by transferInfo.transDate asc";
		Query query = getSession().createQuery(hq);
		query.setParameter("platformUserNo", platformUserNo);
		
		return query.list();
	}
	public List<TDrawMoney> DrawMonetAllTransRecord(String platformUserNo)throws Exception {
		String hq = "from TDrawMoney drawMoney where drawMoney.platformUserNo=:platformUserNo order by drawMoney.transDate asc";
		Query query = getSession().createQuery(hq);
		query.setParameter("platformUserNo", platformUserNo);
		
		return query.list();
	}
	public List<TRecharge> RechargeAllTransRecord(String platformUserNo)throws Exception{
		String hq = "from TRecharge Recharge where Recharge.platformUserNo=:platformUserNo order by Recharge.time asc";
		Query query = getSession().createQuery(hq);
		query.setParameter("platformUserNo", platformUserNo);
		
		return query.list();
	}
	public List  AllTransRecord(int pageNo,String platformUserNo)throws Exception{
		String hq = "from TTransferInfo transferInfo,TDrawMoney drawMoney,TRecharge Recharge where transferInfo.platformUserNo=:platformUserNo1,drawMoney.platformUserNo=:platformUserNo2,Recharge.platformUserNo=:platformUserNo3 order by transferInfo.transDate asc,drawMoney.transDate asc,Recharge.time asc";
		Query query = getSession().createQuery(hq);
		query.setFirstResult((pageNo-1)*8);
		query.setMaxResults(8);
		query.setParameter("platformUserNo1", platformUserNo);
		query.setParameter("platformUserNo2", platformUserNo);
		query.setParameter("platformUserNo3", platformUserNo);
		return query.list();
	}
	
}
	