package com.stanley.service;

import java.util.List;

import com.stanley.model.User;

public interface UserServiceI {

	/**
	 * 添加用户
	 * 
	 * @param user
	 */
	int addUser(User user);

	/**
	 * 根据用户id获取用户
	 * 
	 * @param userId
	 * @return
	 */
	User getUserById(String userId);

	/**
	 * 根据用户名获取用户
	 * 
	 * @param userName
	 * @return
	 */
	List<User> getUserByUsername(String userName);

	/**
	 * 获取所有用户信息
	 * 
	 * @return List<User>
	 */
	List<User> getAllUser();
}
