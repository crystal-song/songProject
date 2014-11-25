package com.mftour.spring.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.ICollectMoneyDao;
import com.mftour.spring.Dao.ICrowdfundingDao;
import com.mftour.spring.model.TCrowdfunding;
import com.mftour.spring.service.ICollectMoneyService;

@Service("collectMoneyService")
public class ICollectMoneyServiceImpl implements ICollectMoneyService {

	@Autowired
	private ICollectMoneyDao collectMoneyDao;

	@Override
	public void addOrUpdate(TCrowdfunding crowdfunding) throws Exception {
		collectMoneyDao.addOrUpdate(crowdfunding);

	}

}
