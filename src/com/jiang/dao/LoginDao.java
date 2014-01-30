package com.jiang.dao;

import com.jiang.bean.User;

public interface LoginDao {

	public User getUserById();

	public void addUser(User user);

	public User queryUserByPWD(User user);
}
