package com.mftour.spring.service;

import com.mftour.spring.model.TCrowdfunding;
import com.mftour.spring.model.TProduct;

public interface ICollectMoneyService {

	public void addOrUpdate(TCrowdfunding crowdfunding) throws Exception;

}
