package com.usyd.group7.web;

import com.usyd.group7.base.ResultInfo;
import com.usyd.group7.domain.Order;
import com.usyd.group7.domain.OrderDetail;
import com.usyd.group7.service.OrderServices;
import com.usyd.group7.util.JsonUtil;
import com.usyd.group7.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Zhengan Zhu.
 */
@Controller
@RequestMapping(value = "/order")
public class OrderController {
    @Autowired
    private OrderServices orderService;

    @RequestMapping(value = "/addOrder")
    @ResponseBody
    public ResultInfo addOrder(Order order, String orderDetailString, HttpServletRequest request){
        order.setUserID(SessionUtil.getUser(request).getUserID());
        Map<String, Integer> productList =
                JsonUtil.toMap(orderDetailString, String.class, Integer.class);
        List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();

        for(Map.Entry<String, Integer> detail : productList.entrySet()){
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setProductID(detail.getKey());
            orderDetail.setProductQuan(detail.getValue());

            orderDetailList.add(orderDetail);
        }

        return orderService.addOrder(order, orderDetailList, request);
    }

    @RequestMapping(value = "/deleteOrder")
    @ResponseBody
    public ResultInfo deleteOrder(long orderID){
        return orderService.deleteOrder(orderID);
    }

    @RequestMapping(value = "/getAllOrderList")
    @ResponseBody
    public ResultInfo getAllOrderList(HttpServletRequest request){
        return orderService.getAllOrderList(SessionUtil.getUser(request).getUserID());
    }

    @RequestMapping(value = "/getOrderList")
    @ResponseBody
    public ResultInfo getOrderList(int days, HttpServletRequest request){
        return orderService.getOrderList(SessionUtil.getUser(request).getUserID(), days);
    }

    public ResultInfo getUnpayedOrderList(int days, HttpServletRequest request){
        return orderService.getAllUnPayedOrderList(SessionUtil.getUser(request).getUserID());
    }
}
