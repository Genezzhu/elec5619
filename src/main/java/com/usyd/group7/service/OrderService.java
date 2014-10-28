package com.usyd.group7.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.roo.addon.layers.service.RooService;

import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.Product;
import com.usyd.group7.domain.ProductOrder;
import com.usyd.group7.domain.ProductOrderItem;

@RooService(domainTypes = { com.usyd.group7.domain.ProductOrder.class })
public interface OrderService {

	public void putProductToSessionCart(HttpServletRequest request,
			Product product, int amount);

	public List<ProductOrderItem> getSessionCart(HttpServletRequest request);

	public double getSessionCartSumCredit(HttpServletRequest request);

	public void saveSessionCart(HttpServletRequest request,
			List<ProductOrderItem> list);

	public void clearSessionCart(HttpServletRequest request);

	public ProductOrder makeOrder(HttpServletRequest request, ProductOrder order);

	public List<ProductOrder> getOrderHistory(Client client);

}
