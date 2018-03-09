package com.stanley.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.stanley.model.User;

public interface UserMapper {
	int deleteByPrimaryKey(String userId);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(String userId);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	List<User> findUserByUsername(String userName);

	List<User> checkUserByUsernameAndPassword(@Param("userName") String userName, @Param("userPwd") String userPwd);

	/**
	 * 获取所有用户信息
	 * 
	 * @return List<User>
	 */
	List<User> getAllUser();
}