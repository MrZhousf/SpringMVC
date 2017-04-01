package com.zhousf.office.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhousf.office.entity.User;

/**
 * 用户数据层接口
 * @author zhousf
 */
public interface UserDao {
	
	User queryById(long id);
	
	List<User> queryByName(@Param(value="userName") String userName);
	
	List<User> queryAll();
	
	int addUser(User user);
	
	int updateUser(User user);
	
	int deleteById(long id);

}
