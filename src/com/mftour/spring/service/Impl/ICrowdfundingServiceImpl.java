package com.mftour.spring.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.ICrowdfundingDao;
import com.mftour.spring.Dao.IGuaranteeDao;
import com.mftour.spring.model.TCrowdfunding;
import com.mftour.spring.model.TCrowdfundingCommodity;
import com.mftour.spring.service.ICrowdfundingService;
import com.mftour.spring.util.Page;

@Service("crowdfundingService")
public class ICrowdfundingServiceImpl implements ICrowdfundingService {

	@Autowired
	private ICrowdfundingDao crowdfundingDao;

	@Override
	public List<TCrowdfunding> getCrowdfunding(Page page,
			TCrowdfunding crowdfunding) throws Exception {
		return crowdfundingDao.getCrowdfunding(page, crowdfunding);

	}

	@Override
	public TCrowdfunding getCrowdfundingById(Long id) {

		return crowdfundingDao.getCrowdfundingById(id);
	}

	@Override
	public List<TCrowdfundingCommodity> queryTCrowdfundingCommodityByNumber(
			String projectNumber) throws Exception {

		return crowdfundingDao
				.queryTCrowdfundingCommodityByNumber(projectNumber);
	}

}
