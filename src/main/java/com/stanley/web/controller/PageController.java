package com.stanley.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.stanley.model.Product;
import com.stanley.model.User;
import com.stanley.service.ProductServiceI;
import com.stanley.service.UserServiceI;
import com.stanley.support.Token;

@Controller
public class PageController {

	@Autowired
	private UserServiceI userService;
	@Autowired
	private ProductServiceI productService;

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	@Token(save = true)
	public ModelAndView gotoUser_Page(ModelAndView model) {
		List<User> users = userService.getAllUser();
		model.addObject("users", users);
		model.setViewName("jsp/user");
		return model;
	}

	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public ModelAndView regist() {
		ModelAndView model = new ModelAndView("jsp/regist");
		return model;
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView model = new ModelAndView("jsp/login");
		return model;
	}

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	@Token(save = true)
	public ModelAndView gotoProduct_Page(ModelAndView model) {
		List<Product> products = productService.getAllProduct();
		model.addObject("products", products);
		model.setViewName("jsp/product");
		return model;
	}
}