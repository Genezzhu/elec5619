package com.usyd.group7.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.usyd.group7.base.ResultInfo;
import com.usyd.group7.domain.Products;
import com.usyd.group7.service.ProductService;

@Controller
@RequestMapping(value="product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String updateProduct(Products product, HttpServletRequest request){
		productService.updateProduct(product, request);
		return "redirect:/shop/ProductManage.htm";
	}
	
	@RequestMapping(value="delete")
	public String deleteProduct(@RequestParam(value = "productid", required = false) String productID, HttpServletRequest request){
		productService.deleteProduct(productID, request);
		return "redirect:/shop/ProductManage.htm";
	}
	
	@RequestMapping(value="add", method = RequestMethod.POST)
	public String addProduct(Products product, HttpServletRequest request){
		productService.addProduct(product, request);
		return "redirect:/shop/ProductManage.htm";
	}
}
