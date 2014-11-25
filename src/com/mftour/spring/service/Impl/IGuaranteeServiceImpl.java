package com.mftour.spring.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.IGuaranteeDao;
import com.mftour.spring.model.TChannel;
import com.mftour.spring.service.IGuaranteeService;

@Service("guaranteeService")
public class IGuaranteeServiceImpl implements IGuaranteeService {

	@Autowired
	private IGuaranteeDao guaranteeDao;

	@Override
	public List<TChannel> getTChannel() throws Exception {

		return guaranteeDao.getTChannel();
	}

}
