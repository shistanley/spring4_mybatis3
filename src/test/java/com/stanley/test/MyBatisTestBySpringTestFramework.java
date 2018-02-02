package com.stanley.test;

import java.util.Date;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.stanley.model.User;
import com.stanley.service.UserServiceI;

@RunWith(SpringJUnit4ClassRunner.class)
// 配置了@ContextConfiguration注解并使用该注解的locations属性指明spring和配置文件之后，
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MyBatisTestBySpringTestFramework {

	private final static Logger logger = LoggerFactory.getLogger(MyBatisTestBySpringTestFramework.class);

	// 注入userService
	@Autowired
	private UserServiceI userService;

	@Test
	public void testAddUser() {
		logger.info(String.format("这只是个测试！"));
		User user = new User();
		user.setUserId(UUID.randomUUID().toString().replaceAll("-", ""));
		user.setUserName("xdp_gacl_白虎神皇1");
		user.setUserBirthday(new Date());
		user.setUserSalary(10000D);
		int num = userService.addUser(user);
		System.out.println(num);
	}

	@Test
	public void testGetUserById() {
		logger.info("查询用户");
		String userId = "e51c5dbf77e945d787372382a3266795";
		User user = userService.getUserById(userId);
		System.out.println(user.getUserName());
	}
}
