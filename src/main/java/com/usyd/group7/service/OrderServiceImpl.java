package com.usyd.group7.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.Product;
import com.usyd.group7.domain.ProductOrder;
import com.usyd.group7.domain.ProductOrderItem;

public class OrderServiceImpl implements OrderService {

	public void putProductToSessionCart(HttpServletRequest request,
			Product product, int amount) {
		List<ProductOrderItem> list = getSessionCart(request);
		boolean found = false;

		for (Iterator<ProductOrderItem> iterator = list.iterator(); iterator
				.hasNext();) {
			ProductOrderItem poi = iterator.next();
			if (poi.getProduct().getId() == product.getId()) {
				poi.setAmount(poi.getAmount() + amount);
				found = true;
				// remove 0 amount product
				if (poi.getAmount() <= 0) {
					iterator.remove();
				}
				break;
			}
		}

		// new product
		if (!found) {
			ProductOrderItem poi = new ProductOrderItem();
			poi.setProduct(product);
			poi.setAmount(amount);
			list.add(poi);
		}

		// save to session again
		saveSessionCart(request, list);

	}

	public List<ProductOrderItem> getSessionCart(HttpServletRequest request) {
		List<ProductOrderItem> list = (List<ProductOrderItem>) request
				.getSession().getAttribute("sessionProductOrdrItemList");
		if (list == null) {
			list = new ArrayList<ProductOrderItem>();
		}

		return list;
	}

	public double getSessionCartSumCredit(HttpServletRequest request) {
		double sum = 0;
		List<ProductOrderItem> list = getSessionCart(request);
		for (Iterator<ProductOrderItem> iterator = list.iterator(); iterator
				.hasNext();) {
			ProductOrderItem poi = iterator.next();
			sum += poi.getAmount() * poi.getProduct().getCredit();
		}
		return sum;
	}

	public void saveSessionCart(HttpServletRequest request,
			List<ProductOrderItem> list) {
		request.getSession().setAttribute("sessionProductOrdrItemList", list);
	}

	public void clearSessionCart(HttpServletRequest request) {
		request.getSession().setAttribute("sessionProductOrdrItemList",
				new ArrayList<ProductOrderItem>());
	}

	public ProductOrder makeOrder(HttpServletRequest request, ProductOrder order) {
		List<ProductOrderItem> list = getSessionCart(request);
		order.setOrderItems(new HashSet<ProductOrderItem>(
				getSessionCart(request)));
		return order;
	}

	public List<ProductOrder> getOrderHistory(Client client) {
		List<ProductOrder> list = ProductOrder.findAllProductOrders();
		Iterator<ProductOrder> it = list.iterator();
		while(it.hasNext()){
			ProductOrder order = it.next();
			if (order.getClient().getId() != client.getId()){
				it.remove();
			}
		}
		return list;
	}
}
