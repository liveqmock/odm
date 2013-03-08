package com.jiang.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Component;

import com.jiang.bean.User;
import com.jiang.dao.LoginDao;

@Component("loginDao")
public class LoginDaoImpl extends SqlMapClientDaoSupport implements LoginDao {


	public void addUser(User user) {
		getSqlMapClientTemplate().insert("User.addUser", user);
	}


	public User getUserById() {
		return null;
	}

	@SuppressWarnings("unchecked")

	public User queryUserByPWD(User user) {
		List<User> users = new ArrayList<User>();
		users = getSqlMapClientTemplate().queryForList("User.getUserByPWD",
                user);
        if (users.size() > 0) {
            return users.get(0);
        }
        return null;
	}

}
