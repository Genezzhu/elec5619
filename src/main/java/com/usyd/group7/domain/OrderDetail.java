package com.usyd.group7.domain;

import javax.persistence.*;

/**
 * Created by Zhengan Zhu.
 */
@Entity
@Table(name = "t_order_detail")
public class OrderDetail {
    @Id
    @GeneratedValue
    @Column(name = "orderdetailid")
    private long orderDetailID;

    @Column(name = "orderid")
    private long orderID;

    @Column(name = "productid")
    private String productID;

    @Column(name = "productquan")
    private int productQuan;

    public long getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(long orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public long getOrderID() {
        return orderID;
    }

    public void setOrderID(long orderID) {
        this.orderID = orderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getProductQuan() {
        return productQuan;
    }

    public void setProductQuan(int productQuan) {
        this.productQuan = productQuan;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "orderDetailID=" + orderDetailID +
                ", orderID=" + orderID +
                ", productID='" + productID + '\'' +
                ", productQuan=" + productQuan +
                '}';
    }
}
