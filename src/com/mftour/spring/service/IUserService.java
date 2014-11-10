package com.mftour.spring.service;

import java.util.List;

import com.mftour.spring.model.TUser;

public interface IUserService {
	public TUser getUserByAccount(String account) throws Exception;
	public TUser getUserByEmail(String email) throws Exception;
	
	public void addOrUpdate(TUser user) throws Exception;
	
	public List<TUser> getName(String name)throws Exception;

}
