package com.stanley.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stanley.model.Product;
import com.stanley.service.ProductServiceI;
import com.stanley.support.Util;

@Controller
@RequestMapping("/product")
public class ProductAction {

	// private static final String SUCCESS = "success";
	@Autowired
	private ProductServiceI productService;

	@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	public ModelAndView addProduct(@RequestParam("product_name") String product_name,
			@RequestParam("product_desc") String product_desc) {
		Product product = new Product();
		product.setProductId(Util.getInstance().getRandomID());
		product.setProductName(product_name);
		product.setProductDesc(product_desc);
		ModelAndView model = new ModelAndView();
		int sign = productService.addProduct(product);
		if (sign == 1) {
			List<Product> products = productService.getAllProduct();
			model.addObject("products", products);
			model.setViewName("jsp/product");
		} else {
			model.addObject("add_product_fail", "添加产品失败！");
			model.setViewName("jsp/product");
		}
		return model;
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
	public ModelAndView updateProductSubmit(
			@RequestParam(value = "product_id_hidden", required = true) String product_id,
			@RequestParam("product_name") String product_name, @RequestParam("product_desc") String product_desc) {
		ModelAndView model = new ModelAndView();
		Product product = new Product();
		product.setProductId(product_id);
		product.setProductName(product_name);
		product.setProductDesc(product_desc);
		int sign = productService.updateProduct(product);
		if (sign == 1) {
			List<Product> products = productService.getAllProduct();
			model.addObject("products", products);
			model.setViewName("jsp/product");
		} else {
			model.addObject("update_product_fail", "更新产品失败！");
			model.setViewName("jsp/product");
		}
		return model;
	}

	@RequestMapping(value = "/deleteproduct/{productId}", method = RequestMethod.GET)
	// @ResponseBody
	public ModelAndView deleteProduct(@PathVariable("productId") String productId) {
		ModelAndView model = new ModelAndView();
		int sign = productService.deleteProduct(productId);
		if (sign == 1) {
			List<Product> products = productService.getAllProduct();
			model.addObject("products", products);
			model.setViewName("jsp/product");
		} else {
			model.addObject("delete_product_fail", "删除产品失败！");
			model.setViewName("jsp/product");
		}
		return model;
	}
}