package com.mftour.spring.service.Impl;

import java.util.List;

import com.mftour.spring.model.Accounts;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.IUserDao;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDao userDao;

	public TUser getUserByAccount(String account) throws Exception {
		List list = userDao.getUserByAccount(account);
		return list == null || list.size() == 0 ? null : (TUser) list.get(0);

	}

	public TUser getUserByEmail(String email) throws Exception {
		List list = userDao.getUserByEmail(email);
		return list == null || list.size() == 0 ? null : (TUser) list.get(0);

	}

	public Accounts getAccountByName(String name) throws Exception {

		return userDao.getAccountByName(name);

	}

	@Override
	public void addOrUpdate(TUser user) throws Exception {
		userDao.addOrUpdate(user);

	}

	@Override
	public List<TUser> getName(String name) throws Exception {
		return userDao.getName(name);

	}

	public int findAllRecord(String mobilephone) {
		int i = 0;
		i = userDao.finaAllRecord(mobilephone);
		return i;
	}
	public TUser getUserByopenId(String openId) throws Exception{
		return userDao.getUserByopenId(openId);
	}
}
