package com.stanley.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class I18nController {
	
	@RequestMapping(value = "/hellomessage")
	public ModelAndView welcome() {
		ModelAndView modelAndView = new ModelAndView("jsp/welcome");
		return modelAndView;
	}
}
