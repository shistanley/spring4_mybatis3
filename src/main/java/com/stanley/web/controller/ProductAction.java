package com.stanley.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.stanley.model.Product;
import com.stanley.service.ProductServiceI;
import com.stanley.support.Token;
import com.stanley.support.Util;

@Controller
@RequestMapping("/product")
public class ProductAction {

	private final static Logger logger = LoggerFactory.getLogger(ProductAction.class);
	@SuppressWarnings("unused")
	private static final String MESSAGE = "product_message";
	private static final String SUCCESS = "product_success";
	private static final String FAIL = "product_fail";

	@Autowired
	private ProductServiceI productService;

	@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	@Token(remove = true)
	public String addProduct(@RequestParam("product_name") String product_name,
			@RequestParam("product_desc") String product_desc, RedirectAttributes attr) {
		logger.info(String.format("添加产品：", product_name));
		Product product = new Product();
		product.setProductId(Util.getInstance().getRandomID());
		product.setProductName(product_name);
		product.setProductDesc(product_desc);
		int sign = productService.addProduct(product);
		if (sign == 1) {
			attr.addFlashAttribute(SUCCESS, "添加产品 " + product_name + " 成功！");
		} else {
			attr.addFlashAttribute(FAIL, "添加产品 " + product_name + " 失败！");
		}
		return "redirect:/product";
	}

	@RequestMapping(value = "/updateproduct/{productId}", method = RequestMethod.GET)
	public ModelAndView updateProduct(@PathVariable("productId") String productId) {
		ModelAndView model = new ModelAndView();
		Product product = productService.getProductById(productId);
		model.addObject("product", product);
		model.setViewName("jsp/updateproduct");
		return model;
	}

	@RequestMapping(value = "/updateproductsubmit", method = RequestMethod.POST)
	@Token(remove = true)
	public String updateProductSubmit(@RequestParam(value = "product_id_hidden", required = true) String product_id,
			@RequestParam("product_name") String product_name, @RequestParam("product_desc") String product_desc,
			RedirectAttributes attr) {
		logger.info(String.format("更新产品：", product_name));
		Product product = new Product();
		product.setProductId(product_id);
		product.setProductName(product_name);
		product.setProductDesc(product_desc);
		int sign = productService.updateProduct(product);
		if (sign == 1) {
			attr.addFlashAttribute(SUCCESS, "更新产品 " + product_name + " 成功！");
		} else {
			attr.addFlashAttribute(FAIL, "更新产品 " + product_name + " 失败！");
		}
		return "redirect:/product";
	}

	@RequestMapping(value = "/deleteproduct/{productId}", method = RequestMethod.GET)
	// @ResponseBody
	public String deleteProduct(@PathVariable("productId") String productId, RedirectAttributes attr) {
		String product_name = getProductName(productId);
		logger.info(String.format("删除产品：", product_name));
		int sign = productService.deleteProduct(productId);
		if (sign == 1) {
			attr.addFlashAttribute(SUCCESS, "删除产品 " + product_name + " 成功！");
		} else {
			attr.addFlashAttribute(FAIL, "删除产品 " + product_name + " 失败！");
		}
		return "redirect:/product";
	}

	private String getProductName(String productId) {
		String productName = productService.getProductById(productId).getProductName();
		return productName;
	}
}