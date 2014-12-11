package com.mftour.spring.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.ITransRecordDao;
import com.mftour.spring.model.TTransRecord;
import com.mftour.spring.service.ITransRecordService;
@Service("transRecordService")
public class ITransRecordServiceImpl implements ITransRecordService {
	@Autowired
	ITransRecordDao transRecordDao;
	@Override
	public void addOrUpdate(TTransRecord transrecord) throws Exception {
		// TODO Auto-generated method stub
		transRecordDao.addOrUpdate(transrecord);
	}

}
