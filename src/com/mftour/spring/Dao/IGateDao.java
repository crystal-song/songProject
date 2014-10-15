package com.mftour.spring.Dao;

import java.util.List;

import com.mftour.spring.model.TRegisterYeePay;
import com.mftour.spring.model.TYeePay;

public interface IGateDao {
	
	public void addOrUpdate(TYeePay YeePay) throws Exception;
	
	public void addOrUpdateRegisterYeePay(TRegisterYeePay registerYeePay) throws Exception;
	
	 public List<TRegisterYeePay> queryTRegisterYeePayByName(String name)throws Exception;
	 
	 public List<TRegisterYeePay> queryTRegisterYeePayByNumber(String Number)throws Exception;

}
