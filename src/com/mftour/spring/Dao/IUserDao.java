package com.mftour.spring.Dao;

import java.util.List;

import com.mftour.spring.model.TUser;

public interface IUserDao {
	
	public List getUserByAccount(String account) throws Exception;
	
	public List getUserByEmail(String email) throws Exception;
	
	public void addOrUpdate(TUser user) throws Exception;
	
	public List<TUser> getName(String name)throws Exception;

}
