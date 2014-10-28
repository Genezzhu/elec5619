package com.usyd.group7.service;

import javax.servlet.http.HttpServletRequest;

import com.usyd.group7.base.ResultInfo;
import com.usyd.group7.domain.Products;

public interface ProductService {
	
	public ResultInfo deleteProduct(String productID, HttpServletRequest request);
	
	public ResultInfo updateProduct(Products product, HttpServletRequest request);
	
	public ResultInfo addProduct(Products product, HttpServletRequest request);
}
