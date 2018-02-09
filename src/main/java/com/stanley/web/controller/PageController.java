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

@Controller
public class PageController {

	@Autowired
	private UserServiceI userService;
	@Autowired
	private ProductServiceI productService;

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView gotoUser_Page(ModelAndView model) {
		List<User> users = userService.getAllUser();
		model.addObject("users", users);
		model.setViewName("jsp/user");
		return model;
	}
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public ModelAndView gotoProduct_Page(ModelAndView model) {
		List<Product> products = productService.getAllProduct();
		model.addObject("products", products);
		model.setViewName("jsp/product");
		return model;
	}
}