package com.zhousf.office.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhousf.office.dao.UserDao;
import com.zhousf.office.entity.User;
import com.zhousf.office.service.UserService;

/**
 * 用户业务
 * @author zhousf
 */
@Service
public class UserServiceImpl implements UserService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserDao userDao;
	
	public User queryById(long id) {
		return userDao.queryById(id);
	}

	public List<User> getList() {
		return userDao.queryAll();
	}

	public int addUser(User user) {
		return userDao.addUser(user);
	}

	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	public int deleteById(long id) {
		return userDao.deleteById(id);
	}

	public List<User> queryByName(String userName) {
		return userDao.queryByName(userName);
	}
	
	
	
	
	
	
	

}
