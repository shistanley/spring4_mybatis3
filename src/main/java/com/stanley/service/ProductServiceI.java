package com.stanley.service;

import java.util.List;

import com.stanley.model.Product;

public interface ProductServiceI {

	int addProduct(Product product);
	
	Product getProductById(String productID);
	
	List<Product> getProductByProductName(String productName);
	
	List<Product> getAllProduct();
}
