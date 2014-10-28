package com.usyd.group7.service;

import com.usyd.group7.base.ResultInfo;
import com.usyd.group7.dao.OrderDetailManager;
import com.usyd.group7.dao.OrderManager;
import com.usyd.group7.domain.Order;
import com.usyd.group7.domain.OrderDetail;
import com.usyd.group7.util.SessionUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

import java.util.*;

import static com.usyd.group7.util.SessionUtil.*;

/**
 * Created by Zhengan Zhu.
 */
@Component
public class SimpleOrderServices implements OrderServices{
    @Autowired
    private OrderManager orderManager;
    @Autowired
    private OrderDetailManager orderDetailManager;

    private static final Logger LOGGER = LoggerFactory.getLogger(SimpleUserService.class);

    @Override
    public ResultInfo addOrder(Order order, List<OrderDetail> detailList, HttpServletRequest request) {
        ResultInfo resultInfo = new ResultInfo();

        try {
            orderManager.addOrder(order);
            for(OrderDetail detail : detailList){
                detail.setOrderID(order.getOrderID());
            }
            orderDetailManager.batchAddOrderDetail(detailList);

            removeAttribute(CART, request);
            resultInfo.markSuccess();
        }catch (RuntimeException e){
            LOGGER.error("Add Order Error", e);
            resultInfo.setErrorMessage(e.getCause().getMessage());
        }

        return resultInfo;
    }

    @Override
    public ResultInfo deleteOrder(long orderID) {
        ResultInfo resultInfo = new ResultInfo();

        try{
            orderDetailManager.deleteOrderDetail(Arrays.asList(orderID));
            orderManager.deleteOrder(orderID);

            resultInfo.markSuccess();
        }catch (RuntimeException e){
            LOGGER.error("Delete Order Error", e);
            resultInfo.setErrorMessage(e.getCause().getMessage());
        }

        return resultInfo;
    }

    @Override
    public ResultInfo getAllOrderList(long userID) {
        ResultInfo resultInfo = new ResultInfo();

        try{
            List<Order> orderList = orderManager.getAllOrderList(userID);

            resultInfo.addData("orderList", orderList);
            resultInfo.addData("orderDetailMap", getOrderDetailMap(orderList));
            resultInfo.markSuccess();
        }catch (RuntimeException e){
            LOGGER.error("Retrieve All OrderList Error", e);
            resultInfo.setErrorMessage(e);
        }

        return resultInfo;
    }

    @Override
    public ResultInfo getOrderList(long userID, int days) {
        ResultInfo resultInfo = new ResultInfo();

        try{
            List<Order> orderList = orderManager.getOrderList(userID, days);

            resultInfo.addData("orderList", orderList);
            resultInfo.addData("orderDetailMap", getOrderDetailMap(orderList));
            resultInfo.markSuccess();
        }catch (RuntimeException e){
            LOGGER.error("Retrieve OrderList Error", e);
            resultInfo.setErrorMessage(e);
        }

        return resultInfo;
    }

    @Override
    public Map<Long, List<OrderDetail>> getOrderDetailMap(List<Order> orderList){
        List<Long> orderIDList = new ArrayList<Long>();
        for(Order order : orderList){
            orderIDList.add(order.getOrderID());
        }
        Map<Long, List<OrderDetail>> orderDetailMap = new HashMap<Long, List<OrderDetail>>();
        List<OrderDetail> orderDetailList = orderDetailManager.getOrderDetailList(orderIDList);

        for(OrderDetail orderDetail : orderDetailList){
            if(! orderDetailMap.containsKey(orderDetail.getOrderID())){
                orderDetailMap.put(orderDetail.getOrderID(), new ArrayList<OrderDetail>());
            }

            orderDetailMap.get(orderDetail.getOrderID()).add(orderDetail);
        }

        return orderDetailMap;
    }

    @Override
    public ResultInfo getAllUnPayedOrderList(long userID) {
        ResultInfo resultInfo = new ResultInfo();

        try{
            List<Order> orderList = orderManager.getAllUnPayedOrderList(userID);

            resultInfo.addData("orderList", orderList);
            resultInfo.addData("orderDetailMap", getOrderDetailMap(orderList));
            resultInfo.markSuccess();
        }catch (RuntimeException e){
            LOGGER.error("Retrieve All OrderList Error", e);
            resultInfo.setErrorMessage(e);
        }

        return resultInfo;
    }

    @Override
    public Map<Long, Double> getOrderTotalPrice(List<Order> orderList) {
        List<Long> orderIDList = new ArrayList<Long>();
        for(Order order : orderList){
            orderIDList.add(order.getOrderID());
        }

        return orderDetailManager.getOrderTotalPrice(orderIDList);
    }

	@Override
	public void payOrder(long userID) {
		orderManager.payOrder(userID);
		
	}
}
