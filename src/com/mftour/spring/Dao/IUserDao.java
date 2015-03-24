package com.mftour.spring.Dao;

import java.util.List;

import com.mftour.spring.model.Accounts;
import com.mftour.spring.model.TUser;

import org.hibernate.Query;

public interface IUserDao {

	public List getUserByAccount(String account) throws Exception;

	public List getUserByEmail(String email) throws Exception;

	public void addOrUpdate(TUser user) throws Exception;

	public List<TUser> getName(String name) throws Exception;
	public Accounts getAccountByName(String name) throws Exception;
	public int finaAllRecord(String mobilephone);
	public TUser getUserByopenId(String openId) throws Exception;
}
