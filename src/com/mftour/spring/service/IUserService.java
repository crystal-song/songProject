package com.mftour.spring.service;

import java.util.List;

import com.mftour.spring.model.Accounts;
import com.mftour.spring.model.TUser;

public interface IUserService {
	public TUser getUserByAccount(String account) throws Exception;

	public TUser getUserByEmail(String email) throws Exception;

	public void addOrUpdate(TUser user) throws Exception;

	public List<TUser> getName(String name) throws Exception;
	public Accounts getAccountByName(String name) throws Exception;
	public int findAllRecord(String mobilephone);
	public TUser getUserByopenId(String openId) throws Exception;
}
