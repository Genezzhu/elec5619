package com.usyd.group7.dao;

import com.usyd.group7.domain.Products;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

public interface ProductManager extends Serializable {
	
	public void increasePrice(int percentage);
	
	public List<Products> getProducts();
	
	public void addProduct(Products product);
	
	public Products getProductById(String id);

    public List<Products> getProductList(Set<String> productIDList);

	public void updateProduct(Products product);
	
	public void deleteProduct(String id);

}
