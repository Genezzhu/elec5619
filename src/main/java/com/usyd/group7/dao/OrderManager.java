package com.usyd.group7.dao;

import com.usyd.group7.domain.Order;
import com.usyd.group7.domain.User;

import java.util.Date;
import java.util.List;

/**
 * Created by Zhengan Zhu
 */
public interface OrderManager {
    public boolean addOrder(Order order);

    public void deleteOrder(long orderID);

    public List<Order> getOrderList(long userID, int days);

    public List<Order> getAllOrderList(long userID);

    public List<Order> getAllUnPayedOrderList(long userID);

    public void payOrder(long userID);
}
