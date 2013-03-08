package com.jiang.service;

import com.jiang.bean.User;

public interface LoginService {
	
	public User getUserById();
	
	public void addUser(User user);
	

	public User queryUserByPWD(User user);


}
