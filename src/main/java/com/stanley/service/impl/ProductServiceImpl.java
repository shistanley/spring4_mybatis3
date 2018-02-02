package com.stanley.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.stanley.model.Product;
import com.stanley.service.ProductServiceI;

@Service("productService")
public class ProductServiceImpl implements ProductServiceI {

	@Override
	public int addProduct(Product product) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public com.stanley.model.Product getProductById(String productID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<com.stanley.model.Product> getProductByProductName(String productName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<com.stanley.model.Product> getAllProduct() {
		// TODO Auto-generated method stub
		return null;
	}

}
