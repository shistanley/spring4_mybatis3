package com.stanley.dao;

import java.util.List;

import com.stanley.model.Product;

public interface ProductMapper {
	int deleteByPrimaryKey(String productId);
	
	int insert(Product product);
	
	int updateByPrimaryKey(Product product);
	
	Product selectByPrimaryKey(String productId);
	
	List<Product> findProductByProductname(String productName);
	
	List<Product> getAllProduct();
}
