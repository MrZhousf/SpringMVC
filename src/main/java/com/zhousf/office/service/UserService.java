package com.zhousf.office.service;

import java.util.List;

import com.zhousf.office.entity.User;

/**
 * 用户业务接口
 * @author zhousf
 */
public interface UserService {

	User queryById(long id);
	
	List<User> getList();
	
	List<User> queryByName(String userName);
	
	int addUser(User user);
	
	int updateUser(User user);
	
	int deleteById(long id);
	
}
