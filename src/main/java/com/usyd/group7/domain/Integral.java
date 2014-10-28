package com.usyd.group7.domain;

import javax.persistence.*;

/**
 * Created by Zhengan Zhu.
 */
@Entity
@Table(name = "t_integral")
public class Integral {
    @Id
    @GeneratedValue
    @Column(name = "integralid")
    private long integralID;

    @Column(name = "userID")
    private long userID;

    @Column(name = "remainingintegral")
    private long remainingIntegral;

    public long getIntegralID() {
        return integralID;
    }

    public void setIntegralID(long integralID) {
        this.integralID = integralID;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public long getRemainingIntegral() {
        return remainingIntegral;
    }

    public void setRemainingIntegral(long remainingIntegral) {
        this.remainingIntegral = remainingIntegral;
    }
}
