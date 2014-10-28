package com.usyd.group7.domain;

import com.usyd.group7.util.DateSerializer;
import com.usyd.group7.util.TimeSerializer;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Zhengan Zhu.
 */
@Entity
@Table(name = "t_order")
public class Order {
    @Id
    @GeneratedValue
    @Column(name = "orderid", unique = true)
    private long orderID;

    @Column(name = "userid")
    private long userID;

    @Column(name = "ordertime")
    private Timestamp orderTime;

    @Column(name = "orderaddress")
    private String orderAddress;

    @Column(name = "ispayed")
    private boolean isPayed;

    @Column(name = "personname")
    private String personName;

    @Column(name = "city")
    private String city;

    @Column(name = "postalcode")
    private String postalCode;

    @Column(name = "company")
    private String company;

    @Column(name = "country")
    private String country;

    public long getOrderID() {
        return orderID;
    }

    public void setOrderID(long orderID) {
        this.orderID = orderID;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    @JsonSerialize(using = TimeSerializer.class)
    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public boolean isPayed() {
        return isPayed;
    }

    public void setPayed(boolean isPayed) {
        this.isPayed = isPayed;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderID=" + orderID +
                ", userID=" + userID +
                ", orderTime=" + orderTime +
                ", orderAddress='" + orderAddress + '\'' +
                ", isPayed=" + isPayed +
                ", personName='" + personName + '\'' +
                ", city='" + city + '\'' +
                ", country='" + country + '\'' +
                ", postalCode='" + postalCode + '\'' +
                ", company='" + company + '\'' +
                '}';
    }
}
