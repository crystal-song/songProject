package com.mftour.spring.service;

import java.util.List;

import com.mftour.spring.model.TCrowdfunding;
import com.mftour.spring.model.TCrowdfundingCommodity;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.util.Page;

public interface ICrowdfundingService {
	
	
	public List<TCrowdfunding> getCrowdfunding(Page page,TCrowdfunding crowdfunding)throws Exception;
	
	public TCrowdfunding getCrowdfundingById(Long id);
	
	 public List<TCrowdfundingCommodity> queryTCrowdfundingCommodityByNumber(String  projectNumber)throws Exception;

}
