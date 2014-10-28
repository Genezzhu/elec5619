package com.usyd.group7.service;

import com.usyd.group7.base.ResultInfo;
import com.usyd.group7.dao.ProductManager;
import com.usyd.group7.dao.UserManager;
import com.usyd.group7.domain.Products;
import com.usyd.group7.domain.User;
import com.usyd.group7.util.SessionUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

@Component
public class SimpleProductService implements ProductService{

	@Autowired
	private ProductManager productManager;
	
	private static final Logger logger = LoggerFactory.getLogger(SimpleProductService.class);
	
	
	@Override
	public ResultInfo deleteProduct(String productID, HttpServletRequest request) {
		ResultInfo resultInfo = new ResultInfo();
		
		try{
			productManager.deleteProduct(productID);
			resultInfo.markSuccess();
		}catch(RuntimeException e){
			logger.error("Exception occurs when delete product", e);
			resultInfo.setErrorMessage(e.getCause().getMessage());
		}
		
		return resultInfo;
	}
	
	@Override
	public ResultInfo updateProduct(Products product, HttpServletRequest request) {
		ResultInfo resultInfo = new ResultInfo();
		
		try{
			productManager.updateProduct(product);
			resultInfo.markSuccess();
		}catch(RuntimeException e){
			logger.error("Exception occur when update product", e);
			resultInfo.setErrorMessage(e.getCause().getMessage());
		}
		
		return resultInfo;
	}
	
	@Override
	public ResultInfo addProduct(Products product, HttpServletRequest request) {
		ResultInfo resultInfo = new ResultInfo();
		
		try{
			productManager.addProduct(product);
			resultInfo.markSuccess();
		}catch(RuntimeException e){
			logger.error("Exception occur when update product", e);
			resultInfo.setErrorMessage(e.getCause().getMessage());
		}
		
		return resultInfo;
	}
}
