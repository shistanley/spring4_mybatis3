package com.stanley.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.stanley.service.HelloService;
import com.stanley.service.TokenService;

@RestController
@CrossOrigin
@RequestMapping(value = "api")
public class RestHelloController {
	private final HelloService helloService;
	private final TokenService tokenService;

	@Autowired
	public RestHelloController(HelloService helloService, TokenService tokenService) {
		this.helloService = helloService;
		this.tokenService = tokenService;
	}

	// 获得一个token
	@RequestMapping(value = "token/{username}")
	public String token(@PathVariable String username) {
		return tokenService.generateToken(username);
	}

	// 将姓名和信息存储进Redis
	@RequestMapping(value = "name/{name}/{message}")
	public void add(@PathVariable String name, @PathVariable String message) {
		helloService.add(name, message);
	}

	// 显示用户信息
	@RequestMapping(value = "{token}")
	public String get(@PathVariable String token) {
		return helloService.showMessage(tokenService.getName(token));
	}

	@RequestMapping("redis")
	public ModelAndView redis() {
		ModelAndView model = new ModelAndView("jsp/redisdemo");
		return model;
	}

	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public ModelAndView addUser(@RequestParam String username, @RequestParam String message) {
		ModelAndView model = new ModelAndView();
		helloService.add(username, message);
		model.setViewName("jsp/addredisdatasuccess");
		return model;
	}

	@RequestMapping(value = "viewData", method = RequestMethod.POST)
	public ModelAndView viewUser(@RequestParam String username) {
		String token = tokenService.generateToken(username);
		String message = helloService.showMessage(tokenService.getName(token));
		ModelAndView model = new ModelAndView();
		model.addObject("message", message);
		model.setViewName("jsp/showRedisData");
		return model;
	}
}
