package com.stanley.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stanley.dao.UserMapper;
import com.stanley.model.User;
import com.stanley.service.UserServiceI;

/**
 * @author stanley 使用@Service注解将UserServiceImpl类标注为一个service
 *         service的id是userService
 */
@Service("userService")
public class UserServiceImpl implements UserServiceI {

	/**
	 * 使用@Autowired注解标注userMapper变量， 当需要使用UserMapper时，Spring就会自动注入UserMapper
	 */
	@Autowired
	private UserMapper userMapper;// 注入dao

	@Override
	public int addUser(User user) {
		return userMapper.insert(user);
	}

	@Override
	public User getUserById(String userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

	@Override
	public List<User> getUserByUsername(String userName) {
		return userMapper.findUserByUsername(userName);
	}

	@Override
	public List<User> getAllUser() {
		return userMapper.getAllUser();
	}

	@Override
	public int deleteUser(String userId) {
		return userMapper.deleteByPrimaryKey(userId);
	}

	@Override
	public int updateUser(User user) {
		return userMapper.updateByPrimaryKey(user);
	}
}
