package com.stanley.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.validation.Valid;
//import javax.validation.Validation;
//import javax.validation.Validator;
//import javax.validation.ValidatorFactory;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.stanley.model.User;
import com.stanley.service.UserServiceI;
import com.stanley.support.Token;
import com.stanley.support.Util;

@Controller
@RequestMapping("/user")
@SessionAttributes("userInfo")
public class UserAction {

	private final static Logger logger = LoggerFactory.getLogger(UserAction.class);
	@SuppressWarnings("unused")
	private static final String MESSAGE = "user_message";
	private static final String SUCCESS = "user_success";
	private static final String FAIL = "user_fail";

	// 注入userService
	@Autowired
	private UserServiceI userService;

	// @RequestMapping("/getallusers")
	// public ModelAndView getAllUser() {
	// List<User> users = userService.getAllUser();
	// ModelAndView model = new ModelAndView();
	// if (users.isEmpty()) {
	// model.addObject("messages", "目前无用户，请先添加用户！");
	// }
	// model.addObject("lstUsers", users);
	// model.setViewName("jsp/allusers");
	// return model;
	// }

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

	@RequestMapping(value = "/loginuser", method = RequestMethod.POST)
	public String loginUser(@RequestParam("user_name") String user_name, @RequestParam("user_pwd") String user_pwd,
			ModelMap model) {
		logger.info(String.format("登录：", user_name));
		User user = userService.checkLogin(user_name, user_pwd);
		if (user != null) {
			model.addAttribute("userInfo", user);
		}
		return "redirect:/user";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		logger.info(String.format("注销用户"));
		httpSession.invalidate();
		return "redirect:/index";
	}

	@RequestMapping(value = "/registuser", method = RequestMethod.POST)
	public String registUser(@RequestParam("user_name") String user_name, @RequestParam("user_pwd") String user_pwd,
			@RequestParam("user_birthday") String user_birthday, RedirectAttributes attr) throws ParseException {
		logger.info(String.format("注册用户：", user_name));

		User user = new User();
		user.setUserId(Util.getInstance().getRandomID());
		user.setUserName(user_name);
		user.setUserPwd(user_pwd);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		user.setUserBirthday(df.parse(user_birthday));
		user.setUserSalary(0.00);

		// ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		// Validator validator = factory.getValidator();
		// validator.validate(user);
		int sign = userService.addUser(user);
		// ModelAndView model = new ModelAndView();
		if (sign == 1) {
			attr.addFlashAttribute(SUCCESS, "注册成功！");
			// model.setViewName("user");
		} else {
			attr.addFlashAttribute(FAIL, "注册失败！");
			// model.setViewName("user");
		}
		return "redirect:/user";
	}

	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	@Token(remove = true)
	public String addUser(@RequestParam("user_name") String user_name,
			@RequestParam("user_birthday") String user_birthday, @RequestParam("user_salary") String user_salary,
			RedirectAttributes attr) throws ParseException {
		logger.info(String.format("新增用户：", user_name));
		User user = new User();
		user.setUserId(Util.getInstance().getRandomID());
		user.setUserName(user_name);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		user.setUserBirthday(df.parse(user_birthday));
		user.setUserSalary(Double.valueOf(user_salary));
		int sign = userService.addUser(user);
		if (sign == 1) {
			attr.addFlashAttribute(SUCCESS, "新增用户 " + user_name + " 成功！");
		} else {
			attr.addFlashAttribute(FAIL, "新增用户 " + user_name + " 失败！");
		}
		return "redirect:/user";
	}

	@RequestMapping(value = "/updateuser/{userId}", method = RequestMethod.GET)
	@Token(save = true)
	public ModelAndView updateUser(@PathVariable("userId") String userId) {
		ModelAndView model = new ModelAndView();
		User user = userService.getUserById(userId);
		model.addObject("user", user);
		model.setViewName("jsp/updateuser");
		return model;
	}

	@RequestMapping(value = "/updateusersubmit", method = RequestMethod.POST)
	@Token(remove = true)
	public String updateProductSubmit(@RequestParam(value = "user_id_hidden", required = true) String user_id,
			@RequestParam("user_name") String user_name, @RequestParam("user_birthday") String user_birthday,
			@RequestParam("user_salary") String user_salary, RedirectAttributes attr) throws ParseException {
		logger.info(String.format("修改用户：", user_name));
		User user = new User();
		user.setUserId(user_id);
		user.setUserName(user_name);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		user.setUserBirthday(df.parse(user_birthday));
		user.setUserSalary(Double.valueOf(user_salary));
		int sign = userService.updateUser(user);
		if (sign == 1) {
			attr.addFlashAttribute(SUCCESS, "修改用户 " + user_name + " 成功！");
		} else {
			attr.addFlashAttribute(FAIL, "修改用户 " + user_name + " 失败！");
		}
		return "redirect:/user";
	}

	@RequestMapping(value = "/deleteuser/{userId}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable("userId") String userId, RedirectAttributes attr) {
		String user_name = getUserName(userId);
		logger.info(String.format("删除用户：", user_name));
		int sign = userService.deleteUser(userId);
		if (sign == 1) {
			attr.addFlashAttribute(SUCCESS, "删除用户 " + user_name + " 成功！");
		} else {
			attr.addFlashAttribute(FAIL, "删除用户 " + user_name + " 失败！");
		}
		return "redirect:/user";
	}

	private String getUserName(String userId) {
		String userName = userService.getUserById(userId).getUserName();
		return userName;
	}
}