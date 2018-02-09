package com.stanley.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stanley.dao.ProductMapper;
import com.stanley.model.Product;
import com.stanley.service.ProductServiceI;

@Service("productService")
public class ProductServiceImpl implements ProductServiceI {

	@Autowired
	private ProductMapper productMapper;

	@Override
	public int addProduct(Product product) {
		return productMapper.insert(product);
	}

	@Override
	public Product getProductById(String productId) {
		return productMapper.selectByPrimaryKey(productId);
	}

	@Override
	public List<Product> getProductByProductName(String productName) {
		return productMapper.findProductByProductname(productName);
	}

	@Override
	public List<Product> getAllProduct() {
		return productMapper.getAllProduct();
	}

	@Override
	public int updateProduct(Product product) {
		return productMapper.updateByPrimaryKey(product);
	}

	@Override
	public int deleteProduct(String productId) {
		return productMapper.deleteByPrimaryKey(productId);
	}
}
