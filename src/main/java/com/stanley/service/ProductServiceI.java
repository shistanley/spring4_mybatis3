package com.stanley.service;

import java.util.List;

import com.stanley.model.Product;

public interface ProductServiceI {

	int addProduct(Product product);
	
	int deleteProduct(String productId);
	
	int updateProduct(Product product);
	
	Product getProductById(String productId);
	
	List<Product> getProductByProductName(String productName);
	
	List<Product> getAllProduct();
}
