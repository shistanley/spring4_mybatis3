package com.stanley.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.stanley.model.User;
import com.stanley.service.UserServiceI;

@Controller
@RequestMapping("/user")
public class UserAction {

	private final static Logger logger = LoggerFactory.getLogger(UserAction.class);
	// 注入userService
	@Autowired
	private UserServiceI userService;

	@RequestMapping("/getallusers")
	public ModelAndView getAllUser() {
		List<User> users = userService.getAllUser();
		ModelAndView model = new ModelAndView();
		if (users.isEmpty()) {
			model.addObject("messages", "目前无用户，请先添加用户！");
		}
		model.addObject("lstUsers", users);
		model.setViewName("jsp/allusers");
		return model;
	}

	@RequestMapping("/getusername")
	public ModelAndView getUserByUsername(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		logger.info(String.format("按用户名查询：", username));
		List<User> users = userService.getUserByUsername(username);
		ModelAndView model = new ModelAndView();
		if (users.isEmpty()) {
			model.addObject("messages", "无此用户");
		}
		model.addObject("lstUsers", users);
		model.setViewName("jsp/specificuser");
		return model;
	}

	@RequestMapping("/regist")
	public ModelAndView regist() {
		ModelAndView model = new ModelAndView("jsp/regist");
		return model;
	}

	@RequestMapping("/registuser")
	public ModelAndView registUser(@ModelAttribute("user") @Valid User u, BindingResult br, String user_name,
			String user_birthday, String user_salary) throws ParseException {
		ModelAndView model = new ModelAndView();
		if (br.hasErrors()) {
			// 验证未通过则
			//model.setViewName("validate1");
			return model;
		}
		User user = new User();
		user.setUserId(UUID.randomUUID().toString().replaceAll("-", ""));
		user.setUserName(user_name);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		user.setUserBirthday(df.parse(user_birthday));
		user.setUserSalary(Double.valueOf(user_salary));
		
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();
		validator.validate(user);
		int sign = userService.addUser(user);
		
		if (sign == 1) {
			model.addObject("adduser", user);
			model.setViewName("jsp/success");
		} else {
			model.addObject("addfail", "添加用户失败！");
			model.setViewName("jsp/fail");
		}
		return model;
	}
}
