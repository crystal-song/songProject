
package com.mftour.spring.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.ITransNoticeDao;
import com.mftour.spring.model.TTransNotice;
import com.mftour.spring.service.ITransNoticeService;



@Service("transNoticeService")
public class ITransNoticeServiceImpl  implements  ITransNoticeService {

	
	@Autowired
    private ITransNoticeDao transNoticeDao;
	
	
	@Override
	public void addOrUpdate(TTransNotice transNotice) throws Exception {
		transNoticeDao.addOrUpdate(transNotice);
		
	}
	public List<TTransNotice> queryTransNoticeByName(String username)
			throws Exception {
		return transNoticeDao.queryTransNoticeByName(username);
	}


	
}