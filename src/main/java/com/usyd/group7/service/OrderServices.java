package com.usyd.group7.service;

import com.usyd.group7.base.ResultInfo;
import com.usyd.group7.domain.Order;
import com.usyd.group7.domain.OrderDetail;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Zhengan Zhu
 */
public interface OrderServices {
    public ResultInfo addOrder(Order order, List<OrderDetail> detailList, HttpServletRequest request);

    public ResultInfo deleteOrder(long orderID);

    public ResultInfo getOrderList(long userID, int days);

    public ResultInfo getAllOrderList(long userID);

    public ResultInfo getAllUnPayedOrderList(long userID);

    public Map<Long, List<OrderDetail>> getOrderDetailMap(List<Order> orderList);

    public Map<Long, Double> getOrderTotalPrice(List<Order> orderList);
    
	public void payOrder(long userID);
}
