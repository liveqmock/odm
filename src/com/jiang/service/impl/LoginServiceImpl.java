package com.jiang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.jiang.bean.User;
import com.jiang.dao.LoginDao;
import com.jiang.service.LoginService;



@Component("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginDao;
	

	public User getUserById() {
		return null;
	}


	public void addUser(User user) {
		Assert.notNull(user,"user is null!");
		loginDao.addUser(user);
	}


	public User queryUserByPWD(User user) {
		return loginDao.queryUserByPWD(user);
	}


}
