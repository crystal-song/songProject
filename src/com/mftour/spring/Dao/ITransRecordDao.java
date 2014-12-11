package com.mftour.spring.Dao;

import com.mftour.spring.model.TTransRecord;

public interface ITransRecordDao {
	public void addOrUpdate(TTransRecord transrecord) throws Exception;
}
