package com.stanley.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/goto")
public class PageController {

	@RequestMapping("/prod_reg")
	public ModelAndView gotoProduct_Regist(ModelAndView model) {
		model.setViewName("jsp/product");
		return model;
	}
}
