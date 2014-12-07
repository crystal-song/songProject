	package com.mftour.spring.Dao;

import java.util.List;

import com.mftour.spring.model.TTransNotice;


public interface ITransNoticeDao {
	
	public void addOrUpdate(TTransNotice transnotice) throws Exception;
	public List<TTransNotice> queryTransNoticeByName(String username)
			throws Exception;
	public List<TTransNotice> queryTransNoticeByNameAndtype(String username,String type)
			throws Exception;
	public List<TTransNotice> queryTransNoticeByNameAndtypes(String username,String type,String noticeType)
			throws Exception;
	public void delTransNoticeByName(String username)
			throws Exception;

}
	 
	