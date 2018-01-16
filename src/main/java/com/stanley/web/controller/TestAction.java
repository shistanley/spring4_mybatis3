package com.stanley.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/templates")
public class TestAction {

	@RequestMapping("/demo")
	public ModelAndView demo() {
		ModelAndView model = new ModelAndView();
		model.addObject("message", "thymeleaf demo");
		model.setViewName("templates/thymeleafdemo");
		return model;
	}
}
