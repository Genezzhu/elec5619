package com.usyd.group7.dao;

import com.usyd.group7.domain.OrderDetail;

import java.util.List;
import java.util.Map;

/**
 * Created by Zhengan Zhu
 */
public interface OrderDetailManager {

    public void batchAddOrderDetail(List<OrderDetail> detailList);

    public List<OrderDetail> getOrderDetailList(List<Long> orderIDList);

    public void deleteOrderDetail(List<Long> orderIDList);

    public Map<Long, Double> getOrderTotalPrice(List<Long> orderIDList);

	boolean addOrderDetail(OrderDetail detail);
}
