package com.mftour.spring.Dao;

import com.mftour.spring.model.TCrowdfunding;

public interface ICollectMoneyDao {
	
	
	public void addOrUpdate(TCrowdfunding  crowdfunding ) throws Exception;

}
