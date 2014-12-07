
package com.mftour.spring.service;

import java.util.List;

import com.mftour.spring.model.TTransNotice;

public interface ITransNoticeService {
	
	public void addOrUpdate(TTransNotice transnotice) throws Exception;
	public List<TTransNotice> queryTransNoticeByName(String username)
			throws Exception;
	public List<TTransNotice> queryTransNoticeByNameAndtype(String username,String type)
			throws Exception;
	public void delTransNoticeByName(String username)
			throws Exception;
	public List<TTransNotice> queryTransNoticeByNameAndtypes(String username,String type,String noticeType)
			throws Exception;
}